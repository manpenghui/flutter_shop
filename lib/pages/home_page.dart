import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'dart:convert';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';

import '../sercice/service_method.dart';
import '../routers/application.dart';
import '../provide/home.dart';
import './home_page/swiper_area.dart';
import './home_page/top_navigator_area.dart';
import './home_page/ad_bar_area.dart';
import './home_page/leader_phone_area.dart';
import './home_page/recommand_area.dart';
import './home_page/floor_title_area.dart';
import './home_page/floor_content_area.dart';
import './home_page/hot_goods_area.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  List<Map> hotGoodsList = [];
  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();
  GlobalKey<EasyRefreshState> _easyRefreshKey = GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = GlobalKey<RefreshHeaderState>();
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('首页加载');
    // _getHotGoods();
  }

  var formData = {'lon': '115.02932', 'lat': '35.76189'};

  @override
  Widget build(BuildContext context) {
    Future _getHomeInfo(BuildContext context) async{
      await Provide.value<HomeInfoProvide>(context).getHomeInfo(formData);
      // await Provide.value<HomeInfoProvide>(context).getHotGoods();
      return '完成加载';
    }
    return Container(
      child: Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body: FutureBuilder(
        // future: request('homePageContext', formData: formData),
        future: _getHomeInfo(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return EasyRefresh(
              child: ListView(
                key: _easyRefreshKey,
                children: <Widget>[
                  SwiperArea(),
                  TopNavigatorArea(),
                  AdBarArea(),
                  LeaderPhoneArea(),
                  RecommendArea(),
                  FloorTitleArea(title: 'floor1Pic',),
                  FloorContentArea(type: 'floor2'),
                  FloorTitleArea(title: 'floor2Pic',),
                  FloorContentArea(type: 'floor2'),
                  FloorTitleArea(title: 'floor3Pic',),
                  FloorContentArea(type: 'floor3'),
                  HotGoodsArea(hotGoodsList: hotGoodsList,)
                ],
              ),
              loadMore: () async {
                print('loadMore');
                _getHotGoods();
                // Provide.value<HomeInfoProvide>(context).getHotGoods();

              },
              onRefresh: () async {
                print('onRefresh');
                await Future.delayed(const Duration(seconds: 3));
              },
              refreshHeader: BezierCircleHeader(
                key: _headerKey,
                backgroundColor: Colors.pink,
                color: Colors.white,
              ),
              refreshFooter: ClassicsFooter(
                    bgColor: Colors.white,
                    textColor: Colors.pink,
                    moreInfoColor: Colors.pink,
                    showMore: true,
                    noMoreText: '老弟，加载完毕',
                    moreInfo: '加载中',
                    loadReadyText: '上拉加载',
                    key: _footerKey,
                  ),
            );
            // var data = json.decode(snapshot.data.toString());
            // List<Map> swiper = (data['data']['slides'] as List).cast();
            // List<Map> navigatorList = (data['data']['category'] as List).cast();
            // String adPicture =
            //     data['data']['advertesPicture']['PICTURE_ADDRESS'];
            // String leaderImage = data['data']['shopInfo']['leaderImage'];
            // String leaderPhone = data['data']['shopInfo']['leaderPhone'];
            // List<Map> recommandList =
            //     (data['data']['recommend'] as List).cast();
            // String floorTitle1 = data['data']['floor1Pic']['PICTURE_ADDRESS'];
            // List<Map> floor1 = (data['data']['floor1'] as List).cast();
            // String floorTitle2 = data['data']['floor2Pic']['PICTURE_ADDRESS'];
            // List<Map> floor2 = (data['data']['floor2'] as List).cast();
            // String floorTitle3 = data['data']['floor3Pic']['PICTURE_ADDRESS'];
            // List<Map> floor3 = (data['data']['floor3'] as List).cast();
            // return EasyRefresh(
            //   key: _easyRefreshKey,
            //   child: ListView(
            //     children: <Widget>[
            //       SwiperDiy(swiperDataList: swiper),
            //       TopNavigator(navigatorList: navigatorList),
            //       AdBanner(adPicture: adPicture),
            //       LeaderPhone(
            //           leaderImage: leaderImage, leaderPhone: leaderPhone),
            //       Recommend(
            //         recommendList: recommandList,
            //       ),
            //       FloorTitle(
            //         picture_address: floorTitle1,
            //       ),
            //       FloorContent(
            //         floorGoodsList: floor1,
            //       ),
            //       FloorTitle(
            //         picture_address: floorTitle2,
            //       ),
            //       FloorContent(
            //         floorGoodsList: floor2,
            //       ),
            //       FloorTitle(
            //         picture_address: floorTitle3,
            //       ),
            //       FloorContent(
            //         floorGoodsList: floor3,
            //       ),
            //       _hotGoods(),
            //     ],
            //   ),
            //   loadMore: () async {
            //     print('loadMore');
            //     _getHotGoods();
            //   },
            //   onRefresh: () async {
            //     print('onRefresh');
            //     await Future.delayed(const Duration(seconds: 3));
            //   },
            //   refreshHeader: BezierCircleHeader(
            //     key: _headerKey,
            //     backgroundColor: Colors.pink,
            //     color: Colors.white,
            //   ),
            //   refreshFooter: BezierBounceFooter(
            //     key: _footerKey,
            //     backgroundColor: Colors.pink,
            //     color: Colors.white,
            //   ),
            // );
          } else {
            return Center(
              child: Text('加载中...'),
            );
          }
        },
      ),
    ));
  }

  void _getHotGoods() {
    var formData = {'page': page};
    print(page);
    request('homePageBelowConten', formData: formData).then((val) {
      var data = json.decode(val.toString());
      List<Map> newGoodsList = (data['data'] as List).cast();
      setState(() {
        hotGoodsList.addAll(newGoodsList);
        page++;
      });
    });
  }

  Widget _hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text('火爆专区'),
  );
  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
          onTap: () {
            Application.router.navigateTo(
              context,
              '/detail?goodsId=${val['goodsId']}',
            );
          },
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  val['image'],
                  width: ScreenUtil().setWidth(370),
                ),
                Text(
                  val['name'],
                  style: TextStyle(
                      color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  children: <Widget>[
                    Text('￥${val['mallPrice']}'),
                    Text('￥${val['price']}',
                        style: TextStyle(
                            color: Colors.black26,
                            decoration: TextDecoration.lineThrough))
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }

  Widget _hotGoods() {
    return Container(
      child: Column(
        children: <Widget>[
          _hotTitle,
          _wrapList(),
        ],
      ),
    );
  }
}

//首页轮播组件
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('设备像素密度:${ScreenUtil.pixelRatio},设备宽${ScreenUtil.screenWidth}');
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Application.router.navigateTo(
                  context,
                  '/detail?goodsId=${swiperDataList[index]['goodsId']}',
                );
              },
              child: Image.network(
                swiperDataList[index]['image'],
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: swiperDataList.length,
          pagination: SwiperPagination(),
          control: SwiperControl(),
          autoplay: true),
    );
  }
}

