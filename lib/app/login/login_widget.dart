import 'dart:ui';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  static String routeName = 'Login';
  static String routePath = '/login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.create = false;
      safeSetState(() {});
    });

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(-0.349, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            // Full screen background image
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                      Colors.black.withOpacity(0.6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            
            // Login Card centering
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(maxWidth: 450.0),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Logo/Header section
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 20.0),
                              child: Container(
                                width: 120.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Image.asset(
                                    'assets/images/Sem_ttulo_(20).png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            
                            Text(
                              'Carteira Palito',
                              style: FlutterFlowTheme.of(context).displaySmall.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.0,
                              ),
                            ),
                            
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 32.0),
                              child: Text(
                                'Bem-vindo de volta!',
                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),

                            // Form Fields
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32.0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _model.emailAddressTextController,
                                    focusNode: _model.emailAddressFocusNode,
                                    autofillHints: [AutofillHints.email],
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).primary,
                                          width: 2.0,
                                        ),
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context).primaryBackground.withOpacity(0.5),
                                      prefixIcon: Icon(Icons.email_outlined, color: FlutterFlowTheme.of(context).primary),
                                    ),
                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: _model.passwordTextController,
                                    focusNode: _model.passwordFocusNode,
                                    obscureText: !_model.passwordVisibility,
                                    decoration: InputDecoration(
                                      labelText: 'Senha',
                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).primary,
                                          width: 2.0,
                                        ),
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context).primaryBackground.withOpacity(0.5),
                                      prefixIcon: Icon(Icons.lock_outline, color: FlutterFlowTheme.of(context).primary),
                                      suffixIcon: InkWell(
                                        onTap: () => safeSetState(() => _model.passwordVisibility = !_model.passwordVisibility),
                                        child: Icon(
                                          _model.passwordVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ),

                            // Actions
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                              child: Column(
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      final user = await authManager.signInWithEmail(
                                        context,
                                        _model.emailAddressTextController.text,
                                        _model.passwordTextController.text,
                                      );
                                      if (user == null) return;
                                      context.goNamedAuth(VerificacaoWidget.routeName, context.mounted);
                                    },
                                    text: 'Entrar',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 54.0,
                                      color: FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      elevation: 3.0,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      final user = await authManager.signInWithGoogle(context);
                                      if (user == null) return;
                                      context.goNamedAuth(VerificacaoWidget.routeName, context.mounted);
                                    },
                                    text: 'Continuar com Google',
                                    icon: FaIcon(
                                      FontAwesomeIcons.google,
                                      size: 18.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 54.0,
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            // Bottom Links
                            Padding(
                              padding: EdgeInsets.only(bottom: 40.0),
                              child: Column(
                                children: [
                                  TextButton(
                                    onPressed: () => context.pushNamed(RedefinirsenhadousuarioWidget.routeName),
                                    child: Text(
                                      'Esqueci minha senha',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context).primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Não tem uma conta? ',
                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                      ),
                                      TextButton(
                                        onPressed: () => context.pushNamed(CriarcontaWidget.routeName),
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: Size.zero,
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        child: Text(
                                          'Cadastre-se',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context).primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

