import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../provide/child_category.dart';
import '../provide/category_goods_list.dart';
import '../sercice/service_method.dart';
import '../model/catagoryGoodsList.dart';
import '../model/category.dart';

class CategoryPage extends StatefulWidget {
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),
            Column(
              children: <Widget>[RightCategoryNav(), CategoryGoodsList()],
            )
          ],
        ),
      ),
    );
  }
}

// 左侧导航
class LeftCategoryNav extends StatefulWidget {
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];
  var listIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _getCategory();
    _getGoodsList();
    super.initState();
  }

  void _getGoodsList({String categoryId}) {
    var data = {
      'categoryId': categoryId == null ? '4' : categoryId,
      'categorySubId': "",
      'page': 1
    };
    request('getMallGoods', formData: data).then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      Provide.value<CategoryGoodsListProvide>(context)
          .getGoodsList(goodsList.data);
    });
  }

  void _getCategory() async {
    await request('getCategory').then((val) {
      var data = json.decode(val.toString());
      CategoryModel category = CategoryModel.fromJson(data);
      setState(() {
        list = category.data;
      });
      Provide.value<ChildCategory>(context)
          .getchildCategotyList(list[0].bxMallSubDto, list[0].mallCategoryId);
    });
  }

  Widget _leftInkWell(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;
    return InkWell(
      onTap: () {
        var childList = list[index].bxMallSubDto;
        Provide.value<ChildCategory>(context)
            .getchildCategotyList(childList, list[index].mallCategoryId);
        var categoryId = list[index].mallCategoryId;
        _getGoodsList(categoryId: categoryId);
        setState(() {
          listIndex = index;
        });
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: isClick ? Color.fromRGBO(236, 236, 234, 1) : Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Colors.black12, width: 1))),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _leftInkWell(index);
        },
      ),
    );
  }
}

class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context, child, childCategory) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(color: Colors.black12, width: 1))),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: childCategory.childCategotyList.length,
            itemBuilder: (context, index) {
              return _rightInkwell(
                  childCategory.childCategotyList[index], index);
            },
          ),
        );
      },
    );
  }

  void _getGoodsList(String categorySubId) {
    var data = {
      'categoryId': Provide.value<ChildCategory>(context).categoryId,
      'categorySubId': categorySubId,
      'page': 1
    };
    request('getMallGoods', formData: data).then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if (goodsList.data == null) {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
      } else {
        Provide.value<CategoryGoodsListProvide>(context)
            .getGoodsList(goodsList.data);
      }
    });
  }

  Widget _rightInkwell(BxMallSubDto item, int index) {
    bool isClick = false;
    isClick = (index == Provide.value<ChildCategory>(context).childIndex)
        ? true
        : false;
    return InkWell(
      onTap: () {
        Provide.value<ChildCategory>(context)
            .changechildIndex(index, item.mallSubId);
        _getGoodsList(item.mallSubId);
      },
      child: Container(
        child: Text(
          item.mallSubName,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
              color: isClick ? Colors.pink : Colors.black),
        ),
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      ),
    );
  }
}

//商品列表 可以上拉加载
class CategoryGoodsList extends StatefulWidget {
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();
  GlobalKey<EasyRefreshState> _easyRefreshKey = GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = GlobalKey<RefreshHeaderState>();
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void _getMoreList() {
    Provide.value<ChildCategory>(context).addPage();
    var data = {
      'categoryId': Provide.value<ChildCategory>(context).categoryId,
      'categorySubId':  Provide.value<ChildCategory>(context).subId,
      'page':  Provide.value<ChildCategory>(context).page
    };
    request('getMallGoods', formData: data).then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if (goodsList.data == null) {
         Provide.value<ChildCategory>(context).changeNoMore('没有更多了');
         Fluttertoast.showToast(
            msg: "已经到底了",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.pink,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else {
        Provide.value<CategoryGoodsListProvide>(context)
            .getMoreList(goodsList.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Provide<CategoryGoodsListProvide>(
      builder: (context, child, data) {
        try {
          if (Provide.value<ChildCategory>(context).page ==1) {
            _controller.jumpTo(0.0);
          }
        } catch (e) {
        }
        if (data.goodslist.length > 0) {
          return Container(
              width: ScreenUtil().setWidth(570),
              // height: ScreenUtil().setHeight(1000),
              child: EasyRefresh(
                  key: _easyRefreshKey,
                  loadMore: () async {
                    print('loadMore');
                    _getMoreList();
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
                    noMoreText: Provide.value<ChildCategory>(context).noMoreText,
                    moreInfo: '加载中',
                    loadReadyText: '上拉加载',
                    key: _footerKey,
                  ),
                  // refreshFooter: BezierBounceFooter(
                  //   key: _footerKey,
                  //   backgroundColor: Colors.pink,
                  //   color: Colors.white,
                  // ),
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: data.goodslist.length,
                    itemBuilder: (context, index) {
                      return _listWidget(data.goodslist, index);
                    },
                  )));
        } else {
          return Center(child: Text('暂无数据'));
        }
      },
    ));
  }

  Widget _goodsImage(list, index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(list[index].image),
    );
  }

  Widget _goodsName(list, index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        list[index].goodsName,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(list, index) {
    return Container(
        padding: EdgeInsets.all(5.0),
        width: ScreenUtil().setWidth(370),
        margin: EdgeInsets.only(top: 20.0),
        child: Row(
          children: <Widget>[
            Text(
              '价格:￥${list[index].presentPrice}',
              style: TextStyle(
                  color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
            ),
            Text(
              '价格:￥${list[index].oriPrice}',
              style: TextStyle(
                  color: Colors.black26,
                  fontSize: 12.0,
                  decoration: TextDecoration.lineThrough),
            ),
          ],
        ));
  }

  Widget _listWidget(list, index) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.black12))),
          child: Row(
            children: <Widget>[
              _goodsImage(list, index),
              Column(
                children: <Widget>[
                  _goodsName(list, index),
                  _goodsPrice(list, index)
                ],
              )
            ],
          ),
        ));
  }
}
