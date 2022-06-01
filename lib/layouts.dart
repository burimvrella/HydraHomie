import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String Sip = '5';
String Liter = '0.5';
DateFormat dateFormat = DateFormat("yyyy-MM-dd");
bool ishydrate = true;
List<DataRow> dataRows = [];

Widget mainWidget(){
  return mainlayout();
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
            rows('Liter Consumtion', '$Liter l'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                  HydratedDehydrated("Hydrated",ishydrate),
                  HydratedDehydrated("Dehydrated",!ishydrate)
              ],
            ),
            Row(
              children: [
                Infotable()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                child: const Text("Connect"),
                onPressed:() {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                    fixedSize: const Size(180, 50),
                    padding: const EdgeInsets.all(5),
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold)
                ),
                ),
                ElevatedButton(
                  child: const Text("Save"),
                  onPressed: () {savedata();},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
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

void savedata() {
  String date = dateFormat.format(DateTime.now());
  String name = ishydrate ? 'Hydrated' : 'Dehydrated';
  dataRows.add(DataRow(
    cells: <DataCell>[
      DataCell(Text(date)),
      DataCell(Text('5')),
      DataCell(Text('0.5 l')),
      DataCell(Text(name)),
    ],
  ));
}


Widget rows(String titleText, String boxTitle){
  return Card(
    elevation: 5,
    child: ListTile(
      title: Text(titleText,
      ),
      trailing: Text(boxTitle)
      ),
  );
}

Widget HydratedDehydrated(String info,bool hydrated){
  return Container(
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(5),
    width: 180,
    height: 50,
    decoration: BoxDecoration(
      color: hydrated ? Colors.lightBlue : Colors.white,
      shape: BoxShape.rectangle,
      border: Border.all(width: 3.0),
      borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: Center(
      child:
        Text(info,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
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
      DataColumn(
        label: Text(
          'Hydration',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
    ],
    rows: dataRows,
  );
}




