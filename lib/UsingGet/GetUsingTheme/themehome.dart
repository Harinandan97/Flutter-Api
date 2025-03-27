import 'package:api/UsingGet/GetUsingTheme/themecontroller.dart';
import 'package:api/UsingGet/GetUsingTheme/themedataaa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
void main(){
  runApp(GetMaterialApp(
    title: 'Flutter Demo',
    theme: CustomTheme.lightTheme,
    darkTheme: CustomTheme.darkTheme,
    themeMode: ThemeMode.system,
    home: ThemeeHome(),
  ));
}
class ThemeeHome extends StatelessWidget {

  final HomeCntroller _controller =Get.put(HomeCntroller());

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Obx(
            ()=>Text(_controller.currentTheme.value == ThemeMode.dark
            ? "Dark Theme"
            :"Light Theme",style: TextStyle(fontSize: size.height *0.02),),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tap On The Switch To Change the Theme",
              style: TextStyle(fontSize: size.height *0.02),
            ),
            Obx(
                ()=>Switch(value: _controller.currentTheme.value==ThemeMode.dark, onChanged: (value){
                  _controller.switchTheme();
                  Get.changeThemeMode(_controller.currentTheme.value);

                },
                activeColor: CustomTheme.white,
                ))
          ],
        ),
      ),
    );
  }
}
