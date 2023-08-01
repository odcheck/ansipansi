#!/bin/bash

set -euo pipefail
DIR_ME=$(realpath "$(dirname "$0")")

# this script is called by root an must fail if no user is provided
. "${DIR_ME}/.userfoo.sh"
setUserName ${1-""}
OS_TYPE=${2-"ubuntu"}

createMainUser () {
  verifyUserName
  if [[ $(cat /etc/passwd | grep ${USERNAME} | wc -l) == 0 ]]; then
    useradd -m -s /bin/bash ${USERNAME}
  fi

  # add to sudo group
  if [[ "${OS_TYPE}" == "ubuntu" ]]; then
    usermod -aG sudo ${USERNAME}
  fi
  if [[ "${OS_TYPE}" == "centos" ]]; then
    usermod -aG wheel ${USERNAME}
  fi

  if [[ ! -d ${HOMEDIR}/git ]]; then
      mkdir ${HOMEDIR}/git
      chown ${USERNAME}:${USERNAME} ${HOMEDIR}/git
  fi

  if [[ ! -d ${HOMEDIR}/.ssh ]]; then
      mkdir ${HOMEDIR}/.ssh
      chown ${USERNAME}:${USERNAME} ${HOMEDIR}/.ssh
      chmod 700 ${HOMEDIR}/.ssh
  fi

  cp "${DIR_ME}/nogit/"* "${HOMEDIR}/.ssh"

  if [[ -f ${HOMEDIR}/.ssh/config ]]; then
      chown ${USERNAME}:${USERNAME} ${HOMEDIR}/.ssh/config
      chmod 644 ${HOMEDIR}/.ssh/config
  fi

  if [[ -f ${HOMEDIR}/.ssh/id_rsa ]]; then
      chown ${USERNAME}:${USERNAME} ${HOMEDIR}/.ssh/id_rsa
      chmod 600 ${HOMEDIR}/.ssh/id_rsa
  fi

  if [[ -f ${HOMEDIR}/.ssh/id_rsa.pub ]]; then
      chown ${USERNAME}:${USERNAME} ${HOMEDIR}/.ssh/id_rsa.pub
      chmod 644 ${HOMEDIR}/.ssh/id_rsa.pub
  fi

  # ensure no password is set
  passwd -d ${USERNAME}
}
createMainUser

modifyWslConf
