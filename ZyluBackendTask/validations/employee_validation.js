import { Joi } from "express-validation";


export const createEmployeeValidation = {

    body: Joi.object({

        name: Joi.string()
            .min(3)
            .required(),

        email: Joi.string()
            .email()
            .required(),

        department: Joi.string()
            .required(),

        salary: Joi.number()
            .required(),

        experience: Joi.number()
            .min(0)
            .required(),

        active: Joi.boolean()
            .required(),
        image:Joi.string().required()

    })

};


