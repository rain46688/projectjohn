var app = require('express')();
var https = require('https');
const fs =require('fs'),
helmet = require("helmet");

const option = {
    key : fs.readFileSync('/Users/jackson/private.key'),
    cert : fs.readFileSync('/Users/jackson/private.crt')
};

var server = https.createServer(option, app);
server.listen(83);
var io = require('socket.io').listen(server);

app.get('/', function (req, res) {
    res.send('<h1>안녕하세요 "/" 경로 입니다.</h1>');
});

io.on('connection', socket => {
    socket.on('join-room', (roomId, userId) => {
        console.log(roomId, userId)
        socket.join(roomId)
        socket.to(roomId).broadcast.emit('user-connected',userId)
        socket.on('disconnect',() => {
            socket.to(roomId).broadcast.emit('user-disconnected',userId);
        })
    })
})

// https.listen(82, function () {
//     console.log('listening on *:82');
// });

// io.set('transports', ['websocket',
//     'flashsocket',
//     'htmlfile',
//     'xhr-polling',
//     'jsonp-polling',
//     'polling']);

app.use(helmet());

app.use((req,res)=> {
    res.writeHead(200);
    console.log('listening on *:83');
})

app.listen(82);

