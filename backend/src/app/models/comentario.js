const { Schema, model } = require('mongoose')

const ComentarioSchema = new Schema({
    nome: {
       type: String
    },
    mensagem: {
        type: String
     } 
 }) 
    
module.exports = model("comentarios", ComentarioSchema )



