import '/flutter_flow/flutter_flow_util.dart';
import 'reporte_widget.dart' show ReporteWidget;
import 'package:flutter/material.dart';

class ReporteModel extends FlutterFlowModel<ReporteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for report widget.
  FocusNode? reportFocusNode;
  TextEditingController? reportTextController;
  String? Function(BuildContext, String?)? reportTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    reportFocusNode?.dispose();
    reportTextController?.dispose();
  }
}
