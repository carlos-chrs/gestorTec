import 'package:flutter/material.dart';
import 'package:web_app_tec/pages/inicio_usuario.dart';
import 'package:web_app_tec/pages/login.dart';

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
      home: const InicioUsuario(),
    );
  }
}
