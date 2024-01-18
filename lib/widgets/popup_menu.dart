import 'package:flutter/material.dart';

enum Items { config, salir }

class PopupMenu extends StatelessWidget {
  Widget build(BuildContext context) {
    return PopupMenuButton<Items>(
      initialValue: null,
      // Callback that sets the selected popup menu item.
      onSelected: (Items item) {
        // print(item);
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
