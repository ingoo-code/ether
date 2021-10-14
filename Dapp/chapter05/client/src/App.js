import React, { useState, useEffect,useReducer } from "react";
import FruitshopContract from "./contracts/Fruitshop.json";
import getWeb3 from "./getWeb3";


import "./App.css";

const App = () => {
  const [myApple,setMyApple] = useState(0)
  let initalState = {web3:null,instance:null,account:null}
  const [state,dispatch] = useReducer(reducer,initalState)
  
  function reducer(state,action){
    switch(action.type){
      case "INIT":
        let {web3,instance,account} = action;
        return{
          ...state,
          web3,
          instance,
          account
        }
    }
  }


  // 0xD1ec6cef3873Befd88c5C7C263E4Ca53B1DC4167
  const buyApple = async () => {
    // instance 값을 가져와야함
    let {instance,account,web3} = state;
    await instance.buyApple({
      from:account,
      value:web3.utils.toWei("10","ether"),
      gas:90000,
    })
    setMyApple(prev => prev+1)
  }

  const sellApple = async () => {
    let {instance,account,web3} = state
    await instance.sellApple(web3.utils.toWei("10","ether"),{
      from:account,
      gas:90000,
    })
    setMyApple(0)
  }

  const getApple = async (instance) => {
    if(instance == null) return
    let result = await instance.getMyApple()
    console.log(result.toNumber())
    setMyApple(result.toNumber())

  }

  const getweb = async () => {
    const contract = require('@truffle/contract');

    let web3 = await getWeb3()
    let fruitshop = contract(FruitshopContract)
    fruitshop.setProvider(web3.currentProvider)
    
    let instance = await fruitshop.deployed()
    let accounts = await web3.eth.getAccounts()

    let InitActions = {
      type:'INIT',
      web3,
      instance,
      account:accounts[0]
    }
    dispatch(InitActions)
    getApple(instance)
    // instance.sellApple()
    // instance.buyApple()

    // web와 instace, account 값 상태에 저장하기 

    // 현재 내가 가지고있는 사과를 리턴해주는 함수를 만드는것 
  }

  // componentDidMount WEB3 가져와서 메타마스크 연결 
  useEffect(()=>{
    getweb()
  },[])

  return (
    <div>
      <h1>사과 가격 : 10 ETH</h1>
      <button onClick={()=>buyApple()}>Buy</button>
      <p>내가 가지고있는 사과 : {myApple}</p>
      <button onClick={()=>sellApple()}>Sell (판매가격은:{myApple * 10} ETH)</button>
    </div>
  )
}

export default App;
