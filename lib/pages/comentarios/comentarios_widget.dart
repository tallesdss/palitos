import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'comentarios_model.dart';
export 'comentarios_model.dart';

class ComentariosWidget extends StatefulWidget {
  const ComentariosWidget({
    super.key,
    required this.comentarios,
  });

  final DocumentReference? comentarios;

  @override
  State<ComentariosWidget> createState() => _ComentariosWidgetState();
}

class _ComentariosWidgetState extends State<ComentariosWidget> {
  late ComentariosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComentariosModel());

    _model.postarcomentariopsTextController ??= TextEditingController();
    _model.postarcomentariopsFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostagemRecord>(
      stream: PostagemRecord.getDocument(widget.comentarios!),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }

        final containerPostagemRecord = snapshot.data!;
        final commentsList = containerPostagemRecord.comentarios;

        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF12141C).withValues(alpha: 0.85),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.08),
                  width: 1.0,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                   // Handle
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 8.0),
                    child: Container(
                      width: 40.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF5C5A6A).withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  
                  // Header
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ComentÃ¡rios',
                          style: GoogleFonts.syne(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFFF0EFFB),
                            letterSpacing: -0.5,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFF222535),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                            ),
                            child: Icon(
                              Icons.close_rounded,
                              color: Color(0xFF9896A8),
                              size: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: commentsList.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF6B5FEF).withValues(alpha: 0.05),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.commentDots,
                                    color: Color(0xFF6B5FEF).withValues(alpha: 0.5),
                                    size: 40.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                                  child: Text(
                                    'Nenhum comentÃ¡rio ainda.\nSeja o primeiro a interagir!',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.dmSans(
                                      color: Color(0xFF9896A8),
                                      fontSize: 14.0,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.separated(
                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 120.0),
                            itemCount: commentsList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 20.0),
                            itemBuilder: (context, index) {
                              final comment = commentsList[index];
                              return FutureBuilder<UserRecord>(
                                future: UserRecord.getDocumentOnce(comment.dono!),
                                builder: (context, userSnap) {
                                  final userName = userSnap.data?.displayName ?? 'UsuÃ¡rio';
                                  final userPhoto = userSnap.data?.photoUrl ?? '';
                                  
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFF6B5FEF).withValues(alpha: 0.3),
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(shape: BoxShape.circle),
                                            child: Image.network(
                                              userPhoto.isNotEmpty ? userPhoto : 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12.0),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(14.0),
                                              decoration: BoxDecoration(
                                                color: Color(0xFF1A1D28),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4),
                                                  topRight: Radius.circular(20.0),
                                                  bottomLeft: Radius.circular(20.0),
                                                  bottomRight: Radius.circular(20.0),
                                                ),
                                                border: Border.all(
                                                  color: Colors.white.withValues(alpha: 0.04),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    userName,
                                                    style: GoogleFonts.syne(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 13.0,
                                                      color: Color(0xFFF0EFFB),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                    child: Text(
                                                      comment.texto,
                                                      style: GoogleFonts.dmSans(
                                                        color: Color(0xFF9896A8),
                                                        fontSize: 14.5,
                                                        height: 1.5,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 6.0, 0.0, 0.0),
                                              child: Text(
                                                dateTimeFormat('relative', comment.data!),
                                                style: GoogleFonts.dmSans(
                                                      fontSize: 11.0,
                                                      color: Color(0xFF5C5A6A),
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                  ),

                  // Input Area
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(24, 16, 24, 32),
                    decoration: BoxDecoration(
                      color: Color(0xFF12141C),
                      border: Border(
                        top: BorderSide(color: Colors.white.withValues(alpha: 0.06), width: 1),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.postarcomentariopsTextController,
                            focusNode: _model.postarcomentariopsFocusNode,
                            decoration: InputDecoration(
                              hintText: 'Digite sua mensagem...',
                              hintStyle: GoogleFonts.dmSans(
                                    color: Color(0xFF5C5A6A),
                                    fontSize: 14,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withValues(alpha: 0.06),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF6B5FEF),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFF1A1D28),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 12.0),
                            ),
                            style: GoogleFonts.dmSans(color: Color(0xFFF0EFFB)),
                            maxLines: null,
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              if (_model.postarcomentariopsTextController.text.isEmpty) return;
                              
                              final newComment = createComentarioStruct(
                                dono: currentUserReference,
                                texto: _model.postarcomentariopsTextController.text,
                                data: getCurrentTimestamp,
                              );
                              
                              await widget.comentarios!.update({
                                'comentarios': FieldValue.arrayUnion([getComentarioFirestoreData(newComment, true)]),
                              });
                              
                              _model.postarcomentariopsTextController?.clear();
                              FocusScope.of(context).unfocus();
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(100.0),
                            child: Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF6B5FEF),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 12.0,
                                    color: Color(0xFF6B5FEF).withValues(alpha: 0.3),
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                              child: Icon(
                                Icons.send_rounded,
                                color: Colors.white,
                                size: 20.0,
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
      },
    );
  }
}

