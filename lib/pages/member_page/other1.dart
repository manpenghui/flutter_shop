import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Other1 extends StatelessWidget {
  List _menu = [
    {'text': '领取优惠券', 'icon': Icons.payment},
    {'text': '已领取优惠券', 'icon': Icons.favorite},
    {'text': '地址管理', 'icon': Icons.add_location},
  ];
  Widget _item() {
    List<Widget> listWidge = _menu.map((val) {
      return InkWell(
        child: ListTile(
          leading: Icon(val['icon']),
          title: Text(val['text']),
          trailing: Icon(Icons.navigate_next),
        ),
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
