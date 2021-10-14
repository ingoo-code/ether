const web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"))
let account;

const ABI_CODE = JSON.parse(`[{"inputs":[{"internalType":"string[]","name":"candidatenames","type":"string[]"}],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"candidateList","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"string","name":"_candidate","type":"string"}],"name":"totalVotesFor","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"string","name":"_candidate","type":"string"}],"name":"validCandidate","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"string","name":"_candidate","type":"string"}],"name":"voteForCandidate","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"string","name":"","type":"string"}],"name":"votesReceived","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"stateMutability":"view","type":"function"}]`)

let VotingContract = new web3.eth.Contract(ABI_CODE,'0xe6b74c28606df9740a1f884d12bbd6a3d3d39417')
// let contractInstance = VotingContract.at()
let candidates = {"ingoo1":"candidate1","ingoo2":"candidate2","ingoo3":"candidate3"}

window.addEventListener('DOMContentLoaded',init)
async function init(){
    // console.log(VotingContract)
    candidateNames = Object.keys(candidates)
    for (let i=0; i<candidateNames.length; i++) {
        let name = candidateNames[i];
        const nameElement = document.querySelector(`#${candidates[name]}`)
        nameElement.innerHTML = name;
        const span = document.createElement('span')
        span.innerHTML = await VotingContract.methods.totalVotesFor(name).call()
        nameElement.appendChild(span) 
    }
}

let btn = document.querySelector(`#btn`)
btn.addEventListener(`click`,btnEvent);
async function btnEvent(){
    let candidateName = document.querySelector(`#cadidate`).value;

    await VotingContract.methods.voteForCandidate(candidateName).send({from:'0x2Bedf0af9137bE95b8D7686e0385c3d94A914592'})
    let count = await VotingContract.methods.totalVotesFor(candidateName).call()

    const nameElement = document.querySelector(`#${candidates[candidateName]} > span`)
    nameElement.innerHTML = count;
    
}