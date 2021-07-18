'use strict';

const express = require('express');
const axios = require('axios');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();

app.use(express.json());

app.get('/', (req, res) => {
  res.send('Hello World from Internal Service');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);