import express, { json } from "express";
import cors from 'cors';
import employeeRoute from "../exsize/router/employee_route.js";
import { ValidationError } from 'express-validation';
import { sequelize, connectDB } from "../exsize/config/db_config.js";
import dotenv from "dotenv";
dotenv.config();


const app=express();
app.use(cors());
app.use(json());

app.use("/employees",employeeRoute);


app.use(function(err, req, res, next) {
  if (err instanceof ValidationError) {
    return res.status(err.statusCode).json(err)
  }
  return res.status(500).json(err)
})

await connectDB();

await sequelize.sync();
app.listen(process.env.PORT,async()=>{
 
    console.log(`Server running correctly on port ${process.env.PORT}`);
});

