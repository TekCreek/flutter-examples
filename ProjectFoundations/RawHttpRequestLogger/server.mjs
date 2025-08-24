// server.mjs
import express from 'express';

const app = express();

app.use((req, res, next) => {
  let rawBody = '';

  req.on('data', (chunk) => {
    rawBody += chunk;
  });

  req.on('end', () => {
    // Dump raw HTTP info
    console.log('--- RAW REQUEST ---');
    console.log(`${req.method} ${req.url} HTTP/${req.httpVersion}`);
    for (const [key, value] of Object.entries(req.headers)) {
      console.log(`${key}: ${value}`);
    }
    console.log('');
    console.log(rawBody);
    console.log('-------------------');

    res.sendStatus(200);
  });
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server listening on http://localhost:${PORT}`);
});
