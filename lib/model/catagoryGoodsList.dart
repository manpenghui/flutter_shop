class CategoryGoodsListModel {
  String code;
  String message;
  List<CategoryGoodsListData> data;

  CategoryGoodsListModel({this.code, this.message, this.data});

  CategoryGoodsListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<CategoryGoodsListData>();
      json['data'].forEach((v) {
        data.add(new CategoryGoodsListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryGoodsListData {
  double oriPrice;
  String image;
  String goodsId;
  double presentPrice;
  String goodsName;
  CategoryGoodsListData(
      {this.oriPrice,
      this.image,
      this.goodsId,
      this.presentPrice,
      this.goodsName});

  CategoryGoodsListData.fromJson(Map<String, dynamic> json) {
    oriPrice = json['oriPrice'];
    image = json['image'];
    goodsId = json['goodsId'];
    presentPrice = json['presentPrice'];
    goodsName = json['goodsName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oriPrice'] = this.oriPrice;
    data['image'] = this.image;
    data['goodsId'] = this.goodsId;
    data['presentPrice'] = this.presentPrice;
    data['goodsName'] = this.goodsName;
    return data;
  }
}