import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'vendedoresadm_widget.dart' show VendedoresadmWidget;
import 'package:flutter/material.dart';

class VendedoresadmModel extends FlutterFlowModel<VendedoresadmWidget> {
  ///  Local state fields for this page.

  DocumentReference? filtrouser;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
