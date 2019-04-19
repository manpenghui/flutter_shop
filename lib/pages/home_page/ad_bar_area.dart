import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../routers/application.dart';
import 'package:provide/provide.dart';
import '../../provide/home.dart';

class AdBarArea extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('SwiperArea');
    return Provide<HomeInfoProvide>(
      builder: (context, child, val) {
        var homeListData = Provide.value<HomeInfoProvide>(context).homeListData;
        if (homeListData != null && homeListData['data']!=null) {
          // var adPicture = homeListData.data.advertesPicture.pICTUREADDRESS;
          String adPicture =homeListData['data']['advertesPicture']['PICTURE_ADDRESS'];
          return Container(
            child: Image.network(adPicture),
          );
        } else {
          return Text('');
        }
      },
    );
  }
}
