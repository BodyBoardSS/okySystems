const express = require('express');
const app = express();
const { sequelize } = require('./models/index')

//Settings
const PORT = process.env.PORT || 3001;

//Middlewares
app.use(express.json())
app.use(express.urlencoded({extended: false}))

//Routes
app.use(require('./routes'))

app.listen(PORT, () => {
  console.log(`Example app listening on port ${PORT}`)

  sequelize.authenticate().then(() => {
    console.log('Conectado')
  }).catch(function (err) {
    console.log(`No conectado: ${err}`)
    console.log(process.env.DB_PASSWORD)
  })
});