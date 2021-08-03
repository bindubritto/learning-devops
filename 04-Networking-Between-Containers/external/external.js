'use strict';

const express = require('express');
const axios = require('axios')

// Constants
const PORT = 8081;
const HOST = '0.0.0.0';

// App
const app = express();
app.use(express.json());


const INTERNAL_API = "http://172.17.0.2:8080/api/v1/internal";


app.get('/', (request, response) => {
  response.send('External service is running successfully')
})


// Making request to internal service

app.get('/api/v1/external', async (request, response) => {

  console.info('Requesting to ', INTERNAL_API);

  try{
    const internalResponse = await axios.get(INTERNAL_API);
    console.log('internal response ', internalResponse.data);
    
    // const finalResponse = {
    //   msg: 'communication successful',
    //   response: internalResponse.data
    // }

    // send the response to the outer world
    response.send(internalResponse.data);

  } catch(err){
    // handle the error
    const errResponse = {
      msg: 'error', err
    }
    response.send(err)
  }
})



app.listen(PORT, HOST);
console.log(`External service running on http://${HOST}:${PORT}`);