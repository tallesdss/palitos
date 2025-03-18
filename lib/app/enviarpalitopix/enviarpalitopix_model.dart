import '/flutter_flow/flutter_flow_util.dart';
import '/pages/side_nav12/side_nav12_widget.dart';
import 'enviarpalitopix_widget.dart' show EnviarpalitopixWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EnviarpalitopixModel extends FlutterFlowModel<EnviarpalitopixWidget> {
  ///  Local state fields for this page.

  bool popup = false;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav12 component.
  late SideNav12Model sideNav12Model;
  // State field(s) for vaslo widget.
  FocusNode? vasloFocusNode;
  TextEditingController? vasloTextController;
  final vasloMask = MaskTextInputFormatter(mask: '#######');
  String? Function(BuildContext, String?)? vasloTextControllerValidator;
  // State field(s) for digitarnome widget.
  FocusNode? digitarnomeFocusNode;
  TextEditingController? digitarnomeTextController;
  String? Function(BuildContext, String?)? digitarnomeTextControllerValidator;
  var scann = '';

  @override
  void initState(BuildContext context) {
    sideNav12Model = createModel(context, () => SideNav12Model());
  }

  @override
  void dispose() {
    sideNav12Model.dispose();
    vasloFocusNode?.dispose();
    vasloTextController?.dispose();

    digitarnomeFocusNode?.dispose();
    digitarnomeTextController?.dispose();
  }
}
