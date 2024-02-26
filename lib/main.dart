import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web_app_tec/prividers/content_document_provider.dart';
import 'package:web_app_tec/prividers/login_provider.dart';
import 'package:web_app_tec/utils/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ldqahmgngmrovptxuddh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxkcWFobWduZ21yb3ZwdHh1ZGRoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk0NzAyNDgsImV4cCI6MjAxNTA0NjI0OH0.MTYbTyYb3gh0JTUb75sHcKTo2BpDPSSuEchVeRs0KX8',
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContenidoDocumentoProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent[700]!),
        useMaterial3: true,
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      routerConfig: getRouter(context),
    );
  }
}
