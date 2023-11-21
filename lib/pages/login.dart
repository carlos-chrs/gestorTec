import 'package:flutter/material.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/blured_background.dart';
import 'package:web_app_tec/widgets/custom_background.dart';
import 'package:web_app_tec/widgets/input_text.dart';
import 'package:web_app_tec/widgets/password_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Scaffold(
        body: CustomBackground(
      child: Center(
        child: Container(
          width: ScreenSize.i.width * 90,
          height: ScreenSize.i.heigth * 90,
          color: Colors.white,
          child: Center(
            child: SingleChildScrollView(
              child: BlurredBackground(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Text(
                          'Usuario:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        InputText(
                          hintText: "Ingrese su nombre de usuario.",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Contraseña:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        PasswordField(
                            controller: TextEditingController(),
                            labelText: "Ingrese su contraseña."),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: ScreenSize.i.width < 600 ? 250 : 350,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {},
                        child: const Text(
                          'Iniciar seion',
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
                      child: Text(
                        "Si tiene problemas para iniciar sesion, por favor acerquese al departamento de ---------- para solicitar ayuda.",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
