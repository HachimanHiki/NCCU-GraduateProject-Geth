#!/bin/bash
# ------------------------------------------------------------------------------
# Check account balance
#
# Works on Linux and OS/X. May work on Windows with Cygwin.
#
# Usage:
#   1. Download this script to checkBalance
#   2. `chmod 700 checkBalance`
#   3. Run `geth console` in a window.
#   4. Then run this script `./checkBalance` in a separate window.
#
# Parameters:
#   account    Account to check the balance. Defaults to GOLEM multisig
#   block      Blocknumber. Defaults to "latest"
#
# Sample Usage:
#   ./checkBalance
#   '0x7da82c7ab4771ff031b66538d2fb9b0b047f6cf9' at 'latest' has 770001.899999999999999999 ETH
#   ./checkBalance 0x7da82c7ab4771ff031b66538d2fb9b0b047f6cf9 2691189
#   '0x7da82c7ab4771ff031b66538d2fb9b0b047f6cf9' at '2691189' has 820002.9 ETH
#
# History:
#   * Jan 07 2017 - Version 1.0
#
# Enjoy. (c) BokkyPooBah 2016. The MIT licence.
# ------------------------------------------------------------------------------

# Leave ATTACHPARAMETER as undefined normally
# RPC
# ATTACHPARAMETER="rpc:http://localhost:8545"
ATTACHPARAMETER="ipc:/tmp/geth.ipc"
# OS/X IPC
# ATTACHPARAMETER="ipc:$HOME/Library/Ethereum/geth.ipc"

# Golem multisig
ACCOUNT=${1:-"0xFc8b234B78165f39E838A28fd6FBB239cB98147F"}
BLOCK=${2:-"latest"}

# echo "ACCOUNT: $ACCOUNT"
# echo "ATTACHPARAMETER: $ATTACHPARAMETER"

# Uncomment the following line and comment the next line using // while debugging this script
# geth attach $ATTACHPARAMETER << EOF
geth attach $ATTACHPARAMETER << EOF | grep "Data: " | sed "s/Data: //"

function sleep(delay) {
    var start = new Date().getTime();
    while (new Date().getTime() < start + delay);
}

while(true){
	eth.sendTransaction({value: web3.toWei(0.01, 'ether'), gasPrice: 1, from:eth.accounts[2], to:eth.accounts[3]})
	eth.sendTransaction({value: web3.toWei(0.01, 'ether'), gasPrice: 1, from:eth.accounts[1], to:eth.accounts[2]})
	eth.sendTransaction({value: web3.toWei(0.01, 'ether'), gasPrice: 1, from:eth.accounts[0], to:eth.accounts[1]})
	eth.sendTransaction({value: web3.toWei(0.01, 'ether'), gasPrice: 1, from:eth.accounts[9], to:eth.accounts[0]})
	eth.sendTransaction({value: web3.toWei(0.01, 'ether'), gasPrice: 1, from:eth.accounts[8], to:eth.accounts[9]})
	eth.sendTransaction({value: web3.toWei(0.01, 'ether'), gasPrice: 1, from:eth.accounts[7], to:eth.accounts[8]})
	eth.sendTransaction({value: web3.toWei(0.01, 'ether'), gasPrice: 1, from:eth.accounts[6], to:eth.accounts[7]})
	eth.sendTransaction({value: web3.toWei(0.01, 'ether'), gasPrice: 1, from:eth.accounts[5], to:eth.accounts[6]})
	eth.sendTransaction({value: web3.toWei(0.01, 'ether'), gasPrice: 1, from:eth.accounts[4], to:eth.accounts[5]})
	eth.sendTransaction({value: web3.toWei(0.01, 'ether'), gasPrice: 1, from:eth.accounts[3], to:eth.accounts[4]})
	sleep(15000)
}
EOF
