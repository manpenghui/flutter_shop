import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provide/provide.dart';
import 'member_page/header.dart';
import 'member_page/order.dart';
import 'member_page/other1.dart';
import 'member_page/other2.dart';


class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Header(),
            Order(),
            Other1(),
            Other2()
          ],
        ),
      ),
    );
  }
}
