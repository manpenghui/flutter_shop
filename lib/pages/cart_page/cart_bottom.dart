import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int allGoodsCount = Provide.value<CartProvide>(context).allGoodsCount;
    double allPrice = Provide.value<CartProvide>(context).allPrice;
    return Provide<CartProvide>(
      builder: (context, child, data) {
        allGoodsCount = Provide.value<CartProvide>(context).allGoodsCount;
        allPrice = Provide.value<CartProvide>(context).allPrice;
      return Container(
        padding: EdgeInsets.all(5.0),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            selectAll(context),
            allPricearea(context),
            goButton(context)
          ],
        ),
      );
    });
  }

  Widget selectAll(context) {
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: true,
            activeColor: Colors.pink,
            onChanged: (bool val) {},
          ),
          Text('全选')
        ],
      ),
    );
  }

  Widget allPricearea(context) {
    double allPrice = Provide.value<CartProvide>(context).allPrice;
    return Container(
      width: ScreenUtil().setWidth(430),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(200),
                child: Text(
                  '合计：',
                  style: TextStyle(fontSize: ScreenUtil().setSp(36)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(230),
                child: Text(
                  '￥${allPrice}',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(36), color: Colors.pink),
                ),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费，预购免配送',
              style: TextStyle(
                color: Colors.black38,
                fontSize: ScreenUtil().setSp(26),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget goButton(context) {
    int allGoodsCount = Provide.value<CartProvide>(context).allGoodsCount;
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Text(
            '结算 ${allGoodsCount}',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