// 导航模块
class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _girdViewItemUi(BuildContext context, item) {
    return InkWell(
      onTap: () {
        // print('点击了${item.toString()}');
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 10) {
      navigatorList.removeRange(10, navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(260),
      padding: const EdgeInsets.all(3.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(), // 禁止滚动   因为全局的上拉加载和此处的会有冲突
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item) {
          return _girdViewItemUi(context, item);
        }).toList(),
      ),
    );
  }
}

//广告模块
class AdBanner extends StatelessWidget {
  final String adPicture;

  AdBanner({Key key, this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adPicture),
    );
  }
}

//电厂电话模块
class LeaderPhone extends StatelessWidget {
  final String leaderImage; //店长图片
  final String leaderPhone; //店长电话
  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _launchURL() async {
    String url = 'tel:' + leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

//商品推荐
class Recommend extends StatelessWidget {
  final List recommendList;
  Recommend({Key key, this.recommendList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(390),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[_titleWidget(), _recommedList()],
      ),
    );
  }

//推荐商品标题
  Widget _titleWidget() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
        child: Text('商品推荐', style: TextStyle(color: Colors.pink)));
  }

  Widget _recommedList() {
    return Expanded(
      child: Container(
        height: ScreenUtil().setHeight(330),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context, index) {
            return _item(context, index);
          },
        ),
      ),
    );
  }

  Widget _item(context, index) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(
          context,
          '/detail?goodsId=${recommendList[index]['goodsId']}',
        );
      },
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(width: 0.5, color: Colors.black12))),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}

//楼层标题
class FloorTitle extends StatelessWidget {
  final String picture_address;
  FloorTitle({Key key, this.picture_address}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(picture_address),
    );
  }
}

//楼层商品列表
class FloorContent extends StatelessWidget {
  final List floorGoodsList;

  FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_firstRow(context), _otherGoods(context)],
      ),
    );
  }

  Widget _firstRow(context) {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0], context),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1], context),
            _goodsItem(floorGoodsList[2], context),
          ],
        )
      ],
    );
  }

  Widget _otherGoods(context) {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3], context),
        _goodsItem(floorGoodsList[4], context),
      ],
    );
  }

  Widget _goodsItem(Map goods, context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          Application.router.navigateTo(
            context,
            '/detail?goodsId=${goods['goodsId']}',
          );
        },
        child: Image.network(goods['image']),
      ),
    );
  }
}
