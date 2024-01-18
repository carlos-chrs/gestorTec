import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app_tec/pages/crear_documento_page.dart';
import 'package:web_app_tec/pages/inicio_usuario.dart';
import 'package:web_app_tec/pages/login.dart';

getRouter() {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const InicioUsuario();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginPage();
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
