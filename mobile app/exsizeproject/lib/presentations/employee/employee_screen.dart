import 'package:exsizeproject/presentations/employee/bloc/employee_bloc.dart';
import 'package:exsizeproject/presentations/employee/bloc/employee_event.dart';
import 'package:exsizeproject/presentations/employee/bloc/employee_state.dart';
import 'package:exsizeproject/presentations/employee/widgets/appbar_widget.dart';
import 'package:exsizeproject/presentations/employee/widgets/employee_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}


class _EmployeeScreenState extends State<EmployeeScreen> {

  @override
  void initState() {
    super.initState();

    context.read<EmployeeBloc>().add(
      InitailLoad(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppbarWidget(
          title: const Text("Employees"),    
        ),     
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
         final fivePlusYearsCount = state.employees
    .where((employee) =>
        employee.experience != null &&
        employee.experience! >= 5)
    .length;

          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }         

           return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _employeeInfo(Icons.people, "Total Employees \n${state.employees.length}"),
                      
                      _employeeInfo(Icons.check_circle, "5+ years & Active\n$fivePlusYearsCount")
                    ],
                  ),
              ),
              Expanded(
                child: EmployeeCardWidget()
                )
            ],
           );     


        },
      ),
    );
  }


  Widget _employeeInfo(IconData icon, String text) {
  return Row(
    children: [
      Icon(
        icon,
        size: 20,
        color: Colors.blue,
      ),
      const SizedBox(width: 15),
      Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
}