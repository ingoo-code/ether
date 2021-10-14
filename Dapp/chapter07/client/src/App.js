import React, { useEffect, useState, useReducer } from "react";
import SimpleStorageContract from "./contracts/SimpleStorage.json";
import getWeb3 from "./getWeb3";

import "./App.css";

const reducer = (state,action) => {
  switch(action.type){
    case "INIT":
      let {web3,Instance,account} = action
      return {
        ...state,
        web3,
        Instance,
        account
      }
  }
}

const INIT_ACTIONS = (web3,Instance,account) => {
  return {
    type:'INIT',
    web3,
    Instance,
    account
  }
}

const App = () => {

  let initialstate = {
    web3:null,
    Instance:null,
    account:null,
  }

  const [state,dispatch] = useReducer(reducer,initialstate)
  const [value,setValue] = useState(0)
  const [storageValue,setStorageValue] = useState(0)
  const [loadding,setLoadding] = useState(false)

  const handleLog = (log,web3) => {
    const params = [{type:'string',name:'message'},{type:'uint256',name:'newVal'}]
    const returnValues = web3.eth.abi.decodeLog(params,log.data)
    setStorageValue(returnValues.newVal)
    setLoadding(prev=>!prev)
  }

  const init = async () => {
    const contract = require('@truffle/contract');
    const web3 = await getWeb3()
    const [account] = await web3.eth.getAccounts() // client를 접속한 계정 가져오기 (공개키)
    // const networkId = await web3.eth.net.getId() // network id 값 가져오기 

    let simpelStorage = contract(SimpleStorageContract)
    simpelStorage.setProvider(web3.currentProvider)

    const Instance = await simpelStorage.deployed()
    dispatch(INIT_ACTIONS(web3,Instance,account))

    web3.eth.subscribe("logs", {address:Instance.address})
    .on('data',log=>{
      handleLog(log,web3)
    })
    .on('error',err=>console.log(err))
  }

  const send = async () => {
    const {account,Instance} = state
    if (value > 0) {
      setLoadding(prev=>!prev)
      await Instance.set(value,{from:account})
    }
  }

  const sendAPI = async () => {
    const {account,Instance,web3} = state
    if (value > 0) {
      // SERVER API 호출
      setLoadding(prev=>!prev)
      const result = await aixos.post('/rpc/set',{ from:account, value })

      if (result.data !== undefined && result.data.rawTx !== undefined ) {
        await web3.eth.sendTransaction(result.data.rawTx)
      }
      
    }
  }

  const handleChange = (e) => {
    const val = e.target.value;
    setValue(val)
  }

  useEffect(()=>{
    init()
  },[])

  return (
    <>
      <div>
        <input type="text" value={value} onChange={handleChange} />
        <div>
          <button onClick={send}>일반서명</button>
          <button onClick={sendAPI}>DB 거치고 서명</button>
          <button>DB 서명</button>
        </div>
        <div>
          {loadding ? 'loadding' : storageValue}
        </div>
      </div>
    </>
  )
}



export default App;
