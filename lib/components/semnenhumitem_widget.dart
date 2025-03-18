import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'semnenhumitem_model.dart';
export 'semnenhumitem_model.dart';

class SemnenhumitemWidget extends StatefulWidget {
  const SemnenhumitemWidget({super.key});

  @override
  State<SemnenhumitemWidget> createState() => _SemnenhumitemWidgetState();
}

class _SemnenhumitemWidgetState extends State<SemnenhumitemWidget> {
  late SemnenhumitemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SemnenhumitemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.work_off_outlined,
                color: FlutterFlowTheme.of(context).primary,
                size: 35.0,
              ),
              Text(
                'Sem itens',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto Mono',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
