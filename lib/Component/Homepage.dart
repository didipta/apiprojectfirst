import 'dart:convert';

import 'package:apiprojectfirst/Apicall/Apicall.dart';
import 'package:apiprojectfirst/Model/Photots.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  bool loader=true;
  List<Photos> photos=[];
  Future<void> _getphotos() async{
    setState(() {
    });
    photos=[];
    loader=true;
    const String Temperaturesurl="https://jsonplaceholder.typicode.com/photos";
    Uri uri=Uri.parse(Temperaturesurl);
    Response response =await get(uri);
    if(response.statusCode==200){
      List<dynamic> jsonList = jsonDecode(response.body);

      photos=jsonList.map((json) => Photos.fromJson(json)).toList();
    }
    else{

    }

    loader=false;
    setState(() {

    });
  }
  @override
  void initState(){
    super.initState();
    _getphotos();

    setState((){});


  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Gallery App",style: TextStyle(
          color: Colors.white,
          fontSize: 18
        ),),
        backgroundColor: Colors.blue,
        elevation: 1,
      ),
      body: Visibility(
        visible: loader==false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ResponsiveGridList(
          verticalGridSpacing: 8,
          horizontalGridSpacing: 8,
          horizontalGridMargin: 20,
          verticalGridMargin: 20,
          minItemsPerRow: width> 650? 2:1 ,
          minItemWidth: width> 650? width : width*0.5,
          children: List.generate(
              photos.length,
                  (index) => Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment:CrossAxisAlignment.center,

                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.network(
                            photos[index].url,
                            fit: BoxFit.cover,
                            height: 50,
                            width: 50,

                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(photos[index].title,softWrap: false),

                      ],
                    ),
                  )
          ),


        ),
      ),
    );
  }
}
