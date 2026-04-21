import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/confirmassenhas/confirmassenhas_widget.dart';
import '/pages/side_nav12/side_nav12_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'enviarpalitopix_model.dart';
export 'enviarpalitopix_model.dart';

class EnviarpalitopixWidget extends StatefulWidget {
  const EnviarpalitopixWidget({super.key});

  static String routeName = 'enviarpalitopix';
  static String routePath = '/enviarpalitopix';

  @override
  State<EnviarpalitopixWidget> createState() => _EnviarpalitopixWidgetState();
}

class _EnviarpalitopixWidgetState extends State<EnviarpalitopixWidget> {
  late EnviarpalitopixModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnviarpalitopixModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.digitarnomeTextController?.text =
            _model.digitarnomeTextController.text;
      });
    });

    _model.vasloTextController ??= TextEditingController();
    _model.vasloFocusNode ??= FocusNode();

    _model.digitarnomeTextController ??= TextEditingController();
    _model.digitarnomeFocusNode ??= FocusNode();

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
        body: Row(
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
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // Glassmorphism Header
                                ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                      width: double.infinity,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: Color(0xCC0A0B10),
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0x0DFFFFFF),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Color(0x1AFFFFFF),
                                              borderRadius: 16.0,
                                              borderWidth: 1.0,
                                              buttonSize: 45.0,
                                              fillColor: Color(0x0DFFFFFF),
                                              icon: Icon(
                                                Icons.arrow_back_rounded,
                                                color: Colors.white,
                                                size: 22.0,
                                              ),
                                              onPressed: () async {
                                                context.safePop();
                                              },
                                            ),
                                            SizedBox(width: 16),
                                            Text(
                                              'Enviar Palitos',
                                              style: GoogleFonts.syne(
                                                color: Colors.white,
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: -0.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Wallet Balance Details
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Color(0xFF1A1D28), Color(0xFF12141C)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0x0DFFFFFF),
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 10,
                                          offset: Offset(0, 4),
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Seu Saldo Atual',
                                                style: GoogleFonts.dmSans(
                                                  color: Color(0xFF9896A8),
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              if (FFAppState().olhos == true)
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    'PW\$ ${formatNumber(
                                                      valueOrDefault(currentUserDocument?.saldo, 0.0),
                                                      formatType: FormatType.decimal,
                                                      decimalType: DecimalType.commaDecimal,
                                                    )}',
                                                    style: GoogleFonts.syne(
                                                      color: Colors.white,
                                                      fontSize: 28.0,
                                                      fontWeight: FontWeight.w800,
                                                      letterSpacing: -1,
                                                    ),
                                                  ),
                                                ),
                                              if (FFAppState().olhos == false)
                                                Text(
                                                  'PW\$ ••••••',
                                                  style: GoogleFonts.syne(
                                                    color: Colors.white,
                                                    fontSize: 28.0,
                                                    fontWeight: FontWeight.w800,
                                                    letterSpacing: -1,
                                                  ),
                                                ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () => safeSetState(() => FFAppState().olhos = !FFAppState().olhos),
                                            child: Container(
                                              width: 48,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                color: Color(0x0DFFFFFF),
                                                borderRadius: BorderRadius.circular(16),
                                              ),
                                              child: Icon(
                                                FFAppState().olhos ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                color: Color(0xFF9896A8),
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // Amount Input Section
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Quanto deseja enviar?',
                                        style: GoogleFonts.syne(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF12141C),
                                          borderRadius: BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: Color(0x1AFFFFFF),
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF6B5FEF).withOpacity(0.12),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.monetization_on_outlined,
                                                  color: Color(0xFF6B5FEF),
                                                  size: 20,
                                                ),
                                              ),
                                              SizedBox(width: 12),
                                              Expanded(
                                                child: TextFormField(
                                                  controller: _model.vasloTextController,
                                                  focusNode: _model.vasloFocusNode,
                                                  onChanged: (_) => EasyDebounce.debounce(
                                                    '_model.vasloTextController',
                                                    Duration(milliseconds: 500),
                                                    () => safeSetState(() {}),
                                                  ),
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: '0,00',
                                                    hintStyle: GoogleFonts.dmSans(
                                                      color: Color(0xFF5C5A6A),
                                                      fontSize: 24.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    enabledBorder: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    errorBorder: InputBorder.none,
                                                    focusedErrorBorder: InputBorder.none,
                                                  ),
                                                  style: GoogleFonts.syne(
                                                    color: Colors.white,
                                                    fontSize: 32.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                  keyboardType: TextInputType.number,
                                                  validator: _model.vasloTextControllerValidator.asValidator(context),
                                                  inputFormatters: [_model.vasloMask],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
                                  child: Container(
                                    height: 1,
                                    color: Color(0x0DFFFFFF),
                                  ),
                                ),
                                // Search and QR Section
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 56.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF12141C),
                                            borderRadius: BorderRadius.circular(16.0),
                                            border: Border.all(
                                              color: Color(0x1AFFFFFF),
                                              width: 1,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.search_rounded, color: Color(0xFF9896A8), size: 20),
                                                SizedBox(width: 12),
                                                Expanded(
                                                  child: TextFormField(
                                                    controller: _model.digitarnomeTextController,
                                                    focusNode: _model.digitarnomeFocusNode,
                                                    onChanged: (_) => EasyDebounce.debounce(
                                                      '_model.digitarnomeTextController',
                                                      Duration(milliseconds: 50),
                                                      () => safeSetState(() {}),
                                                    ),
                                                    decoration: InputDecoration(
                                                      hintText: 'Pesquisar chave ou nome',
                                                      hintStyle: GoogleFonts.dmSans(
                                                        color: Color(0xFF5C5A6A),
                                                        fontSize: 14,
                                                      ),
                                                      enabledBorder: InputBorder.none,
                                                      focusedBorder: InputBorder.none,
                                                    ),
                                                    style: GoogleFonts.dmSans(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      InkWell(
                                        onTap: () async {
                                          _model.scann = await FlutterBarcodeScanner.scanBarcode(
                                            '#6B5FEF',
                                            'Cancelar',
                                            true,
                                            ScanMode.QR,
                                          );
                                          safeSetState(() {
                                            _model.digitarnomeTextController?.text = _model.scann;
                                          });
                                        },
                                        child: Container(
                                          width: 56,
                                          height: 56,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [Color(0xFF6B5FEF), Color(0xFF8B80F4)],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            borderRadius: BorderRadius.circular(16),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x406B5FEF),
                                                blurRadius: 12,
                                                offset: Offset(0, 4),
                                              )
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.qr_code_scanner_rounded,
                                            color: Colors.white,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                StreamBuilder<List<UserRecord>>(
                                  stream: queryUserRecord(),
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
                                    List<UserRecord> listViewUserRecordList =
                                        snapshot.data!;

                                      return ListView.separated(
                                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listViewUserRecordList.length,
                                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewUserRecord = listViewUserRecordList[listViewIndex];
                                          return Visibility(
                                            visible: functions.buscarreceitassd(
                                              listViewUserRecord.displayName,
                                              _model.digitarnomeTextController.text,
                                            ),
                                            child: InkWell(
                                              onTap: () async {
                                                // Existing logic
                                                FFAppState().valor = double.parse(_model.vasloTextController.text);
                                                safeSetState(() {});
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor: Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery.viewInsetsOf(context),
                                                      child: Container(
                                                        height: MediaQuery.sizeOf(context).height * 0.75,
                                                        child: ConfirmassenhasWidget(
                                                          userrecebed: listViewUserRecord,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => safeSetState(() {}));
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF12141C),
                                                  borderRadius: BorderRadius.circular(20.0),
                                                  border: Border.all(
                                                    color: Color(0x0DFFFFFF),
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 54,
                                                        height: 54,
                                                        decoration: BoxDecoration(
                                                          gradient: LinearGradient(
                                                            colors: [Color(0xFF6B5FEF), Color(0xFF8B80F4)],
                                                            begin: Alignment.topLeft,
                                                            end: Alignment.bottomRight,
                                                          ),
                                                          shape: BoxShape.circle,
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.all(2),
                                                          child: Container(
                                                            clipBehavior: Clip.antiAlias,
                                                            decoration: BoxDecoration(shape: BoxShape.circle),
                                                            child: listViewUserRecord.photoUrl != null && listViewUserRecord.photoUrl != ''
                                                                ? CachedNetworkImage(
                                                                    fadeInDuration: Duration(milliseconds: 500),
                                                                    imageUrl: listViewUserRecord.photoUrl,
                                                                    fit: BoxFit.cover,
                                                                  )
                                                                : Center(
                                                                    child: Text(
                                                                      listViewUserRecord.displayName.isNotEmpty ? listViewUserRecord.displayName[0].toUpperCase() : '?',
                                                                      style: GoogleFonts.syne(
                                                                        color: Colors.white,
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 20,
                                                                      ),
                                                                    ),
                                                                  ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                                            .override(
                                                                              fontFamily: 'Roboto Mono',
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'Chave: 789',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Roboto Mono',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          _model.popup =
                                                                              true;
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        text:
                                                                            'Pagar',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              0.0,
                                                                              24.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Roboto Mono',
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(1.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 120.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                listViewUserRecord.displayName,
                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                      fontFamily: 'Roboto Mono',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.navigate_next_sharp,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          ],
                                                                        ),
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
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
