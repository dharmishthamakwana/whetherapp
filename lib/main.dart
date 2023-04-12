import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:whetherapp/screens/home/provider/whether_provider.dart';
import 'package:whetherapp/screens/home/view/whether_screen.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>WhtherProvider(),),
        // ChangeNotifierProvider(create: (context)=>Wether_Provider(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>First_Screen(),
        },
      ),
    ),
  );
}