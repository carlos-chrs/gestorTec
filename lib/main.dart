import 'package:flutter/material.dart';
import 'package:web_app_tec/pages/crear_documento_page.dart';
import 'package:web_app_tec/pages/historial_ocumentos_usuario.dart';

import 'package:web_app_tec/pages/inicio_usuario.dart';
import 'package:web_app_tec/pages/login.dart';
// import 'package:web_app_tec/pages/inicio_usuario.dart';
// import 'package:web_app_tec/pages/login.dart';
import 'package:web_app_tec/pages/test2.dart';
import 'package:web_app_tec/pages/test_widgets.dart';
import 'package:web_app_tec/pages/ver_documento_page.dart';
// import 'package:web_app_tec/pages/test_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent[700]!),
          useMaterial3: true,
          textTheme: const TextTheme(
              displayMedium: TextStyle(
            fontSize: 18,
          ))),
      home: VerDocumentoPage(),
    );
  }
}
