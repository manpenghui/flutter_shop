import 'package:flutter/material.dart';
import '../model/catagoryGoodsList.dart';
class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryGoodsListData> goodslist = [];
  //点击大类时更换商品列表
  getGoodsList(List<CategoryGoodsListData> list){
    goodslist= list;
    notifyListeners();
  }
  getMoreList(List<CategoryGoodsListData> list){
    goodslist.addAll(list);
    notifyListeners();
  }
}
