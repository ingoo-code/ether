const Web3 = require('web3')
const fs = require('fs')

const web3 = new Web3('http://localhost:8545')
const BYTECODE = fs.readFileSync('./Voting_sol_Voting.bin').toString();
const ABI_CODE = JSON.parse(fs.readFileSync('./Voting_sol_Voting.abi').toString());


const deployedContract = new web3.eth.Contract(ABI_CODE)

deployedContract.deploy({
    data:BYTECODE,
    arguments:[['ingoo1','ingoo2','ingoo3'].map(name => web3.utils.asciiToHex(name))]
})
.send({
    from:'0x6048cbA07a1D12a8d4b49e5549D0906F8662eb5C',
    gas:6721975,
})
.then( newContractInstance => {
    deployedContract.options.address = newContractInstance.options.address;
})


// Transaction : 0xb92fa026e247638f6b76018c10ee271008328e5f7762507da5d18f572899f051
// Contract created : 0x1a945b0b5c12a1e302562c33baef737e1bb0b180

// deployedContract.methods.totalVotesFor(web3.utils.asciiToHex('ingoo1')).call().then(data => {
//     console.log(data)
// })

// deployedContract.methods.voteForCandidate(web3.utils.asciiToHex('ingoo1')).send({from:'0x0Caf2D307494D7Ec42e918cF4bEb682Eb167E655'}).then(data=>{
//     console.log(data)
// })



