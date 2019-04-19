import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/home.dart';

class FloorTitleArea extends StatelessWidget {
  final String title;
   FloorTitleArea({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('FloorTitleArea');
    return Provide<HomeInfoProvide>(
      builder: (context,child,val){
         var homeListData = Provide.value<HomeInfoProvide>(context).homeListData;
        if (homeListData != null && homeListData['data']!=null) {
           String floorTitle = homeListData['data'][title]['PICTURE_ADDRESS'];
          //  print(floorTitle);
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(floorTitle),
          );
        }else{
          return Text('');
        }
      },
    );
  }
}