import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web_app_tec/prividers/login_provider.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/background_painter.dart';
import 'package:web_app_tec/widgets/blured_background.dart';
import 'package:web_app_tec/widgets/custom_background.dart';
import 'package:web_app_tec/widgets/input_text.dart';
import 'package:web_app_tec/widgets/password_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final userTextController = TextEditingController();
  final passTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Scaffold(
        body: SizedBox(
      child: SizedBox(
        width: ScreenSize.i.width,
        height: ScreenSize.i.heigth,
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: Center(
            child: Container(
              clipBehavior: Clip.antiAlias,
              width: ScreenSize.i.width > 700
                  ? ScreenSize.i.width * 0.5
                  : ScreenSize.i.width * 0.7,
              height: ScreenSize.i.heigth * 0.6,
              decoration: const BoxDecoration(
                color: Color.fromARGB(190, 255, 255, 255),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Usuario:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InputText(
                                textController: userTextController,
                                hintText: "Ingrese su nombre de usuario.",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Contraseña:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: PasswordField(
                                  controller: passTextController,
                                  labelText: "Ingrese su contraseña."),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: ScreenSize.i.width < 600 ? 250 : 350,
                          height: 50,
                          child: FilledButton(
                            onPressed: () async {
                              print(userTextController.text);
                              print(passTextController.text);
                              // TODO: revisar conexion con la base de datos
                              final supabase = Supabase.instance.client;
                              try {
                                await supabase.auth.signInWithPassword(
                                  email: userTextController.text,
                                  password: passTextController.text,
                                );
                              } catch (e) {
                                print(e);
                                const snackBar = SnackBar(
                                  content: Center(
                                    child: Text(
                                        "Problemas de inicio de sesión. verifique sus datos e intente de nuevo"),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                              final session = supabase.auth.currentSession;
                              final isSessionExpired = session?.isExpired;
                              if (isSessionExpired != null ||
                                  isSessionExpired == false)
                                context.read<LoginProvider>().login(true);
                            },
                            child: const Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
                          width: 500,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Si tiene problemas para iniciar sesion, por favor acerquese al departamento de Sistemas para solicitar ayuda.",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black54),
                              maxLines: 4,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
