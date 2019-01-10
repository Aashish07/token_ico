// we want our smart contract to be bug free
// so test case should be full proof

var DappToken = artifacts.require("./DappToken.sol");

contract('DappToken', function(accounts) {
	it('sets the total supply upon deployment', () => {
		return DappToken.deployed().then(function(instance) {
			tokenInstance = instance;
			return tokenInstance.totalSupply();
		}).then(function(totalSupply) {
			assert.equal(totalSupply.toNumber(), 1000000, 'sets the toal supply to 1,000,000');
		});
	});
})