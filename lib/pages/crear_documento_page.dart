import 'package:flutter/material.dart' hide ReorderableList;
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:go_router/go_router.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:provider/provider.dart';
import 'package:web_app_tec/models/campo_documento_model.dart';
import 'package:web_app_tec/prividers/content_document_provider.dart';
import 'package:web_app_tec/singleton/usuario_actual.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/html_text_editor.dart';
import 'package:web_app_tec/widgets/popup_menu.dart';
import 'package:web_app_tec/widgets/title_bar.dart';
import 'package:universal_html/html.dart' as html;

class CrearDocumento extends StatefulWidget {
  const CrearDocumento({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CrearDocumentoState createState() => _CrearDocumentoState();
}

class ItemData {
  ItemData(this.title, this.key);
  final String title;
  final Key key;
}

class _CrearDocumentoState extends State<CrearDocumento> {
  late List<CampoDeDocumento> _items;
  _CrearDocumentoState() {
    _items = [
      CampoDeDocumento(
        nombreDeCampo: 'Fecha',
        formato: "formato",
        alineacion: Alineacion.derecha,
        controller: TextEditingController(),
        medida: Medida.chico,
        label: "23/01/2024",
        key: const Key('Fecha'),
      ),
      CampoDeDocumento(
        nombreDeCampo: 'Asunto',
        formato: "formato",
        alineacion: Alineacion.derecha,
        controller: TextEditingController(),
        key: const Key('Asunto'),
        label: "asunto del documento",
        medida: Medida.mediano,
      ),
      CampoDeDocumento(
        nombreDeCampo: 'Dirigido a',
        formato: "formato",
        alineacion: Alineacion.izquierda,
        controller: TextEditingController(),
        label: " dirigido a",
        key: const Key('Dirigido a'),
        medida: Medida.mediano,
      ),
      CampoDeDocumento(
        nombreDeCampo: 'Puesto',
        formato: "formato",
        alineacion: Alineacion.izquierda,
        controller: TextEditingController(),
        label: "puesto",
        key: const Key('Puesto'),
        medida: Medida.mediano,
      ),
      CampoDeDocumento(
          nombreDeCampo: 'Cuerpo',
          formato: "formato",
          textoEnriquesido: true,
          htmlController: HtmlEditorController(),
          alineacion: Alineacion.derecha,
          label: "escriba el cuerpo del documento",
          key: const Key('Cuerpo'),
          lineas: 8,
          medida: Medida.grande),
    ];
  }

  // Returns index of item with given key
  int _indexOfKey(Key key) {
    return _items.indexWhere((CampoDeDocumento d) => d.key == key);
  }

  bool _reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item);
    int newPositionIndex = _indexOfKey(newPosition);

    final draggedItem = _items[draggingIndex];
    setState(() {
      debugPrint("Reordering $item -> $newPosition");
      _items.removeAt(draggingIndex);
      _items.insert(newPositionIndex, draggedItem);
    });
    return true;
  }

  void _reorderDone(Key item) {
    final draggedItem = _items[_indexOfKey(item)];
    debugPrint("Reordering finished for ${draggedItem.nombreDeCampo}}");
  }

