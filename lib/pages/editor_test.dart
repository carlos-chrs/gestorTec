import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:web_app_tec/widgets/html_text_editor.dart';

class HtmlEditorExample extends StatefulWidget {
  HtmlEditorExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HtmlEditorExampleState createState() => _HtmlEditorExampleState();
}

class _HtmlEditorExampleState extends State<HtmlEditorExample> {
  String result = '';
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.clearFocus();
        }
      },
      child: Scaffold(
          body: HtmlTextEditor(
        alto: 80,
        controller: HtmlEditorController(),
      )),
    );
  }
}

// class HtmlTextEditor extends StatelessWidget {
//   final HtmlEditorController controller;

//   const HtmlTextEditor({
//     required this.controller,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 600,
//       width: 700,
//       decoration: BoxDecoration(),
//       clipBehavior: Clip.antiAlias,
//       child: HtmlEditor(
//         htmlToolbarOptions: const HtmlToolbarOptions(
//             toolbarPosition: ToolbarPosition.belowEditor,
//             defaultToolbarButtons: [
//               FontButtons(clearAll: false),
//               ListButtons(listStyles: false),
//               ParagraphButtons(
//                   textDirection: false,
//                   lineHeight: false,
//                   caseConverter: false),
//             ]),
//         controller: controller, //required
//         htmlEditorOptions: const HtmlEditorOptions(
//           hint: "ESCRIBA AQUI SU TEXTO...",
//           //initalText: "text content initial, if any",
//         ),
//         otherOptions: const OtherOptions(
//           height: 700,
//         ),
//       ),
//     );
//   }
// }
