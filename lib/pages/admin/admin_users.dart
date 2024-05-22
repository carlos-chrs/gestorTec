import 'package:flutter/material.dart';
import 'package:web_app_tec/utils/screen_size.dart';

class AdminUsersPage extends StatelessWidget {
  const AdminUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administracion de usuarios'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('busqueda de usuarios'),
            SizedBox(
              height: ScreenSize.i.heigth * 70,
              width: ScreenSize.i.heigth * 90,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    title: Text('titulo $index'),
                    children: [
                      Text('contenido $index'),
                      Text('contenido $index'),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
