import 'package:apiprojectfirst/Model/Photots.dart';
import 'package:apiprojectfirst/Router/RouterPath.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class Photolist extends StatelessWidget{
  final List<Photos> photos;
  const Photolist({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return ResponsiveGridList(
        verticalGridSpacing: 8,
        horizontalGridSpacing: 8,
        horizontalGridMargin: 20,
        verticalGridMargin: 20,
        minItemsPerRow: width> 650? 2:1 ,
        minItemWidth: width> 650? width : width*0.5,
        children: List.generate(
            photos.length,
                (index) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(

                    onTap: (){
                      Navigator.pushNamed(context, RouterPath.detailpage,arguments:photos[index] );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                        boxShadow:[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ]
                      ),
               padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                    crossAxisAlignment:CrossAxisAlignment.center,

                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          photos[index].url,
                          fit: BoxFit.fill,
                          height: 100,
                          width: 100,

                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded( // Use Expanded to allow the text to wrap within the available space
                        child: Text(
                          photos[index].title,
                          softWrap: true,
                          style: TextStyle(fontSize: 16), // Adjust the text style as needed
                        ),
                      ),

                    ],
              ),
            ),
                  ),
                )
        ),



    );
  }
}
