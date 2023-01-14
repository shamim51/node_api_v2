// const http = require ('http');

// const server = http.createServer((req, res)=>{
//     if(req.method === 'GET'){
//         res.end({message: "hello"});
//         console.log("new req");
//     }
// })

// server.listen('8000', ()=>{
//     console.log('listening to port 8000');
// })

const app = require('./server');

app.listen(8000, ()=>{
  console.log('server started on port 8000');

})