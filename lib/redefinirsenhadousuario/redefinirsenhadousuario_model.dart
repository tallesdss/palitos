import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'redefinirsenhadousuario_widget.dart' show RedefinirsenhadousuarioWidget;
import 'package:flutter/material.dart';

class RedefinirsenhadousuarioModel
    extends FlutterFlowModel<RedefinirsenhadousuarioWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
