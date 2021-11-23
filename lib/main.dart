import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/injection.dart';

import 'presentation/app.dart';

void main() {
  setupLocator();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey[200],
  ));
  runApp(const App());
}
