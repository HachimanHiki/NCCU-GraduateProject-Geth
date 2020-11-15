while(true){
	for(i = 1; i<=1000; i++){
		eth.sendTransaction({value: web3.toWei(i*0.001, 'ether'), from:eth.accounts[0], to:"0x00000000000000000000000000000000000000ff"})
	}
}
