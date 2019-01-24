#!/bin/bash

WALLET=${1:-default}
PASS_FILE=${2:-$WALLET}
INPUT=${3:-wallets} # relative to the folder executing the script

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$THIS_DIR/setup.sh
echo -e "\n Decrypt ${WALLET}.wallet.encrypted"
gpg \
	--output ${WALLET}.wallet \
	--decrypt ./${INPUT}/${WALLET}.wallet.encrypted

echo -e "\n Decrypt ${PASS_FILE}.password.encrypted"
gpg \
	--output ${PASS_FILE}.password \
	--decrypt ./${INPUT}/${PASS_FILE}.password.encrypted

echo -e "\n Done! Decrypted from ./${INPUT}"
ls ./
