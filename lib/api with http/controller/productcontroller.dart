import 'package:get/get.dart';

import '../service/api service.dart';

class productcontroller extends GetxController{
  var isloading=true.obs;
  var productList =[].obs;

  @override
  void onInit(){

    getproducts();

  super.onInit();

  }

  void getproducts()async{
    try{
      isloading(true);
      var products= await httpservice.fetchproducts();
      if(products!=null){
        productList.value=products;

      }

    }catch(e){
      print(e);

    }finally{
      isloading(false);
    }

  }

}