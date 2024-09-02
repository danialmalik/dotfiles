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


##################### portainer ##################
_start_portainer () {
	docker volume inspect portainer_data >/dev/null || docker volume create portainer_data
	docker run --rm -d -p 8080:8000 -p 9000:9000 --name=portainer --rm -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
}
alias start_portainer="_start_portainer"
alias stop_portainer="docker stop portainer"
