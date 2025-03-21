import 'package:api/api%20with%20catogery/categorey%20service/ctservice.dart';
import 'package:api/api%20with%20catogery/cotegoery%20model/ctmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ctproductcontroller extends GetxController{
  var mainCategories =<String>[].obs;
  var productCategory=<Map<String,dynamic>>[].obs;
  var isLoadingcategories = true.obs;
  var isLoadingProducts = true.obs;


  @override
  void onInit() {
    fetchMaincategories();
    super.onInit();
  }

  Future<void>fetchMaincategories()async{
  try{
    isLoadingcategories(true);
    var response =await Fakestoreservice().getMaiCategories();
    mainCategories.assignAll(response);

  }finally{
    isLoadingcategories(false);
  }
}
Future<void>fetchProductByCategory(String Category)async{
  try{
    isLoadingProducts(true);
    var response= await Fakestoreservice().getProductsBycatrgory(Category);
    productCategory.assignAll(response);
  }finally{

  }
}}