import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loudnews/viewmodels/database/local/cache_helper.dart';
import 'package:loudnews/viewmodels/database/network/dio_helper.dart';

import 'loud_news.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await DioHelper.init();
  await CacheHelper().init();
  runApp(LoudNews());
}
