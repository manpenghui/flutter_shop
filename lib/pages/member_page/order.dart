import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Order extends StatelessWidget {
  List _menu = [
    {'text': '待付款', 'icon': Icons.payment},
    {'text': '待发货', 'icon': Icons.alarm},
    {'text': '待收货', 'icon': Icons.airport_shuttle},
    {'text': '待评价', 'icon': Icons.edit},
  ];
  Widget _item() {
    List<Widget> listWidge = _menu.map((val) {
      return InkWell(
        child: Column(
          children: <Widget>[
            Icon(val['icon'], color: Colors.black38),
            Text(val['text'])
          ],
        ),
      );
    }).toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: listWidge,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.only(bottom: 5.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.black12,
                        width: ScreenUtil().setWidth(1)))),
            child: ListTile(
              leading: Icon(
                Icons.assignment,
                color: Colors.black38,
              ),
              title: Text('我的订单'),
              trailing: Icon(Icons.navigate_next),
            ),
          ),
          _item()
        ],
      ),
    );
  }
}
