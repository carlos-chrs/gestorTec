import 'dart:math';

import 'package:flutter/material.dart';

class MiniaturaDocumento extends StatelessWidget {
  const MiniaturaDocumento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(5, 5),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Colors.black26,
            offset: Offset(-2, -2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Solicitud de..."),
          Container(
            width: double.infinity,
            height: 30,
            color: Color.fromRGBO(Random().nextInt(150), Random().nextInt(150),
                Random().nextInt(150), 1),
            child: const Center(
                child: Text(
              "Direccion",
              style: TextStyle(color: Colors.white),
            )),
          ),
        ],
      ),
    );
  }
}
