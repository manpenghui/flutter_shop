import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';
import 'package:provide/provide.dart';
import '../../provide/home.dart';

//热销商品
class HotGoodsArea extends StatelessWidget {
  final List hotGoodsList;
   HotGoodsArea({Key key, this.hotGoodsList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('HotGoodsArea');
    return Provide<HomeInfoProvide>(
      builder: (context, child, val) {
        var homeListData = Provide.value<HomeInfoProvide>(context).homeListData;
        if (homeListData != null && homeListData['data'] != null) {
          return Container(
            child: Column(
              children: <Widget>[
                _hotTitle,
                _wrapList(context),
              ],
            ),
          );
        } else {
          return Text('');
        }
      },
    );
  }
  Widget _hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text('火爆专区'),
  );
    Widget _wrapList(context) {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
          onTap: () {
            Application.router.navigateTo(
              context,
              '/detail?goodsId=${val['goodsId']}',
            );
          },
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  val['image'],
                  width: ScreenUtil().setWidth(370),
                ),
                Text(
                  val['name'],
                  style: TextStyle(
                      color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  children: <Widget>[
                    Text('￥${val['mallPrice']}'),
                    Text('￥${val['price']}',
                        style: TextStyle(
                            color: Colors.black26,
                            decoration: TextDecoration.lineThrough))
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }
}
