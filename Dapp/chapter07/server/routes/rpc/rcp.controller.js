const {GANACHE} = require('./eth.config')
const Web3 = require('web3')
const web3 = new Web3(GANACHE)
const abi = require('../../../client/src/contracts/SimpleStorage.json').abi;
const address = require('../../../client/src/contracts/SimpleStorage.json').networks["5777"].address
const ethTx = require('ethereumjs-tx').Transaction
const set = async (req,res) => {
    const {from,val} = req.body;

    const contract =  await new web3.eth.Contract(abi,address)
    const data = await contract.methods.set(val).encodeABI();

    let txObject = {}

    //const txCount = await web3.eth.getTransactionCount(from)
    //txObject["nonce"] = txCount;
    // txObject["from"] = from;
    // txObject["to"] = address;
    // txObject["data"] = data;
    // txObject["gasLimit"] = web3.utils.toHex(3000000)
    // txObject["gasPrice"] = web3.utils.toHex(web3.utils.toWei('20','gwei'))

    let txObject = {
        from,
        to:addresss,
        data,
        gasLimit:web3.utils.toHex(3000000),
        gasPrice:web3.utils.toHex(web3.utils.toWei('20','gwei'))
    }

    res.json({
        success:true,
        rawTx:txObject
    })
}

const setTx = async (req,res) => {
    const {from,val} = req.body
    const privateKey = Buffer.from("18afe465a7508ae3cd8dacd912e79bf80abafc42c791c093ca79b9bd460f7b08","hex")

    const contract =  await new web3.eth.Contract(abi,address)
    const data = await contract.methods.set(val).encodeABI();
    const txCount = await web3.eth.getTransactionCount(from) // txCount..? 

    const txObject = {
        nonce: web3.utils.toHex(txCount),
        from,
        to:address,
        data,
        gasLimit:web3.utils.toHex(3000000),
        gasPrice:web3.utils.toHex(web3.utils.toWei('20','gwei'))
    }

    const tx = new ethTx(txObject)
    tx.sign(privateKey)
    const serializedTx = tx.serialize()
    const txhash = await web3.eth.sendSignedTransaction('0x' + serializedTx.toString('hex'))


    res.json({
        success:true,
        txhash
    })
}

module.exports = {
    set,
    setTx
}