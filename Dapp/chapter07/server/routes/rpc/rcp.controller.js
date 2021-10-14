const web3 = new Web3()
const abi = require('../../../client/src/contracts/SimpleStorage.json').abi;
const address = require('../../../client/src/contracts/SimpleStorage.json').networks["5777"].address

const set = async (req,res) => {
    const {from,val} = req.body;

    const contract =  await new web3.eth.Contract(abi,address)
    const data = await contract.methods.set(val).encodeABI();

    let txObject = {}

    //const txCount = await web3.eth.getTransactionCount(from)
    //txObject["nonce"] = txCount;
    txObject["from"] = from;
    txObject["to"] = address;
    txObject["data"] = data;
    txObject["gasLimit"] = web3.utils.toHex(3000000)
    txObject["gasPrice"] = web3.utils.toHex(web3.utils.toWei('20','gwei'))

    res.json({
        success:true,
        rawTx:txObject
    })
}
