import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';
import 'package:provide/provide.dart';
import '../../provide/home.dart';

//商品推荐
class RecommendArea extends StatelessWidget {
  // final List recommendList;
  // RecommendArea({Key key, this.recommendList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('RecommendArea');
    return Provide<HomeInfoProvide>(
      builder: (context, child, val) {
        var homeListData = Provide.value<HomeInfoProvide>(context).homeListData;
        if (homeListData != null && homeListData['data'] != null) {
          // var recommendList = homeListData.data.recommend;
          List<Map> recommendList =
                (homeListData['data']['recommend'] as List).cast();
          return Container(
            height: ScreenUtil().setHeight(390),
            margin: EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[_titleWidget(), _recommedList(recommendList)],
            ),
          );
        } else {
          return Text('');
        }
      },
    );
  }

//推荐商品标题
  Widget _titleWidget() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
        child: Text('商品推荐', style: TextStyle(color: Colors.pink)));
  }

  Widget _recommedList(recommendList) {
    return Expanded(
      child: Container(
        height: ScreenUtil().setHeight(330),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context, index) {
            return _item(context, index, recommendList);
          },
        ),
      ),
    );
  }

  Widget _item(context, index, recommendList) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(
          context,
          '/detail?goodsId=${recommendList[index]['goodsId']}',
        );
      },
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(width: 0.5, color: Colors.black12))),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}