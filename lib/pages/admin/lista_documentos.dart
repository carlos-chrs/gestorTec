import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Importando paquetes necesarios
import 'package:web_app_tec/utils/screen_size.dart'; // Importando un archivo de utilidades
import 'package:web_app_tec/widgets/custombuttom.dart'; // Importando un widget personalizado de botón
import 'package:web_app_tec/widgets/popup_menu.dart'; // Importando un widget personalizado de menú emergente
import 'package:web_app_tec/widgets/separador_bar.dart'; // Importando un widget personalizado de separador de barra
import 'package:web_app_tec/widgets/title_bar.dart'; // Importando un widget personalizado de barra de título

// Declarando una clase StatelessWidget llamada HistorialDocumentosAdmin
class HistorialDocumentosAdmin extends StatelessWidget {
  const HistorialDocumentosAdmin({Key? key}) : super(key: key);

  // Método build() que construye y devuelve la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    // Actualizando el tamaño de la pantalla usando una utilidad
    ScreenSize.i.upadate(context);
    
    // Devuelve un Scaffold que proporciona la estructura básica de la página
    return Scaffold(
      body: ListView( // Cuerpo de la página como una lista desplazable
        children: const [ // Lista de elementos hijos
          // Barra de título personalizada con menú emergente y nombre de usuario y puesto
          TitleBar(
            menu: PopupMenu(),
            nombreUsuario: 'nombreUsuario',
            puesto: 'puesto'
          ),
          // Separador con un texto y un botón que actualmente no realiza ninguna acción
          Separador(
            nombre: "Historial general de documentos",
            boton: TextButton(
              onPressed: null,
              child: Text(''),
            )
          )
        ],
      ),
    );
  }
}



