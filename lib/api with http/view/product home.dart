
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/productcontroller.dart';
import 'Producttile.dart';
void main(){
  runApp(GetMaterialApp(home: ProductHome(),));
}

class ProductHome extends StatelessWidget {
  final productcontroller productController = Get.put(productcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: SizedBox(
        child: Obx((){
          if(productController.isloading.value)
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else
          {
            return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
                itemBuilder: (context,index){
                  return ProductTile(
                      productController.productList[index]
                  );
                },itemCount: productController.productList.length,);
          }
        }),
      ),
    );
  }
}