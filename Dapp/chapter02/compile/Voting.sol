pragma solidity ^0.8.0;

contract Voting {
    // 후보자들 초기화
    // 후보자에 대한 투표 기능
    // 각 후보자에게 투표하는 기능

    // bytes32[] 자료형 사용하는이유는 아직 솔리디티가 배열이나 글자형을 지원하지않기떄문 [이건알아봐야할듯.]
    string[] public candidateList;
    mapping (string => uint8) public votesReceived;
    // ingoo=>5 ikgun=>5
    constructor(string[] memory candidatenames) public { 
         candidateList = candidatenames;
    }

    function voteForCandidate(string memory _candidate) public {
        // require(validCandidate(_candidate));
        votesReceived[_candidate] += 1;
    }

    function totalVotesFor(string memory _candidate) view public returns(uint8) { 
        // require(validCandidate(_candidate));
        return votesReceived[_candidate];
    }

    function validCandidate(string memory _candidate) view public returns(bool) {
        for(uint i=0; i< candidateList.length; i++){
            if(keccak256(bytes(candidateList[i])) == keccak256(bytes(_candidate))) {
                return true;
            }
        }
        return false;
    }
}
