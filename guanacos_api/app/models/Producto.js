'use strict';

module.exports = (sequelize, DataTypes) => {
  const Producto = sequelize.define('Producto',{
    nombre: {type: DataTypes.STRING,field:'NOMBRE'},
    precio: {type: DataTypes.DECIMAL,field:'PRECIO'},
    descripcion: {type: DataTypes.STRING,field:'DESCIPCION'},
    imagen: {type: DataTypes.STRING,field:'IMAGEN'}
  },{
    tableName: "producto", timestamps: false,freezeTableName: true, createdAt:false,updatedAt:false
  });

  Producto.associate = function(models) {
    Producto.belongsTo(models.Categoria, {as: "categoria", foreignKey:"categoriaid"});
  }
  return Producto;
};