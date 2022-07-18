const { Usuario } = require('../models/index')

module.exports = {
    isAdmin(req, res, next) {
        if(Usuario.isAdmin(req.usuario.roles))
            next()
        else 
            res.status(401).json({msg: "Permisos insuficientes"})
    }
}