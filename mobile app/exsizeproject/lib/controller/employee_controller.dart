
import 'package:exsizeproject/model/employee_model.dart';
import 'package:exsizeproject/services/employee_services.dart';

class EmployeeController {

  Future<List<EmployeeModel>> getEmployees() async {

    final result = await EmployeeService()
        .getEmployees();


    return result.fold(

      (error) {
        throw Exception(error);
      },


      (response) {

        final List<EmployeeModel> employees =
            (response.data["data"] as List)
                .map(
                  (json) => EmployeeModel.fromJson(json),
                )
                .toList();


        return employees;
      },

    );
  }
}