import 'package:computer_graphics_1/bloc/graphic_paras_bloc/graphic_params_bloc.dart';
import 'package:computer_graphics_1/pages/graphic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => GraphicParamsBloc(),
        child: GraphicPage(),
      ),
    );
  }
}
