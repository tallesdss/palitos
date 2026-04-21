import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'notificacoes_model.dart';
export 'notificacoes_model.dart';

class NotificacoesWidget extends StatefulWidget {
  const NotificacoesWidget({super.key});

  static String routeName = 'notificacoes';
  static String routePath = '/notificacoes';

  @override
  State<NotificacoesWidget> createState() => _NotificacoesWidgetState();
}

class _NotificacoesWidgetState extends State<NotificacoesWidget> {
  late NotificacoesModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificacoesModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF0A0B10),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
             // Multi-layered decorative blobs (Vibrant Cool)
            Positioned(
              top: -80,
              right: -50,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF6B5FEF).withValues(alpha: 0.08),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                  child: Container(color: Colors.transparent),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF1FBF7A).withValues(alpha: 0.05),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                  child: Container(color: Colors.transparent),
                ),
              ),
            ),

            Column(
              children: [
                // Premium Glass Header
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF12141C).withValues(alpha: 0.7),
                        border: Border(
                          bottom: BorderSide(color: Colors.white.withValues(alpha: 0.06), width: 1),
                        ),
                      ),
                      child: SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(24, 16, 24, 20),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => context.safePop(),
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1A1D28),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                                  ),
                                  child: Icon(Icons.chevron_left_rounded, color: Color(0xFFF0EFFB), size: 28),
                                ),
                              ),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NotificaÃ§Ãµes',
                                    style: GoogleFonts.syne(
                                      color: Color(0xFFF0EFFB),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                  Text(
                                    'FIQUE POR DENTRO DE TUDO',
                                    style: GoogleFonts.syne(
                                      color: Color(0xFF5C5A6A),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Notifications List
                Expanded(
                  child: StreamBuilder<List<NotificacoesRecord>>(
                    stream: queryNotificacoesRecord(
                      queryBuilder: (n) => n.orderBy('datadeCriacao', descending: true),
                    ),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF6B5FEF),
                            strokeWidth: 2,
                          ),
                        );
                      }
                      final notifications = snapshot.data!;

                      if (notifications.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: Color(0xFF1A1D28),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white.withValues(alpha: 0.04)),
                                ),
                                child: Icon(
                                  Icons.notifications_off_outlined, 
                                  size: 48, 
                                  color: Color(0xFF5C5A6A).withValues(alpha: 0.5)
                                ),
                              ),
                              SizedBox(height: 24),
                              Text(
                                'SilÃªncio total...',
                                style: GoogleFonts.syne(
                                  color: Color(0xFFF0EFFB), 
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Avisaremos quando algo\nnovo aparecer para vocÃª.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.dmSans(
                                  color: Color(0xFF9896A8), 
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(24, 24, 24, 40),
                        itemCount: notifications.length,
                        separatorBuilder: (_, __) => SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final notification = notifications[index];
                          final iconData = _getIconForNotification(notification.titulo);
                          final accentColor = _getColorForNotification(notification.titulo);
                          
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF1A1D28),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                )
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: accentColor.withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Icon(
                                          iconData,
                                          color: accentColor,
                                          size: 22,
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              notification.titulo,
                                              style: GoogleFonts.syne(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                color: Color(0xFFF0EFFB),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              notification.texto,
                                              style: GoogleFonts.dmSans(
                                                fontSize: 14,
                                                color: Color(0xFF9896A8),
                                                height: 1.5,
                                              ),
                                            ),
                                            SizedBox(height: 12),
                                            Row(
                                              children: [
                                                Icon(Icons.access_time_rounded, size: 12, color: Color(0xFF5C5A6A)),
                                                SizedBox(width: 4),
                                                Text(
                                                  dateTimeFormat('relative', notification.datadeCriacao!),
                                                  style: GoogleFonts.dmSans(
                                                    fontSize: 11,
                                                    color: Color(0xFF5C5A6A),
                                                    fontWeight: FontWeight.w500,
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
    );
  }

  IconData _getIconForNotification(String title) {
    title = title.toLowerCase();
    if (title.contains('venda') || title.contains('faturamento')) return Icons.account_balance_wallet_rounded;
    if (title.contains('meta')) return Icons.auto_graph_rounded;
    if (title.contains('transfer') || title.contains('p2p')) return Icons.swap_horizontal_circle_rounded;
    if (title.contains('conquista')) return Icons.emoji_events_rounded;
    if (title.contains('dica')) return Icons.lightbulb_outline_rounded;
    return Icons.notifications_active_rounded;
  }

  Color _getColorForNotification(String title) {
    title = title.toLowerCase();
    if (title.contains('venda') || title.contains('faturamento')) return Color(0xFF1FBF7A);
    if (title.contains('meta')) return Color(0xFFF5A623);
    if (title.contains('transfer') || title.contains('p2p')) return Color(0xFF6B5FEF);
    if (title.contains('conquista')) return Color(0xFF8B80F4);
    if (title.contains('dica')) return Color(0xFF1FBF7A);
    return Color(0xFF6B5FEF);
  }
}

