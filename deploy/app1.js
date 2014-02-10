console.log("App 1 starting");
var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end("Hello from App 1");
  process.exit();
}).listen(3001);