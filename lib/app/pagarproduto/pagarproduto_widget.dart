import 'dart:ui';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/side_nav12/side_nav12_widget.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagarproduto_model.dart';
export 'pagarproduto_model.dart';

class PagarprodutoWidget extends StatefulWidget {
  const PagarprodutoWidget({super.key});

  static String routeName = 'pagarproduto';
  static String routePath = '/pagarproduto';

  @override
  State<PagarprodutoWidget> createState() => _PagarprodutoWidgetState();
}

class _PagarprodutoWidgetState extends State<PagarprodutoWidget> {
  late PagarprodutoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagarprodutoModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        backgroundColor: const Color(0xFF0A0B10),
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
                child: const SideNav12Widget(),
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
                          decoration: const BoxDecoration(
                            color: Color(0xFF0A0B10),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // Glassmorphic Header
                                ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                      width: double.infinity,
                                      height: 120,
                                      decoration: const BoxDecoration(
                                        color: Color(0xCC0A0B10),
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0x0DFFFFFF),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: const Color(0x1AFFFFFF),
                                              borderRadius: 16.0,
                                              borderWidth: 1.0,
                                              buttonSize: 45.0,
                                              fillColor: const Color(0x0DFFFFFF),
                                              icon: const Icon(
                                                Icons.arrow_back_rounded,
                                                color: Colors.white,
                                                size: 22.0,
                                              ),
                                              onPressed: () async {
                                                context.safePop();
                                              },
                                            ),
                                            const SizedBox(width: 16),
                                            Text(
                                              'Checkout',
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
                                // Main Content
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(20, 32, 20, 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Revisão do Pedido',
                                        style: GoogleFonts.syne(
                                          color: const Color(0xFF9896A8),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      // Product Card
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF12141C),
                                          borderRadius: BorderRadius.circular(24),
                                          border: Border.all(
                                            color: const Color(0x0DFFFFFF),
                                            width: 1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFF1A1D28),
                                                      borderRadius: BorderRadius.circular(16),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(16),
                                                      child: CachedNetworkImage(
                                                        imageUrl: FFAppState().imagepro,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          FFAppState().produto,
                                                          style: GoogleFonts.syne(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Text(
                                                          'Item de alta qualidade selecionado para você.',
                                                          style: GoogleFonts.dmSans(
                                                            color: const Color(0xFF9896A8),
                                                            fontSize: 14,
                                                            height: 1.4,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 24),
                                              const Divider(color: Color(0x0DFFFFFF)),
                                              const SizedBox(height: 24),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Subtotal',
                                                    style: GoogleFonts.dmSans(
                                                      color: const Color(0xFF9896A8),
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    'PW$ ${formatNumber(FFAppState().valor, formatType: FormatType.decimal, decimalType: DecimalType.commaDecimal)}',
                                                    style: GoogleFonts.syne(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Taxa de Processamento',
                                                    style: GoogleFonts.dmSans(
                                                      color: const Color(0xFF9896A8),
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    'PW$ 0,00',
                                                    style: GoogleFonts.syne(
                                                      color: const Color(0xFF1FBF7A),
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 24),
                                              Container(
                                                width: double.infinity,
                                                padding: const EdgeInsets.all(16),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF6B5FEF).withOpacity(0.05),
                                                  borderRadius: BorderRadius.circular(16),
                                                  border: Border.all(
                                                    color: const Color(0xFF6B5FEF).withOpacity(0.1),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Total da Ordem',
                                                      style: GoogleFonts.syne(
                                                        color: const Color(0xFFA89FF8),
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      'PW$ ${formatNumber(FFAppState().valor, formatType: FormatType.decimal, decimalType: DecimalType.commaDecimal)}',
                                                      style: GoogleFonts.syne(
                                                        color: Colors.white,
                                                        fontSize: 24,
                                                        fontWeight: FontWeight.w800,
                                                        letterSpacing: -1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 32),
                                      // Payment Method
                                      Text(
                                        'Método de Pagamento',
                                        style: GoogleFonts.syne(
                                          color: const Color(0xFF9896A8),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF12141C),
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(
                                            color: const Color(0x0DFFFFFF),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF6B5FEF).withOpacity(0.12),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.account_balance_wallet_rounded,
                                                color: Color(0xFF6B5FEF),
                                                size: 20,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Saldo Carteira Palito',
                                                  style: GoogleFonts.syne(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    'Disponível: PW$ ${formatNumber(valueOrDefault(currentUserDocument?.saldo, 0.0), formatType: FormatType.decimal, decimalType: DecimalType.commaDecimal)}',
                                                    style: GoogleFonts.dmSans(
                                                      color: const Color(0xFF5C5A6A),
                                                      fontSize: 13,
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
                                const SizedBox(height: 48),
                                // Action Button
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(ConfirmasenhaWidget.routeName);
                                    },
                                    text: 'CONFIRMAR PAGAMENTO',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 64.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFF6B5FEF),
                                      textStyle: GoogleFonts.syne(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 1.0,
                                      ),
                                      elevation: 8.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(100.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
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
