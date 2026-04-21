import 'dart:ui';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pagamentoconcli_model.dart';
export 'pagamentoconcli_model.dart';

class PagamentoconcliWidget extends StatefulWidget {
  const PagamentoconcliWidget({super.key});

  static String routeName = 'pagamentoconcli';
  static String routePath = '/pagamentoconcli';

  @override
  State<PagamentoconcliWidget> createState() => _PagamentoconcliWidgetState();
}

class _PagamentoconcliWidgetState extends State<PagamentoconcliWidget> {
  late PagamentoconcliModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagamentoconcliModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0A0B10),
        body: Stack(
          children: [
            // Celebration Glow Background
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x1A00C853), // Success green glow
                  捧: [
                    BoxShadow(
                      blurRadius: 100,
                      color: Color(0x1A00C853),
                      spreadRadius: 50,
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 80),
                            // Large Success Checkmark
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0x1A00C853),
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0x6600C853), width: 4),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check_rounded,
                                  color: Color(0xFF00C853),
                                  size: 70,
                                ),
                              ),
                            ),
                            SizedBox(height: 32),
                            Text(
                              'Pagamento Realizado!',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).headlineMedium.override(
                                    fontFamily: 'Syne',
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: true,
                                  ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Sua transação foi processada com sucesso.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: Colors.white60,
                                    fontSize: 16,
                                    useGoogleFonts: true,
                                  ),
                            ),
                            SizedBox(height: 48),
                            // Transaction Summary Card
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFF1A1D28),
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: Color(0x33FFFFFF)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(24),
                                child: Column(
                                  children: [
                                    Text(
                                      'VALOR PAGO',
                                      style: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 12,
                                        letterSpacing: 2,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'PW\$ ${formatNumber(
                                        FFAppState().ultimatransacao,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                      )}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 36,
                                        fontFamily: 'Syne',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    Divider(color: Colors.white10),
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Data e Hora', style: TextStyle(color: Colors.white60, fontFamily: 'DM Sans')),
                                        Text(
                                          dateTimeFormat(
                                            "dd/MM/yyyy HH:mm",
                                            getCurrentTimestamp,
                                            locale: FFLocalizations.of(context).languageCode,
                                          ),
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'DM Sans'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 32),
                            // Share Button
                            InkWell(
                              onTap: () {
                                // Add share functionality if needed
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                decoration: BoxDecoration(
                                  color: Color(0x14FFFFFF),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.share_rounded, color: Colors.white, size: 18),
                                    SizedBox(width: 8),
                                    Text(
                                      'Compartilhar Comprovante',
                                      style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'DM Sans'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Bottom Button
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.goNamed(HomeWidget.routeName);
                      },
                      text: 'VOLTAR PARA O INÍCIO',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 56.0,
                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF6B5FEF),
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Syne',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: true,
                            ),
                        elevation: 8.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  }
}
