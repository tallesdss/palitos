import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'criarpostagem_model.dart';
export 'criarpostagem_model.dart';

class CriarpostagemWidget extends StatefulWidget {
  const CriarpostagemWidget({super.key});

  @override
  State<CriarpostagemWidget> createState() => _CriarpostagemWidgetState();
}

class _CriarpostagemWidgetState extends State<CriarpostagemWidget> {
  late CriarpostagemModel _model;
  String _selectedTipo = 'post';



  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CriarpostagemModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF12141C).withValues(alpha: 0.8),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Indicator
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Color(0xFF5C5A6A).withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              
              // Header
              Padding(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nova Postagem',
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
                        child: Icon(Icons.close_rounded, size: 18, color: Color(0xFF9896A8)),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tipo selector
                        Text(
                          'CATEGORIA',
                          style: GoogleFonts.syne(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: Color(0xFF9896A8),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Geral
                            _buildCategoryItem(
                              'post', 
                              'Geral', 
                              Icons.chat_bubble_outline_rounded,
                              Color(0xFF6B5FEF),
                            ),
                            SizedBox(width: 12),
                            // Conquista
                            _buildCategoryItem(
                              'conquista', 
                              'Conquista', 
                              Icons.emoji_events_outlined,
                              Color(0xFFF5A623),
                            ),
                            SizedBox(width: 12),
                            // Dica
                            _buildCategoryItem(
                              'dica', 
                              'Dica', 
                              Icons.lightbulb_outline_rounded,
                              Color(0xFF1FBF7A),
                            ),
                          ],
                        ),

                        SizedBox(height: 32),

                        // Input Field Label
                        Text(
                          'MENSAGEM',
                          style: GoogleFonts.syne(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: Color(0xFF9896A8),
                          ),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          decoration: InputDecoration(
                            hintText: 'O que estÃ¡ acontecendo?',
                            hintStyle: GoogleFonts.dmSans(color: Color(0xFF5C5A6A), fontSize: 14),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.06), width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6B5FEF), width: 1.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Color(0xFF1A1D28),
                            contentPadding: EdgeInsets.all(16),
                          ),
                          style: GoogleFonts.dmSans(color: Color(0xFFF0EFFB), fontSize: 15),
                          maxLines: 5,
                        ),

                        SizedBox(height: 24),

                        // Media upload
                        InkWell(
                          onTap: () async {
                            final selectedMedia = await selectMedia(
                              mediaSource: MediaSource.photoGallery,
                              multiImage: false,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) =>
                                    validateFileFormat(m.storagePath, context))) {
                              safeSetState(() => _model.isDataUploading = true);
                              var downloadUrls = <String>[];
                              try {
                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async =>
                                        await uploadData(m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                _model.isDataUploading = false;
                              }
                              if (downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                              }
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 160,
                            decoration: BoxDecoration(
                              color: Color(0xFF1A1D28),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: _model.uploadedFileUrl.isNotEmpty
                                  ? Color(0xFF6B5FEF).withValues(alpha: 0.3)
                                  : Colors.white.withValues(alpha: 0.06), 
                                width: 1, 
                                style: BorderStyle.solid
                              ),
                              image: _model.uploadedFileUrl.isNotEmpty
                                ? DecorationImage(
                                    image: CachedNetworkImageProvider(_model.uploadedFileUrl),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            ),
                            child: _model.uploadedFileUrl.isNotEmpty
                              ? null
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF6B5FEF).withValues(alpha: 0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.add_a_photo_outlined, size: 28, color: Color(0xFF6B5FEF)),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      'Adicionar Foto',
                                      style: GoogleFonts.syne(
                                        color: Color(0xFFF0EFFB),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'PNG, JPG atÃ© 10MB',
                                      style: GoogleFonts.dmSans(
                                        color: Color(0xFF5C5A6A),
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                          ),
                        ),
                        
                        if (_model.isDataUploading)
                          Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: LinearProgressIndicator(
                                color: Color(0xFF6B5FEF),
                                backgroundColor: Color(0xFF1A1D28),
                                minHeight: 6,
                              ),
                            ),
                          ),

                        SizedBox(height: 40),

                        // Post Button
                        FFButtonWidget(
                          onPressed: () async {
                            if (_model.textController.text.isEmpty && (_model.uploadedFileUrl.isEmpty)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Escreva algo ou adicione uma foto!'),
                                  backgroundColor: Color(0xFFE84040),
                                ),
                              );
                              return;
                            }
                            await PostagemRecord.collection
                                .doc()
                                .set(createPostagemRecordData(
                                  data: getCurrentTimestamp,
                                  descricao: _model.textController.text,
                                  dono: currentUserReference,
                                  nomedono: currentUserDisplayName,
                                  imagem: _model.uploadedFileUrl,
                                  fotourl: currentUserPhoto,
                                  tipo: _selectedTipo,
                                ));
                            Navigator.pop(context);
                          },
                          text: 'Publicar Agora',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 56,
                            color: Color(0xFF6B5FEF),
                            textStyle: GoogleFonts.syne(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                            elevation: 8,
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
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

  Widget _buildCategoryItem(String key, String label, IconData icon, Color color) {
    bool isSelected = _selectedTipo == key;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _selectedTipo = key),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected 
              ? color.withValues(alpha: 0.15) 
              : Color(0xFF1A1D28),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? color : Colors.white.withValues(alpha: 0.05),
              width: 1.5,
            ),
            boxShadow: isSelected ? [
              BoxShadow(
                color: color.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              )
            ] : [],
          ),
          child: Column(
            children: [
              Icon(
                icon, 
                size: 24,
                color: isSelected ? color : Color(0xFF9896A8),
              ),
              SizedBox(height: 8),
              Text(
                label,
                style: GoogleFonts.syne(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                  color: isSelected ? color : Color(0xFF9896A8),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

