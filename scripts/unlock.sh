#!/bin/bash

WALLET=${1:-default}
PASS_FILE=${2:-$WALLET}
INPUT=${3:-wallets} # relative to the folder executing the script

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$THIS_DIR/decrypt.sh ${WALLET} ${PASS_FILE} ${INPUT}

# Move decrypted files to wallet directory
cleos wallet stop
mv -i ${WALLET}.wallet ~/eosio-wallet/${WALLET}.wallet

echo -e "\n Unlock ${WALLET}.wallet with ${PASS_FILE}.password"
cleos wallet open --name ${WALLET}
cleos wallet unlock --name ${WALLET} --password $(cat ${PASS_FILE}.password)
rm -rf ./${PASS_FILE}.password

echo -e "\n List ${WALLET}.wallet public keys"
cleos wallet keys
