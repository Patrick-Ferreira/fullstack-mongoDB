const app = require ('../server')
const connection = require('./config/connection')
const comenatrio = require('./app/models/comentario')


app.get("/", async (res, res) => {
    const resultado = await comenatrio.find()

    res.json(resultado)
})

app.post("/", async (req, res) => {
    const { nome, mensagem } = req.body

    let resultado = await comentario.create({ nome, mensagem})

    res.json(resultado)
})