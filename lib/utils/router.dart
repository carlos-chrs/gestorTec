import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_app_tec/main.dart';
import 'package:web_app_tec/pages/crear_documento_page.dart';
import 'package:web_app_tec/pages/editor_test.dart';
import 'package:web_app_tec/pages/editor_texto_quill.dart';
import 'package:web_app_tec/pages/inicio_usuario.dart';
import 'package:web_app_tec/pages/login.dart';
import 'package:web_app_tec/pages/test2.dart';
import 'package:web_app_tec/pages/ver_documento_page.dart';
import 'package:web_app_tec/prividers/login_provider.dart';
import 'package:web_app_tec/widgets/input_text.dart';

getRouter(BuildContext context) {
  bool login = context.watch<LoginProvider>().authenticated;

  final GoRouter router = GoRouter(
    redirect: (BuildContext context, GoRouterState state) {
      if (!login) {
        return '/login';
      } else {
        return null;
      }
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return login ? const InicioUsuario() : LoginPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return LoginPage();
            },
          ),
          GoRoute(
            path: 'crear_documento',
            builder: (BuildContext context, GoRouterState state) {
              return const CrearDocumento(
                title: '',
              );
            },
          ),
          GoRoute(
            path: 'ver_documento',
            builder: (BuildContext context, GoRouterState state) {
              return const CrearDocumento(
                title: '',
              );
            },
          ),
        ],
      ),
    ],
  );
  return router;
}
