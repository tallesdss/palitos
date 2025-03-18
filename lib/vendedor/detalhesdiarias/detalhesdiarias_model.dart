import '/flutter_flow/flutter_flow_util.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbarra/navbarra_widget.dart';
import 'detalhesdiarias_widget.dart' show DetalhesdiariasWidget;
import 'package:flutter/material.dart';

class DetalhesdiariasModel extends FlutterFlowModel<DetalhesdiariasWidget> {
  ///  Local state fields for this page.

  DocumentReference? produto;

  double? comissoafinal;

  double? pagar;

  double? vendatotal;

  ///  State fields for stateful widgets in this page.

  // Model for navbarra component.
  late NavbarraModel navbarraModel;
  // Model for header component.
  late HeaderModel headerModel;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    navbarraModel = createModel(context, () => NavbarraModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    navbarraModel.dispose();
    headerModel.dispose();
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
