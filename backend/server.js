const express = require('express');

const server = express();

const cors = require('cors');

server.use(cors())
server.use(express.json());
server.use(express.urlencoded({extended:true}))
require('./src/config/database/connect')


const comentariosControllers = require('./src/app/controllers/comentariosControllers');


server.post('/comentario', comentariosControllers.post);
server.get('/comentario', comentariosControllers.listar);


server.listen(3333, function(){
    console.log('Servidor Ativo')
});

