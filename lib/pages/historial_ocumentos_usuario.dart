import 'package:flutter/material.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/cuadro_info_document.dart';
import 'package:web_app_tec/widgets/custom_search_tab_bar.dart';
import 'package:web_app_tec/widgets/custom_table.dart';
import 'package:web_app_tec/widgets/title_bar.dart';

/// Widget para mostrar el historial de documentos de usuarios.
class HistorialDocumentosUsuarios extends StatelessWidget {
  /// Constructor para el widget [HistorialDocumentosUsuarios].
  const HistorialDocumentosUsuarios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Actualiza el tamaño de la pantalla utilizando el objeto [ScreenSize].
    ScreenSize.i.upadate(context);
    
    // Devuelve un Scaffold con el contenido del historial de documentos.
    return Scaffold(
      body: SizedBox(
        height: ScreenSize.i.heigth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Barra de título con nombre de usuario y puesto.
              TitleBar(
                menu: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_down_sharp,
                  ),
                ),
                nombreUsuario: "Nombre de Usuario",
                puesto: "puesto",
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomSearchTab(
                  heigthFilterButtons: 40,
                  maxWidthBar: 950,
                  widthFilterButtons: 150,
                ),
              ),
              // Contenido principal: CuadroInfo y CustomTable.
              SizedBox(
                width: ScreenSize.i.width,
                child: Row(
                  children: [
                    // Cuadro de información del documento.
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ScreenSize.i.width > 700
                          ? CuadroInfo(
                              heigth: ScreenSize.i.heigth * 0.7,
                              width: 250,
                            )
                          : const SizedBox(),
                    ),
                    // Tabla personalizada para mostrar los documentos.
                    CustomTable(
                      heigth: ScreenSize.i.heigth * 0.7,
                      width: ScreenSize.i.width <= 700
                          ? ScreenSize.i.width - 40
                          : ScreenSize.i.width - 300,
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