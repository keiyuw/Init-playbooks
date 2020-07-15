#!/usr/bin/env bash

export ANSIBLE_PYTHON_INTERPRETER=auto_silent

# shellcheck disable=SC2153
ansible_flags="$ANSIBLE_FLAGS"
if [ -e "./.ansible-args.yaml" ]; then
	ansible_flags+=" --extra-vars @./.ansible-args.yaml"
fi
