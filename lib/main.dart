import 'package:flutter/material.dart';
import 'package:playstore/screen/basescreen/provider/bases_provider.dart';
import 'package:playstore/screen/basescreen/view/bases_screen.dart';
import 'package:playstore/screen/gane/tab1/view/view.dart';
import 'package:playstore/screen/gane/tab2/view/topview.dart';
import 'package:playstore/screen/view/appscreen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Baseprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Basescreen(),
          '1' : (context) => Foryouscreen(),
          '2' : (context) => Topviewscreen(),
          '3' : (context) => Appliactionscreen(),
        },
      ),
    ),
  );
}