#!/bin/bash

WALLET=${1:-default}
PASS_FILE=${2:-$WALLET}
OUTPUT=${3:-wallets} # relative to the folder executing the script

# Create ouput directory in case it does not exist yet
mkdir -p ./${OUTPUT}

echo -e "\n Encrypt ${WALLET}.wallet"
gpg \
	--cipher-algo AES256 \
	--symmetric \
	--output ${OUTPUT}/${WALLET}.wallet.encrypted \
	~/eosio-wallet/${WALLET}.wallet

echo -e "\n Encrypt ${PASS_FILE}.password"
gpg \
	--cipher-algo AES256 \
	--symmetric \
	--output ${OUTPUT}/${PASS_FILE}.password.encrypted \
	./${PASS_FILE}.password
