import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarra/navbarra_widget.dart';
import 'transacoes_widget.dart' show TransacoesWidget;
import 'package:flutter/material.dart';

class TransacoesModel extends FlutterFlowModel<TransacoesWidget> {
  ///  Local state fields for this page.

  DocumentReference? listadereferencias;

  ///  State fields for stateful widgets in this page.

  // Model for navbarra component.
  late NavbarraModel navbarraModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    navbarraModel = createModel(context, () => NavbarraModel());
  }

  @override
  void dispose() {
    navbarraModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
