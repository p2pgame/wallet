#!/bin/bash

echo -e "\n Conigure GPG"
cp gpg-agent.conf ~/.gnupg/gpg-agent.conf
echo RELOADAGENT | gpg-connect-agent
