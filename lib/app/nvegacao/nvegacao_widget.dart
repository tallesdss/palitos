import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nvegacao_model.dart';
export 'nvegacao_model.dart';

class NvegacaoWidget extends StatefulWidget {
  const NvegacaoWidget({
    super.key,
    required this.paragre,
  });

  final DocumentReference? paragre;

  static String routeName = 'Nvegacao';
  static String routePath = '/navegacao';

  @override
  State<NvegacaoWidget> createState() => _NvegacaoWidgetState();
}

class _NvegacaoWidgetState extends State<NvegacaoWidget> {
  late NvegacaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NvegacaoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.referenciadacat = widget.paragre;
      safeSetState(() {});
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
        backgroundColor: Color(0xFF0A0B10), // --bg-base
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 48.0, 16.0, 16.0),
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
                          color: Color(0xFF1A1D28), // --bg-card
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0xFF222535),
                            width: 1.0,
                          ),
                        ),
                        child: Icon(
                          Icons.chevron_left_rounded,
                          color: Color(0xFFF0EFFB),
                          size: 28.0,
                        ),
                      ),
                    ),
                    Text(
                      'Explorar',
                      style: GoogleFonts.getFont(
                        'Syne',
                        color: Color(0xFFF0EFFB),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 44.0), // Spacer for balance
                  ],
                ),
              ),
              Container(
                height: 110.0,
                child: StreamBuilder<List<CategoriaRecord>>(
                  stream: queryCategoriaRecord(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    List<CategoriaRecord> listViewCategoriaRecordList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: listViewCategoriaRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewCategoriaRecord = listViewCategoriaRecordList[listViewIndex];
                        final isSelected = _model.referenciadacat == listViewCategoriaRecord.reference;
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                          child: InkWell(
                            onTap: () async {
                              _model.referenciadacat = listViewCategoriaRecord.reference;
                              safeSetState(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 64.0,
                                  height: 64.0,
                                  decoration: BoxDecoration(
                                    color: isSelected ? Color(0xFF6B5FEF) : Color(0xFF1A1D28),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected ? Color(0xFF6B5FEF) : Color(0xFF222535),
                                      width: 2.0,
                                    ),
                                    boxShadow: isSelected ? [
                                      BoxShadow(
                                        color: Color(0x666B5FEF),
                                        blurRadius: 10.0,
                                        spreadRadius: 1.0,
                                      )
                                    ] : null,
                                  ),
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: listViewCategoriaRecord.imagem,
                                      fit: BoxFit.cover,
                                      color: isSelected ? Colors.transparent : Colors.white.withOpacity(0.8),
                                      colorBlendMode: isSelected ? BlendMode.dst : BlendMode.modulate,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  listViewCategoriaRecord.nome,
                                  style: GoogleFonts.getFont(
                                    'Syne',
                                    color: isSelected ? Color(0xFF6B5FEF) : Color(0xFF9896A8),
                                    fontSize: 12.0,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: StreamBuilder<List<ProdutosRecord>>(
                    stream: queryProdutosRecord(
                      queryBuilder: (produtosRecord) => produtosRecord.where(
                        'categoriaRefe',
                        isEqualTo: _model.referenciadacat,
                      ),
                    ),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF6B5FEF),
                          ),
                        );
                      }
                      List<ProdutosRecord> gridProducts = snapshot.data!;
                      if (gridProducts.isEmpty) {
                        return Center(
                          child: Text(
                            'Nenhum produto nesta categoria',
                            style: GoogleFonts.getFont(
                              'DM Sans',
                              color: Color(0xFF9896A8),
                              fontSize: 14.0,
                            ),
                          ),
                        );
                      }
                      return MasonryGridView.builder(
                        padding: EdgeInsets.only(top: 16.0, bottom: 32.0),
                        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        itemCount: gridProducts.length,
                        itemBuilder: (context, index) {
                          final product = gridProducts[index];
                          return InkWell(
                            onTap: () async {
                              context.pushNamed(
                                DetalhessorveteWidget.routeName,
                                queryParameters: {
                                  'sorvete': serializeParam(
                                    product.reference,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                                    child: Image.network(
                                      product.imagem,
                                      width: double.infinity,
                                      height: 180.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.nome,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.getFont(
                                            'Syne',
                                            color: Color(0xFFF0EFFB),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        SizedBox(height: 6.0),
                                        Text(
                                          'PW\$ ${formatNumber(
                                            product.preco,
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.commaDecimal,
                                          )}',
                                          style: GoogleFonts.getFont(
                                            'DM Sans',
                                            color: Color(0xFF6B5FEF),
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15.0,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
