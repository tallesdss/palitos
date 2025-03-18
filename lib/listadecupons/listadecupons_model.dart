import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarra/navbarra_widget.dart';
import 'listadecupons_widget.dart' show ListadecuponsWidget;
import 'package:flutter/material.dart';

class ListadecuponsModel extends FlutterFlowModel<ListadecuponsWidget> {
  ///  Local state fields for this page.

  DocumentReference? cupom;

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
