'use strict';

module.exports = (sequelize, DataTypes) => {
  const PedidoDetalle = sequelize.define('PedidoDetalle',{
    cantidad: {type: DataTypes.DOUBLE,field:'CANTIDAD'},
    precio: {type: DataTypes.DOUBLE,field:'PRECIO'},
    descuento: {type: DataTypes.DOUBLE,field:'DESCUENTO'}
  },{
    tableName: "pedido_detalle", timestamps: false,freezeTableName: true, createdAt:false,updatedAt:false
  });

  PedidoDetalle.associate = function(models) {
    PedidoDetalle.belongsTo(models.Producto,{as: "producto", foreignKey: "idproducto"});
    PedidoDetalle.belongsTo(models.Pedido,{as: "pedido", foreignKey: "idpedido"});
  }
  
  return PedidoDetalle;
};