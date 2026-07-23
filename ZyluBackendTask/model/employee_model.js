import { DataTypes } from "sequelize";
import { sequelize } from "../config/db_config.js";

const Employee =sequelize.define(
    "Employee",
    {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },

        name: {
            type: DataTypes.STRING(100),
            allowNull: false
        },

        email: {
            type: DataTypes.STRING(100),
            allowNull: false,
            unique: true
        },

        department: {
            type: DataTypes.STRING(100),
            allowNull: false
        },

        salary: {
            type: DataTypes.INTEGER,
            allowNull: false
        },

        experience: {
            type: DataTypes.INTEGER,
            allowNull: false
        },

        image:{
             type: DataTypes.STRING(200),
            allowNull: false
        },
        active: {
            type: DataTypes.BOOLEAN,
            defaultValue: true
        },

        joiningDate: {
            type: DataTypes.DATEONLY,
            allowNull: true
        }
    },
    {
        tableName: "employees",
        timestamps: true
    }
);


export default Employee;