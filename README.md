# wallet
Crypto Wallet Creation and Management for EOS Blockchain using Cleos CLI.


#### Make scripts exectuable
```cd scripts && chmod +x *.sh```


### Usage

#### Creating a New Wallet

1. Disconnect from the internet

2. Run this command to ensure gpg does not store passphrases used to encrypt/decrypte files:
```./setup.sh```

3. Run this command, replacing `<wallet-name>` with `owner`, `active`, or any name you want:
```./wallet.sh <wallet-name>```

The above command will ask you to enter passphrase four times (to encrypt the wallet and its password respectively). Then it removes the generated wallet from cleos after everything is done.

#### Using a Wallet

1. Disconnect from the internet

2. Run this command to ensure gpg does not store passphrases used to encrypt/decrypte files:
```./setup.sh```

3. Run this command, replacing `<wallet-name>` with `owner`, `active`, or any name you want:
```./unlock.sh <wallet-name>```

The above command will unlock given wallet by its name so you can push any EOS contract action to the blockhain that requires account authority through `cleos`.

#### Closing a Wallet
Don't forget to remove the wallet from cleos after you are done for maximum security:
```./close.sh <wallet-name>```

