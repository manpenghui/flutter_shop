import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(300),
        width: ScreenUtil().setWidth(375),
        decoration: new BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
              colors: [Colors.lightBlue, Colors.white, Colors.purpleAccent]),
        ),
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage('https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJU0kzLA7kLdxEQMvlKmhoPHtqfDEHib7h2eVuw5tG9tBO3qomP97BtkboRV45sxGumLeVtsaNqFvw/132'),
                radius: 30.0,
              ),
              SizedBox(height: 10.0,),
              Text('公子小白')
            ],
          ),
        ),
        );
  }
}
