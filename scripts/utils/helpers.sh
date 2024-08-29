#!/bin/sh

show_git_alias_cheatsheet() {
    cat << EOF
        gcb     =   git checkout -b
        gbda    =   Delete all merged branches (local only)
        gbD     =   git branch -D
        gbr     =   git branch --remote

        ggsup   =   git branch --set-upstream-to=origin/$(git_current_branch)
        ggpush  =   git push origin "$(git_current_branch)"
        gpsup   =   git push --set-upstream origin $(git_current_branch)
        gbs     =   git bisect
        gbsb    =   git bisect bad
        gbsg    =   git bisect good
        gbsr    =   git bisect reset
        gbss    =   git bisect start

EOF
}


## Usage: list-aws-instances.sh  mi-qa qa app

list_aws_instances() {
    PROFILE="${1}"
    ENV="${2}"
    NAME="${3}"
    REGION="${4:-ca-central-1}"

    # display error if any of the parameters are not sent
    if [ -z "${PROFILE}" ] || [ -z "${ENV}" ] || [ -z "${NAME}" ]; then
        echo "Usage: list-aws-instances.sh <profile> <env> <name> [region]"
        return 1
    # else print passed values of parameters
    else
        echo "Profile: ${PROFILE}"
        echo "Environment: ${ENV}"
        echo "Name: ${NAME}"
        echo "Region: ${REGION}"
    fi

    echo "[INFO]: Not using enviornment filter, as some instances may not have the tag"

    # --filters "Name=tag:Environment,Values="${ENV}"" \
    aws ec2 describe-instances \
    --profile "${PROFILE}" \
    --region "${REGION}" \
    | jq '.Reservations[].Instances[]
        | {
        instance_id: .InstanceId,
        name: .Tags[]
            | select(.Key == "Name")
            | select(.Value | match('\"${NAME}\"')) | .Value,
        launch_time: .LaunchTime,
        state: .State.Name,
        instance_dns_name: .PrivateDnsName,
        instance_ip: .PrivateIpAddress
        }'
}


full_upgrade() {
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get full-upgrade
    sudo apt-get dist-upgrade
    flatpak update
    sudo snap refresh
}

full_clean() {
    sudo apt-get autoremove
    sudo apt-get autoclean
    sudo apt-get clean
    sudo apt-get autopurge
    docker system prune
}

## For tempo mat
activateTempomat() {
    PROFILE="${1}"
    if [ -z "${PROFILE}" ]; then
        echo "Usage: activateTempomat <profile>"
        return 1
    fi
    rm ~/.tempomat_back 2> /dev/null
    mv ~/.tempomat ~/.tempomat_back 2> /dev/null

    cp ~/.tempomat_${PROFILE} ~/.tempomat
}
