import '';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'quantidadefinal_model.dart';
export 'quantidadefinal_model.dart';

class QuantidadefinalWidget extends StatefulWidget {
  const QuantidadefinalWidget({
    super.key,
    required this.docukn,
    required this.data,
  });

  final HistoricoRecord? docukn;
  final DiariaStruct? data;

  @override
  State<QuantidadefinalWidget> createState() => _QuantidadefinalWidgetState();
}

class _QuantidadefinalWidgetState extends State<QuantidadefinalWidget> {
  late QuantidadefinalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuantidadefinalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.itemdata = DiariaStruct();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x91000000),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 25.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                color: Colors.transparent,
                child: Container(
                  width: 200.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(15.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: FlutterFlowCountController(
                    decrementIconBuilder: (enabled) => Icon(
                      Icons.remove_rounded,
                      color: enabled
                          ? FlutterFlowTheme.of(context).secondaryText
                          : FlutterFlowTheme.of(context).alternate,
                      size: 35.0,
                    ),
                    incrementIconBuilder: (enabled) => Icon(
                      Icons.add_rounded,
                      color: enabled
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).alternate,
                      size: 35.0,
                    ),
                    countBuilder: (count) => Text(
                      count.toString(),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'baloo2',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                    count: _model.countControllerValue ??= 1,
                    updateCount: (count) =>
                        safeSetState(() => _model.countControllerValue = count),
                    stepSize: 1,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 35.0),
            child: FFButtonWidget(
              onPressed: () async {
                if (!FFAppState().vendidos.contains(VendidosStruct(
                      produto: widget.data?.produto,
                    ))) {
                  FFAppState().addToVendidos(VendidosStruct(
                    comissaoFinal: ((widget.data!.quantidade -
                                (_model.countControllerValue!)) *
                            widget.data!.valor *
                            widget.data!.porcentdaComissao) /
                        100,
                    vendidosFinal: widget.data!.quantidade -
                        (_model.countControllerValue!),
                    produto: widget.data?.produto,
                    valor: widget.data?.valor,
                    nome: widget.data?.nome,
                    quantidadefinal: _model.countControllerValue,
                    porcentdaComissao: widget.data?.porcentdaComissao,
                  ));
                  safeSetState(() {});
                  Navigator.pop(context);
                }
              },
              text: 'Salvar',
              options: FFButtonOptions(
                width: 100.0,
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Roboto Mono',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        ].divide(SizedBox(height: 15.0)).around(SizedBox(height: 15.0)),
      ),
    );
  }
}
