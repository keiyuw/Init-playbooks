#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"
source ./.lib.sh

if [[ "$WORKSTATION" == "true" ]] || [ -e ./workstations ] && grep -xq "$(hostname)" ./workstations; then
	ansible_flags+=" --extra-vars role_workstation=true"
else
	ansible_flags+=" --skip-tags workstation"
fi

ansible-playbook --connection local -i inventory.yaml --limit localhost $ansible_flags $@ playbook.yaml
