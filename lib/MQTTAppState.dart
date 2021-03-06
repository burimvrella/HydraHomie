import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrahomie/main.dart';
import 'package:intl/intl.dart';
import 'layouts.dart';

enum MQTTAppConnectionState { connected, disconnected, connecting }
class MQTTAppState with ChangeNotifier{
  MQTTAppConnectionState _appConnectionState = MQTTAppConnectionState.disconnected;
  String _receivedText = '';
  String _historyText = '';

  void setReceivedText(String text) {
    int sips;
    double liters;
    if(isNumeric(text)) {
      gotData = true;
      sips = int.parse(text);
      liters = sips / 40;
      if(liters > 2) {
        Hydration.text = "Hydrated";
      } else {
        Hydration.text = "Dehydrated";
      }
      DateTime now = DateTime.now();
      String now_str = DateFormat('yyyy-MM-dd').format(now);
      dataRows.add(DataRow(cells: [
        DataCell(
          Text(now_str)
        ),
        DataCell(
            Text(sips.toString())
        ),
        DataCell(
            Text(liters.toString())
        ),
        DataCell(
            Text(Hydration.text)
        )
      ]));
      asdf.setState(() {

      });
    }
    else {
      sips = 0;
      liters = 0.0;
    }
    Sip.text = sips.toString();
    Liter.text = liters.toString() + " l";
    _historyText = _historyText + '\n' + _receivedText;
    notifyListeners();
  }
  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
    notifyListeners();
  }

  String get getReceivedText => _receivedText;
  String get getHistoryText => _historyText;
  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }
}

