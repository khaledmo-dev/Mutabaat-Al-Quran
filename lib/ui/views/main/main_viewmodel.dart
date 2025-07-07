import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_test/ui/views/home/home_view.dart';
import 'package:quran_test/ui/views/table/table_view.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends IndexTrackingViewModel {
  final List<Widget> pages = const [HomeView(), TableView()];

  List views = [
    {
      'index': 0,
      'title': "home",
      'icon-light': IconlyLight.home,
      'icon-bold': IconlyBold.home,
    },
    {
      'index': 1,
      'title': "table",
      'icon-light': IconlyLight.document,
      'icon-bold': IconlyBold.document,
    },
  ];
}
