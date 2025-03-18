import '/flutter_flow/flutter_flow_util.dart';
import 'criarcupom_widget.dart' show CriarcupomWidget;
import 'package:flutter/material.dart';

class CriarcupomModel extends FlutterFlowModel<CriarcupomWidget> {
  ///  Local state fields for this component.

  String? fundo;

  String? iamgem;

  ///  State fields for stateful widgets in this component.

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for text widget.
  FocusNode? textFocusNode;
  TextEditingController? textTextController;
  String? Function(BuildContext, String?)? textTextControllerValidator;
  // State field(s) for CountController widget.
  int? countControllerValue;
  DateTime? datePicked;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    textFocusNode?.dispose();
    textTextController?.dispose();
  }
}
