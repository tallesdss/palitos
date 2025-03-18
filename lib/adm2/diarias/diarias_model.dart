import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarra/navbarra_widget.dart';
import '/index.dart';
import 'diarias_widget.dart' show DiariasWidget;
import 'package:flutter/material.dart';

class DiariasModel extends FlutterFlowModel<DiariasWidget> {
  ///  Local state fields for this page.

  DateTime? data;

  ///  State fields for stateful widgets in this page.

  // Model for navbarra component.
  late NavbarraModel navbarraModel;
  // State field(s) for pesquisa widget.
  FocusNode? pesquisaFocusNode;
  TextEditingController? pesquisaTextController;
  String? Function(BuildContext, String?)? pesquisaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    navbarraModel = createModel(context, () => NavbarraModel());
  }

  @override
  void dispose() {
    navbarraModel.dispose();
    pesquisaFocusNode?.dispose();
    pesquisaTextController?.dispose();
  }
}
