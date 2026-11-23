import 'package:flutter/cupertino.dart';
import 'package:pas/menu/feat.dart';
import 'package:pas/menu/home.dart';
import 'package:pas/menu/profile.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController{
  final RxInt selectedIndex = 0.obs;

  void changePage(int index){
    selectedIndex.value = index;
  }

  List<Widget> listPages = [HomePage(), FeatPage(), ProfilePage()];

}