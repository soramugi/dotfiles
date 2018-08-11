#!/bin/bash

set -eu

PW=''
SYNC_PATH=''
SYNC_TO_PATH=''

expect -c "
set timeout -1
spawn env LANG=C rsync -av ${SYNC_PATH} ${SYNC_TO_PATH}
expect \"password:\"
send \"${PW}\n\"
expect \"total size is\"
exit 0
"

