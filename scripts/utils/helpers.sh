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
