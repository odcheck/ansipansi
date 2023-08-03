#!/bin/bash

set -euo pipefail
DIR_ME=$(realpath "$(dirname "$0")")

# this script is called by root an must fail if no user is provided
. "${DIR_ME}/.userfoo.sh"
setUserName "${1-""}"
OS_TYPE=${2-"ubuntu"}

cp "${DIR_ME}/nogit/"* "${HOMEDIR}/.ssh"

# Restrict everything by default
chown "${USERNAME}:${USERNAME}" "${HOMEDIR}/.ssh/"*
chmod 600 "${HOMEDIR}/.ssh/"*

# Open back up where needed
if [[ -f "${HOMEDIR}/.ssh/config" ]]; then
    chmod 644 "${HOMEDIR}/.ssh/config"
fi

if [[ -f "${HOMEDIR}/.ssh/id_rsa.pub" ]]; then
    chmod 644 "${HOMEDIR}/.ssh/id_rsa.pub"
fi
