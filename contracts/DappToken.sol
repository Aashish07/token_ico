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

	//approve 
	event Approval(
		address indexed _owner,
		address indexed _spender,
		uint256 _value
	);

	//mapping in solidity is like associative array of languages or hash table
	// basically a key value store for an address
	mapping( address => uint256) public balanceOf;
	mapping( address => mapping(address => uint256)) public allowance; 
	// allowance
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

	 // approve
	function approve(address _spender, uint256 _value) public returns(bool success){
	 	//allowance

	 	allowance[msg.sender][_spender] = _value;

	 	//Approve event
	 	emit Approval(msg.sender,_spender, _value);
	 	return true;
	 }

	 // transferFrom
	function transferFrom(address _from, address _to, uint256 _value) public returns(bool success) {
		
		require(_value <= balanceOf[_from]);
		require(_value <= allowance[_from][msg.sender]);
		 // Require _from has enough tokens
		 // Require allowance is big enough
		 // Change the balance
		 balanceOf[_from] -= _value;
		 balanceOf[_to] += _value;
		 // Update the allowance
		  allowance[_from][msg.sender] -= _value;
		 // Transfer event
		 emit Transfer(_from, _to, _value);
		 // return a boolean
		  return true;
	}

} 