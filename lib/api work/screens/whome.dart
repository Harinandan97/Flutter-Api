import 'package:api/api%20dio/controller/diodatacontroller.dart';
import 'package:api/api%20dio/utilits/colors.dart';
import 'package:api/api%20dio/utilits/cont_snackbar.dart';
import 'package:api/api%20work/controller/wcontroller.dart';
import 'package:api/api%20work/utilits/_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
void main(){
  runApp(GetMaterialApp(home: WDiohome(),debugShowCheckedModeBanner: false,));
}
class WDiohome extends StatelessWidget {
  wdatacontroller controller =Get.put(wdatacontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Card Home"),backgroundColor:Mycolors.cgColor,
        ),
        backgroundColor: Mycolors.bgColor,
        floatingActionButton:
        Obx(()=> controller.isNetconnection.value ? FloatingActionButton(onPressed: (){
          controller.isListDown.value
              ? controller.scrollup()
              : controller.isListDown();
        }
          ,
          child: FaIcon(controller.isListDown.value
              ?FontAwesomeIcons.arrowUp:FontAwesomeIcons.arrowDown),
        ):Container()),



        body: Obx(()=>
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: controller.isNetconnection.value == true
                    ? (controller.isloading.value
                    ? Center(
                    child: CircularProgressIndicator())
                    :getData())
                    :Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.network_check,size: 100,),
                      MaterialButton(onPressed: ()async{
                        if(await InternetConnectionChecker().hasConnection == true)
                        {
                          controller.fetchData();
                        }
                        else
                        {
                          showCustomSnackBar(context);
                        }
                      })
                    ],
                  ),
                )
            ),
        )

    );
  }

  getData() {
    return RefreshIndicator(child: ScrollablePositionedList.builder

      (itemCount: controller.datas.length,
        itemScrollController: controller.scrollController,
        itemBuilder: (context,index){
          var data=controller.datas[index];
          return Card(
            child: ListTile(leading: CircleAvatar(
              backgroundColor: Mycolors.bgColor,
              child: Text(data.users.toString()),
            ),
              title: Text(data.f.toString()),
              //subtitle: Text(data.limit as String),
            ),
          );
        }), onRefresh: (){
      return controller.fetchData();
    });
  }
}
