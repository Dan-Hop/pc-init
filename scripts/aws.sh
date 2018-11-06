aws_get_session_token() {

    local creds
    local username
    local caller
    local account
    local token_number
    local profile

    profile="${AWS_PROFILE:-default}_sts"
    username="daniel.hopkins@artofus.com"
    caller=$(aws sts get-caller-identity) || return 1
    account=$(echo ${caller} | jq -r .Account)
    read -s -p "Please enter your MFA code: " -t 60 token_number

    creds=($({ aws sts get-session-token --duration-seconds 28800 \
        --serial-number "arn:aws:iam::${account}:mfa/${username}" \
        --token-code ${token_number} || \
        { echo 'ERROR: Failed to request a session token!'; return 1; } ; } | jq -r '.Credentials | "\(.AccessKeyId) \(.SecretAccessKey) \(.SessionToken)"'))

    [ -n "${creds}" ] || return 1

    aws configure --profile ${profile} set aws_access_key_id ${creds[0]}
    aws configure --profile ${profile} set aws_secret_access_key ${creds[1]}
    aws configure --profile ${profile} set aws_session_token ${creds[2]}
    aws configure --profile ${profile} set region eu-west-1

    export AWS_PROFILE=${profile}
    echo
}

export AWS_PROFILE='default_sts'
