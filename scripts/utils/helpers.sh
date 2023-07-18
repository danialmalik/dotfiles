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

    aws ec2 describe-instances \
    --filters "Name=tag:Environment,Values="${ENV}"" \
    --profile "${PROFILE}" \
    --region "${REGION}" \
    | jq '.Reservations[].Instances[]
        | {
        instance_id: .InstanceId,
        name: .Tags[]
            | select(.Key == "Name")
            | select(.Value | match('\"${NAME}\"')) | .Value,
        launch_time: .LaunchTime,
        state: .State.Name
        }'
}
