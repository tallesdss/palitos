import '/flutter_flow/flutter_flow_util.dart';
import 'comentarios_widget.dart' show ComentariosWidget;
import 'package:flutter/material.dart';

class ComentariosModel extends FlutterFlowModel<ComentariosWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for postarcomentariops widget.
  FocusNode? postarcomentariopsFocusNode;
  TextEditingController? postarcomentariopsTextController;
  String? Function(BuildContext, String?)?
      postarcomentariopsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    postarcomentariopsFocusNode?.dispose();
    postarcomentariopsTextController?.dispose();
  }
}
