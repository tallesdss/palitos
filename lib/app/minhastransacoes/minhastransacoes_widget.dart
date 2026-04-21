import 'dart:ui';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'minhastransacoes_model.dart';
export 'minhastransacoes_model.dart';

class MinhastransacoesWidget extends StatefulWidget {
  const MinhastransacoesWidget({super.key});

  static String routeName = 'minhastransacoes';
  static String routePath = '/minhastransacoes';

  @override
  State<MinhastransacoesWidget> createState() => _MinhastransacoesWidgetState();
}

class _MinhastransacoesWidgetState extends State<MinhastransacoesWidget> {
  late MinhastransacoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MinhastransacoesModel());

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
        backgroundColor: const Color(0xFF0A0B10),
        body: Column(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                              'Histórico',
                              style: GoogleFonts.syne(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                        FlutterFlowIconButton(
                          borderColor: const Color(0x1AFFFFFF),
                          borderRadius: 16.0,
                          borderWidth: 1.0,
                          buttonSize: 45.0,
                          fillColor: const Color(0x0DFFFFFF),
                          icon: const Icon(
                            Icons.calendar_today_rounded,
                            color: Color(0xFF9896A8),
                            size: 20.0,
                          ),
                          onPressed: () async {
                            final _datePickedDate = await showDatePicker(
                              context: context,
                              initialDate: getCurrentTimestamp,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2050),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.dark().copyWith(
                                    colorScheme: const ColorScheme.dark(
                                      primary: Color(0xFF6B5FEF),
                                      onPrimary: Colors.white,
                                      surface: Color(0xFF12141C),
                                      onSurface: Colors.white,
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor: const Color(0xFFA89FF8),
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );

                            if (_datePickedDate != null) {
                              safeSetState(() {
                                _model.datePicked = DateTime(
                                  _datePickedDate.year,
                                  _datePickedDate.month,
                                  _datePickedDate.day,
                                );
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Atividades Recentes',
                            style: GoogleFonts.syne(
                              color: const Color(0xFF9896A8),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                          if (_model.datePicked != null)
                             InkWell(
                               onTap: () => safeSetState(() => _model.datePicked = null),
                               child: Text(
                                 'Limpar Filtro',
                                 style: GoogleFonts.dmSans(
                                   color: const Color(0xFF6B5FEF),
                                   fontSize: 12,
                                   fontWeight: FontWeight.w600,
                                 ),
                               ),
                             ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 40),
                      child: StreamBuilder<List<TransacoesRecord>>(
                        stream: queryTransacoesRecord(
                          queryBuilder: (transacoesRecord) => transacoesRecord
                              .where(
                                'minhas',
                                arrayContains: currentUserReference,
                              )
                              .where(
                                'data',
                                isLessThanOrEqualTo: _model.datePicked ?? getCurrentTimestamp,
                              )
                              .orderBy('data', descending: true),
                          limit: 50,
                        ),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(40),
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6B5FEF)),
                                ),
                              ),
                            );
                          }
                          List<TransacoesRecord> transactions = snapshot.data!;
                          
                          if (transactions.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 100),
                              child: Column(
                                children: [
                                  const Icon(Icons.history_rounded, color: Color(0xFF222535), size: 64),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Nenhuma transação encontrada',
                                    style: GoogleFonts.dmSans(color: const Color(0xFF5C5A6A)),
                                  ),
                                ],
                              ),
                            );
                          }

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: transactions.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final transaction = transactions[index];
                              final bool isOutgoing = transaction.pagador == currentUserReference;
                              
                              return Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF12141C),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: const Color(0x0DFFFFFF),
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      // Transaction Icon
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: isOutgoing 
                                              ? const Color(0xFFE84040).withOpacity(0.1)
                                              : const Color(0xFF1FBF7A).withOpacity(0.1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          isOutgoing ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
                                          color: isOutgoing ? const Color(0xFFE84040) : const Color(0xFF1FBF7A),
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      // Details
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              isOutgoing 
                                                  ? 'Pago para ${transaction.nomedorecebedor}'
                                                  : 'Recebido de ${transaction.nomedopagador}',
                                              style: GoogleFonts.syne(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              dateTimeFormat("d MMMM, HH:mm", transaction.data!, locale: 'pt_BR'),
                                              style: GoogleFonts.dmSans(
                                                color: const Color(0xFF5C5A6A),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Amount
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${isOutgoing ? '-' : '+'} PW\$ ${formatNumber(transaction.valor, formatType: FormatType.decimal, decimalType: DecimalType.commaDecimal)}',
                                            style: GoogleFonts.syne(
                                              color: isOutgoing ? const Color(0xFFF0EFFB) : const Color(0xFF1FBF7A),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF222535),
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                            child: Text(
                                              'Sucesso',
                                              style: GoogleFonts.dmSans(
                                                color: const Color(0xFF1FBF7A),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
