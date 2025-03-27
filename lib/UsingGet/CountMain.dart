
import 'package:api/UsingGet/controllerget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
void main(){
  runApp(GetMaterialApp(home: Get_Main(),));
}

class Get_Main extends StatelessWidget {
  const Get_Main({super.key});

  @override
  Widget build(BuildContext context) {
    final CountController controller =Get.put(CountController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(()=>Text("count = ${controller.count}")),
            ElevatedButton(onPressed: ()=> controller.increment(), child: Icon(CupertinoIcons.plus)),

            const SizedBox(height: 15,),
            ElevatedButton(onPressed: ()=>controller.decrement(), child: Icon(CupertinoIcons.minus))
          ],
        ),
      ),
    );
  }
}
