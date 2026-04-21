import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/comentarios/comentarios_widget.dart';
import '/pages/criarpostagem/criarpostagem_widget.dart';
import '/pages/notificacoes/notificacoes_widget.dart';
import '/index.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'social_model.dart';
export 'social_model.dart';

class SocialWidget extends StatefulWidget {
  const SocialWidget({super.key});

  static String routeName = 'social';
  static String routePath = '/social';

  @override
  State<SocialWidget> createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> {
  late SocialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).primaryBackground,
                FlutterFlowTheme.of(context).secondaryBackground,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              // Vibrant Circles Decoration
              Positioned(
                top: -120,
                right: -80,
                child: Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF6B5FEF).withValues(alpha: 0.12),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),
              Positioned(
                bottom: 200,
                left: -100,
                child: Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF1FBF7A).withValues(alpha: 0.08),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Glassmorphism Header
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xCC0A0B10),
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0x1AFFFFFF),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 50, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Comunidade',
                                    style: GoogleFonts.syne(
                                      color: Color(0xFFF0EFFB),
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -0.8,
                                    ),
                                  ),
                                  Text(
                                    'Troque experiÃªncias e conquistas',
                                    style: GoogleFonts.dmSans(
                                      color: Color(0xFF9896A8),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () => context.pushNamed(NotificacoesWidget.routeName),
                                    child: Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Color(0x1AFFFFFF),
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: Color(0x0DFFFFFF)),
                                      ),
                                      child: Icon(
                                        Icons.notifications_none_rounded,
                                        color: Color(0xFFF0EFFB),
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  InkWell(
                                    onTap: () => context.pushNamed(PerfilWidget.routeName),
                                    child: Container(
                                      width: 48,
                                      height: 48,
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
                                        Icons.person_rounded,
                                        color: Colors.white,
                                        size: 22,
                                      ),
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

                  // Feed Content
                  Expanded(
                    child: StreamBuilder<List<PostagemRecord>>(
                      stream: queryPostagemRecord(
                        queryBuilder: (postagemRecord) =>
                            postagemRecord.orderBy('data', descending: true),
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          );
                        }
                        List<PostagemRecord> posts = snapshot.data!;
                        
                        if (posts.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).alternate.withValues(alpha: 0.3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.auto_awesome_mosaic_rounded,
                                    size: 64,
                                    color: FlutterFlowTheme.of(context).primary.withValues(alpha: 0.5),
                                  ),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  'Ainda nÃ£o hÃ¡ postagens,\nSeja o primeiro!',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.syne(
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return ListView.separated(
                          padding: EdgeInsets.fromLTRB(16, 20, 16, 120),
                          itemCount: posts.length,
                          separatorBuilder: (_, __) => SizedBox(height: 20),
                          itemBuilder: (context, index) {
                            final post = posts[index];
                            return PostCard(post: post);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              // Floating Action Button - Glassmorphism style
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Center(
                  child: InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.85,
                            child: CriarpostagemWidget(),
                          ),
                        ),
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).secondary,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: FlutterFlowTheme.of(context).primary.withValues(alpha: 0.4),
                            blurRadius: 20,
                            offset: Offset(0, 8),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add_a_photo_rounded, color: Colors.white, size: 24),
                          SizedBox(width: 12),
                          Text(
                            'Postar Novidade',
                            style: GoogleFonts.dmSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
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

class PostCard extends StatelessWidget {
  final PostagemRecord post;

  const PostCard({super.key, required this.post});

  Widget _buildTypeBadge(BuildContext context) {
    if (post.tipo == 'post') return SizedBox.shrink();
    
    IconData icon;
    String label;
    Color color;
    
    if (post.tipo == 'conquista') {
      icon = Icons.emoji_events_rounded;
      label = 'CONQUISTA';
      color = Color(0xFFF5A623);
    } else {
      icon = Icons.lightbulb_rounded;
      label = 'DICA';
      color = Color(0xFF6B5FEF);
    }
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          SizedBox(width: 4),
          Text(
            label,
            style: GoogleFonts.syne(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              color: color,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isConquest = post.tipo == 'conquista';
    
    return Container(
      decoration: BoxDecoration(
        color: isConquest ? Color(0xFF1A1D28) : Color(0xFF12141C),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isConquest ? Color(0x33F5A623) : Color(0x1AFFFFFF),
          width: 1,
        ),
        boxShadow: isConquest ? [
          BoxShadow(
            color: Color(0x1AF5A623),
            blurRadius: 20,
            offset: Offset(0, 4),
          )
        ] : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: User Info
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).secondary.withValues(alpha: 0.5),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(post.fotourl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              post.nomedono,
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 8),
                          _buildTypeBadge(context),
                        ],
                      ),
                      Text(
                        dateTimeFormat('relative', post.data!, locale: 'pt_BR'),
                        style: GoogleFonts.dmSans(
                          fontSize: 12,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                if (post.dono == currentUserReference)
                  IconButton(
                    icon: Icon(Icons.more_horiz_rounded, color: FlutterFlowTheme.of(context).secondaryText),
                    onPressed: () async {
                      final confirmDeletion = await showDialog<bool>(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                          title: Text('Apagar Post', style: GoogleFonts.syne(fontWeight: FontWeight.bold)),
                          content: Text('Deseja realmente remover esta postagem do feed?'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text('NÃ£o', style: TextStyle(color: FlutterFlowTheme.of(context).primaryText))),
                            TextButton(
                              onPressed: () => Navigator.pop(ctx, true), 
                              child: Text('Sim, Apagar', style: TextStyle(color: Colors.red))
                            ),
                          ],
                        ),
                      );
                      if (confirmDeletion == true) {
                        await post.reference.delete();
                      }
                    },
                  ),
              ],
            ),
          ),

          // Content: Description
          if (post.descricao.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Text(
                post.descricao,
                style: GoogleFonts.dmSans(
                  fontSize: 15,
                  color: FlutterFlowTheme.of(context).primaryText,
                  height: 1.5,
                ),
              ),
            ),

          // Content: Image
          if (post.imagem.isNotEmpty)
            Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: post.imagem,
                  width: double.infinity,
                  height: 280,
                  fit: BoxFit.cover,
                ),
              ),
            ),

          // Footer: Actions
          Padding(
            padding: EdgeInsets.fromLTRB(12, 8, 20, 16),
            child: Row(
              children: [
                ToggleIcon(
                  onPressed: () async {
                    final isFav = post.favoritosUser.contains(currentUserReference);
                    await post.reference.update({
                      'favoritos_user': isFav 
                        ? FieldValue.arrayRemove([currentUserReference]) 
                        : FieldValue.arrayUnion([currentUserReference]),
                    });
                  },
                  value: post.favoritosUser.contains(currentUserReference),
                  onIcon: Icon(Icons.favorite_rounded, color: Color(0xFFFF3B3B), size: 30),
                  offIcon: Icon(Icons.favorite_border_rounded, color: FlutterFlowTheme.of(context).secondaryText, size: 30),
                ),
                Text(
                  '${post.favoritosUser.length}',
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                SizedBox(width: 24),
                InkWell(
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.9,
                          child: ComentariosWidget(comentarios: post.reference),
                        ),
                      ),
                    ).then((value) => (context as Element).markNeedsBuild());
                  },
                  child: Row(
                    children: [
                      Icon(Icons.chat_bubble_outline_rounded, color: FlutterFlowTheme.of(context).secondaryText, size: 26),
                      SizedBox(width: 8),
                      Text(
                        '${post.comentarios.length}',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                // Tiny avatar stack for likes
                if (post.favoritosUser.isNotEmpty)
                  SizedBox(
                    width: 70,
                    height: 28,
                    child: Stack(
                      children: List.generate(
                        post.favoritosUser.take(4).length,
                        (i) => Positioned(
                          right: i * 14.0,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: FlutterFlowTheme.of(context).secondaryBackground, width: 2),
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: FutureBuilder<UserRecord>(
                                future: UserRecord.getDocumentOnce(post.favoritosUser[post.favoritosUser.length - 1 - i]),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Image.network(snapshot.data!.photoUrl, fit: BoxFit.cover);
                                  }
                                  return Container(color: FlutterFlowTheme.of(context).alternate);
                                }
                              ),
                            ),
                          ),
                        ),
                      ).reversed.toList(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

