pragma solidity ^0.8.26;

contract DepositAndRefund {
    mapping(address=>uint) balances;

    function getBalance(address party) external view returns(uint) {
        return balances[party];
    }

    function deposit() external payable {
        // Should check if msg.value is greater than 0
        if (balances[msg.sender] > 0) {
            balances[msg.sender] += msg.value;
        }
        else {
            balances[msg.sender] = msg.value;
        }
    }

    function withdraw(uint amount) external payable {
        require(balances[msg.sender] > 0);
        require(amount <= balances[msg.sender]);
        uint temp = balances[msg.sender];
        balances[msg.sender] -= amount;
        assert(temp == balances[msg.sender] + amount);
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed.");
    }
}
