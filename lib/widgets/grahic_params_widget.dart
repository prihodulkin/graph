import 'package:computer_graphics_1/bloc/graphic_paras_bloc/graphic_params_bloc.dart';
import 'package:computer_graphics_1/models/fun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphicParamsWidget extends StatefulWidget {
  const GraphicParamsWidget({Key? key}) : super(key: key);

  @override
  State<GraphicParamsWidget> createState() => _GraphicParamsWidgetState();
}

class _GraphicParamsWidgetState extends State<GraphicParamsWidget> {
  TextEditingController minXEditingController = TextEditingController();
  TextEditingController maxXEditingController = TextEditingController();

  @override
  void dispose() {
    minXEditingController.dispose();
    maxXEditingController.dispose();
    super.dispose();
  }

  static const List<Fun> functions = <Fun>[
    Fun.sin,
    Fun.cos,
    Fun.exp,
    Fun.x_2,
    Fun.x_3
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GraphicParamsBloc, GraphicParamsState>(
      listener: (context, state) {
        if (state is GraphicParamsError) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    content: Text(state.errorMessage),
                  ));
        }
      },
      buildWhen: (_, state) => state is GraphicParams,
      builder: (context, state) {
        minXEditingController.text = (state as GraphicParams).xMin.toString();
        maxXEditingController.text = (state).xMax.toString();
        return Container(
          color: Colors.white10,
          child: Column(
            children: [
              ...functions
                  .map((fun) => ListTile(
                        title: Text(fun.getName()),
                        leading: Radio(
                          value: fun,
                          groupValue: (state).fun,
                          onChanged: (Fun? fun) =>
                              BlocProvider.of<GraphicParamsBloc>(context)
                                  .add(FunChanged(fun!)),
                        ),
                      ))
                  .toList(),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                validator: (value) =>
                    double.tryParse(value!) == null ? "Incorrect input" : null,
                decoration: InputDecoration(labelText: "X min"),
                controller: minXEditingController,
                onFieldSubmitted: (value) =>
                    BlocProvider.of<GraphicParamsBloc>(context)
                        .add(MinXChanged(double.parse(value))),
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                validator: (value) =>
                    double.tryParse(value!) == null ? "Incorrect input" : null,
                decoration: InputDecoration(labelText: "X max"),
                controller: maxXEditingController,
                onFieldSubmitted: (value) =>
                    BlocProvider.of<GraphicParamsBloc>(context)
                        .add(MaxXChanged(double.parse(value))),
              ),
            ],
          ),
        );
      },
    );
  }
}
