import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'configperfil_widget.dart' show ConfigperfilWidget;
import 'package:flutter/material.dart';

class ConfigperfilModel extends FlutterFlowModel<ConfigperfilWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for naassme widget.
  FocusNode? naassmeFocusNode;
  TextEditingController? naassmeTextController;
  String? Function(BuildContext, String?)? naassmeTextControllerValidator;
  // State field(s) for cidasde widget.
  FocusNode? cidasdeFocusNode;
  TextEditingController? cidasdeTextController;
  String? Function(BuildContext, String?)? cidasdeTextControllerValidator;
  // State field(s) for endereco widget.
  FocusNode? enderecoFocusNode;
  TextEditingController? enderecoTextController;
  String? Function(BuildContext, String?)? enderecoTextControllerValidator;
  // State field(s) for cep widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepTextController;
  String? Function(BuildContext, String?)? cepTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    naassmeFocusNode?.dispose();
    naassmeTextController?.dispose();

    cidasdeFocusNode?.dispose();
    cidasdeTextController?.dispose();

    enderecoFocusNode?.dispose();
    enderecoTextController?.dispose();

    cepFocusNode?.dispose();
    cepTextController?.dispose();
  }
}
