import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarra/navbarra_widget.dart';
import 'vendedoreslista_widget.dart' show VendedoreslistaWidget;
import 'package:flutter/material.dart';

class VendedoreslistaModel extends FlutterFlowModel<VendedoreslistaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navbarra component.
  late NavbarraModel navbarraModel;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    navbarraModel = createModel(context, () => NavbarraModel());
  }

  @override
  void dispose() {
    navbarraModel.dispose();
  }
}
