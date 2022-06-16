import 'package:flutter/material.dart';
import 'package:hydrahomie/DataTable.dart';
import 'package:intl/intl.dart';


import 'MQTTAppState.dart';
import 'MQTTManager.dart';


TextEditingController Sip = TextEditingController();
TextEditingController Liter = TextEditingController();
TextEditingController Hydration = TextEditingController();
DateFormat dateFormat = DateFormat("yyyy-MM-dd");
bool ishydrate = true;
List<DataRow> dataRows = [];
late MQTTAppState currentAppState;
late MQTTManager manager;
Row? sips;

Widget mainWidget(){
  Sip.text = "0";
  Liter.text = "0.0 l";
  Hydration.text = "Dehydrated";
  currentAppState = MQTTAppState();
  Widget main = mainlayout();
  return main;
}

Widget mainlayout() {
  return Column(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset(
                  'assets/images/Logo.JPG',
                  width: 150,
                  height: 150,
                  ),
              ],
            ),
            rows('Sip Counter', Sip),
            rows('Liter Consumtion', Liter),
            HydratedDehydrated(),
            Row(
              children: [
                Infotable()
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                child: const Text("Connect"),
                onPressed:() {savedata();},
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                    fixedSize: const Size(180, 50),
                    padding: const EdgeInsets.all(5),
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold)
                ),
                ),
              ],
            )
          ]
        );
}

Widget rows(String titleText, TextEditingController controller){
  return Card(
    elevation: 5,
    child: ListTile(
      title: Text(titleText,
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        height: 100,
        width: 100,
        child: TextField(
          controller: controller,
          textAlign: TextAlign.right,
          readOnly: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      )
      ),
  );
}

Widget HydratedDehydrated() {
  return Card(
    elevation: 5,
    child: ListTile(
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          height: 50,
          width: double.infinity,
          child: TextField(
            controller: Hydration,
            textAlign: TextAlign.center,
            readOnly: true,
            style: TextStyle(fontSize: 34.0, height: 2.0, color: Colors.black),
            decoration: const InputDecoration(
              border: InputBorder.none,

            ),
          ),
        )
    ),
  );
}

Widget Infotable(){
  return DataTable(

    horizontalMargin: 10,
    columns: const <DataColumn>[
      DataColumn(
        label: Text(
          'Date',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      DataColumn(
        label: Text(
          'Sip',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      DataColumn(
        label: Text(
          'Liter',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      DataColumn(label: Text('Hydration', style: TextStyle(fontStyle: FontStyle.italic),),),
    ],
    rows: dataRows,
  );
}

void _configureAndConnect() {
  // ignore: flutter_style_todos
  // TODO: Use UUID

  manager = MQTTManager(
      host: "broker.mqttdashboard.com",
      topic: "aisoudfoiasdfzasdufizasodiufzaosd",
      identifier: "TestApp-546546546",
      state: currentAppState);
  manager.initializeMQTTClient();
  manager.connect();
}

