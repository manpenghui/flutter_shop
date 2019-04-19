import 'package:flutter/material.dart';
import '../model/category.dart';
class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategotyList = [];
  int childIndex = 0; //子类高亮索引
  String categoryId = '4'; //  大类的id
  String subId = ''; //子类的id
  int page =1; //列表页数，当改变大类或者小类时都要进行改变
  String noMoreText = '';//显示更多的标识
  getchildCategotyList(List<BxMallSubDto> list, String id){
    childIndex = 0; //子类高亮索引
    categoryId = id;

    page = 1;
    noMoreText = '';

    subId=''; //点击大类时，把子类ID清空
    noMoreText='';


    BxMallSubDto all = BxMallSubDto();
    all.mallSubId='';
    all.mallCategoryId='00';
    all.mallSubName= "全部";
    all.comments= null;
    childCategotyList= [all];
    childCategotyList.addAll(list);
    notifyListeners();
  }
  //改变子类索引
  changechildIndex(int index,String id){
    childIndex = index;
    subId = id;

    page = 1;
    noMoreText = '';

    notifyListeners();
  }
  // 增加page的方法
  addPage(){
    page++;
  }
  //改变noMoreText的方法
  changeNoMore(String text){
    noMoreText = text;
    notifyListeners();
  }
}
