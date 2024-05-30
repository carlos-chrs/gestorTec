
// importacion de paquetes de librerias.


import 'package:flutter/material.dart';
import 'package:http/http.dart'; // Importamos el paquete http para realizar solicitudes HTTP.
import 'package:web_app_tec/utils/screen_size.dart'; // Importamos una clase ScreenSize para manejar el tamaño de la pantalla.
import 'package:web_app_tec/widgets/app_expansion_tile.dart'; // Importamos un widget personalizado para ExpansionTile.
import 'package:web_app_tec/widgets/custombuttom.dart'; // Importamos un widget personalizado para un botón.
import 'package:web_app_tec/widgets/popup_menu.dart'; // Importamos un widget personalizado para un menú emergente.
import 'package:web_app_tec/widgets/search_bar.dart'; // Importamos un widget personalizado para una barra de búsqueda.
import 'package:web_app_tec/widgets/title_bar.dart'; // Importamos un widget personalizado para la barra de título.

class AdminUsersPage extends StatelessWidget {
  const AdminUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);// Actualizamos el tamaño de la pantalla utilizando la clase ScreenSize.
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             // Barra de título personalizada con menú emergente, nombre de usuario y puesto.
            TitleBar(
                menu: PopupMenu(),
                nombreUsuario: "nombreUsuario",
                puesto: "puesto"),
                // Contenedor para la sección de encabezado con título, barra de búsqueda y botón 'nuevo'.
            Container(
              alignment: Alignment.center,
              width: ScreenSize.i.width - 10,
              height: 80,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "USUARIOS",
                          style: TextStyle(
                            fontSize: ScreenSize.i.width < 600 ? 20 : 28,
                          ),
                        ),
                      ),
                    ),
                    // Barra de búsqueda personalizada.
                    CustomSearchBar(
                      action: () {},
                      width: ScreenSize.i.width < 600
                          ? ScreenSize.i.width * 0.4
                          : 300,
                      heigth: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                    ),
                     // Botón personalizado para añadir un nuevo usuario.
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CustomButtom(
                        action: () {},
                        text: 'nuevo',
                      ),
                    ),
                  ],
                ),
              ),
            ),
             // Sección de lista de usuarios (no proporcionada en el código).
            // Aquí se esperaría que se incluya un widget para mostrar la lista de usuarios,
            // como un ListView o un widget personalizado.
            // El código proporcionado solo incluye un widget llamado ExpansionPanelListRadioExample,
            // el cual parece ser un ejemplo de otro widget personalizado que se espera que
            // muestre una lista de usuarios expandibles.
            // Esto probablemente necesitaría ser implementado o reemplazado con la lógica real para mostrar usuarios.
            SizedBox(
              height: ScreenSize.i.heigth * 70,
              width: ScreenSize.i.heigth * 90,
              child: ExpansionPanelListRadioExample(),
            ),
          ],
        ),
      ),
    );
  }
}
