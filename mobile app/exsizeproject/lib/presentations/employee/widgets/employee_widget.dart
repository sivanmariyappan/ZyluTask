import 'package:exsizeproject/presentations/employee/bloc/employee_bloc.dart';
import 'package:exsizeproject/presentations/employee/bloc/employee_state.dart';
import 'package:exsizeproject/presentations/employee/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeCardWidget extends StatefulWidget {
  const EmployeeCardWidget({super.key});

  @override
  State<EmployeeCardWidget> createState() => _EmployeeCardWidgetState();
}

class _EmployeeCardWidgetState extends State<EmployeeCardWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      buildWhen: (previous, current) => previous.employees!=current.employees,
        builder: (context, state) {
        return ListView.builder(        
          itemCount: state.employees.length,
          itemBuilder: (context,index){
            return CardWidget(
                name: state.employees[index].name ?? "",
                email: state.employees[index].email ?? "",
                department: state.employees[index].department ?? "",
                salary: state.employees[index].salary ?? 0,
                experience: state.employees[index].experience ?? 0,
                active: state.employees[index].active ?? false,
                joiningDate: state.employees[index].joiningDate,
                image:state.employees[index].image??""
              );
        });

        }
    );
  }
}