import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'loud_news.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const LoudNews());
}
