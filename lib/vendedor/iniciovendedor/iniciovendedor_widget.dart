import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'iniciovendedor_model.dart';
export 'iniciovendedor_model.dart';

class IniciovendedorWidget extends StatefulWidget {
  const IniciovendedorWidget({super.key});

  static String routeName = 'iniciovendedor';
  static String routePath = '/iniciovendedor';

  @override
  State<IniciovendedorWidget> createState() => _IniciovendedorWidgetState();
}

class _IniciovendedorWidgetState extends State<IniciovendedorWidget> {
  late IniciovendedorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IniciovendedorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _submitRegistration() async {
    if (_model.uploadedFileUrl1.isEmpty || _model.uploadedFileUrl2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Por favor, envie todas as fotos necessÃ¡rias antes de continuar.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
      return;
    }

    // Update User Record
    await currentUserReference!.update(createUserRecordData(
      candidato: true,
      fotocandidato: _model.uploadedFileUrl2,
      documentocandidato: _model.uploadedFileUrl1,
    ));

    // Navigate to Success Page
    _model.pageViewController?.animateToPage(
      3,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
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
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                'https://images.unsplash.com/photo-1557683316-973673baf926?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
              ).image,
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 0.6),
                BlendMode.darken,
              ),
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => context.safePop(),
                        child: Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: Color(0x33FFFFFF),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Text(
                        'Seja um Vendedor',
                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                              fontFamily: 'baloo2',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                      SizedBox(width: 44.0),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    children: [
                      // Step 1: Welcome
                      _buildStep(
                        index: 0,
                        title: 'Bem-vindo ao Time!',
                        subtitle:
                            'Transforme sua rotina em lucro vendendo os melhores picolÃ©s da regiÃ£o.',
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Color(0x22FFFFFF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.icecream_outlined,
                                color: Colors.white,
                                size: 100,
                              ).animate().shake(hz: 2, duration: 1000.ms),
                            ),
                            SizedBox(height: 32),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Vamos configurar seu perfil profissional em apenas alguns passos.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Colors.white70,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        onNext: () => _model.pageViewController?.nextPage(
                            duration: Duration(milliseconds: 300), curve: Curves.easeInOut),
                        nextLabel: 'ComeÃ§ar Agora',
                      ),

                      // Step 2: ID Upload
                      _buildStep(
                        index: 1,
                        title: 'IdentificaÃ§Ã£o',
                        subtitle: 'Precisamos de uma foto nÃ­tida do seu documento (CNH ou RG).',
                        content: _buildUploadCard(
                          label: 'Documento de Identidade',
                          icon: Icons.badge_outlined,
                          imageUrl: _model.uploadedFileUrl1,
                          isUploading: _model.isDataUploading1,
                          onTap: () async {
                            final selectedMedia = await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) =>
                                    validateFileFormat(m.storagePath, context))) {
                              safeSetState(() => _model.isDataUploading1 = true);
                              try {
                                final downloadUrl = await uploadData(
                                    selectedMedia.first.storagePath,
                                    selectedMedia.first.bytes);
                                if (downloadUrl != null) {
                                  safeSetState(() {
                                    _model.uploadedFileUrl1 = downloadUrl;
                                    _model.foto = downloadUrl;
                                  });
                                }
                              } finally {
                                safeSetState(() => _model.isDataUploading1 = false);
                              }
                            }
                          },
                        ),
                        onNext: () {
                          if (_model.uploadedFileUrl1.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Por favor, envie a foto do documento.')),
                            );
                            return;
                          }
                          _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                        },
                        nextLabel: 'PrÃ³ximo Passo',
                      ),

                      // Step 3: Selfie Upload
                      _buildStep(
                        index: 2,
                        title: 'Foto de Perfil',
                        subtitle: 'Uma selfie bem iluminada ajuda na aprovaÃ§Ã£o rÃ¡pida do seu cadastro.',
                        content: _buildUploadCard(
                          label: 'Tire uma Selfie',
                          icon: Icons.camera_alt_outlined,
                          imageUrl: _model.uploadedFileUrl2,
                          isUploading: _model.isDataUploading2,
                          onTap: () async {
                            final selectedMedia = await selectMedia(
                              multiImage: false,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) =>
                                    validateFileFormat(m.storagePath, context))) {
                              safeSetState(() => _model.isDataUploading2 = true);
                              try {
                                final downloadUrl = await uploadData(
                                    selectedMedia.first.storagePath,
                                    selectedMedia.first.bytes);
                                if (downloadUrl != null) {
                                  safeSetState(() {
                                    _model.uploadedFileUrl2 = downloadUrl;
                                    _model.fotodovendedor = downloadUrl;
                                  });
                                }
                              } finally {
                                safeSetState(() => _model.isDataUploading2 = false);
                              }
                            }
                          },
                        ),
                        onNext: _submitRegistration,
                        nextLabel: 'Finalizar Cadastro',
                      ),

                      // Step 4: Success / Under Review
                      _buildSuccessStep(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: smooth_page_indicator.SmoothPageIndicator(
                    controller: _model.pageViewController!,
                    count: 4,
                    effect: smooth_page_indicator.ExpandingDotsEffect(
                      expansionFactor: 3.0,
                      spacing: 8.0,
                      radius: 12.0,
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      dotColor: Color(0x44FFFFFF),
                      activeDotColor: Colors.white,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStep({
    required int index,
    required String title,
    required String subtitle,
    required Widget content,
    required VoidCallback onNext,
    required String nextLabel,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'baloo2',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          ).animate().fadeIn(duration: 400.ms).moveY(begin: 10, end: 0),
          SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto Mono',
                  color: Colors.white70,
                  fontSize: 14,
                ),
          ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
          Expanded(child: Center(child: content)),
          FFButtonWidget(
            onPressed: onNext,
            text: nextLabel,
            options: FFButtonOptions(
              width: double.infinity,
              height: 56,
              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Roboto Mono',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
              elevation: 4,
              borderSide: BorderSide(color: Colors.transparent, width: 1),
              borderRadius: BorderRadius.circular(28),
            ),
          ).animate().fadeIn(delay: 400.ms).scale(begin: Offset(0.9, 0.9), end: Offset(1.0, 1.0)),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildUploadCard({
    required String label,
    required IconData icon,
    required String imageUrl,
    required bool isUploading,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: isUploading ? null : onTap,
      child: Container(
        width: 250,
        height: 320,
        decoration: BoxDecoration(
          color: Color(0x22FFFFFF),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Color(0x44FFFFFF), width: 2),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (imageUrl.isEmpty && !isUploading)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.white54, size: 60),
                  SizedBox(height: 16),
                  Text(
                    label,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Toque para selecionar',
                    style: TextStyle(color: Colors.white38, fontSize: 11),
                  ),
                ],
              ),
            if (isUploading)
              CircularProgressIndicator(color: Colors.white),
            if (imageUrl.isNotEmpty && !isUploading)
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            if (imageUrl.isNotEmpty && !isUploading)
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                  child: Icon(Icons.check, color: Colors.white, size: 20),
                ),
              ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 500.ms).scale(begin: Offset(0.95, 0.95), end: Offset(1.0, 1.0));
  }

  Widget _buildSuccessStep() {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Color(0xFF4CAF50).withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF4CAF50),
              size: 80,
            ),
          ).animate().scale(duration: 600.ms, curve: Curves.elasticOut),
          SizedBox(height: 32),
          Text(
            'SolicitaÃ§Ã£o Enviada!',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'baloo2',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          ),
          SizedBox(height: 16),
          Text(
            'Seu cadastro estÃ¡ sob anÃ¡lise. Em breve vocÃª receberÃ¡ uma notificaÃ§Ã£o sobre o status da sua conta.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Roboto Mono',
                  color: Colors.white70,
                  fontSize: 16,
                ),
          ),
          SizedBox(height: 48),
          FFButtonWidget(
            onPressed: () => context.safePop(),
            text: 'Voltar para o InÃ­cio',
            options: FFButtonOptions(
              width: 220,
              height: 50,
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              color: Color(0x33FFFFFF),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Roboto Mono',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
              elevation: 0,
              borderSide: BorderSide(color: Colors.white24, width: 2),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ],
      ),
    );
  }
}

