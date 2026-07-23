
import Employee from "../model/employee_model.js";
export async function addEmployees(req,res){

    try {
        const employee = await Employee.create(req.body);

        res.status(201).json({
            message:"Employee created successfully",
            data:employee
        });

    } catch(error){

        res.status(500).json({
            message:error.message
        });
    }
}
// Get All Employees
export async function getEmployee(req, res) {
    try {
        const employees = await Employee.findAll();

        res.status(200).json({
            message: "Employees fetched successfully",
            data: employees
        });

    } catch (error) {

        res.status(500).json({
            message: error.message
        });
    }
}