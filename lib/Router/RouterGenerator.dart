


import 'package:apiprojectfirst/Component/Homepage.dart';
import 'package:flutter/material.dart';

import 'RouterPath.dart';


MaterialPageRoute? materialPageRoute(RouteSettings settings){
  Widget? widget;
  switch(settings.name){
    case RouterPath.homepath:
      widget = const HomePage();
      break;
    case RouterPath.detailpage:

      break;

  }
  if(widget !=null){
    return MaterialPageRoute(builder: (context)=>widget!);
  }

  return null;
}