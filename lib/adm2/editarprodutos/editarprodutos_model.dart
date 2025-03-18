import '/flutter_flow/flutter_flow_util.dart';
import 'editarprodutos_widget.dart' show EditarprodutosWidget;
import 'package:flutter/material.dart';

class EditarprodutosModel extends FlutterFlowModel<EditarprodutosWidget> {
  ///  Local state fields for this page.

  String? nomeCat;

  DocumentReference? refeCat;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for preco widget.
  FocusNode? precoFocusNode;
  TextEditingController? precoTextController;
  String? Function(BuildContext, String?)? precoTextControllerValidator;
  // State field(s) for tipo widget.
  FocusNode? tipoFocusNode;
  TextEditingController? tipoTextController;
  String? Function(BuildContext, String?)? tipoTextControllerValidator;
  // State field(s) for descircao widget.
  FocusNode? descircaoFocusNode;
  TextEditingController? descircaoTextController;
  String? Function(BuildContext, String?)? descircaoTextControllerValidator;
  // State field(s) for comissao widget.
  FocusNode? comissaoFocusNode;
  TextEditingController? comissaoTextController;
  String? Function(BuildContext, String?)? comissaoTextControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    precoFocusNode?.dispose();
    precoTextController?.dispose();

    tipoFocusNode?.dispose();
    tipoTextController?.dispose();

    descircaoFocusNode?.dispose();
    descircaoTextController?.dispose();

    comissaoFocusNode?.dispose();
    comissaoTextController?.dispose();
  }
}
