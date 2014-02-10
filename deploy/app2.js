console.log("App 2 starting");
var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end("Hello from App 2");
 process.exit();
}).listen(3002);