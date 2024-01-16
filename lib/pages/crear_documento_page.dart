import 'package:flutter/material.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/input_text.dart';

class CrearDocumentoPage extends StatelessWidget {
  const CrearDocumentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    print(ScreenSize.i.width);
    return Scaffold(
      body: Container(
        width: ScreenSize.i.width,
        height: ScreenSize.i.heigth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InputText(hintText: "fecha"),
                    width: 150,
                    height: 40,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('numero de oficio'),
                    width: 150,
                    height: 40,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(3, 5),
                        blurRadius: 3,
                      ),
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(-2, -2),
                        blurRadius: 2,
                      ),
                    ], color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InputText(hintText: "dirigido a:"),
                    width: 200,
                    height: 40,
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    child: TextField(
                      maxLines: 8,
                    ),
                    width: ScreenSize.i.width - 10,
                    height: 200,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(3, 5),
                        blurRadius: 3,
                      ),
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(-2, -2),
                        blurRadius: 2,
                      ),
                    ], color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
