import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'atualizarintro_widget.dart' show AtualizarintroWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AtualizarintroModel extends FlutterFlowModel<AtualizarintroWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for numero widget.
  FocusNode? numeroFocusNode;
  TextEditingController? numeroTextController;
  String? Function(BuildContext, String?)? numeroTextControllerValidator;
  String? _numeroTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha seu contato!';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for naassme widget.
  FocusNode? naassmeFocusNode;
  TextEditingController? naassmeTextController;
  String? Function(BuildContext, String?)? naassmeTextControllerValidator;
  String? _naassmeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Digite seu nome.';
    }

    return null;
  }

  // State field(s) for cidasde widget.
  FocusNode? cidasdeFocusNode;
  TextEditingController? cidasdeTextController;
  String? Function(BuildContext, String?)? cidasdeTextControllerValidator;
  String? _cidasdeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Digite sua cidade';
    }

    return null;
  }

  // State field(s) for endereco widget.
  FocusNode? enderecoFocusNode;
  TextEditingController? enderecoTextController;
  String? Function(BuildContext, String?)? enderecoTextControllerValidator;
  String? _enderecoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Digite seu endereço';
    }

    return null;
  }

  // State field(s) for cep widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepTextController;
  final cepMask = MaskTextInputFormatter(mask: '#####-###');
  String? Function(BuildContext, String?)? cepTextControllerValidator;
  String? _cepTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Digite seu cep!';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    numeroTextControllerValidator = _numeroTextControllerValidator;
    naassmeTextControllerValidator = _naassmeTextControllerValidator;
    cidasdeTextControllerValidator = _cidasdeTextControllerValidator;
    enderecoTextControllerValidator = _enderecoTextControllerValidator;
    cepTextControllerValidator = _cepTextControllerValidator;
  }

  @override
  void dispose() {
    numeroFocusNode?.dispose();
    numeroTextController?.dispose();

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
