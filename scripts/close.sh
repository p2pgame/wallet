#!/bin/bash

WALLET=${1:-default}
PASS_FILE=${2:-$WALLET}

echo -e "\n Close ${WALLET}.wallet with ${PASS_FILE}.password"
cleos wallet stop
rm -rf ~/eosio-wallet/${WALLET}.wallet
rm -rf ./${PASS_FILE}.password
