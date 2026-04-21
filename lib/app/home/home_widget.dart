import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/datas_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/notifications/notifications_widget.dart';
import '/pages/scanearqrcode/scanearqrcode_widget.dart';
import '/pages/side_nav12/side_nav12_widget.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              wrapWithModel(
                model: _model.sideNav12Model,
                updateCallback: () => safeSetState(() {}),
                child: SideNav12Widget(),
              ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    height: 240.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [],
                                          ),
                                        ),
                                         Row(
                                           mainAxisSize: MainAxisSize.max,
                                           mainAxisAlignment:
                                               MainAxisAlignment.start,
                                           children: [
                                             Padding(
                                               padding: EdgeInsetsDirectional
                                                   .fromSTEB(
                                                       20.0, 0.0, 0.0, 0.0),
                                               child: AuthUserStreamWidget(
                                                 builder: (context) => InkWell(
                                                   splashColor:
                                                       Colors.transparent,
                                                   focusColor:
                                                       Colors.transparent,
                                                   hoverColor:
                                                       Colors.transparent,
                                                   highlightColor:
                                                       Colors.transparent,
                                                   onTap: () async {
                                                     context.pushNamed(
                                                         PerfilWidget.routeName);
                                                   },
                                                   child: Container(
                                                     width: 60.0,
                                                     height: 60.0,
                                                     clipBehavior:
                                                         Clip.antiAlias,
                                                     decoration: BoxDecoration(
                                                       shape: BoxShape.circle,
                                                     ),
                                                     child: CachedNetworkImage(
                                                       fadeInDuration: Duration(
                                                           milliseconds: 500),
                                                       fadeOutDuration: Duration(
                                                           milliseconds: 500),
                                                       imageUrl:
                                                           currentUserPhoto,
                                                       fit: BoxFit.cover,
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                             ),
                                             Expanded(
                                               child: Padding(
                                                 padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                 child: Column(
                                                   mainAxisSize: MainAxisSize.max,
                                                   mainAxisAlignment: MainAxisAlignment.center,
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     Text(
                                                       'Olá!',
                                                       style: FlutterFlowTheme.of(context).labelSmall.override(
                                                             fontFamily: 'DM Sans',
                                                             color: Color(0xFF9896A8), // --text-secondary
                                                             fontSize: 12.0,
                                                             fontWeight: FontWeight.w400,
                                                             useGoogleFonts: true,
                                                           ),
                                                     ),
                                                     AuthUserStreamWidget(
                                                       builder: (context) => Text(
                                                         currentUserDisplayName,
                                                         style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                               fontFamily: 'Syne',
                                                               color: Color(0xFFF0EFFB), // --text-primary
                                                               fontSize: 18.0,
                                                               fontWeight: FontWeight.bold,
                                                               useGoogleFonts: true,
                                                             ),
                                                       ),
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                             ),
                                             Padding(
                                               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                               child: Container(
                                                 width: 44.0,
                                                 height: 44.0,
                                                 decoration: BoxDecoration(
                                                   color: Color(0xFF1A1D28), // --bg-card
                                                   borderRadius: BorderRadius.circular(12.0),
                                                   border: Border.all(
                                                     color: Color(0xFF222535), // --border-default
                                                     width: 1.0,
                                                   ),
                                                 ),
                                                 child: FlutterFlowIconButton(
                                                   borderColor: Colors.transparent,
                                                   borderRadius: 12.0,
                                                   borderWidth: 0.0,
                                                   buttonSize: 44.0,
                                                   fillColor: Colors.transparent,
                                                   icon: Icon(
                                                     Icons.notifications_outlined,
                                                     color: Color(0xFFF0EFFB), // --text-primary
                                                     size: 24.0,
                                                   ),
                                                   onPressed: () async {
                                                     await showModalBottomSheet(
                                                       isScrollControlled: true,
                                                       backgroundColor: Colors.transparent,
                                                       enableDrag: false,
                                                       context: context,
                                                       builder: (context) {
                                                         return GestureDetector(
                                                           onTap: () {
                                                             FocusScope.of(context).unfocus();
                                                             FocusManager.instance.primaryFocus?.unfocus();
                                                           },
                                                           child: Padding(
                                                             padding: MediaQuery.viewInsetsOf(context),
                                                             child: Container(
                                                               height: MediaQuery.sizeOf(context).height * 0.9,
                                                               child: NotificationsWidget(),
                                                             ),
                                                           ),
                                                         );
                                                       },
                                                     ).then((value) => safeSetState(() {}));
                                                   },
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFF1A1D28), // --bg-card
                                                    Color(0xFF222535), // --bg-elevated
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                borderRadius: BorderRadius.circular(20.0),
                                                border: Border.all(
                                                  color: Color(0xFF222535), // --border-default
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(24.0),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment: AlignmentDirectional(1.1, -1.1),
                                                      child: Container(
                                                        width: 120.0,
                                                        height: 120.0,
                                                        decoration: BoxDecoration(
                                                          color: Colors.transparent,
                                                          shape: BoxShape.circle,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color(0x306B5FEF),
                                                              blurRadius: 50.0,
                                                              spreadRadius: 10.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                              Text(
                                                                'Saldo Estimado',
                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                      fontFamily: 'DM Sans',
                                                                      color: Color(0xFF9896A8), // --text-secondary
                                                                      fontSize: 11.0,
                                                                      fontWeight: FontWeight.w400,
                                                                      useGoogleFonts: true,
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  if (FFAppState().olhos)
                                                                    AuthUserStreamWidget(
                                                                      builder: (context) => Text(
                                                                        'PW\$ ${formatNumber(
                                                                          valueOrDefault(currentUserDocument?.saldo, 0.0),
                                                                          formatType: FormatType.decimal,
                                                                          decimalType: DecimalType.commaDecimal,
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                              fontFamily: 'Syne',
                                                                              fontSize: 32.0,
                                                                              fontWeight: FontWeight.w800,
                                                                              letterSpacing: -0.02,
                                                                              useGoogleFonts: true,
                                                                            ),
                                                                      ),
                                                                    )
                                                                  else
                                                                    Text(
                                                                      'PW\$ ••••••',
                                                                      style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                            fontFamily: 'Syne',
                                                                            fontSize: 32.0,
                                                                            fontWeight: FontWeight.w800,
                                                                            letterSpacing: -0.02,
                                                                            useGoogleFonts: true,
                                                                          ),
                                                                    ),
                                                                  InkWell(
                                                                    splashColor: Colors.transparent,
                                                                    focusColor: Colors.transparent,
                                                                    hoverColor: Colors.transparent,
                                                                    highlightColor: Colors.transparent,
                                                                    onTap: () {
                                                                      setState(() => FFAppState().olhos = !FFAppState().olhos);
                                                                    },
                                                                    child: Icon(
                                                                      FFAppState().olhos ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                                      color: Color(0xFF9896A8), // --text-secondary
                                                                      size: 24.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                child: Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap: () async {
                                                                        context.pushNamed(MinhastransacoesWidget.routeName);
                                                                      },
                                                                      child: Container(
                                                                        height: 40.0,
                                                                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                                                                        decoration: BoxDecoration(
                                                                          color: Color(0xFF6B5FEF), // --accent-primary
                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Color(0x406B5FEF),
                                                                              blurRadius: 12.0,
                                                                              offset: Offset(0, 4),
                                                                            )
                                                                          ],
                                                                        ),
                                                                        alignment: Alignment.center,
                                                                        child: Text(
                                                                          'Transações',
                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                fontFamily: 'Syne',
                                                                                color: Colors.white,
                                                                                fontSize: 13.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                letterSpacing: 0.02,
                                                                                useGoogleFonts: true,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      onTap: () async {
                                                                        context.pushNamed(EnviarpalitopixWidget.routeName);
                                                                      },
                                                                      child: Container(
                                                                        height: 40.0,
                                                                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                                                                        decoration: BoxDecoration(
                                                                          color: Color(0xFF222535), // --bg-elevated
                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                          border: Border.all(
                                                                            color: Color(0xFF2A2E3F), // --border-default
                                                                            width: 1.0,
                                                                          ),
                                                                        ),
                                                                        alignment: Alignment.center,
                                                                        child: Text(
                                                                          'Transferir',
                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                fontFamily: 'Syne',
                                                                                color: Color(0xFFF0EFFB), // --text-primary
                                                                                fontSize: 13.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                letterSpacing: 0.02,
                                                                                useGoogleFonts: true,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(width: 12.0)),
                                                                ),
                                                              ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(width: 20.0),
                                    ...[
                                      _buildNavIcon(
                                        context,
                                        icon: Icons.favorite_rounded,
                                        label: 'Social',
                                        onTap: () => context.pushNamed(SocialWidget.routeName),
                                      ),
                                      _buildNavIcon(
                                        context,
                                        icon: Icons.store_rounded,
                                        label: 'Vendedor',
                                        onTap: () async {
                                          if (valueOrDefault<bool>(currentUserDocument?.vendedorAtivo, false)) {
                                            context.pushNamed(VendedorAdmWidget.routeName);
                                          } else {
                                            if (valueOrDefault<bool>(currentUserDocument?.candidato, false)) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) => AlertDialog(
                                                  backgroundColor: Color(0xFF12141C),
                                                  title: Text('Atenção!', style: TextStyle(color: Colors.white, fontFamily: 'Syne')),
                                                  content: Text('Seu cadastro ainda está em análise!', style: TextStyle(color: Color(0xFF9896A8), fontFamily: 'DM Sans')),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                      child: Text('Ok', style: TextStyle(color: Color(0xFF6B5FEF))),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              context.pushNamed(IniciovendedorWidget.routeName);
                                            }
                                          }
                                        },
                                      ),
                                      _buildNavIcon(
                                        context,
                                        icon: Icons.add_circle_outline_rounded,
                                        label: 'Depositar',
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) => DatasWidget(),
                                          ).then((value) => safeSetState(() {}));
                                        },
                                      ),
                                      _buildNavIcon(
                                        context,
                                        icon: Icons.qr_code_scanner_rounded,
                                        label: 'Scanear',
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) => Container(
                                              height: MediaQuery.sizeOf(context).height * 0.95,
                                              child: ScanearqrcodeWidget(),
                                            ),
                                          ).then((value) => safeSetState(() {}));
                                        },
                                      ),
                                      _buildNavIcon(
                                        context,
                                        icon: Icons.send_rounded,
                                        label: 'Enviar',
                                        onTap: () => context.pushNamed(EnviarpalitopixWidget.routeName),
                                      ),
                                      _buildNavIcon(
                                        context,
                                        icon: Icons.admin_panel_settings_rounded,
                                        label: 'Admin',
                                        onTap: () => context.pushNamed(DashboardWidget.routeName),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                    SizedBox(width: 20.0),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child:
                                          StreamBuilder<List<CategoriaRecord>>(
                                        stream: queryCategoriaRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<CategoriaRecord>
                                              choiceChipsCategoriaRecordList =
                                              snapshot.data!;

                                            return FlutterFlowChoiceChips(
                                              options:
                                                  choiceChipsCategoriaRecordList
                                                      .map((e) => e.nome)
                                                      .toList()
                                                      .map((label) =>
                                                          ChipData(label))
                                                      .toList(),
                                              onChanged: (val) => safeSetState(
                                                  () => _model.choiceChipsValue =
                                                      val?.firstOrNull),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0xFF6B5FEF), // --accent-primary
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Syne',
                                                      color: Colors.white,
                                                      fontSize: 12.0,
                                                      fontWeight: FontWeight.w600,
                                                      letterSpacing: 0.03,
                                                      useGoogleFonts: true,
                                                    ),
                                                iconColor: Colors.white,
                                                iconSize: 18.0,
                                                elevation: 8.0,
                                                borderRadius:
                                                    BorderRadius.circular(100.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0xFF1A1D28), // --bg-card
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Syne',
                                                      color: Color(0xFF9896A8), // --text-secondary
                                                      fontSize: 12.0,
                                                      fontWeight: FontWeight.w600,
                                                      letterSpacing: 0.03,
                                                      useGoogleFonts: true,
                                                    ),
                                                iconColor: Color(0xFF5C5A6A),
                                                iconSize: 18.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            12.0, 4.0, 12.0, 4.0),
                                                elevation: 0.0,
                                                borderColor:
                                                    Color(0xFF222535), // --border-default
                                                borderRadius:
                                                    BorderRadius.circular(100.0),
                                              ),
                                              chipSpacing: 12.0,
                                              rowSpacing: 12.0,
                                              multiselect: false,
                                              initialized:
                                                  _model.choiceChipsValue != null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .choiceChipsValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                ['Mega'],
                                              ),
                                              wrapped: false,
                                            );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (FFAppState().produto.isNotEmpty)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 72.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1A1D28), // --bg-card
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Color(0xFF6B5FEF), // --accent-primary
                                      width: 1.0,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x206B5FEF),
                                        blurRadius: 15.0,
                                        offset: Offset(0, 5),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'No Carrinho',
                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                    fontFamily: 'DM Sans',
                                                    color: Color(0xFF9896A8),
                                                    fontSize: 11.0,
                                                    useGoogleFonts: true,
                                                  ),
                                            ),
                                            Text(
                                              'PW\$ ${formatNumber(
                                                FFAppState().valor,
                                                formatType: FormatType.decimal,
                                                decimalType: DecimalType.commaDecimal,
                                              )}',
                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                    fontFamily: 'Syne',
                                                    color: Color(0xFFF0EFFB),
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: true,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () => context.pushNamed(PagarprodutoWidget.routeName),
                                          child: Container(
                                            height: 40.0,
                                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                                            decoration: BoxDecoration(
                                              color: Color(0xFF6B5FEF),
                                              borderRadius: BorderRadius.circular(100.0),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Pagar Agora',
                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                    fontFamily: 'Syne',
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: true,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: StreamBuilder<List<ProdutosRecord>>(
                                    stream: queryProdutosRecord(
                                      queryBuilder: (produtosRecord) =>
                                          produtosRecord.where(
                                        'categoria',
                                        isEqualTo: _model.choiceChipsValue,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ProdutosRecord>
                                          staggeredViewProdutosRecordList =
                                          snapshot.data!;

                                      return MasonryGridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                        ),
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        itemCount:
                                            staggeredViewProdutosRecordList
                                                .length,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (context, staggeredViewIndex) {
                                          final staggeredViewProdutosRecord =
                                              staggeredViewProdutosRecordList[
                                                  staggeredViewIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                DetalhessorveteWidget.routeName,
                                                queryParameters: {
                                                  'sorvete': serializeParam(
                                                    staggeredViewProdutosRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFF1A1D28),
                                                borderRadius: BorderRadius.circular(20.0),
                                                border: Border.all(
                                                  color: Color(0xFF222535),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    AspectRatio(
                                                      aspectRatio: 0.8,
                                                      child: Stack(
                                                        children: [
                                                          Image.network(
                                                            staggeredViewProdutosRecord.imagem,
                                                            width: double.infinity,
                                                            height: double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              gradient: LinearGradient(
                                                                colors: [Colors.transparent, Color(0xFF1A1D28)],
                                                                begin: Alignment.topCenter,
                                                                end: Alignment.bottomCenter,
                                                              ),
                                                            ),
                                                          ),
                                                          if (FFAppState().produto.contains(staggeredViewProdutosRecord.reference))
                                                            Positioned(
                                                              top: 12,
                                                              right: 12,
                                                              child: Icon(
                                                                Icons.check_circle,
                                                                color: Color(0xFF6B5FEF),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(12.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            staggeredViewProdutosRecord.nome,
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  fontFamily: 'Syne',
                                                                  color: Color(0xFFF0EFFB),
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize: 14.0,
                                                                  useGoogleFonts: true,
                                                                ),
                                                          ),
                                                          SizedBox(height: 4.0),
                                                          Text(
                                                            'PW\$ ${formatNumber(
                                                              staggeredViewProdutosRecord.preco,
                                                              formatType: FormatType.decimal,
                                                              decimalType: DecimalType.commaDecimal,
                                                            )}',
                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                  fontFamily: 'DM Sans',
                                                                  color: Color(0xFF6B5FEF),
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 13.0,
                                                                  useGoogleFonts: true,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
  }

  Widget _buildNavIcon(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52.0,
            height: 52.0,
            decoration: BoxDecoration(
              color: Color(0xFF1A1D28), // --bg-card
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: Color(0xFF222535), // --border-subtle/default
                width: 1.0,
              ),
            ),
            child: Icon(icon, color: Color(0xFF6B5FEF), size: 24.0),
          ),
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'DM Sans',
              color: Color(0xFF9896A8), // --text-secondary
              fontSize: 11.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
