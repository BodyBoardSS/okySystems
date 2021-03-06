'use strict';

module.exports = (sequelize, DataTypes) => {
  const Rol = sequelize.define('Rol',{
    rol: {
      type: DataTypes.STRING,
      allowNull: false
    }
  },{
    tableName: "rol",freezeTableName: true
  });

  Rol.associate = function(models) {
    Rol.belongsToMany(models.Usuario, {
        as: "usuarios", 
        through: "usuario_rol", 
        foreignKey: "idrol"
      });
  }
  
  return Rol;
};