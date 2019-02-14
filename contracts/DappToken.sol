pragma solidity >=0.4.21 <0.6.0;

contract DappToken {
	// Constructor run anytime whenever our smart contract is deployed

	string public name = "Dapp Token";
	string public symbol = "DAPP";
	string public standard = "Dapp Token v1.0";
	uint256 public totalSupply; //declared totalSupply


	event Transfer(
		address indexed _from,
		address indexed _to,
		uint256 _value
	);

	//mapping in solidity is like associative array of languages or hash table
	// basically a key value store for an address
	mapping( address => uint256) public balanceOf; 

	constructor (uint256 _initialSupply) public {
		balanceOf[msg.sender] = _initialSupply;
		// 'msg' is global keyword in solidity that has various values that you can read from it.
		// sender is the address that call this function
		// set the total number of tokens
		totalSupply = _initialSupply;
		// allocate the initial supply
		
		// convention in solidity that we use _ in front of local variables and not for state variables
		// for eg initialSupply is an local variable so that we use _ in front of it.
	}	
	
	//read the total number of token
	// Transfer
	// Exception if account doesn't have enough
	//Return a boolean
	//Transfer event

	function transfer(address _to, uint256 _value) public returns (bool success) {
			//check if the sender has enough balance
		require(balanceOf[msg.sender] >= _value);
		// Transfer the balance
		balanceOf[msg.sender] -= _value;

		balanceOf[_to] += _value;
		emit Transfer(msg.sender, _to, _value);

		return true;
	 } 

} 