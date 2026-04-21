import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detalhessorvete_model.dart';
export 'detalhessorvete_model.dart';

class DetalhessorveteWidget extends StatefulWidget {
  const DetalhessorveteWidget({
    super.key,
    required this.sorvete,
  });

  final DocumentReference? sorvete;

  static String routeName = 'Detalhessorvete';
  static String routePath = '/detalhessorvete';

  @override
  State<DetalhessorveteWidget> createState() => _DetalhessorveteWidgetState();
}

class _DetalhessorveteWidgetState extends State<DetalhessorveteWidget> {
  late DetalhessorveteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalhessorveteModel());

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
        body: StreamBuilder<ProdutosRecord>(
          stream: ProdutosRecord.getDocument(widget.sorvete!),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6B5FEF)),
                  ),
                ),
              );
            }

            final productData = snapshot.data!;

            return Stack(
              children: [
                // --- Scrollable Content ---
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Spacer for the sticky header
                      const SizedBox(height: 110),

                      // --- Image Section ---
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Decorative glow behind image
                            Positioned(
                              top: -20,
                              right: -20,
                              child: Container(
                                width: 180,
                                height: 180,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0x1F6B5FEF), // --accent-glow
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x1F6B5FEF),
                                        blurRadius: 80,
                                        spreadRadius: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 400.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 40,
                                    offset: const Offset(0, 20),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24.0),
                                child: CachedNetworkImage(
                                  imageUrl: productData.imagem,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(color: const Color(0xFF12141C)),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                            ),
                            // Floating Action Button
                            Positioned(
                              bottom: -28,
                              right: 20,
                              child: _buildActionBtn(context, productData),
                            ),
                          ],
                        ),
                      ),

                      // --- Product Info Section ---
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 52.0, 20.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildBadge(productData.categoria),
                            const SizedBox(height: 16),
                            Text(
                              productData.nome,
                              style: GoogleFonts.syne(
                                color: const Color(0xFFF0EFFB), // --text-primary
                                fontSize: 32.0, // Display style
                                fontWeight: FontWeight.w800,
                                height: 1.1,
                                letterSpacing: -0.03 * 32, // -0.03em
                              ),
                            ),
                            
                            const SizedBox(height: 32),
                            
                            // Price Card (Wallet Style)
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A1D28), // --bg-card
                                borderRadius: BorderRadius.circular(20.0), // --radius-xl
                                border: Border.all(color: const Color(0x1AFFFFFF)), // --border-default
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Color(0xFF1A1D28), Color(0xFF222535)],
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: -40,
                                    right: -40,
                                    child: Container(
                                      width: 120,
                                      height: 120,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0x146B5FEF), // faint accent glow
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'PREÇO UNITÁRIO',
                                              style: GoogleFonts.syne(
                                                color: const Color(0xFF9896A8), // --text-secondary
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 0.18 * 10, // Overline style
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.baseline,
                                              textBaseline: TextBaseline.alphabetic,
                                              children: [
                                                Text(
                                                  'PW\$ ',
                                                  style: GoogleFonts.syne(
                                                    color: const Color(0xFF6B5FEF),
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  formatNumber(productData.preco, formatType: FormatType.decimal, decimalType: DecimalType.commaDecimal),
                                                  style: GoogleFonts.syne(
                                                    color: const Color(0xFFF0EFFB),
                                                    fontSize: 32.0, // Display style
                                                    fontWeight: FontWeight.w800,
                                                    letterSpacing: -0.02 * 32,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 56,
                                          height: 56,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF12141C), // --bg-surface
                                            borderRadius: BorderRadius.circular(16),
                                            border: Border.all(color: const Color(0x1AFFFFFF)),
                                          ),
                                          child: const Icon(Icons.stars_rounded, color: Color(0xFF6B5FEF), size: 30),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 40),
                            
                            Text(
                              'DESCRIÇÃO',
                              style: GoogleFonts.syne(
                                color: const Color(0xFF5C5A6A), // --text-muted
                                fontSize: 11.0,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.05 * 11,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              productData.descricao,
                              style: GoogleFonts.dmSans(
                                color: const Color(0xFF9896A8), // --text-secondary
                                fontSize: 15.0, // --font-body
                                height: 1.6,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // --- Other Categories ---
                      _buildSectionHeader(
                        icon: Icons.auto_awesome_mosaic_rounded,
                        title: 'Explorar Outros',
                      ),
                      SizedBox(
                        height: 90.0,
                        child: StreamBuilder<List<CategoriaRecord>>(
                          stream: queryCategoriaRecord(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return const SizedBox();
                            final categories = snapshot.data!;
                            return ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                final cat = categories[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(100.0),
                                    onTap: () => context.pushNamed(
                                      NvegacaoWidget.routeName,
                                      queryParameters: {
                                        'paragre': serializeParam(cat.reference, ParamType.DocumentReference),
                                      }.withoutNulls,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1A1D28), // --bg-card
                                        borderRadius: BorderRadius.circular(100.0), // pill
                                        border: Border.all(color: const Color(0x0DFFFFFF)),
                                      ),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            ClipOval(
                                              child: CachedNetworkImage(
                                                imageUrl: cat.imagem,
                                                width: 24,
                                                height: 24,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              cat.nome,
                                              style: GoogleFonts.syne(
                                                color: const Color(0xFFF0EFFB),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),

                      // --- Suggestions ---
                      _buildSectionHeader(
                        icon: Icons.flash_on_rounded,
                        title: 'Você Pode Gostar',
                      ),
                      SizedBox(
                        height: 240.0,
                        child: StreamBuilder<List<ProdutosRecord>>(
                          stream: queryProdutosRecord(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return const SizedBox();
                            final suggested = snapshot.data!.where((p) => p.reference != productData.reference).take(5).toList();
                            return ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: suggested.length,
                              itemBuilder: (context, index) {
                                final item = suggested[index];
                                return _buildSuggestedCard(context, item);
                              },
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 100.0),
                    ],
                  ),
                ),

                // --- Sticky Glass Header ---
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dst),
                      child: Container(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 12, bottom: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xCC0A0B10), // Semi-transparent bg-base
                          border: Border(
                            bottom: BorderSide(color: Colors.white.withOpacity(0.06), width: 1),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildHeaderAction(
                                icon: Icons.chevron_left_rounded,
                                onTap: () => context.safePop(),
                              ),
                              Text(
                                'DETALHES',
                                style: GoogleFonts.syne(
                                  color: const Color(0xFF9896A8), // --text-secondary
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              _buildHeaderBag(context),
                            ],
                          ),
                        ).animate().fadeIn(duration: 400.ms),
                      ),
                    ),
                  ).animate().fadeIn(duration: 400.ms),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeaderAction({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100.0),
      child: Container(
        width: 44.0,
        height: 44.0,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1D28),
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(color: const Color(0x1AFFFFFF)),
        ),
        child: Icon(icon, color: const Color(0xFFF0EFFB), size: 22.0),
      ),
    );
  }

  Widget _buildHeaderBag(BuildContext context) {
    return InkWell(
      onTap: () {
        if (FFAppState().valor > 0.0) {
          context.pushNamed(PagarprodutoWidget.routeName);
        }
      },
      borderRadius: BorderRadius.circular(100.0),
      child: Container(
        height: 44.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1D28),
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            color: FFAppState().valor > 0 ? const Color(0xFF6B5FEF).withOpacity(0.5) : const Color(0x1AFFFFFF),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.shopping_bag_outlined, 
              color: FFAppState().valor > 0 ? const Color(0xFF6B5FEF) : const Color(0xFF9896A8), 
              size: 20.0
            ),
            if (FFAppState().valor > 0) ...[
              const SizedBox(width: 8.0),
              Text(
                '${formatNumber(FFAppState().valor, formatType: FormatType.decimal, decimalType: DecimalType.commaDecimal)}',
                style: GoogleFonts.syne(
                  color: const Color(0xFFF0EFFB),
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildActionBtn(BuildContext context, ProdutosRecord product) {
    final bool isAdded = FFAppState().produto.contains(product.reference);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: isAdded ? const Color(0x26E84040) : const Color(0x406B5FEF),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: FFButtonWidget(
        onPressed: () async {
          if (isAdded) {
            FFAppState().removeFromProduto(product.reference);
            FFAppState().valor = FFAppState().valor - product.preco;
          } else {
            FFAppState().addToProduto(product.reference);
            FFAppState().valor = FFAppState().valor + product.preco;
          }
          safeSetState(() {});
        },
        text: isAdded ? 'REMOVER' : 'ADICIONAR',
        icon: Icon(isAdded ? Icons.remove_circle_outline_rounded : Icons.add_shopping_cart_rounded, size: 20.0),
        options: FFButtonOptions(
          height: 56.0,
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          color: isAdded ? const Color(0xFF1A1D28) : const Color(0xFF6B5FEF),
          textStyle: GoogleFonts.syne(
            color: isAdded ? const Color(0xFFE84040) : Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            letterSpacing: 1.0,
          ),
          elevation: 0,
          borderSide: BorderSide(
            color: isAdded ? const Color(0xFFE84040).withOpacity(0.4) : Colors.transparent,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
    );
  }

  Widget _buildBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: const Color(0x1A6B5FEF), // --accent-glow
        borderRadius: BorderRadius.circular(100.0), // pill
        border: Border.all(color: const Color(0x336B5FEF)),
      ),
      child: Text(
        label.toUpperCase(),
        style: GoogleFonts.syne(
          color: const Color(0xFFA89FF8), // --accent-light
          fontSize: 10.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0,
        ),
      ),
    );
  }

  Widget _buildSectionHeader({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 48.0, 20.0, 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1D28),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0x0DFFFFFF)),
            ),
            child: Icon(icon, color: const Color(0xFF6B5FEF), size: 18.0),
          ),
          const SizedBox(width: 14.0),
          Text(
            title,
            style: GoogleFonts.syne(
              color: const Color(0xFFF0EFFB),
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedCard(BuildContext context, ProdutosRecord item) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, bottom: 8),
      child: InkWell(
        onTap: () => context.pushNamed(
          DetalhessorveteWidget.routeName,
          queryParameters: {
            'sorvete': serializeParam(item.reference, ParamType.DocumentReference),
          }.withoutNulls,
        ),
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: 170.0,
          decoration: BoxDecoration(
            color: const Color(0xFF1A1D28), // --bg-card
            borderRadius: BorderRadius.circular(20.0), // radius-xl
            border: Border.all(color: const Color(0x0DFFFFFF)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: CachedNetworkImage(
                      imageUrl: item.imagem,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.syne(
                        color: const Color(0xFFF0EFFB),
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'PW\$ ${formatNumber(item.preco, formatType: FormatType.decimal, decimalType: DecimalType.commaDecimal)}',
                          style: GoogleFonts.syne(
                            color: const Color(0xFF6B5FEF),
                            fontWeight: FontWeight.w800,
                            fontSize: 13.0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0x1F6B5FEF),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.add_rounded, color: Color(0xFF6B5FEF), size: 16),
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
    );
  }
  }
}
