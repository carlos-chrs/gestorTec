import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/custombuttom.dart';
import 'package:web_app_tec/widgets/popup_menu.dart';
import 'package:web_app_tec/widgets/separador_bar.dart';
import 'package:web_app_tec/widgets/title_bar.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleBar(
                  menu: PopupMenu(),
                  nombreUsuario: 'nombreUsuario',
                  puesto: 'puesto'),
              Container(
                width: ScreenSize.i.width,
                height: 200,
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 60.0, horizontal: 8.0),
                        child: CustomButtom(
                          action: () {
                            context.go("/crear_documento");
                          },
                          text: 'Nuevo Documento \n Direccion',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 60.0, horizontal: 8.0),
                        child: CustomButtom(
                          action: () {
                            context.go("/crear_documento");
                          },
                          text: 'Nuevo Documento \n Departamento',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 60.0, horizontal: 8.0),
                        child: CustomButtom(
                          action: () {},
                          text: 'Configuracion',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Separador(
                  nombre: "Historial general de documentos",
                  boton: TextButton(
                    onPressed: () {},
                    child: Text('ver mas'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