  @override
  Widget build(BuildContext context) {
    // _items = context.watch<ContenidoDocumentoProvider>().items;
    ScreenSize.i.upadate(context);
    return Scaffold(
      body: ReorderableList(
        onReorder: _reorderCallback,
        onReorderDone: _reorderDone,
        child: CustomScrollView(
          // cacheExtent: 3000,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              // expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                title: TitleBar(
                    menu: const PopupMenu(),
                    nombreUsuario: UserData().nombre,
                    puesto: UserData().puesto),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Item(
                        data: _items[index],
                        // first and last attributes affect border drawn during dragging
                        isFirst: index == 0,
                        isLast: index == _items.length - 1,
                      );
                    },
                    childCount: _items.length,
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            ElevatedButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add_box),
                    ScreenSize.i.width > 750
                        ? const Text("Agregar campo")
                        : const SizedBox(),
                  ],
                ),
                onPressed: () {}),
            const Spacer(),
            ElevatedButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.clear_all),
                    ScreenSize.i.width > 750
                        ? const Text("limpiar todos los campos")
                        : const SizedBox(),
                  ],
                ),
                onPressed: () {
                  for (var element in _items) {
                    element.textoEnriquesido
                        ? element.htmlController!.clear()
                        : element.controller!.clear();
                  }
                }),
            const Spacer(),
            ElevatedButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.preview),
                    ScreenSize.i.width > 750
                        ? const Text("Previsualizar")
                        : const SizedBox(),
                  ],
                ),
                onPressed: () {}),
            const Spacer(),
            ElevatedButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.cloud_done),
                    ScreenSize.i.width > 750
                        ? const Text("crear y guardar")
                        : const SizedBox(),
                  ],
                ),
                onPressed: () {
                  print(_items[0].controller!.text);
                  context
                      .read<ContenidoDocumentoProvider>()
                      .repalceList(_items);
                  for (var element in _items) {
                    element.textoEnriquesido
                        ? element.htmlController!.getText().then((value) {
                            print(value);
                            String txt = value.replaceAll('&nbsp;', ' ');
                            print("remplazado ${txt}");
                            var jspntext = parseHtmlToJson(value);
                            print(jspntext);
                          })
                        : print(element.controller!.text);
                  }
                }),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> parseHtmlToJson(String htmlString) {
    var document = html.Element.html(htmlString);
    return _parseNodeToJson(document);
  }

  Map<String, dynamic> _parseNodeToJson(html.Element node) {
    Map<String, dynamic> jsonMap = {
      'tag': node.localName,
      'children': [],
    };

    for (var childNode in node.nodes) {
      if (childNode is html.Element) {
        jsonMap['children'].add(_parseNodeToJson(childNode));
      } else if (childNode is html.Text) {
        jsonMap['children'].add({'text': childNode.text});
      }
    }

    return jsonMap;
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.data,
    required this.isFirst,
    required this.isLast,
  }) : super(key: key);

  final CampoDeDocumento data;
  final bool isFirst;
  final bool isLast;

  Widget _buildChild(BuildContext context, ReorderableItemState state) {
    BoxDecoration decoration;

    if (state == ReorderableItemState.dragProxy ||
        state == ReorderableItemState.dragProxyFinished) {
      // slightly transparent background white dragging (just like on iOS)
      decoration = const BoxDecoration(color: Color(0xD0FFFFFF));
    } else {
      bool placeholder = state == ReorderableItemState.placeholder;
      decoration = BoxDecoration(
          border: Border(
              top: isFirst && !placeholder
                  ? Divider.createBorderSide(context) //
                  : BorderSide.none,
              bottom: isLast && placeholder
                  ? BorderSide.none //
                  : Divider.createBorderSide(context)),
          color: placeholder ? null : Colors.white);
    }

    // For iOS dragging mode, there will be drag handle on the right that triggers
    // reordering; For android mode it will be just an empty container
    Widget dragHandle = ReorderableListener(
      child: Container(
        padding: const EdgeInsets.only(right: 18.0, left: 18.0),
        color: const Color(0x08000000),
        child: const Center(
          child: Icon(Icons.reorder, color: Color(0xFF888888)),
        ),
      ),
    );

    Widget content = Container(
      decoration: decoration,
      child: SafeArea(
          top: false,
          bottom: false,
          child: Opacity(
            // hide content for placeholder
            opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 14.0),
                    child: data.textoEnriquesido
                        ? HtmlTextEditor(
                            controller: data.htmlController!,
                            alto: data.lineas * 20,
                          )
                        : TextInputCampoDeDocumento(data: data),
                  )),
                  // Triggers the reordering
                  dragHandle,
                ],
              ),
            ),
          )),
    );

    // For android dragging mode, wrap the entire content in DelayedReorderableListener

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableItem(
        key: data.key, //
        childBuilder: _buildChild);
  }
}

class TextInputCampoDeDocumento extends StatelessWidget {
  const TextInputCampoDeDocumento({
    super.key,
    required this.data,
  });

  final CampoDeDocumento data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: calcularAlineacion(data),
      children: [
        Container(
          width: calcularMedida(data, context),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 5)
              ]),
          child: TextField(
            maxLines: data.lineas,
            controller: data.controller,
            decoration: InputDecoration(
              hintText: data.label,
              border: InputBorder.none,
              prefix: const Text('  '),
            ),
          ),
        ),
      ],
    );
  }

  calcularMedida(CampoDeDocumento data, BuildContext context) {
    ScreenSize.i.upadate(context);

    switch (data.medida) {
      case Medida.chico:
        return ScreenSize.i.width / 4;
      case Medida.mediano:
        return ScreenSize.i.width / 2;
      case Medida.grande:
        return ScreenSize.i.width - 100;
    }
  }

  calcularAlineacion(CampoDeDocumento data) {
    switch (data.alineacion) {
      case Alineacion.izquierda:
        return MainAxisAlignment.start;
      case Alineacion.derecha:
        return MainAxisAlignment.end;
      case Alineacion.centrado:
        return MainAxisAlignment.center;
      default:
        return MainAxisAlignment.center;
    }
  }
}
