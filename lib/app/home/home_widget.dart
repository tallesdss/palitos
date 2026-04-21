import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/notifications/notifications_widget.dart';
import '/pages/side_nav12/side_nav12_widget.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: const Color(0xFF0A0B10), // --bg-base
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
                  child: const SideNav12Widget(),
                ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xFF0A0B10),
                        ),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // --- Header ---
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => InkWell(
                                        onTap: () => context.pushNamed(PerfilWidget.routeName),
                                        child: Container(
                                          width: 52.0,
                                          height: 52.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: const Color(0xFF6B5FEF).withOpacity(0.2), width: 1.5),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: currentUserPhoto,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12.0),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Olá!',
                                            style: GoogleFonts.dmSans(
                                              color: const Color(0xFF9896A8),
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              currentUserDisplayName,
                                              style: GoogleFonts.syne(
                                                color: const Color(0xFFF0EFFB),
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    _buildHeaderIconButton(
                                      icon: Icons.notifications_none_rounded,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) => const NotificationsWidget(),
                                        ).then((value) => safeSetState(() {}));
                                      },
                                    ),
                                  ],
                                ),
                              ),

                              // --- Balance Card ---
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 32.0, 20.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF1E2130), Color(0xFF131520)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(28.0),
                                    border: Border.all(color: const Color(0xFF2A2E3F), width: 1.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF6B5FEF).withOpacity(0.08),
                                        blurRadius: 40,
                                        offset: const Offset(0, 20),
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      // Subtle Glow
                                      Positioned(
                                        top: -20,
                                        right: -20,
                                        child: Container(
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color(0xFF6B5FEF).withOpacity(0.05),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(28.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Saldo Estimado',
                                              style: GoogleFonts.dmSans(
                                                color: const Color(0xFF9896A8),
                                                fontSize: 12.0,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    FFAppState().olhos
                                                        ? 'PW\$ ${formatNumber(valueOrDefault(currentUserDocument?.saldo, 0.0), formatType: FormatType.decimal, decimalType: DecimalType.commaDecimal)}'
                                                        : 'PW\$ ••••••',
                                                    style: GoogleFonts.syne(
                                                      color: const Color(0xFFF0EFFB),
                                                      fontSize: 32.0,
                                                      fontWeight: FontWeight.w800,
                                                      letterSpacing: -0.5,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    FFAppState().olhos ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                    color: const Color(0xFF9896A8),
                                                    size: 24,
                                                  ),
                                                  onPressed: () => setState(() => FFAppState().olhos = !FFAppState().olhos),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 32),
                                            Row(
                                              children: [
                                                _buildActionChip(
                                                  label: 'Transações',
                                                  isPrimary: true,
                                                  onTap: () => context.pushNamed(MinhastransacoesWidget.routeName),
                                                ),
                                                const SizedBox(width: 12),
                                                _buildActionChip(
                                                  label: 'Transferir',
                                                  isPrimary: false,
                                                  onTap: () => context.pushNamed(EnviarpalitopixWidget.routeName),
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

                              // --- Quick Actions ---
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      _buildNavIcon(context, icon: Icons.favorite_rounded, label: 'Social', onTap: () => context.pushNamed(SocialWidget.routeName)),
                                      _buildNavIcon(context, icon: Icons.store_rounded, label: 'Vendedor', onTap: () => _handleVendorTap(context)),
                                      _buildNavIcon(context, icon: Icons.add_circle_outline_rounded, label: 'Depositar', onTap: () => _showDepositModal(context)),
                                      _buildNavIcon(context, icon: Icons.qr_code_scanner_rounded, label: 'Scanear', onTap: () => _showScannerModal(context)),
                                      _buildNavIcon(context, icon: Icons.send_rounded, label: 'Enviar', onTap: () => context.pushNamed(EnviarpalitopixWidget.routeName)),
                                      _buildNavIcon(context, icon: Icons.admin_panel_settings_rounded, label: 'Admin', onTap: () => context.pushNamed(DashboardWidget.routeName)),
                                    ].divide(const SizedBox(width: 20.0)),
                                  ),
                                ),
                              ),

                              // --- Category Selector ---
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 32.0, 20.0, 0.0),
                                child: StreamBuilder<List<CategoriaRecord>>(
                                  stream: queryCategoriaRecord(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) return const SizedBox(height: 50);
                                    return FlutterFlowChoiceChips(
                                      options: snapshot.data!.map((e) => e.nome).toList().map((label) => ChipData(label)).toList(),
                                      onChanged: (val) => safeSetState(() => _model.choiceChipsValue = val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor: const Color(0xFF6B5FEF),
                                        textStyle: GoogleFonts.syne(color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w700),
                                        elevation: 8.0,
                                        borderRadius: BorderRadius.circular(100.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: const Color(0xFF1A1D28),
                                        textStyle: GoogleFonts.syne(color: const Color(0xFF9896A8), fontSize: 13.0, fontWeight: FontWeight.w600),
                                        borderColor: const Color(0xFF222535),
                                        borderRadius: BorderRadius.circular(100.0),
                                      ),
                                      chipSpacing: 12.0,
                                      multiselect: false,
                                      initialized: _model.choiceChipsValue != null,
                                      controller: _model.choiceChipsValueController ??= FormFieldController<List<String>>(['Mega']),
                                    );
                                  },
                                ),
                              ),

                              // --- Checkout Bar (if items in cart) ---
                              if (FFAppState().produto.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 32.0, 20.0, 0.0),
                                  child: InkWell(
                                    onTap: () => context.pushNamed(PagarprodutoWidget.routeName),
                                    child: Container(
                                      width: double.infinity,
                                      height: 72.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF6B5FEF).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(24.0),
                                        border: Border.all(color: const Color(0xFF6B5FEF).withOpacity(0.4), width: 1.5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('CARRINHO', style: GoogleFonts.dmSans(color: const Color(0xFFA89FF8), fontSize: 10.0, fontWeight: FontWeight.w800, letterSpacing: 1)),
                                                Text('PW\$ ${formatNumber(FFAppState().valor, formatType: FormatType.decimal, decimalType: DecimalType.commaDecimal)}', 
                                                  style: GoogleFonts.syne(color: const Color(0xFFF0EFFB), fontSize: 18, fontWeight: FontWeight.w800)),
                                              ],
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                              decoration: BoxDecoration(color: const Color(0xFF6B5FEF), borderRadius: BorderRadius.circular(100)),
                                              child: Text('Pagar Agora', style: GoogleFonts.syne(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              // --- Product Grid ---
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: StreamBuilder<List<ProdutosRecord>>(
                                  stream: queryProdutosRecord(
                                    queryBuilder: (p) => p.where('categoria', isEqualTo: _model.choiceChipsValue),
                                  ),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                                    final products = snapshot.data!;
                                    return MasonryGridView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                      crossAxisSpacing: 16.0,
                                      mainAxisSpacing: 16.0,
                                      itemCount: products.length,
                                      itemBuilder: (context, index) => _buildProductCard(context, products[index]),
                                    );
                                  },
                                ),
                              ),

                              const SizedBox(height: 40),
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

  Widget _buildHeaderIconButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 52.0,
        height: 52.0,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1D28),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: const Color(0xFF222535)),
        ),
        child: Icon(icon, color: const Color(0xFFF0EFFB), size: 24.0),
      ),
    );
  }

  Widget _buildActionChip({required String label, required bool isPrimary, required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 48.0,
          decoration: BoxDecoration(
            color: isPrimary ? const Color(0xFF6B5FEF) : const Color(0xFF222535),
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: isPrimary ? [BoxShadow(color: const Color(0xFF6B5FEF).withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5))] : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.syne(
              color: isPrimary ? Colors.white : const Color(0xFFF0EFFB),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1D28),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF222535)),
            ),
            child: Icon(icon, color: const Color(0xFF6B5FEF), size: 26),
          ),
          const SizedBox(height: 10),
          Text(label, style: GoogleFonts.dmSans(color: const Color(0xFF9896A8), fontSize: 11, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, ProdutosRecord product) {
    bool inCart = FFAppState().produto.contains(product.reference);
    return InkWell(
      onTap: () => context.pushNamed(DetalhessorveteWidget.routeName, queryParameters: {'sorvete': serializeParam(product.reference, ParamType.DocumentReference)}.withoutNulls),
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1D28),
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(color: inCart ? const Color(0xFF6B5FEF).withOpacity(0.4) : const Color(0xFF222535), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0)),
                child: Stack(
                  children: [
                    CachedNetworkImage(imageUrl: product.imagem, width: double.infinity, height: double.infinity, fit: BoxFit.cover),
                    if (inCart)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(color: Color(0xFF6B5FEF), shape: BoxShape.circle),
                          child: const Icon(Icons.check_rounded, color: Colors.white, size: 16),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.nome, maxLines: 1, overflow: TextOverflow.ellipsis, 
                    style: GoogleFonts.syne(color: const Color(0xFFF0EFFB), fontWeight: FontWeight.w700, fontSize: 15)),
                  const SizedBox(height: 6),
                  Text('PW\$ ${formatNumber(product.preco, formatType: FormatType.decimal, decimalType: DecimalType.commaDecimal)}',
                    style: GoogleFonts.dmSans(color: const Color(0xFF6B5FEF), fontWeight: FontWeight.w800, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleVendorTap(BuildContext context) async {
    if (valueOrDefault<bool>(currentUserDocument?.vendedorAtivo, false)) {
      context.pushNamed(VendedorAdmWidget.routeName);
    } else if (valueOrDefault<bool>(currentUserDocument?.candidato, false)) {
      showDialog(
        context: context,
        builder: (c) => AlertDialog(
          backgroundColor: const Color(0xFF1A1D28),
          title: Text('Atenção!', style: GoogleFonts.syne(color: Colors.white)),
          content: Text('Seu cadastro ainda está em análise!', style: GoogleFonts.dmSans(color: const Color(0xFF9896A8))),
          actions: [TextButton(onPressed: () => Navigator.pop(c), child: const Text('Ok', style: TextStyle(color: Color(0xFF6B5FEF))))],
        ),
      );
    } else {
      context.pushNamed(IniciovendedorWidget.routeName);
    }
  }

  void _showDepositModal(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const DatasWidget(),
    );
  }

  void _showScannerModal(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => SizedBox(height: MediaQuery.sizeOf(context).height * 0.95, child: const ScanearqrcodeWidget()),
    );
  }
}
