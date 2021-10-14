import React, { useState,useEffect } from "react";
import FruitshopContract from "./contracts/Fruitshop.json";
import getWeb3 from "./getWeb3";

import "./App.css";

const App = () => {
  const [shopInstance,setShopInstance] = useState(null)
  const [myAccount,setMyAccount] = useState(null)
  const [myApple,setMyApple] = useState(0)
  const [web3,setWeb3] = useState(null)

  useEffect(()=>{
    getWeb3().then( results=> {
      setWeb3(results.web3)
    })
  },[])

  function instantiateContract(){
    const contract = require('@truffle/contract');
    const fruitshop = contract(FruitshopContract)
    fruitshop.setProvider(web3.currentProvider)
    web3.eth.getAccounts( (error,accounts)=>{
      if (!error) {
        fruitshop.deployed().then(instance=> {
          setShopInstance(instance)
          myAccount(accounts[0])
        })
      }
    })
  }
}

export default App;
