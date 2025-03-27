import 'package:api/api%20dio/model/modeldataa.dart';
import 'package:api/api%20dio/service/dioservice.dart';
import 'package:api/api%20work/model/wdatamodel.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class wdatacontroller extends GetxController{


  @override
  void onInit(){
    super.onInit();
    fetchData();
    isNetconnection();

  }


  RxList<User> datas =RxList();
  RxBool isloading =true.obs;
  RxBool isListDown =false.obs;
  RxBool isNetconnection=true.obs;


  var scrollController = ItemScrollController();

  void isnetworkconnected()async{
    isNetconnection.value=await InternetConnectionChecker().hasConnection;
  }

  fetchData()async{
    isnetworkconnected();
    isloading.value=true;
    var response= await Dioservice().getData();
    if(response.statusCode==200){
      response.data.forEach((data){
        datas.add(User.fromJson(data));
      });
      isloading.value=false;
    }
  }

  scrolldown(){
    scrollController.scrollTo(
        index: datas.length,
        duration: Duration(seconds: 4),
        curve: Curves.bounceInOut);
    isListDown.value=true;
  }
  scrollup(){
    scrollController.scrollTo(
        index: 0,
        duration: Duration(seconds: 4),curve: Curves.fastOutSlowIn);
    isListDown.value=false;
  }

}