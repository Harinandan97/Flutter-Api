import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCntroller extends GetxController{
  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;

  void switchTheme(){
    currentTheme.value = currentTheme.value==ThemeMode.light
        ?ThemeMode.dark
        :ThemeMode.light;
  }
}