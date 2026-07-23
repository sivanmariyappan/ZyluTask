import { Sequelize } from "sequelize";
import dotenv from "dotenv";
dotenv.config();


export const sequelize  = new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASSWORD,
    {
        host: process.env.DB_HOST,
        dialect: process.env.DB_DIALECT,
        logging: false
    }
);


export const connectDB = async () => {
    try {
        await sequelize .authenticate();
        console.log("MySQL Database Connected");
    } catch (error) {
        console.log("Database Connection Error:", error.message);
    }
};


