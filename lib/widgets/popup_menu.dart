import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web_app_tec/prividers/login_provider.dart';

enum Items { config, salir }

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Items>(
      tooltip: "Menú",
      initialValue: null,
      // Callback that sets the selected popup menu item.
      onSelected: (Items item) async {
        // print(item);
        if (item == Items.salir) {
          final supabase = Supabase.instance.client;
          await supabase.auth.signOut();
          context.read<LoginProvider>().login(false);

          //TODO: cerrar sesion en el backend
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Items>>[
        const PopupMenuItem<Items>(
          value: Items.config,
          child: Text('Configuración'),
        ),
        const PopupMenuItem<Items>(
          value: Items.salir,
          child: Text('Salir'),
        ),
      ],
    );
  }
}
