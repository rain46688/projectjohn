
const fs = require('fs');
const { PeerServer } = require('peer');

const peerServer = PeerServer({
  port: 3000,
  ssl: {
    key : fs.readFileSync('/Users/jackson/private.key'),
    cert : fs.readFileSync('/Users/jackson/private.crt')
  }
});