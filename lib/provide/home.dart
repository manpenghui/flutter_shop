import 'package:flutter/material.dart';
import 'dart:convert';
import '../sercice/service_method.dart';

class HomeInfoProvide  with ChangeNotifier{
  var homeListData = null;
  List<Map> hotGoodsList = [];
  int page = 1;
  //从后台获取数据
  getHomeInfo(Map<String,dynamic> fd) async{
    print(fd);
    await request('homePageContext',formData:fd).then((val){
      var responseData = json.decode(val.toString());
      // homeListData = HomeListModel.fromJson(responseData);
       homeListData = responseData;
      // print('homeListData.toString()');
      notifyListeners();
    });
  }
  //从后台获取热销商品
  getHotGoods() async{
    var formData = {'page': page};
    print(page);
    request('homePageBelowConten', formData: formData).then((val) {
      var data = json.decode(val.toString());
      List<Map> newGoodsList = (data['data'] as List).cast();
      hotGoodsList.addAll(newGoodsList);
      page++;
    });
  }
}

