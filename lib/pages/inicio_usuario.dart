import 'package:flutter/material.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/document_miniatura.dart';

class InicioUsuario extends StatelessWidget {
  const InicioUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: ScreenSize.i.width,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ScreenSize.i.width > 700
                      ? const Text(
                          "Jefe de departamento del departamento de sistemas")
                      : const SizedBox(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ScreenSize.i.width > 700
                      ? const Text("-")
                      : const SizedBox(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Nombre Del Usuario",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down_sharp)),
                ),
              ],
            ),
          ),
          Container(
            width: ScreenSize.i.width,
            height: 200,
            alignment: Alignment.center,
            // decoration: BoxDecoration(
            //   color: Colors.white,
            // ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 8.0),
                  child: MaterialButton(
                    color: Colors.blueAccent,
                    onPressed: () {},
                    child: const Text(
                      "nuevo documento \n   Direccion",
                      style: TextStyle(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 8.0),
                  child: MaterialButton(
                    color: Colors.blueAccent,
                    onPressed: () {},
                    child: const Text(
                      "nuevo documento \n   Departamento",
                      style: TextStyle(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 8.0),
                  child: MaterialButton(
                    color: Colors.blueAccent,
                    onPressed: () {},
                    child: const Text(
                      "configuracion",
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: ScreenSize.i.width,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("creados recientemente"),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child:
                        TextButton(onPressed: () {}, child: Text("ver mas"))),
              ],
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
          Container(
            alignment: Alignment.centerRight,
            width: ScreenSize.i.width,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Plantillas"),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                        onPressed: () {}, child: const Text("ver mas"))),
              ],
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
