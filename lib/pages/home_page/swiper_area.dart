import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../routers/application.dart';
import 'package:provide/provide.dart';
import '../../provide/home.dart';

class SwiperArea extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('SwiperArea');
    return Provide<HomeInfoProvide>(
      builder: (context, child, val) {
        var homeListData = Provide.value<HomeInfoProvide>(context).homeListData;
        if (homeListData != null && homeListData['data']!=null) {
          // var swiperDataList = homeListData.data.slides;
          List<Map> swiperDataList = (homeListData['data']['slides'] as List).cast();
          return Container(
            height: ScreenUtil().setHeight(333),
            width: ScreenUtil().setWidth(750),
            child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Application.router.navigateTo(
                        context,
                        '/detail?goodsId=${swiperDataList[index]['goodsId']}',
                      );
                    },
                    child: Image.network(
                      swiperDataList[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: swiperDataList.length,
                pagination: SwiperPagination(),
                control: SwiperControl(),
                autoplay: true),
          );
        } else {
          return Text('');
        }
      },
    );
  }
}
