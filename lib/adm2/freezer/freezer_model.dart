import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarra/navbarra_widget.dart';
import '/index.dart';
import 'freezer_widget.dart' show FreezerWidget;
import 'package:flutter/material.dart';

class FreezerModel extends FlutterFlowModel<FreezerWidget> {
  ///  Local state fields for this page.

  DocumentReference? refe;

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
