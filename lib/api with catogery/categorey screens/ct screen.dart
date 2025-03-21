
import 'package:api/api%20with%20catogery/categorey%20controller/ctcontroller.dart';
import 'package:api/api%20with%20catogery/categorey%20screens/view2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


void main(){
  runApp(GetMaterialApp(initialRoute: '/',
  getPages: [
    GetPage(name: '/', page:()=>cthome()),
    GetPage(name: '/categryDEtsils', page:()=> CategoryDetailScreen())
  ],
  ));
}

class  cthome extends StatelessWidget {
  final ctproductcontroller productcontroller = Get.put(ctproductcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: SizedBox(
        child: Obx((){
          if(productcontroller.isLoadingcategories.value)
          {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else
          {
            return ListView.builder(

              itemBuilder: (context,index){
                String Category=productcontroller.mainCategories[index];
                print(Category);

                return ListTile(
                   title: Text(Category),
                  onTap:()=> Get.toNamed('/categryDEtsils',arguments: Category),
                );
              },itemCount: productcontroller.mainCategories.length,);
          }
        }),
      ),
    );
  }
}