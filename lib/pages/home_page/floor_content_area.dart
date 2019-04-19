import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';
import 'package:provide/provide.dart';
import '../../provide/home.dart';

//楼层商品列表
class FloorContentArea extends StatelessWidget {
  final String type;

  FloorContentArea({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FloorContentArea');
    return Provide<HomeInfoProvide>(
      builder: (context,child,val){
        var homeListData = Provide.value<HomeInfoProvide>(context).homeListData;
        if (homeListData != null && homeListData['data']!=null) {
          List<Map> floor = (homeListData['data'][type] as List).cast();
          // print(floor.toString());
          return Container(
            child: Column(
              children: <Widget>[_firstRow(context,floor), _otherGoods(context,floor)],
            ),
          );
        }else{
          return Text('');
        }
      },
    );
  }

  Widget _firstRow(context,floor) {
    return Row(
      children: <Widget>[
        _goodsItem(floor[0], context),
        Column(
          children: <Widget>[
            _goodsItem(floor[1], context),
            _goodsItem(floor[2], context),
          ],
        )
      ],
    );
  }

  Widget _otherGoods(context,floor) {
    return Row(
      children: <Widget>[
        _goodsItem(floor[3], context),
        _goodsItem(floor[4], context),
      ],
    );
  }

  Widget _goodsItem(Map goods, context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          Application.router.navigateTo(
            context,
            '/detail?goodsId=${goods['goodsId']}',
          );
        },
        child: Image.network(goods['image']),
      ),
    );
  }
}