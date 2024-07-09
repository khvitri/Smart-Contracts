pragma solidity ^0.8.26;

contract helloWorld {

    event Message(string hi);

    string message;
    address latestAddr;
    
    mapping(address=>string[]) usrMsg;

    function hello() external {
        emit Message(message);
    }

    function updateMessage(string memory _newMsg) public {
        message = _newMsg;
        latestAddr = msg.sender;
        usrMsg[msg.sender].push(_newMsg);
    }

    function getMessages(address user, uint i) external view returns(string memory) {
        return usrMsg[user][i]; 
    }

    function latestMessage() external view returns(string memory, address) {
        return (message, latestAddr);
    }
}
