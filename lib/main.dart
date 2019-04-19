import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:fluro/fluro.dart';
import './provide/counter.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';
import './provide/home.dart';
import './provide/details_info.dart';
import './provide/cart.dart';
import './pages/index_page.dart';
import './routers/routers.dart';
import './routers/application.dart';

void main(){
  var counter =Counter();
  var providers  =Providers();
  var chidCategory = ChildCategory();
  var categoryGoodsList = CategoryGoodsListProvide();
  var detailsInfo = DetailsInfoProvide();
  var homeInfo = HomeInfoProvide();
  var cartInfo = CartProvide();
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(chidCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsList))
    ..provide(Provider<DetailsInfoProvide>.value(detailsInfo))
    ..provide(Provider<HomeInfoProvide>.value(homeInfo))
    ..provide(Provider<CartProvide>.value(cartInfo))
    ;
  runApp(ProviderNode(child:MyApp(),providers:providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: IndexPage(),
      ),
    );
  }
}