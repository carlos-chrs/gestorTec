import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_app_tec/pages/crear_documento_page.dart';
import 'package:web_app_tec/pages/inicio_usuario.dart';
import 'package:web_app_tec/pages/login.dart';
import 'package:web_app_tec/prividers/login_provider.dart';

getRouter(BuildContext context) {
  bool login = context.watch<LoginProvider>().isLogin;

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
              return const CrearDocumentoPage();
            },
          ),
        ],
      ),
    ],
  );
  return router;
}
