import 'package:flutter/material.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class CustomTextEditor extends StatefulWidget {
  CustomTextEditor({super.key, required this.controller, required this.alto});
  QuillEditorController controller;
  double alto;
  @override
  State<CustomTextEditor> createState() => _CustomTextEditorState();
}

class _CustomTextEditorState extends State<CustomTextEditor> {
  // controller = widget.controller;
  final customToolBarList = [
    ToolBarStyle.clean,
    ToolBarStyle.undo,
    ToolBarStyle.redo,
    ToolBarStyle.separator,
    ToolBarStyle.bold,
    ToolBarStyle.italic,
    ToolBarStyle.underline,
    ToolBarStyle.align,
    ToolBarStyle.listBullet,
    ToolBarStyle.listOrdered,
    ToolBarStyle.indentAdd,
    ToolBarStyle.indentMinus,
    ToolBarStyle.addTable,
    ToolBarStyle.editTable,
    ToolBarStyle.image,
    ToolBarStyle.color
  ];

  final _toolbarColor = Colors.grey.shade200;
  final _backgroundColor = Colors.white70;
  final _toolbarIconColor = Colors.black87;
  final _editorTextStyle = const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontFamily: 'Roboto');
  final _hintTextStyle = const TextStyle(
      fontSize: 18, color: Colors.black38, fontWeight: FontWeight.normal);

  bool _hasFocus = false;

  @override
  void initState() {
    widget.controller = QuillEditorController();
    widget.controller.onTextChanged((text) {
      debugPrint('listening to $text');
    });
    widget.controller.onEditorLoaded(() {
      debugPrint('Editor Loaded :)');
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: widget.alto,
      child: Column(
        children: [
          ToolBar(
            toolBarConfig: customToolBarList,
            toolBarColor: _toolbarColor,
            padding: const EdgeInsets.all(8),
            iconSize: 25,
            iconColor: _toolbarIconColor,
            activeIconColor: Colors.greenAccent.shade400,
            controller: widget.controller,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            // customButtons: [
            //   Container(
            //     width: 25,
            //     height: 25,
            //     decoration: BoxDecoration(
            //         color: _hasFocus ? Colors.green : Colors.grey,
            //         borderRadius: BorderRadius.circular(15)),
            //   ),
            //   InkWell(
            //       onTap: () => unFocusEditor(),
            //       child: const Icon(
            //         Icons.favorite,
            //         color: Colors.black,
            //       )),
            //   InkWell(
            //       onTap: () async {
            //         var selectedText = await controller.getSelectedText();
            //         debugPrint('selectedText $selectedText');
            //         var selectedHtmlText =
            //             await controller.getSelectedHtmlText();
            //         debugPrint('selectedHtmlText $selectedHtmlText');
            //       },
            //       child: const Icon(
            //         Icons.add_circle,
            //         color: Colors.black,
            //       )),
            // ],
          ),
          Expanded(
            child: QuillHtmlEditor(
              text: "",
              hintText: '',
              controller: widget.controller,
              isEnabled: true,
              ensureVisible: false,
              minHeight: 500,
              autoFocus: false,
              textStyle: _editorTextStyle,
              hintTextStyle: _hintTextStyle,
              hintTextAlign: TextAlign.start,
              padding: const EdgeInsets.only(left: 10, top: 10),
              hintTextPadding: const EdgeInsets.only(left: 20),
              backgroundColor: _backgroundColor,
              inputAction: InputAction.newline,
              onEditingComplete: (s) => debugPrint('Editing completed $s'),
              loadingBuilder: (context) {
                return const Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: Colors.red,
                ));
              },
              onFocusChanged: (focus) {
                debugPrint('has focus $focus');
                setState(() {
                  _hasFocus = focus;
                });
              },
              onTextChanged: (text) => debugPrint('widget text change $text'),
              onEditorCreated: () {
                debugPrint('Editor has been loaded');
                setHtmlText('Testing text on load');
              },
              onEditorResized: (height) => debugPrint('Editor resized $height'),
              onSelectionChanged: (sel) =>
                  debugPrint('index ${sel.index}, range ${sel.length}'),
            ),
          ),
        ],
      ),
    );
  }

  Widget textButton({required String text, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: _toolbarIconColor,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: _toolbarColor),
          )),
    );
  }

  ///[getHtmlText] to get the html text from editor
  void getHtmlText() async {
    String? htmlText = await widget.controller.getText();
    debugPrint(htmlText);
  }

  ///[setHtmlText] to set the html text to editor
  void setHtmlText(String text) async {
    await widget.controller.setText(text);
  }

  ///[insertNetworkImage] to set the html text to editor
  void insertNetworkImage(String url) async {
    await widget.controller.embedImage(url);
  }

  ///[insertVideoURL] to set the video url to editor
  ///this method recognises the inserted url and sanitize to make it embeddable url
  ///eg: converts youtube video to embed video, same for vimeo
  void insertVideoURL(String url) async {
    await widget.controller.embedVideo(url);
  }

  /// to set the html text to editor
  /// if index is not set, it will be inserted at the cursor postion
  void insertHtmlText(String text, {int? index}) async {
    await widget.controller.insertText(text, index: index);
  }

  /// to clear the editor
  void clearEditor() => widget.controller.clear();

  /// to enable/disable the editor
  void enableEditor(bool enable) => widget.controller.enableEditor(enable);

  /// method to un focus editor
  void unFocusEditor() => widget.controller.unFocus();
}
