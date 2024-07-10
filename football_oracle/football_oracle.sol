// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract FootballOracle {
    struct Match {
        bool exists;
        uint matchID;
        string team1;
        string team2;
        uint score1;
        uint score2;
    }

    mapping(uint => Match) matches;
    uint matchid = 0;

    // TODO: Implement trusted sources only to use this function using modifier
    // 
    function setScore(string memory team1, string memory team2, uint score1, uint score2) public {
        matches[matchid] = Match(true, matchid, team1, team2, score1, score2); // matchid is primitive so it won't have a side-effect from matchid++
        matchid++;
    }

    function getScore(uint _matchid) public view returns(bool success, string memory team1, string memory team2, uint score1, uint score2) {
        Match memory m = matches[_matchid];
        if (m.exists) {
            return (m.exists, m.team1, m.team2, m.score1, m.score2);
        }
        else {
            return (false, "", "", 0, 0);
        }
    }
}
