import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarra/navbarra_widget.dart';
import 'criarcupons_widget.dart' show CriarcuponsWidget;
import 'package:flutter/material.dart';

class CriarcuponsModel extends FlutterFlowModel<CriarcuponsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navbarra component.
  late NavbarraModel navbarraModel;

  @override
  void initState(BuildContext context) {
    navbarraModel = createModel(context, () => NavbarraModel());
  }

  @override
  void dispose() {
    navbarraModel.dispose();
  }
}
