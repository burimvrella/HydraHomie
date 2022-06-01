import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrahomie/layouts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Hydra-Homie',
      home: ControllWaterIntake(),
    );
  }
}

class ControllWaterIntake extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WaterIntake();
}

class _WaterIntake extends State<ControllWaterIntake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Center(
            child:
              Text('Hydra-Homie',
                  textAlign: TextAlign.center
              ),
        ),
        ),
      body: mainWidget()
    );
  }
}

