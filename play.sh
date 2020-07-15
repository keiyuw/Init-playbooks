#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"
source ./.lib.sh

ansible-playbook -i inventory.yaml --limit !localhost $ansible_flags playbook.yaml
