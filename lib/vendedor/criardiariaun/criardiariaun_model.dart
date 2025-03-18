import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarra/navbarra_widget.dart';
import 'criardiariaun_widget.dart' show CriardiariaunWidget;
import 'package:flutter/material.dart';

class CriardiariaunModel extends FlutterFlowModel<CriardiariaunWidget> {
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
