#!/bin/bash
set -e

# make directories
mkdir -p $HOME/work/arbisoft/open-edx
mkdir -p $HOME/work/personal

# clone repos
git clone git@github.com:danialmalik/cron-jobs.git $HOME/work/personal/cron-jobs
git clone git@github.com:danialmalik/interview-questions.git $HOME/work/interview-questions
git clone git@github.com:danialmalik/opnedx-private-files.git $HOME/work/arbisoft/open-edx/opnedx-private-files

git clone git@github.com:danialmalik/selfdecode-config-files.git $HOME/work/selfdecode/selfdecode-config-files
