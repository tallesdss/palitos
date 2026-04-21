import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/vendedor/carregar_carrinho/carregar_carrinho_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class CarregarCarrinhoWidget extends StatefulWidget {
  const CarregarCarrinhoWidget({super.key});

  @override
  State<CarregarCarrinhoWidget> createState() => _CarregarCarrinhoWidgetState();
}

class _CarregarCarrinhoWidgetState extends State<CarregarCarrinhoWidget> {
  late CarregarCarrinhoModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarregarCarrinhoModel());
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
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0A0B10),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Header
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => context.safePop(),
                      child: Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF1A1D28),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0xFF222535),
                            width: 1.0,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xFFF0EFFB),
                          size: 24.0,
                        ),
                      ),
                    ),
                      Text(
                        'Carregamento',
                        style: GoogleFonts.syne(
                          color: Color(0xFFF0EFFB),
                          fontSize: 24.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                      ),
                    Container(width: 48.0), // Spacer for centering
                  ],
                ),
              ),

              // Summary Card
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF6B5FEF), Color(0xFF8B80F4)],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20.0,
                        color: Color(0x4D7F00FF),
                        offset: Offset(0.0, 8.0),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Valor Total',
                                  style: GoogleFonts.dmSans(
                                    color: Color(0xB3FFFFFF),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  formatNumber(
                                    FFAppState().valorcarrinhototal,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.periodDecimal,
                                    currency: 'R\$ ',
                                  ),
                                  style: GoogleFonts.syne(
                                    color: Colors.white,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 56.0,
                              height: 56.0,
                              decoration: BoxDecoration(
                                color: Color(0x33FFFFFF),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.shopping_basket_rounded,
                                color: Colors.white,
                                size: 28.0,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildSummaryItem(
                                'Quantidade',
                                FFAppState().quantidadeDiaria.toString(),
                                Icons.inventory_2_outlined,
                              ),
                              _buildSummaryItem(
                                'ComissÃ£o',
                                formatNumber(
                                  FFAppState().valorcarrinhocomissao,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.periodDecimal,
                                  currency: 'R\$ ',
                                ),
                                Icons.account_balance_wallet_outlined,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Products List Title
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Itens no Carrinho',
                      style: GoogleFonts.syne(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (FFAppState().diariasProdutos.isNotEmpty)
                      Text(
                        '${FFAppState().diariasProdutos.length} itens',
                        style: GoogleFonts.dmSans(
                          color: Color(0xFF00F2FF),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),

              // Active Cart
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  shrinkWrap: true,
                  children: [
                    if (FFAppState().diariasProdutos.isEmpty)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Column(
                          children: [
                            Icon(Icons.add_shopping_cart_rounded, color: Color(0xFF2D2D2D), size: 64.0),
                            Padding(
                              padding: EdgeInsets.only(top: 16.0),
                              child: Text(
                                'Seu carrinho estÃ¡ vazio',
                                style: GoogleFonts.dmSans(color: Color(0xFF8E8E93), fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    
                    ...FFAppState().diariasProdutos.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      return _buildCartItem(item, index);
                    }).toList(),

                    Padding(
                      padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
                      child: Text(
                        'Adicionar Produtos',
                        style: GoogleFonts.syne(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Available Products - Using StreamBuilder or FutureBuilder for Firestore
                    StreamBuilder<List<ProdutosRecord>>(
                      stream: queryProdutosRecord(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator(color: Color(0xFF7F00FF)));
                        }
                        List<ProdutosRecord> produtos = snapshot.data!
                            .where((p) => !FFAppState().listadeitens.contains(p.reference))
                            .toList();

                        if (produtos.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('Todos os produtos jÃ¡ foram adicionados.', 
                              textAlign: TextAlign.center,
                              style: GoogleFonts.dmSans(color: Color(0xFF8E8E93)),
                            ),
                          );
                        }

                        return Column(
                          children: produtos.map((p) => _buildAvailableProduct(p)).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Bottom Button
              Padding(
                padding: EdgeInsets.all(24.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (FFAppState().diariasProdutos.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Adicione pelo menos um item ao carrinho.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    showSnackbar(context, 'Finalizando carregamento...', loading: true);

                    try {
                      final String codigo = List.generate(6, (index) => math.Random().nextInt(10)).join();

                      await HistoricoRecord.collection.doc().set({
                        ...createHistoricoRecordData(
                          refeVendedor: currentUserReference,
                          data: getCurrentTimestamp,
                          valorCarga: FFAppState().valorcarrinhototal,
                          comissaoTotal: FFAppState().valorcarrinhocomissao,
                          aprovacao: false,
                          codigo: codigo,
                        ),
                        'diarias': getDiariaListFirestoreData(FFAppState().diariasProdutos),
                      });

                      // Clear global state
                      FFAppState().update(() {
                        FFAppState().diariasProdutos = [];
                        FFAppState().valorcarrinhototal = 0.0;
                        FFAppState().valorcarrinhocomissao = 0.0;
                        FFAppState().quantidadeDiaria = 0;
                        FFAppState().listadeitens = [];
                      });

                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      showSnackbar(context, 'Carrinho carregado com sucesso!');
                      
                      context.pushNamed('VendedorAdm');
                    } catch (e) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      showSnackbar(context, 'Erro ao carregar carrinho: $e');
                    }
                  },
                  text: 'Continuar',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 56.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF7F00FF),
                    textStyle: GoogleFonts.syne(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, IconData icon) {
    return Row(
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: Color(0x26FFFFFF),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Icon(icon, color: Colors.white, size: 20.0),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.dmSans(
                  color: Color(0xB3FFFFFF),
                  fontSize: 12.0,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.syne(
                  color: Color(0xFFF0EFFB),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCartItem(DiariaStruct item, int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF1A1D28),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Color(0xFF222535), width: 1.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  item.imagem.isNotEmpty 
                    ? item.imagem 
                    : 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=100&h=100&fit=crop',
                  width: 64.0,
                  height: 64.0,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                          item.nome,
                          style: GoogleFonts.syne(
                            color: Color(0xFFF0EFFB),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      Text(
                        'Qtd: ${item.quantidade} â€¢ R\$ ${formatNumber(item.totalkit, formatType: FormatType.decimal)}',
                        style: GoogleFonts.dmSans(
                          color: Color(0xFF8E8E93),
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.remove_circle_outline, color: Color(0xFFFF453A)),
                onPressed: () {
                  setState(() {
                    FFAppState().valorcarrinhototal -= item.totalkit;
                    FFAppState().valorcarrinhocomissao -= item.comissaokit;
                    FFAppState().quantidadeDiaria -= item.quantidade;
                    FFAppState().removeFromListadeitens(item.produto!);
                    FFAppState().removeAtIndexFromDiariasProdutos(index);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvailableProduct(ProdutosRecord produto) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () async {
          // Open quantity picker
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
                  ),
                  child: PremiumQuantityPicker(produto: produto),
                ),
              );
            },
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF1A1A1A).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Color(0xFF2D2D2D), width: 1.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    produto.imagem.isNotEmpty 
                      ? produto.imagem 
                      : 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=100&h=100&fit=crop',
                    width: 56.0,
                    height: 56.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          produto.nome,
                          style: GoogleFonts.syne(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'R\$ ${formatNumber(produto.preco, formatType: FormatType.decimal)}',
                          style: GoogleFonts.dmSans(
                            color: Color(0xFF00F2FF),
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF7F00FF).withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add_rounded, color: Color(0xFF7F00FF), size: 24.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PremiumQuantityPicker extends StatefulWidget {
  final ProdutosRecord produto;
  const PremiumQuantityPicker({super.key, required this.produto});

  @override
  State<PremiumQuantityPicker> createState() => _PremiumQuantityPickerState();
}

class _PremiumQuantityPickerState extends State<PremiumQuantityPicker> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Color(0xFF2D2D2D),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              'Quantas unidades?',
              style: GoogleFonts.syne(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline, color: Colors.white, size: 32),
                onPressed: () {
                  if (quantity > 1) setState(() => quantity--);
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  quantity.toString(),
                  style: GoogleFonts.syne(
                    color: Colors.white,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline, color: Color(0xFF7F00FF), size: 32),
                onPressed: () {
                  setState(() => quantity++);
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: FFButtonWidget(
              onPressed: () async {
                final comissao = (quantity * widget.produto.preco * widget.produto.comissao) / 100;
                final totalValue = quantity * widget.produto.preco;

                FFAppState().addToDiariasProdutos(DiariaStruct(
                  produto: widget.produto.reference,
                  valor: widget.produto.preco,
                  quantidade: quantity,
                  nome: widget.produto.nome,
                  imagem: widget.produto.imagem,
                  comissaokit: comissao,
                  totalkit: totalValue,
                  porcentagemkit: widget.produto.comissao,
                  porcentdaComissao: widget.produto.comissao,
                ));
                
                FFAppState().valorcarrinhototal += totalValue;
                FFAppState().valorcarrinhocomissao += comissao;
                FFAppState().quantidadeDiaria += quantity;
                FFAppState().addToListadeitens(widget.produto.reference);
                
                Navigator.pop(context);
              },
              text: 'Adicionar ao Carrinho',
              options: FFButtonOptions(
                width: double.infinity,
                height: 56.0,
                color: Color(0xFF7F00FF),
                textStyle: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

