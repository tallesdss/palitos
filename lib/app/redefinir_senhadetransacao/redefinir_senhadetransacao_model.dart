import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'redefinir_senhadetransacao_widget.dart'
    show RedefinirSenhadetransacaoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RedefinirSenhadetransacaoModel
    extends FlutterFlowModel<RedefinirSenhadetransacaoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  final emailAddressMask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
