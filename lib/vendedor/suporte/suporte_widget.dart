import '/backend/backend.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class SuporteWidget extends StatefulWidget {
  const SuporteWidget({super.key});

  static const String routeName = 'Suporte';
  static const String routePath = '/suporte';

  @override
  State<SuporteWidget> createState() => _SuporteWidgetState();
}

class _SuporteWidgetState extends State<SuporteWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).primaryBackground,
                FlutterFlowTheme.of(context).secondaryBackground,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              // Decorative background elements
              Positioned(
                top: -60,
                right: -60,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: FlutterFlowTheme.of(context).primary.withValues(alpha: 0.12),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                left: -80,
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: FlutterFlowTheme.of(context).secondary.withValues(alpha: 0.1),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Glass Header
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Container(
                        width: double.infinity,
                        height: 110,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground.withValues(alpha: 0.4),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white.withValues(alpha: 0.1),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 45, 20, 0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => context.safePop(),
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Icon(
                                    Icons.chevron_left_rounded,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    size: 28,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                'Suporte',
                                style: GoogleFonts.syne(
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Como podemos ajudar?',
                              style: GoogleFonts.syne(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Relate problemas operacionais, dÃºvidas ou sugestÃµes diretamente para a equipe central.',
                              style: GoogleFonts.dmSans(
                                color: FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: 32),
                            
                            // Input Container
                            Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  width: 1,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: TextField(
                                      controller: _textController,
                                      maxLines: null,
                                      expands: true,
                                      style: GoogleFonts.dmSans(
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        fontSize: 16,
                                      ),
                                      textAlignVertical: TextAlignVertical.top,
                                      decoration: InputDecoration(
                                        hintText: 'Descreva aqui o que aconteceu...',
                                        hintStyle: GoogleFonts.dmSans(
                                          color: FlutterFlowTheme.of(context).secondaryText.withValues(alpha: 0.5),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            
                            SizedBox(height: 32),
                            
                            // Send Button
                            Container(
                              width: double.infinity,
                              height: 58,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).primary,
                                    FlutterFlowTheme.of(context).secondary,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: FlutterFlowTheme.of(context).primary.withValues(alpha: 0.3),
                                    blurRadius: 12,
                                    offset: Offset(0, 6),
                                  )
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () async {
                                    if (_textController.text.trim().isEmpty) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Por favor, descreva o problema.'),
                                          backgroundColor: Colors.redAccent,
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                      return;
                                    }
                                    
                                    await ReportarRecord.collection.add(createReportarRecordData(
                                      user: currentUserReference,
                                      texto: _textController.text,
                                      data: getCurrentTimestamp,
                                    ));

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Sua mensagem foi enviada. Obrigado!'),
                                        backgroundColor: FlutterFlowTheme.of(context).primary,
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                    context.safePop();
                                  },
                                  borderRadius: BorderRadius.circular(18),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.send_rounded, color: Colors.white, size: 20),
                                        SizedBox(width: 12),
                                        Text(
                                          'Enviar Mensagem',
                                          style: GoogleFonts.dmSans(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            
                            SizedBox(height: 24),
                            Center(
                              child: Text(
                                'Retorno em atÃ© 24h Ãºteis',
                                style: GoogleFonts.dmSans(
                                  color: FlutterFlowTheme.of(context).secondaryText.withValues(alpha: 0.5),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

