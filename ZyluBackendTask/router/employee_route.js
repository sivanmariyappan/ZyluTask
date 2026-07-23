import { Router } from "express";
const router=Router();
import { addEmployees, getEmployee } from "../controller/employee_controller.js";
import { validate } from 'express-validation';
import { createEmployeeValidation } from "../validations/employee_validation.js";

router.post("/createEmploye",
    validate(createEmployeeValidation),
     addEmployees
    );
router.get("/getEmploye",getEmployee);

export default router;