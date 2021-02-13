const mongoose = require('mongoose')
require('../models/comentario')

const Comentario = mongoose.model('comentarios')

module.exports = {
    async post(request, response){
        const {nome, mensagem} = request.body
        const comentario = await Comentario.create({nome, mensagem})
        return response.json(comentario)
        
    },

    async listar(request, response){
        const comentarios = await Comentario.find()

        return response.json(comentarios)
    }
}







