import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/app.module.dart';
import 'config/app.widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Modular.to.addListener(() {
    debugPrint('ROTA: ${Modular.to.path}');
  });

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
  );
}
