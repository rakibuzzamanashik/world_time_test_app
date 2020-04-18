import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; // location name for the UI
  String time; // time for that location
  String flag; // url to the flag icon asset
  String url; // location url for the api end point
  bool isDayTime; // determines whether it is day or night time

  // constructor
  WorldTime({this.location, this.flag, this.url});

  void getTime() async {

    try{
      // make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print("error found: $e"); // this code only prints this in the console,not in the UI
      time = "could not get time data";
    }
  }
}

