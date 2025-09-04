import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:quran_test/ui/views/home/home_view.dart';
import 'package:quran_test/ui/views/more/more_view.dart';
import 'package:quran_test/ui/views/table/table_view.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends IndexTrackingViewModel {
  final List<Widget> pages = const [HomeView(), TableView(), MoreView()];

  List views = [
    {
      'index': 0,
      'title': "home",
      'icon': HeroIcons.home,
    },
    {
      'index': 1,
      'title': "table",
      'icon': HeroIcons.tableCells,
    },
    {
      'index': 2,
      'title': "more",
      'icon': HeroIcons.rectangleGroup,
    },
  ];
}
