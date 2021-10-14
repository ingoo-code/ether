pragma solidity ^0.8.0;

contract Vote{
    string[] public candidateList;
    mapping (string => uint8) public votesReceived;
    mapping(address=>bool) votes;

    uint numVote;
    uint numCandidate;

    event sendMsg(string msg);

    constructor() public{}

    // 후보자 등록
    function registerCondidate(string memory _candidate) public {
        if(validCandidate(_candidate)){
            return;
        }

        // 초기화
        candidateList.push(_candidate);
        votesReceived[_candidate] = 0;
    }

    //투표기능
    function vote(string memory _candidate) public {
        if(vaildVote(msg.sender)){
            // emit sendMsg(bytes("이미투표를 진행하셨습니다."));
            return;
        }

        // 투표진행
        votes[msg.sender] = true;
        votesReceived[_candidate] += 1;
    }

    // 투표자 중복체크
    function vaildVote(address _addr) public view returns(bool){
        return votes[_addr];
    }

    // 후보자 등록 중복체크
    function validCandidate(string memory _candidate) public view returns(bool) {
        for (uint i=0; i < candidateList.length; i ++) {
            if (keccak256(bytes(_candidate)) == keccak256(bytes(candidateList[i])) ) {
                return true;
            }
        }
        return false;
    }

    //후보자 리스트 가져오기
    function getCandidate() public view returns(string[] memory) {
        return candidateList;
    }
}