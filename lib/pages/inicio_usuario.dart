import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_app_tec/prividers/login_provider.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/custombuttom.dart';
import 'package:web_app_tec/widgets/document_miniatura.dart';
import 'package:web_app_tec/widgets/popup_menu.dart';
import 'package:web_app_tec/widgets/separador_bar.dart';
import 'package:web_app_tec/widgets/title_bar.dart';

class InicioUsuario extends StatelessWidget {
  const InicioUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!context.watch<LoginProvider>().isLogin) {
      context.go("/login");
    }
    ScreenSize.i.upadate(context);

    return Scaffold(
      body: ListView(
        children: [
          const TitleBar(
            menu: PopupMenu(),
            nombreUsuario: 'Danny Chavez',
            puesto: 'jefe de departamento de sistemas',
          ),
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
            nombre: "Creados recientemente",
            boton: TextButton(
              onPressed: () {},
              child: const Text("ver mas"),
            ),
          ),
          Container(
            width: ScreenSize.i.width,
            height: 200,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                  child: MiniaturaDocumento(),
                );
              },
            ),
          ),
          Separador(
            nombre: "Plantillas",
            boton: TextButton(
              onPressed: () {},
              child: const Text("ver mas"),
            ),
          ),
          Container(
            width: ScreenSize.i.width,
            height: 200,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                  child: MiniaturaDocumento(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
