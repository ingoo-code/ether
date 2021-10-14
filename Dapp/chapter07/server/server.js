const express = require('express')
const bodyParser = require('body-parser')
const router = require('./routes')
const app = express()

app.use(bodyParser.urlencoded({extended:false}))
app.use(bodyParser.json())

app.use(`/`,router)

app.listen(3001,()=>{
    console.log(`server listen port on : 3000`)
})