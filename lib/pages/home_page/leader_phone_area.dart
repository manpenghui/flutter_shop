import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provide/provide.dart';
import '../../provide/home.dart';
//电厂电话模块
class LeaderPhoneArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('LeaderPhoneArea');
    return Provide<HomeInfoProvide>(
      builder: (context,child,val){
        var homeListData = Provide.value<HomeInfoProvide>(context).homeListData;
        if (homeListData != null && homeListData['data']!=null) {
          //  var leaderImage = homeListData.data.shopInfo.leaderImage;
          //  var leaderPhone = homeListData.data.shopInfo.leaderPhone;
          String leaderImage = homeListData['data']['shopInfo']['leaderImage'];
          String leaderPhone = homeListData['data']['shopInfo']['leaderPhone'];
          return Container(
            child: InkWell(
              onTap: ()async{
                String url = 'tel:' + leaderPhone;
                if (await canLaunch(url)) {
                  await launch(url);
                  return '';
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Image.network(leaderImage),
            ),
          );
        }else{
          return Text('');
        }
      },
    );
  }
}