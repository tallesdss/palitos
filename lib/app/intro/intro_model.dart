import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'intro_widget.dart' show IntroWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class IntroModel extends FlutterFlowModel<IntroWidget> {
  ///  Local state fields for this page.

  String? bairro;

  String? rua;

  String? cidade;

  String? estado;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for fone widget.
  FocusNode? foneFocusNode;
  TextEditingController? foneTextController;
  final foneMask = MaskTextInputFormatter(mask: '(##) # ####-####');
  String? Function(BuildContext, String?)? foneTextControllerValidator;
  // State field(s) for cepp widget.
  FocusNode? ceppFocusNode;
  TextEditingController? ceppTextController;
  final ceppMask = MaskTextInputFormatter(mask: '########');
  String? Function(BuildContext, String?)? ceppTextControllerValidator;
  // Stores action output result for [Backend Call - API (cep Codastro)] action in Button widget.
  ApiCallResponse? apiResultrry;
  // State field(s) for numero widget.
  FocusNode? numeroFocusNode;
  TextEditingController? numeroTextController;
  String? Function(BuildContext, String?)? numeroTextControllerValidator;
  // State field(s) for complemento widget.
  FocusNode? complementoFocusNode;
  TextEditingController? complementoTextController;
  String? Function(BuildContext, String?)? complementoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    foneFocusNode?.dispose();
    foneTextController?.dispose();

    ceppFocusNode?.dispose();
    ceppTextController?.dispose();

    numeroFocusNode?.dispose();
    numeroTextController?.dispose();

    complementoFocusNode?.dispose();
    complementoTextController?.dispose();
  }
}
