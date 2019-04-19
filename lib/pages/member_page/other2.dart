import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Other2 extends StatelessWidget {
  List _menu = [
    {'text': '客服电话', 'icon': Icons.phone, 'sub': '0393-8800315'},
    {'text': '关于商城', 'icon': Icons.warning, 'sub': ''},
  ];
  Widget _item() {
    List<Widget> listWidge = _menu.map((val) {
      return InkWell(
        child: ListTile(
            leading: Icon(val['icon']),
            title: Text(
              val['text'],
            ),
            trailing: Container(
              width: ScreenUtil().setWidth(400),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[Text(val['sub']), Icon(Icons.navigate_next)],
              ),
            )),
      );
    }).toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: listWidge,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.white,
      child: _item(),
    );
  }
}
