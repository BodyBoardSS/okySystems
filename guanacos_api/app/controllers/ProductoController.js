const { Categoria, Producto } = require('../models/index')

module.exports = {
    async index(req, res) {
        let productos = await Producto.findAll({
            include: {
                model: Categoria,
                as: "categoria",
                attributes: ['nombre']
            }
        })
        res.json(productos)
    },

    create(req, res) {
        Producto.create({
            nombre: req.body.nombre,
            precio: req.body.precio,
            descripcion: req.body.descripcion,
            imagen: req.body.imagen,
            categoriaid: req.body.categoriaid
        }).then(producto => {
            res.json(producto);
            console.log(`Project with id = ${producto.nombre} created successfully!`);
        }).catch(function (err) {
            res.status(500).json({ error: "El registro no pudo ser creado." });
        });
    },

    update(req, res) {
        const { id } = req.params;
        Producto.update({
            nombre: req.body.nombre,
            precio: req.body.precio,
            descripcion: req.body.descripcion,
            imagen: req.body.imagen,
            categoriaid: req.body.categoriaid
        },
            {
                where: { id: id }
            }
        ).then(function () {
            res.json({ message: "Updated successfully" });
            console.log(`Project with id = ${id} updated successfully!`);
        }).catch(function (err) {
            res.status(500).json({ error: "El registro no pudo ser actualizado." + err });
        });
    },

    delete(req, res) {
        const { id } = req.params;
        Producto.destroy({
            where: {
                id: id
            }
        }).then(function () {
            res.json({ message: "Deleted successfully" });
            console.log(`Project with id = ${id} deleted successfully!`);
        }).catch(function (err) {
            res.status(500).json({ error: "El registro no pudo ser eliminado." });
        })
    }
}