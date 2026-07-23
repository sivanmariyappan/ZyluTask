import 'package:exsizeproject/common/theme_config.dart';
import 'package:exsizeproject/presentations/employee/bloc/employee_bloc.dart';
import 'package:exsizeproject/presentations/employee/employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Zylu',

      theme: AppTheme.theme,

      home: MultiBlocProvider(

        providers: [

          BlocProvider<EmployeeBloc>(
            create: (context) => EmployeeBloc(),
          ),

        ],


        child: const EmployeeScreen(),

      ),
    );
  }
}