import '/flutter_flow/flutter_flow_util.dart';
import '/pages/header/header_widget.dart';
import '/pages/navbarra/navbarra_widget.dart';
import 'gestaodiaria_widget.dart' show GestaodiariaWidget;
import 'package:flutter/material.dart';

class GestaodiariaModel extends FlutterFlowModel<GestaodiariaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navbarra component.
  late NavbarraModel navbarraModel;
  // Model for header component.
  late HeaderModel headerModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
  }
}
