// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i10;
import 'package:flutter/material.dart';
import 'package:quran_test/ui/views/activity_details/activity_details_view.dart'
    as _i9;
import 'package:quran_test/ui/views/home/home_view.dart' as _i2;
import 'package:quran_test/ui/views/main/main_view.dart' as _i5;
import 'package:quran_test/ui/views/result_details/result_details_view.dart'
    as _i8;
import 'package:quran_test/ui/views/results/results_view.dart' as _i7;
import 'package:quran_test/ui/views/startup/startup_view.dart' as _i3;
import 'package:quran_test/ui/views/table/table_view.dart' as _i6;
import 'package:quran_test/ui/views/test/test_view.dart' as _i4;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const testView = '/test-view';

  static const mainView = '/main-view';

  static const tableView = '/table-view';

  static const resultsView = '/results-view';

  static const resultDetailsView = '/result-details-view';

  static const activityDetailsView = '/activity-details-view';

  static const all = <String>{
    homeView,
    startupView,
    testView,
    mainView,
    tableView,
    resultsView,
    resultDetailsView,
    activityDetailsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.testView,
      page: _i4.TestView,
    ),
    _i1.RouteDef(
      Routes.mainView,
      page: _i5.MainView,
    ),
    _i1.RouteDef(
      Routes.tableView,
      page: _i6.TableView,
    ),
    _i1.RouteDef(
      Routes.resultsView,
      page: _i7.ResultsView,
    ),
    _i1.RouteDef(
      Routes.resultDetailsView,
      page: _i8.ResultDetailsView,
    ),
    _i1.RouteDef(
      Routes.activityDetailsView,
      page: _i9.ActivityDetailsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.TestView: (data) {
      final args = data.getArgs<TestViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.TestView(args.range, key: args.key, testId: args.testId),
        settings: data,
      );
    },
    _i5.MainView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.MainView(),
        settings: data,
      );
    },
    _i6.TableView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.TableView(),
        settings: data,
      );
    },
    _i7.ResultsView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ResultsView(),
        settings: data,
      );
    },
    _i8.ResultDetailsView: (data) {
      final args = data.getArgs<ResultDetailsViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.ResultDetailsView(args.id, key: args.key),
        settings: data,
      );
    },
    _i9.ActivityDetailsView: (data) {
      final args = data.getArgs<ActivityDetailsViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.ActivityDetailsView(args.id, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class TestViewArguments {
  const TestViewArguments({
    required this.range,
    this.key,
    this.testId,
  });

  final List<int> range;

  final _i10.Key? key;

  final int? testId;

  @override
  String toString() {
    return '{"range": "$range", "key": "$key", "testId": "$testId"}';
  }

  @override
  bool operator ==(covariant TestViewArguments other) {
    if (identical(this, other)) return true;
    return other.range == range && other.key == key && other.testId == testId;
  }

  @override
  int get hashCode {
    return range.hashCode ^ key.hashCode ^ testId.hashCode;
  }
}

class ResultDetailsViewArguments {
  const ResultDetailsViewArguments({
    required this.id,
    this.key,
  });

  final int id;

  final _i10.Key? key;

  @override
  String toString() {
    return '{"id": "$id", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ResultDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.id == id && other.key == key;
  }

  @override
  int get hashCode {
    return id.hashCode ^ key.hashCode;
  }
}

class ActivityDetailsViewArguments {
  const ActivityDetailsViewArguments({
    required this.id,
    this.key,
  });

  final int id;

  final _i10.Key? key;

  @override
  String toString() {
    return '{"id": "$id", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ActivityDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.id == id && other.key == key;
  }

  @override
  int get hashCode {
    return id.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTestView({
    required List<int> range,
    _i10.Key? key,
    int? testId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.testView,
        arguments: TestViewArguments(range: range, key: key, testId: testId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTableView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.tableView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResultsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.resultsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResultDetailsView({
    required int id,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.resultDetailsView,
        arguments: ResultDetailsViewArguments(id: id, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToActivityDetailsView({
    required int id,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.activityDetailsView,
        arguments: ActivityDetailsViewArguments(id: id, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTestView({
    required List<int> range,
    _i10.Key? key,
    int? testId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.testView,
        arguments: TestViewArguments(range: range, key: key, testId: testId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTableView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.tableView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResultsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.resultsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResultDetailsView({
    required int id,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.resultDetailsView,
        arguments: ResultDetailsViewArguments(id: id, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithActivityDetailsView({
    required int id,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.activityDetailsView,
        arguments: ActivityDetailsViewArguments(id: id, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
