#!/bin/bash

WALLET=${1:-default}
PASS_FILE=${2:-$WALLET}
OUTPUT=${3:-wallets} # relative to the folder executing the script

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$THIS_DIR/create.sh ${WALLET} ${PASS_FILE} ${OUTPUT}
$THIS_DIR/encrypt.sh ${WALLET} ${PASS_FILE} ${OUTPUT}
$THIS_DIR/close.sh ${WALLET} ${PASS_FILE}

echo -e "\n Done! Generated inside ./${OUTPUT}"
ls ${OUTPUT}
