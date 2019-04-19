import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';
import 'package:provide/provide.dart';
import '../../provide/home.dart';

class TopNavigatorArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('TopNavigator');
    return Provide<HomeInfoProvide>(
      builder: (context, child, val) {
        var homeListData = Provide.value<HomeInfoProvide>(context).homeListData;
        if (homeListData != null && homeListData['data'] != null) {
          // List navigatorList = homeListData.data.category;
          List<Map> navigatorList = (homeListData['data']['category'] as List).cast();
          if (navigatorList.length > 10) {
            navigatorList.removeRange(10, navigatorList.length);
          }
          return Container(
            height: ScreenUtil().setHeight(260),
            padding: const EdgeInsets.all(3.0),
            child: GridView.count(
              physics:
                  NeverScrollableScrollPhysics(), // 禁止滚动   因为全局的上拉加载和此处的会有冲突
              crossAxisCount: 5,
              padding: EdgeInsets.all(5.0),
              children: navigatorList.map((item) {
                return _girdViewItemUi(context, item);
              }).toList(),
            ),
          );
        } else {
          return Text('');
        }
      },
    );
  }

  Widget _girdViewItemUi(BuildContext context, item) {
    return InkWell(
      onTap: () {
        // print('点击了${item.toString()}');
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }
}
