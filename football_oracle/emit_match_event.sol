// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./FootballOracle.sol";

contract EmitMatchEvent {
    event MatchScore(uint matchid, string team1, string team2, uint score1, uint score2);
    
    FootballOracle public oracle;
    
    constructor (address _oracleAddr) {
        oracle = FootballOracle(_oracleAddr); 
    }

    function checkScore(uint matchid) public {
        bool success;
        string memory team1;
        string memory team2;
        uint score1; 
        uint score2;
        // Fetch scores from the oracle
        (success, team1, team2, score1, score2) = oracle.getScore( matchid);
        // If query works, tell world about the score!
        if(success) {
            emit MatchScore(matchid, team1, team2, score1, score2);
        }
    }
}
