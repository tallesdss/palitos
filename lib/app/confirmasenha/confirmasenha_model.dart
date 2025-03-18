import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'confirmasenha_widget.dart' show ConfirmasenhaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ConfirmasenhaModel extends FlutterFlowModel<ConfirmasenhaWidget> {
  ///  Local state fields for this page.

  int? senha;

  List<DocumentReference> minhas = [];
  void addToMinhas(DocumentReference item) => minhas.add(item);
  void removeFromMinhas(DocumentReference item) => minhas.remove(item);
  void removeAtIndexFromMinhas(int index) => minhas.removeAt(index);
  void insertAtIndexInMinhas(int index, DocumentReference item) =>
      minhas.insert(index, item);
  void updateMinhasAtIndex(int index, Function(DocumentReference) updateFn) =>
      minhas[index] = updateFn(minhas[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  final senhaMask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)? senhaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    senhaFocusNode?.dispose();
    senhaTextController?.dispose();
  }
}
