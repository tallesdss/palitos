import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quantidadefinal_widget.dart' show QuantidadefinalWidget;
import 'package:flutter/material.dart';

class QuantidadefinalModel extends FlutterFlowModel<QuantidadefinalWidget> {
  ///  Local state fields for this component.

  DiariaStruct? itemdata;
  void updateItemdataStruct(Function(DiariaStruct) updateFn) {
    updateFn(itemdata ??= DiariaStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for CountController widget.
  int? countControllerValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
