// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../home/modal/whether_modal.dart';
//
// class HomeProvider extends ChangeNotifier
// {
//
//   String lon = "72.8333";  String lan = "21.1667";
//
//   void changeWeather(String wlan,String wlon)
//   {
//     lan = wlan;
//     lon = wlon;
//     notifyListeners();
//
//   }
//
//   Future<Weathermodal> Wfactory( String logi, String lati) async {
//     String newslike = "https://api.openweathermap.org/data/2.5/weather?lat=$logi&lon=$lati&appid=9628b95a2235abb2f18055013ade5de8";
//     Uri uri=Uri.parse(newslike);
//     var response=await  http.get(uri);
//     var newsjson = jsonDecode(response.body);
//     Weathermodal weathermodal=Weathermodal.fromJson(newsjson);
//     return  weathermodal;
//   }
// }

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../home/modal/whether_modal.dart';

class ApiHelper {
  Weathermodal? newsModal;

  Future<Weathermodal?> wetherapi(String lat, String lon) async {
    String? apiLink =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=9628b95a2235abb2f18055013ade5de8";
    Uri uri = Uri.parse(apiLink);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    Weathermodal newsModal = Weathermodal.fromJson(json);
    return newsModal;
  }
}
