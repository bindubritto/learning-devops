'use strict';

const express = require('express');

// Constants
const PORT = 8081;
const HOST = '0.0.0.0';

// App
const app = express();

const INTERNAL_API = "http://localhost:8080/api/v1/internal";

app.use(express.json());


app.get('/', (request, response) => {
  response.send('External service is running successfully')
})


// Making request to internal service

app.get('/api/v1/external', async (request, response) => {

  console.info('Requesting to ', INTERNAL_API);

  try{
    const internalResponse = await axios.get(INTERNAL_API);
    console.log('internal response ', internalResponse.body);
    
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