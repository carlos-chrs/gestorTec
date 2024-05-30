import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:web_app_tec/utils/crear_pdf_web.dart';

class VerDocumentoPage extends StatelessWidget {
  const VerDocumentoPage({Key? key}) : super(key: key);

  // Método de construcción del widget.
  @override
  Widget build(BuildContext context) {
    // Devuelve un widget Center que coloca su contenido en el centro de la pantalla.
    return Center(
      child: TextButton(
        onPressed: () => _createPDF(),
        child: const Text('ver documento'),
      ),
    );
  }

  // Método para crear un documento PDF.
  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    // Dibuja un texto en la página del documento.
    page.graphics.drawString('Welcome to PDF Succinctly!',
        PdfStandardFont(PdfFontFamily.helvetica, 30));

    List<int> bytes = await document.save();
    document.dispose();

    // Llama a la función 'saveAndLaunchFile' para guardar y abrir el archivo PDF.
    saveAndLaunchFile(bytes, 'Output.pdf');
  }

  // Future<Uint8List> _readImageData(String name) async {
  //   final data = await rootBundle.load('images/$name');
  //   return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  // }
}
