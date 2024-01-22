import 'package:flutter/material.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/input_text.dart';
import 'package:web_app_tec/widgets/popup_menu.dart';
import 'package:web_app_tec/widgets/title_bar.dart';

class CrearDocumentoPage extends StatelessWidget {
  const CrearDocumentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Scaffold(
      body: SizedBox(
        width: ScreenSize.i.width,
        height: ScreenSize.i.heigth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleBar(
                menu: PopupMenu(),
                nombreUsuario: 'Danny Chavez',
                puesto: 'jefe de departamento de sistemas',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: 150,
                        height: 40,
                        child: InputText(
                          hintText: "fecha",
                          textController: null,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: 150,
                        height: 40,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(3, 5),
                            blurRadius: 3,
                          ),
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(-2, -2),
                            blurRadius: 2,
                          ),
                        ], color: Colors.white),
                        child: const Text('numero de oficio'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: 200,
                        height: 40,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: InputText(
                          hintText: "dirigido a:",
                          textController: null,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        width: ScreenSize.i.width - 10,
                        height: 200,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(3, 5),
                            blurRadius: 3,
                          ),
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(-2, -2),
                            blurRadius: 2,
                          ),
                        ], color: Colors.white),
                        child: const TextField(
                          maxLines: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
