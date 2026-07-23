import 'package:equatable/equatable.dart';
import 'package:exsizeproject/model/employee_model.dart';



class EmployeeState extends Equatable {
  final List<EmployeeModel> employees;
  final bool loading;
  final String errorMessage;

  const EmployeeState({
    required this.employees,
    this.loading=false,
    this.errorMessage=''
  });


  EmployeeState copyWith({
    List<EmployeeModel>? employees,
    bool? loading,
    String? errorMessage
  }) {
    return EmployeeState(
      employees: employees ?? this.employees,
      loading:loading?? this.loading,
      errorMessage:errorMessage??this.errorMessage
    );
  }


  @override
  List<Object?> get props => [
    employees,
    loading,
    errorMessage
  ];
}