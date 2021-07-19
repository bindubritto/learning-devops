
'use strict'

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0'

// App
const app = express();

app.get('/', (request, response) => {
  response.send('Internal service is running successfully')
})

app.get('/api/v1/internal', (request, response) => {
  console.log('request come form external service', request);
  response.send('Getting data from internal api');
})

app.listen(PORT, HOST)
console.log(`Internal service running on http://${HOST}:${PORT}`);