import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTopArea extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(
      builder: (context,child,val){
        var goodsinfo = Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
        if (goodsinfo!=null) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                _goodsImage(goodsinfo.image1),
                _goodsName(goodsinfo.goodsName),
                _goodsNum(goodsinfo.goodsSerialNumber),
                _goodsPrice(goodsinfo.presentPrice, goodsinfo.oriPrice)
              ],
            ),
          );
        }else{
          return Text('加载中');
        }
      },
    );
  }
  Widget _goodsImage(url){
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

 Widget _goodsName(name){
   return Container(
     width: ScreenUtil().setHeight(730),
     padding: EdgeInsets.only(left: 15.0),
     child: Text(name,maxLines: 1,style: TextStyle(fontSize: ScreenUtil().setSp(30)),),
   );
 }
 Widget _goodsNum(num){
   return Container(
     width: ScreenUtil().setWidth(730),
     padding: EdgeInsets.only(left: 15.0),
     margin: EdgeInsets.only(top: 8.0),
     child: Text('编号:$num',style: TextStyle(color: Colors.black26),),
   );
 }
 Widget _goodsPrice(presentPrice,oriPrice){
   return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Text('￥$presentPrice',style: TextStyle(color: Colors.pinkAccent,
          fontSize: ScreenUtil().setSp(40)),),
          SizedBox(
            width: 10.0,
          ),
          Text(
            '市场价￥$oriPrice',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
   );
 }
}