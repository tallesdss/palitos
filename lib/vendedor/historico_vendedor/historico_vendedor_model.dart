import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'historico_vendedor_widget.dart' show HistoricoVendedorWidget;
import 'package:flutter/material.dart';

class HistoricoVendedorModel extends FlutterFlowModel<HistoricoVendedorWidget> {
  ///  Local state fields for this page.

  int? numeor;

  ///  State fields for stateful widgets in this page.

  // State field(s) for pesquisa widget.
  FocusNode? pesquisaFocusNode;
  TextEditingController? pesquisaTextController;
  String? Function(BuildContext, String?)? pesquisaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    pesquisaFocusNode?.dispose();
    pesquisaTextController?.dispose();
  }
}
