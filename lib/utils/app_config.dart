import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_care_second_version/locator.dart';

import '../data/local_data/storage_service.dart';
import '../routing/routing_module.dart';
class AppConfig extends ChangeNotifier {
  var shared = sl<StorageService>();

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    if (shared.accessToken == "") {
      RouteService.serviceNavi
          .pushNamedAndRemoveUtils(RouteNames.mainAuthScreen);
    } else {
      RouteService.serviceNavi
          .pushNamedAndRemoveUtils(RouteNames.mainScreenApp);
    }
  }
}
