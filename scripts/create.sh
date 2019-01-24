#!/bin/bash

WALLET=${1:-default}
PASS_FILE=${2:-$WALLET}
OUTPUT=${3:-wallets} # relative to the folder executing the script

echo -e "\n Create ${WALLET}.wallet with ${PASS_FILE}.password"
cleos wallet stop
rm -rf ~/eosio-wallet/${WALLET}.wallet
cleos wallet create --name ${WALLET} --file ${PASS_FILE}.password
cleos wallet open --name ${WALLET}
cleos wallet unlock --name ${WALLET} --password $(cat ${PASS_FILE}.password)

echo -e "\n Create 7 private/public key pairs within ${WALLET}.wallet"
cleos wallet create_key --name ${WALLET}
cleos wallet create_key --name ${WALLET}
cleos wallet create_key --name ${WALLET}
cleos wallet create_key --name ${WALLET}
cleos wallet create_key --name ${WALLET}
cleos wallet create_key --name ${WALLET}
cleos wallet create_key --name ${WALLET}

echo -e "\n Save public keys to ${WALLET}.json"
cleos wallet keys > ${WALLET}.json
mkdir -p ./${OUTPUT}
mv -i ${WALLET}.json ./${OUTPUT}/${WALLET}.json
