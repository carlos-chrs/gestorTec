// Importaciones necesarias para el código
import 'package:flutter/material.dart'; // Para construir la interfaz de usuario
import 'package:go_router/go_router.dart'; // Para manejar las rutas de la aplicación
import 'package:web_app_tec/utils/screen_size.dart'; // Para gestionar el tamaño de la pantalla
import 'package:web_app_tec/widgets/custombuttom.dart'; // Para usar un botón personalizado
import 'package:web_app_tec/widgets/popup_menu.dart'; // Para mostrar un menú emergente
import 'package:web_app_tec/widgets/separador_bar.dart'; // Para mostrar un separador
import 'package:web_app_tec/widgets/title_bar.dart'; // Para mostrar una barra de título

// Clase StatelessWidget llamada AdminHome
class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key); // Constructor de la clase

  // Método build() para construir la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context); // Actualiza el tamaño de la pantalla

    // Devuelve un Scaffold que proporciona la estructura básica de la página
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Barra de título con menú emergente, nombre de usuario y puesto
              TitleBar(
                menu: PopupMenu(),
                nombreUsuario: 'nombreUsuario',
                puesto: 'puesto'
              ),
              // Contenedor con botones horizontales
              Container(
                width: ScreenSize.i.width, // Ancho igual al ancho de la pantalla
                height: 200, // Altura fija
                alignment: Alignment.center, // Contenido centrado
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Scroll horizontal
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaciado uniforme entre los botones
                    children: [
                      // Botón para crear un nuevo documento de dirección
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 8.0),
                        child: CustomButtom(
                          action: () {
                            context.go("/crear_documento"); // Navega a la ruta "/crear_documento"
                          },
                          text: 'Nuevo Documento \n Direccion',
                        ),
                      ),
                      // Botón para crear un nuevo documento de departamento
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 8.0),
                        child: CustomButtom(
                          action: () {
                            context.go("/crear_documento"); // Navega a la ruta "/crear_documento"
                          },
                          text: 'Nuevo Documento \n Departamento',
                        ),
                      ),
                      // Botón para configuraciones
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 8.0),
                        child: CustomButtom(
                          action: () {}, // No realiza ninguna acción
                          text: 'Configuracion',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Separador con un botón para ver más
              Separador(
                nombre: "Historial general de documentos",
                boton: TextButton(
                  onPressed: () {}, // No realiza ninguna acción
                  child: Text('ver mas'),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}