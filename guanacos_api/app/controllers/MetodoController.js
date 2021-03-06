const { Metodo } = require('../models/index')

module.exports = {
    async index(req, res) {
        let metodos = await Metodo.findAll()
        res.json(metodos)
    },

    create(req, res) {
        Metodo.create({
            nombre     : req.body.nombre
        }).then(metodo => {
            console.log(`Project with id = ${metodo.nombre} created successfully!`);
            Metodo.findAll().then(metodos => {
                res.json(metodos);
            });
        }).catch(function (err) {
            res.status(500).json({ error: "El registro no pudo ser creado." });
        });
    },

    update(req, res) {
        const { id } = req.params;
        Metodo.update({
            nombre     : req.body.nombre
        },
            {
                where: { id: id }
            }
        ).then(function () {
            console.log(`Project with id = ${id} updated successfully!`);
            Metodo.findAll().then(metodos => {
                res.json(metodos);
            });
        }).catch(function (err) {
            res.status(500).json({ error: "El registro no pudo ser actualizado."+ err});
        });
    },

    delete(req, res) {
        const { id } = req.params;
        Metodo.destroy({
            where: {
                id: id
            }
        }).then(function () {
            console.log(`Project with id = ${id} deleted successfully!`);
            Metodo.findAll().then(metodos => {
                res.json(metodos);
            });
        }).catch(function (err) {
            res.status(500).json({ error: "El registro no pudo ser eliminado." });
        })
    }
}