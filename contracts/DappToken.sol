pragma solidity >=0.4.21 <0.6.0;

contract DappToken {
	// Constructor run anytime whenever our smart contract is deployed

	uint256 public totalSupply; //declared totalSupply

	constructor () public {
		// set the total number of tokens
		totalSupply = 1000000;
	}	
	
	//read the total number of token
}