import '/flutter_flow/flutter_flow_util.dart';
import '/pages/side_nav12/side_nav12_widget.dart';
import '/index.dart';
import 'pagarproduto_widget.dart' show PagarprodutoWidget;
import 'package:flutter/material.dart';

class PagarprodutoModel extends FlutterFlowModel<PagarprodutoWidget> {
  ///  Local state fields for this page.

  bool popup = false;

  ///  State fields for stateful widgets in this page.

  // Model for SideNav12 component.
  late SideNav12Model sideNav12Model;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  var qrcode = '';

  @override
  void initState(BuildContext context) {
    sideNav12Model = createModel(context, () => SideNav12Model());
  }

  @override
  void dispose() {
    sideNav12Model.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
