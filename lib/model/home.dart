class HomeListModel {
  String code;
  String message;
  HomeData data;

  HomeListModel({this.code, this.message, this.data});

  HomeListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new HomeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class HomeData {
  Floor2Pic floor2Pic;
  Floor3Pic floor3Pic;
  FloorName floorName;
  List<Slides> slides;
  List<Recommend> recommend;
  AdvertesPicture advertesPicture;
  List<Floor3> floor3;
  List<Floor2> floor2;
  List<Category> category;
  List<Floor1> floor1;
  Saoma saoma;
  ShopInfo shopInfo;
  IntegralMallPic integralMallPic;
  ToShareCode toShareCode;
  Floor1Pic floor1Pic;
  NewUser newUser;

  HomeData(
      {this.floor2Pic,
      this.floor3Pic,
      this.floorName,
      this.slides,
      this.recommend,
      this.advertesPicture,
      this.floor3,
      this.floor2,
      this.category,
      this.floor1,
      this.saoma,
      this.shopInfo,
      this.integralMallPic,
      this.toShareCode,
      this.floor1Pic,
      this.newUser});

  HomeData.fromJson(Map<String, dynamic> json) {
    floor2Pic = json['floor2Pic'] != null
        ? new Floor2Pic.fromJson(json['floor2Pic'])
        : null;
    floor3Pic = json['floor3Pic'] != null
        ? new Floor3Pic.fromJson(json['floor3Pic'])
        : null;
    floorName = json['floorName'] != null
        ? new FloorName.fromJson(json['floorName'])
        : null;
    if (json['slides'] != null) {
      slides = new List<Slides>();
      json['slides'].forEach((v) {
        slides.add(new Slides.fromJson(v));
      });
    }
    if (json['recommend'] != null) {
      recommend = new List<Recommend>();
      json['recommend'].forEach((v) {
        recommend.add(new Recommend.fromJson(v));
      });
    }
    advertesPicture = json['advertesPicture'] != null
        ? new AdvertesPicture.fromJson(json['advertesPicture'])
        : null;
    if (json['floor3'] != null) {
      floor3 = new List<Floor3>();
      json['floor3'].forEach((v) {
        floor3.add(new Floor3.fromJson(v));
      });
    }
    if (json['floor2'] != null) {
      floor2 = new List<Floor2>();
      json['floor2'].forEach((v) {
        floor2.add(new Floor2.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = new List<Category>();
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
    if (json['floor1'] != null) {
      floor1 = new List<Floor1>();
      json['floor1'].forEach((v) {
        floor1.add(new Floor1.fromJson(v));
      });
    }
    saoma = json['saoma'] != null ? new Saoma.fromJson(json['saoma']) : null;
    shopInfo = json['shopInfo'] != null
        ? new ShopInfo.fromJson(json['shopInfo'])
        : null;
    integralMallPic = json['integralMallPic'] != null
        ? new IntegralMallPic.fromJson(json['integralMallPic'])
        : null;
    toShareCode = json['toShareCode'] != null
        ? new ToShareCode.fromJson(json['toShareCode'])
        : null;
    floor1Pic = json['floor1Pic'] != null
        ? new Floor1Pic.fromJson(json['floor1Pic'])
        : null;
    newUser =
        json['newUser'] != null ? new NewUser.fromJson(json['newUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.floor2Pic != null) {
      data['floor2Pic'] = this.floor2Pic.toJson();
    }
    if (this.floor3Pic != null) {
      data['floor3Pic'] = this.floor3Pic.toJson();
    }
    if (this.floorName != null) {
      data['floorName'] = this.floorName.toJson();
    }
    if (this.slides != null) {
      data['slides'] = this.slides.map((v) => v.toJson()).toList();
    }
    if (this.recommend != null) {
      data['recommend'] = this.recommend.map((v) => v.toJson()).toList();
    }
    if (this.advertesPicture != null) {
      data['advertesPicture'] = this.advertesPicture.toJson();
    }
    if (this.floor3 != null) {
      data['floor3'] = this.floor3.map((v) => v.toJson()).toList();
    }
    if (this.floor2 != null) {
      data['floor2'] = this.floor2.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    if (this.floor1 != null) {
      data['floor1'] = this.floor1.map((v) => v.toJson()).toList();
    }
    if (this.saoma != null) {
      data['saoma'] = this.saoma.toJson();
    }
    if (this.shopInfo != null) {
      data['shopInfo'] = this.shopInfo.toJson();
    }
    if (this.integralMallPic != null) {
      data['integralMallPic'] = this.integralMallPic.toJson();
    }
    if (this.toShareCode != null) {
      data['toShareCode'] = this.toShareCode.toJson();
    }
    if (this.floor1Pic != null) {
      data['floor1Pic'] = this.floor1Pic.toJson();
    }
    if (this.newUser != null) {
      data['newUser'] = this.newUser.toJson();
    }
    return data;
  }
}

class Floor2Pic {
  String tOPLACE;
  String pICTUREADDRESS;

  Floor2Pic({this.tOPLACE, this.pICTUREADDRESS});

  Floor2Pic.fromJson(Map<String, dynamic> json) {
    tOPLACE = json['TO_PLACE'];
    pICTUREADDRESS = json['PICTURE_ADDRESS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TO_PLACE'] = this.tOPLACE;
    data['PICTURE_ADDRESS'] = this.pICTUREADDRESS;
    return data;
  }
}

class Floor3Pic {
  String tOPLACE;
  String pICTUREADDRESS;

  Floor3Pic({this.tOPLACE, this.pICTUREADDRESS});

  Floor3Pic.fromJson(Map<String, dynamic> json) {
    tOPLACE = json['TO_PLACE'];
    pICTUREADDRESS = json['PICTURE_ADDRESS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TO_PLACE'] = this.tOPLACE;
    data['PICTURE_ADDRESS'] = this.pICTUREADDRESS;
    return data;
  }
}

class FloorName {
  String floor3;
  String floor2;
  String floor1;

  FloorName({this.floor3, this.floor2, this.floor1});

  FloorName.fromJson(Map<String, dynamic> json) {
    floor3 = json['floor3'];
    floor2 = json['floor2'];
    floor1 = json['floor1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['floor3'] = this.floor3;
    data['floor2'] = this.floor2;
    data['floor1'] = this.floor1;
    return data;
  }
}

class Slides {
  String image;
  String goodsId;

  Slides({this.image, this.goodsId});

  Slides.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['goodsId'] = this.goodsId;
    return data;
  }
}

class Recommend {
  String image;
  double mallPrice;
  String goodsId;
  double price;
  String goodsName;

  Recommend(
      {this.image, this.mallPrice, this.goodsId, this.price, this.goodsName});

  Recommend.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    mallPrice = json['mallPrice'];
    goodsId = json['goodsId'];
    price = json['price'];
    goodsName = json['goodsName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['mallPrice'] = this.mallPrice;
    data['goodsId'] = this.goodsId;
    data['price'] = this.price;
    data['goodsName'] = this.goodsName;
    return data;
  }
}

class AdvertesPicture {
  String tOPLACE;
  String pICTUREADDRESS;

  AdvertesPicture({this.tOPLACE, this.pICTUREADDRESS});

  AdvertesPicture.fromJson(Map<String, dynamic> json) {
    tOPLACE = json['TO_PLACE'];
    pICTUREADDRESS = json['PICTURE_ADDRESS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TO_PLACE'] = this.tOPLACE;
    data['PICTURE_ADDRESS'] = this.pICTUREADDRESS;
    return data;
  }
}

class Floor3 {
  String goodsId;
  String image;

  Floor3({this.goodsId, this.image});

  Floor3.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['image'] = this.image;
    return data;
  }
}

class Floor2 {
  String goodsId;
  String image;

  Floor2({this.goodsId, this.image});

  Floor2.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['image'] = this.image;
    return data;
  }
}

class Category {
  String mallCategoryId;
  String mallCategoryName;
  List<BxMallSubDto> bxMallSubDto;
  Null comments;
  String image;

  Category(
      {this.mallCategoryId,
      this.mallCategoryName,
      this.bxMallSubDto,
      this.comments,
      this.image});

  Category.fromJson(Map<String, dynamic> json) {
    mallCategoryId = json['mallCategoryId'];
    mallCategoryName = json['mallCategoryName'];
    if (json['bxMallSubDto'] != null) {
      bxMallSubDto = new List<BxMallSubDto>();
      json['bxMallSubDto'].forEach((v) {
        bxMallSubDto.add(new BxMallSubDto.fromJson(v));
      });
    }
    comments = json['comments'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallCategoryName'] = this.mallCategoryName;
    if (this.bxMallSubDto != null) {
      data['bxMallSubDto'] = this.bxMallSubDto.map((v) => v.toJson()).toList();
    }
    data['comments'] = this.comments;
    data['image'] = this.image;
    return data;
  }
}

class BxMallSubDto {
  String mallSubId;
  String mallCategoryId;
  String mallSubName;
  String comments;

  BxMallSubDto(
      {this.mallSubId, this.mallCategoryId, this.mallSubName, this.comments});

  BxMallSubDto.fromJson(Map<String, dynamic> json) {
    mallSubId = json['mallSubId'];
    mallCategoryId = json['mallCategoryId'];
    mallSubName = json['mallSubName'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = this.mallSubId;
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallSubName'] = this.mallSubName;
    data['comments'] = this.comments;
    return data;
  }
}

class Floor1 {
  String goodsId;
  String image;

  Floor1({this.goodsId, this.image});

  Floor1.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['image'] = this.image;
    return data;
  }
}

class Saoma {
  String tOPLACE;
  String pICTUREADDRESS;

  Saoma({this.tOPLACE, this.pICTUREADDRESS});

  Saoma.fromJson(Map<String, dynamic> json) {
    tOPLACE = json['TO_PLACE'];
    pICTUREADDRESS = json['PICTURE_ADDRESS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TO_PLACE'] = this.tOPLACE;
    data['PICTURE_ADDRESS'] = this.pICTUREADDRESS;
    return data;
  }
}

class ShopInfo {
  String leaderImage;
  String leaderPhone;

  ShopInfo({this.leaderImage, this.leaderPhone});

  ShopInfo.fromJson(Map<String, dynamic> json) {
    leaderImage = json['leaderImage'];
    leaderPhone = json['leaderPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaderImage'] = this.leaderImage;
    data['leaderPhone'] = this.leaderPhone;
    return data;
  }
}

class IntegralMallPic {
  String tOPLACE;
  String pICTUREADDRESS;

  IntegralMallPic({this.tOPLACE, this.pICTUREADDRESS});

  IntegralMallPic.fromJson(Map<String, dynamic> json) {
    tOPLACE = json['TO_PLACE'];
    pICTUREADDRESS = json['PICTURE_ADDRESS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TO_PLACE'] = this.tOPLACE;
    data['PICTURE_ADDRESS'] = this.pICTUREADDRESS;
    return data;
  }
}

class ToShareCode {
  String tOPLACE;
  String pICTUREADDRESS;

  ToShareCode({this.tOPLACE, this.pICTUREADDRESS});

  ToShareCode.fromJson(Map<String, dynamic> json) {
    tOPLACE = json['TO_PLACE'];
    pICTUREADDRESS = json['PICTURE_ADDRESS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TO_PLACE'] = this.tOPLACE;
    data['PICTURE_ADDRESS'] = this.pICTUREADDRESS;
    return data;
  }
}

class Floor1Pic {
  String tOPLACE;
  String pICTUREADDRESS;

  Floor1Pic({this.tOPLACE, this.pICTUREADDRESS});

  Floor1Pic.fromJson(Map<String, dynamic> json) {
    tOPLACE = json['TO_PLACE'];
    pICTUREADDRESS = json['PICTURE_ADDRESS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TO_PLACE'] = this.tOPLACE;
    data['PICTURE_ADDRESS'] = this.pICTUREADDRESS;
    return data;
  }
}

class NewUser {
  String tOPLACE;
  String pICTUREADDRESS;

  NewUser({this.tOPLACE, this.pICTUREADDRESS});

  NewUser.fromJson(Map<String, dynamic> json) {
    tOPLACE = json['TO_PLACE'];
    pICTUREADDRESS = json['PICTURE_ADDRESS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TO_PLACE'] = this.tOPLACE;
    data['PICTURE_ADDRESS'] = this.pICTUREADDRESS;
    return data;
  }
}
