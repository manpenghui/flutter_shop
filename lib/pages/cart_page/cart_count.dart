import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
// import '../../model/cartInfo.dart';
import '../../model/cartInfo.dart';
import '../../provide/cart.dart';
class CartCount extends StatefulWidget {
  final CartInfoModel item;
  CartCount(this.item);
  @override
  _CartCountState createState() => _CartCountState();
}

class _CartCountState extends State<CartCount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.black12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _reduceBtn(),
          _countArea(),
          _addBtn()

        ],
      ),
    );
  }
  Widget _reduceBtn(){
    return InkWell(
      onTap: ()async{
        await Provide.value<CartProvide>(context).reduce(widget.item.goodsId);
        await Provide.value<CartProvide>(context).getCartInfo();
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(width: 1.0,color: Colors.black12)
          )
        ),
        child: Text('-'),
      ),
    );
  }
  Widget _countArea(){

    return InkWell(
      onTap: (){},
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        color: Colors.white,
        child: Text('${widget.item.count}'),
      ),
    );
  }
  Widget _addBtn(){
    return InkWell(
      onTap: ()async{
        await Provide.value<CartProvide>(context).save(widget.item.goodsId, widget.item.goodsName, widget.item.count, widget.item.price, widget.item.images);
        await Provide.value<CartProvide>(context).getCartInfo();
      },
      child: Container(
        width: ScreenUtil().setWidth(70),
        height: ScreenUtil().setWidth(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 1.0,color: Colors.black12)
          )
        ),
        child: Text('+'),
      ),
    );
  }
}