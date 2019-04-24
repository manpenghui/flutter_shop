import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/cart.dart';
import '../../provide/details_info.dart';
import '../../provide/currentIndex.dart';


class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsInfo = Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
    var goods = {
        'goodsId': goodsInfo.goodsId,
        'goodsName': goodsInfo.goodsName,
        'count': 1,
        'price': goodsInfo.presentPrice,
        'images': goodsInfo.image1
      };
    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      height:  ScreenUtil().setHeight(80),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: (){},
            child: Container(
              width: ScreenUtil().setWidth(110),
              alignment: Alignment.center,
              child: Icon(Icons.shopping_cart,size: 28,color: Colors.red,),
            ),
          ),
          InkWell(
            onTap: ()async{
              await Provide.value<CartProvide>(context).save(goods['goodsId'], goods['goodsName'], goods['count'], goods['price'], goods['images']);
            },
            child: Container(
               alignment: Alignment.center,
               width: ScreenUtil().setWidth(320),
               height:  ScreenUtil().setHeight(80),
               color: Colors.green,
               child: Text('加入购物车',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(26)),),
            ),

          ),
          InkWell(
            onTap: () {
              Provide.value<CurrentIndexprovide>(context).changeIndex(2);
              Navigator.pop(context);
              // await Provide.value<CartProvide>(context).remove();
              
            },
            child: Container(
               alignment: Alignment.center,
               width: ScreenUtil().setWidth(320),
               height:  ScreenUtil().setHeight(80),
               child: Text('立即购买',style: TextStyle(color: Colors.red,fontSize: ScreenUtil().setSp(26)),),
            ),
          )
        ],
      ),
      
    );
  }
}