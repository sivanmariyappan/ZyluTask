

import 'package:either_dart/either.dart';
import 'package:exsizeproject/common/constant/app_constant.dart';
import '../network/dio_client.dart';



class EmployeeService {

  final DioClient dioClient = DioClient();


  Future<Either> getEmployees() async {

    try {

      final response = await dioClient.get(
        AppConstant.getEmployee,
      );     

      return Right(response);


    } catch (e) {

      return Left(        
          e.toString(),  
      );

    }
  }
}