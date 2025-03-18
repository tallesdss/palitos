import '/flutter_flow/flutter_flow_util.dart';
import 'confirmassenhas_widget.dart' show ConfirmassenhasWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ConfirmassenhasModel extends FlutterFlowModel<ConfirmassenhasWidget> {
  ///  Local state fields for this component.

  int? senha;

  ///  State fields for stateful widgets in this component.

  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  final senhaMask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)? senhaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    senhaFocusNode?.dispose();
    senhaTextController?.dispose();
  }
}
