import 'package:get/get.dart';

class CountController extends GetxController{
  var count= 0.obs;
  void increment(){
    count++;
  }
  void decrement(){

   if(count>0){
     count--;
   }
  }
}