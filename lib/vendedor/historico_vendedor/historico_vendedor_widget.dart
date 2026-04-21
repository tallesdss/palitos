import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'historico_vendedor_model.dart';
export 'historico_vendedor_model.dart';

class HistoricoVendedorWidget extends StatefulWidget {
  const HistoricoVendedorWidget({super.key});

  static String routeName = 'historicoVendedor';
  static String routePath = '/historicoVendedor';

  @override
  State<HistoricoVendedorWidget> createState() =>
      _HistoricoVendedorWidgetState();
}

class _HistoricoVendedorWidgetState extends State<HistoricoVendedorWidget> {
  late HistoricoVendedorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoricoVendedorModel());

    _model.pesquisaTextController ??= TextEditingController();
    _model.pesquisaFocusNode ??= FocusNode();

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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0A0A0A),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 20.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Histórico de Diárias',
            style: GoogleFonts.syne(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0A0A0A), Color(0xFF1A1A1A)],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0x1AFFFFFF),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: Color(0x33FFFFFF),
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: Color(0xB3FFFFFF),
                            size: 24.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.pesquisaTextController,
                                focusNode: _model.pesquisaFocusNode,
                                decoration: InputDecoration(
                                  hintText: 'Pesquisar pelo código...',
                                  hintStyle: GoogleFonts.dmSans(
                                    color: Color(0x80FFFFFF),
                                    fontSize: 16.0,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                style: GoogleFonts.dmSans(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Section Title
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 16.0),
                  child: Text(
                    'Últimos 30 Dias',
                    style: GoogleFonts.syne(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // History List
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: StreamBuilder<List<HistoricoRecord>>(
                    stream: queryHistoricoRecord(
                      queryBuilder: (historicoRecord) => historicoRecord
                          .where(
                            'refeVendedor',
                            isEqualTo: currentUserReference,
                          )
                          .orderBy('data', descending: true),
                      limit: 30,
                    ),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF7F00FF),
                          ),
                        );
                      }
                      final historyItems = snapshot.data!;

                      if (historyItems.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.history_rounded,
                                  color: Color(0x4DFFFFFF),
                                  size: 64.0,
                                ),
                                SizedBox(height: 16.0),
                                Text(
                                  'Nenhum registro encontrado',
                                  style: GoogleFonts.dmSans(
                                    color: Color(0xB3FFFFFF),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: historyItems.length,
                        separatorBuilder: (_, __) => SizedBox(height: 16.0),
                        itemBuilder: (context, index) {
                          final item = historyItems[index];
                          return _buildHistoryCard(context, item);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryCard(BuildContext context, HistoricoRecord item) {
    return InkWell(
      onTap: () async {
        if (item.aprovacao) {
          context.pushNamed(
            ConsultarDiariasWidget.routeName,
            queryParameters: {
              'historicodoc': serializeParam(item, ParamType.Document),
            }.withoutNulls,
            extra: {'historicodoc': item},
          );
        } else {
          context.pushNamed(
            DetalhesdiariasWidget.routeName,
            queryParameters: {
              'historicodoc': serializeParam(item, ParamType.Document),
            }.withoutNulls,
            extra: {'historicodoc': item},
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0x0DFFFFFF),
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: Color(0x1AFFFFFF),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CÓD: ${item.codigo}',
                        style: GoogleFonts.dmSans(
                          color: Color(0x80FFFFFF),
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        dateTimeFormat("d 'de' MMMM, y", item.data!, locale: 'pt_BR'),
                        style: GoogleFonts.syne(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: item.aprovacao ? Color(0x3300FFA3) : Color(0x33FFBD59),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      item.aprovacao ? 'Finalizado' : 'Pendente',
                      style: GoogleFonts.dmSans(
                        color: item.aprovacao ? Color(0xFF00FFA3) : Color(0xFFFFBD59),
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMetric('Carga', 'R\$ ${formatNumber(item.valorCarga, formatType: FormatType.decimal, decimalType: DecimalType.commaDecimal)}'),
                    _buildMetric('Vendas', 'R\$ ${formatNumber(item.valorpagofinal, formatType: FormatType.decimal, decimalType: DecimalType.commaDecimal)}'),
                    _buildMetric('Comissão', 'R\$ ${formatNumber(item.comissaoFinal, formatType: FormatType.decimal, decimalType: DecimalType.commaDecimal)}', isHighlight: true),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Ver detalhes',
                    style: GoogleFonts.dmSans(
                      color: Color(0xFF7F00FF),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFF7F00FF),
                    size: 20.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetric(String label, String value, {bool isHighlight = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.dmSans(
            color: Color(0x80FFFFFF),
            fontSize: 12.0,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.syne(
            color: isHighlight ? Color(0xFF00FFA3) : Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
