import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'semitens_model.dart';
export 'semitens_model.dart';

class SemitensWidget extends StatefulWidget {
  const SemitensWidget({super.key});

  @override
  State<SemitensWidget> createState() => _SemitensWidgetState();
}

class _SemitensWidgetState extends State<SemitensWidget> {
  late SemitensModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SemitensModel());

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
                Icons.production_quantity_limits_rounded,
                color: FlutterFlowTheme.of(context).primary,
                size: 35.0,
              ),
              Text(
                'Sem itens\nno carrinho',
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
