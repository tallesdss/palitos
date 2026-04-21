import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'vendedor_adm_model.dart';
export 'vendedor_adm_model.dart';

class VendedorAdmWidget extends StatefulWidget {
  const VendedorAdmWidget({super.key});

  static String routeName = 'VendedorAdm';
  static String routePath = '/vendedorAdm';

  @override
  State<VendedorAdmWidget> createState() => _VendedorAdmWidgetState();
}

class _VendedorAdmWidgetState extends State<VendedorAdmWidget> {
  late VendedorAdmModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VendedorAdmModel());

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0A0A0A), Color(0xFF121212)],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: SafeArea(
            top: true,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Olá,',
                            style: GoogleFonts.dmSans(
                              color: Color(0xFF8E8E93),
                              fontSize: 16.0,
                            ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => Text(
                              currentUserDisplayName != '' ? currentUserDisplayName : 'Vendedor',
                              style: GoogleFonts.syne(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF1E1E1E),
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Image.network(
                              currentUserPhoto != '' ? currentUserPhoto : 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100&h=100&fit=crop',
                              fit: BoxType.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 32.0),

                  // Session Card
                  StreamBuilder<List<HistoricoRecord>>(
                    stream: queryHistoricoRecord(
                      queryBuilder: (historico) => historico
                        .where('refeVendedor', isEqualTo: currentUserReference)
                        .where('valorpagofinal', isEqualTo: 0.0)
                        .orderBy('data', descending: true),
                      limit: 1,
                    ),
                    builder: (context, snapshot) {
                      final hasActiveSession = snapshot.hasData && snapshot.data!.isNotEmpty;
                      
                      if (!snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Color(0xFF1A1A1A),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Center(child: CircularProgressIndicator(color: Color(0xFF7F00FF))),
                        );
                      }

                      if (!hasActiveSession) {
                        return _buildStartSessionCard();
                      }

                      final activeSession = snapshot.data!.first;
                      return _buildActiveSessionCard(activeSession);
                    },
                  ),

                  SizedBox(height: 32.0),

                  Text(
                    'Ações Rápidas',
                    style: GoogleFonts.syne(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 16.0),

                  // Grid Actions
                  GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 1.1,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildActionCard(
                        'Registrar Venda',
                        'Venda rápida',
                        Icons.bolt_rounded,
                        () => context.pushNamed('VendaRapida'),
                      ),
                      _buildActionCard(
                        'Histórico',
                        'Ver diárias passadas',
                        Icons.history_rounded,
                        () => context.pushNamed(HistoricoVendedorWidget.routeName),
                      ),
                      _buildActionCard(
                        'Ganhos',
                        'Minhas comissões',
                        Icons.account_balance_wallet_rounded,
                        () => context.pushNamed(MeusganhosWidget.routeName),
                      ),
                      _buildActionCard(
                        'Suporte',
                        'Preciso de ajuda',
                        Icons.help_outline_rounded,
                        () => context.pushNamed(SuporteWidget.routeName),
                      ),
                      _buildActionCard(
                        'Perfil',
                        'Meus dados',
                        Icons.person_outline_rounded,
                        () => {}, // Placeholder
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStartSessionCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: Color(0xFF2D2D2D)),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Color(0x1A7F00FF),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.icecream_rounded, color: Color(0xFF7F00FF), size: 30),
            ),
            SizedBox(height: 16.0),
            Text(
              'Pronto para vender?',
              style: GoogleFonts.syne(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Carregue seu carrinho para começar a registrar suas vendas de hoje.',
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                color: Color(0xFF8E8E93),
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 24.0),
            FFButtonWidget(
              onPressed: () => context.pushNamed('carregar_carrinho'),
              text: 'Começar Agora',
              options: FFButtonOptions(
                width: double.infinity,
                height: 50.0,
                color: Color(0xFF7F00FF),
                textStyle: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveSessionCard(HistoricoRecord session) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
          begin: AlignmentDirectional(1.0, -1.0),
          end: AlignmentDirectional(-1.0, 1.0),
        ),
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Color(0x4D7F00FF),
            offset: Offset(0.0, 10.0),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'SESSÃO ATIVA',
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                Text(
                  'Cód: ${session.codigo}',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'R\$ ${formatNumber(session.valorCarga, formatType: FormatType.decimal)}',
              style: GoogleFonts.syne(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Valor em carga carregada',
              style: GoogleFonts.dmSans(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              children: [
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () => context.pushNamed('VendaRapida'),
                    text: 'Venda Rápida',
                    icon: Icon(
                      Icons.bolt_rounded,
                      color: Color(0xFF7F00FF),
                      size: 20,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      color: Colors.white,
                      textStyle: GoogleFonts.dmSans(
                        color: Color(0xFF7F00FF),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'RetornoEstoque',
                      queryParameters: {
                        'historico': serializeParam(
                          session.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: 'Encerrar',
                  options: FFButtonOptions(
                    width: 100.0,
                    height: 50.0,
                    color: Colors.white.withOpacity(0.15),
                    textStyle: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Colors.white30,
                      width: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(String title, String subtitle, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Color(0xFF2D2D2D)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0x1AFFFFFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            SizedBox(height: 12.0),
            Text(
              title,
              style: GoogleFonts.syne(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              subtitle,
              style: GoogleFonts.dmSans(
                color: Color(0xFF8E8E93),
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
