import 'package:exsizeproject/controller/employee_controller.dart';
import 'package:exsizeproject/presentations/employee/bloc/employee_event.dart';
import 'package:exsizeproject/presentations/employee/bloc/employee_state.dart';
import 'package:exsizeproject/model/employee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {

  EmployeeBloc() : super(EmployeeState(employees: [])) {

    on<InitailLoad>(_getEmployees);

  }


  Future<void> _getEmployees(
      InitailLoad event,
      Emitter<EmployeeState> emit,
      ) async {
    try {

      emit(state.copyWith(loading: true));


      final List<EmployeeModel> employees =
          await EmployeeController().getEmployees();


      emit(
        state.copyWith(employees:employees,loading: false )
      );


    } catch (e) {

        emit(
        state.copyWith(errorMessage: e.toString(),loading: false )
      );

    }
  }
}