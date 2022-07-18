'use strict';

module.exports = (sequelize, DataTypes) => {
  const Metodo = sequelize.define('Metodo',{
    nombre: {
      type: DataTypes.STRING,
      allowNull: false
    }
  },{
    tableName: "metodo", timestamps: false,freezeTableName: true, createdAt:false,updatedAt:false
  });

  Metodo.associate = function(models) {
  }
  
  return Metodo;
};