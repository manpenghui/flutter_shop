import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/detail_page.dart';

Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String goodsId = params['goodsId'].first;
    print('index>detail $goodsId');
    return DetailPage(goodsId);
  }
);