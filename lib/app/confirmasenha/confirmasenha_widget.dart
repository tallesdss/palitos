import 'dart:ui';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'confirmasenha_model.dart';
export 'confirmasenha_model.dart';

class ConfirmasenhaWidget extends StatefulWidget {
  const ConfirmasenhaWidget({
    super.key,
    required this.user,
  });

  final DocumentReference? user;

  static String routeName = 'confirmasenha';
  static String routePath = '/confirmasenha';

  @override
  State<ConfirmasenhaWidget> createState() => _ConfirmasenhaWidgetState();
}

class _ConfirmasenhaWidgetState extends State<ConfirmasenhaWidget> {
  late ConfirmasenhaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmasenhaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!_model.minhas.contains(currentUserReference)) {
        _model.addToMinhas(currentUserReference!);
        safeSetState(() {});
      }
    });

    _model.senhaTextController ??= TextEditingController();
    _model.senhaFocusNode ??= FocusNode();

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
        backgroundColor: Color(0xFF0A0B10), // --bg-base
        body: Stack(
          children: [
            // Subtle accent glow in background
            Positioned(
              top: -150,
              left: -150,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x0D6B5FEF),
                  捧: [
                    BoxShadow(
                      blurRadius: 100,
                      color: Color(0x0D6B5FEF),
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
                  // Glassmorphic Header
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0x990A0B10),
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0x33FFFFFF),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 44.0,
                                icon: Icon(
                                  Icons.chevron_left_rounded,
                                  color: Colors.white,
                                  size: 28.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Confirmação',
                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                      fontFamily: 'Syne',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: true,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<UserRecord>(
                      stream: UserRecord.getDocument(widget.user!),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator(color: Color(0xFF6B5FEF)));
                        }
                        final containerUserRecord = snapshot.data!;

                        return SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(height: 48),
                                // Verification Icon
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Color(0x336B5FEF),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Color(0x666B5FEF), width: 2),
                                  ),
                                  child: Icon(Icons.shield_rounded, color: Color(0xFF6B5FEF), size: 40),
                                ),
                                SizedBox(height: 32),
                                Text(
                                  'Verificação de Segurança',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                                        fontFamily: 'Syne',
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: true,
                                      ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Confirme sua senha de 4 dígitos para autorizar o pagamento para \n${containerUserRecord.displayName}.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'DM Sans',
                                        color: Colors.white60,
                                        fontSize: 16,
                                        useGoogleFonts: true,
                                      ),
                                ),
                                SizedBox(height: 48),
                                // Password Input
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1A1D28),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Color(0x33FFFFFF)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    child: TextFormField(
                                      controller: _model.senhaTextController,
                                      focusNode: _model.senhaFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.senhaTextController',
                                        Duration(milliseconds: 200),
                                        () async {
                                          _model.senha = int.tryParse(_model.senhaTextController.text);
                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: true,
                                      obscureText: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        letterSpacing: 24,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Syne',
                                      ),
                                      decoration: InputDecoration(
                                        hintText: '••••',
                                        hintStyle: TextStyle(
                                          color: Colors.white24,
                                          fontSize: 32,
                                          letterSpacing: 24,
                                        ),
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [_model.senhaMask],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 60),
                                // Payment Button
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (valueOrDefault(currentUserDocument?.saldo, 0.0) >= FFAppState().valor) {
                                      if (containerUserRecord.senha == _model.senha) {
                                        _model.addToMinhas(containerUserRecord.reference);
                                        safeSetState(() {});

                                        await containerUserRecord.reference.update(createUserRecordData(
                                          saldo: containerUserRecord.saldo + FFAppState().valor,
                                        ));

                                        await TransacoesRecord.collection.doc().set({
                                          ...createTransacoesRecordData(
                                            data: getCurrentTimestamp,
                                            valor: FFAppState().valor,
                                            pagador: currentUserReference,
                                            recebedor: containerUserRecord.reference,
                                            nomedopagador: containerUserRecord.displayName,
                                            nomedorecebedor: currentUserDisplayName,
                                          ),
                                          ...mapToFirestore({
                                            'produtos': FFAppState().produto,
                                            'minhas': _model.minhas,
                                          }),
                                        });

                                        await currentUserReference!.update(createUserRecordData(
                                          saldo: valueOrDefault(currentUserDocument?.saldo, 0.0) - FFAppState().valor,
                                        ));
                                        FFAppState().ultimatransacao = FFAppState().valor;
                                        FFAppState().produto = [];
                                        FFAppState().valor = 0.0;
                                        safeSetState(() {});

                                        context.goNamed(PagamentoconcliWidget.routeName);
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Senha incorreta!'),
                                            backgroundColor: Colors.redAccent,
                                          ),
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Saldo Insuficiente!'),
                                          backgroundColor: Colors.redAccent,
                                        ),
                                      );
                                    }
                                  },
                                  text: 'CONFIRMAR PAGAMENTO',
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
                                SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.lock_outline_rounded, color: Colors.white24, size: 14),
                                    SizedBox(width: 6),
                                    Text(
                                      'Transação criptografada de ponta a ponta',
                                      style: TextStyle(color: Colors.white24, fontSize: 12, fontFamily: 'DM Sans'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
          },
        ),
      ),
    );
  }
}
