const mongoose = require('mongoose');

function connect() {
    mongoose.connect("mongodb://localhost/fseletro",
    { useNewUrlParser: true, useUnifiedTopology: true})
    .then(() => {
        console.log("MongoDB conetou com sucesso!")
    })
    .catch(()=> {
        console.log(error)
    })

}

module.exports = connect()