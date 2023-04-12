import 'package:flutter/widgets.dart';

import '../../utiles/apihelper.dart';
import '../modal/whether_modal.dart';

class WhtherProvider extends ChangeNotifier {
  List city = ["Surat","Mumbai","Delhi","Jaipur","Kolkata","Chennai","Bangalore"];
  List long = ["72.8311","72.8777","77.1025","75.7873","88.3639","80.237617","77.580643"];
  List lat = ["21.1702","19.0760","28.7041","26.9124","22.5726","13.067439","12.972442"];
  String logi = "72.8311";
  String lati = "21.1702";
  List cityimgage = [
    "https://images.pexels.com/photos/14676831/pexels-photo-14676831.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/13389827/pexels-photo-13389827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/12446192/pexels-photo-12446192.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/13207723/pexels-photo-13207723.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/12446195/pexels-photo-12446195.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/14353572/pexels-photo-14353572.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/10879261/pexels-photo-10879261.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/10890155/pexels-photo-10890155.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/3290386/pexels-photo-3290386.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];
  String imgage = "https://images.pexels.com/photos/14676831/pexels-photo-14676831.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";

  TextEditingController txtsearch=TextEditingController();
  Weathermodal? weatherdatamodal;

  Future<Weathermodal?> getwether(String lat,String  lon) async {
    ApiHelper apiHelper = ApiHelper();
    Weathermodal? newsModal = await apiHelper.wetherapi(lat,lon);
    weatherdatamodal = newsModal;
    return newsModal;
  }  void changeapi(String logii,String latii,int i)
  {
    logi = logii;
    lati = latii;
    imgage = cityimgage[i];

    notifyListeners();
  }
}










// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../modal/whether_modal.dart';
//
// class weathere_Provider extends ChangeNotifier{
//
//   List city = ["Surat","Mumbai","Delhi","Jaipur","Kolkata","Agra","Chennai","Kochi","Hyderabad","Bangalore"];
//   List long = ["72.8311","72.8777","77.1025","75.7873","88.3639","78.008072","80.237617","76.267303","78.491684","77.580643"];
//   List lat = ["21.1702","19.0760","28.7041","26.9124","22.5726","27.176670","13.067439"," 9.931233","17.387140","12.972442"];
//   String logi = "72.8311";
//   String lati = "21.1702";
//   List cityimgage = [
//     "https://images.pexels.com/photos/14676831/pexels-photo-14676831.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "https://images.pexels.com/photos/13389827/pexels-photo-13389827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "https://images.pexels.com/photos/12446192/pexels-photo-12446192.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "https://images.pexels.com/photos/3581368/pexels-photo-3581368.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "https://images.pexels.com/photos/13207723/pexels-photo-13207723.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "https://images.pexels.com/photos/12446195/pexels-photo-12446195.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "https://images.pexels.com/photos/14353572/pexels-photo-14353572.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "https://images.pexels.com/photos/10879261/pexels-photo-10879261.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "https://images.pexels.com/photos/10890155/pexels-photo-10890155.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//     "https://images.pexels.com/photos/3290386/pexels-photo-3290386.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//   ];
//   String imgage = "https://images.pexels.com/photos/14676831/pexels-photo-14676831.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
//
//   Future<Weathermodal> Wfactory() async {
//     String newslike = "https://api.openweathermap.org/data/2.5/weather?lat=$logi&lon=$lati&appid=9628b95a2235abb2f18055013ade5de8";
//     var newsString = await http.get(Uri.parse(newslike));
//     var newsjson = jsonDecode(newsString.body);
//     print("${newsString.body}" );
//     return  Weathermodal.fromJson(newsjson);
//   }
//
//   void changeapi(String logii,String latii,int i)
//   {
//     logi = logii;
//     lati = latii;
//     imgage = cityimgage[i];
//
//     notifyListeners();
//   }
// }