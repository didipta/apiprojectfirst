


import 'package:apiprojectfirst/Component/Homepage.dart';
import 'package:apiprojectfirst/Component/Photodetailes.dart';
import 'package:apiprojectfirst/Model/Photots.dart';
import 'package:flutter/material.dart';

import 'RouterPath.dart';


MaterialPageRoute? materialPageRoute(RouteSettings settings){
  Widget? widget;
  switch(settings.name){
    case RouterPath.homepath:
      widget = const HomePage();
      break;
    case RouterPath.detailpage:
      Photos photo=settings.arguments as Photos;
      widget=Photodetails(photos: photo);
      break;

  }
  if(widget !=null){
    return MaterialPageRoute(builder: (context)=>widget!);
  }

  return null;
}