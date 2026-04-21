import '/backend/backend.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuporteWidget extends StatefulWidget {
  const SuporteWidget({super.key});

  static const String routeName = 'Suporte';
  static const String routePath = '/suporte';

  @override
  State<SuporteWidget> createState() => _SuporteWidgetState();
}

class _SuporteWidgetState extends State<SuporteWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
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
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => context.safePop(),
          ),
          title: Text(
            'Suporte',
            style: GoogleFonts.syne(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0A0A0A), Color(0xFF121212)],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Como podemos ajudar?',
                  style: GoogleFonts.syne(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Relate problemas operacionais, dúvidas ou sugestões para a equipe central.',
                  style: GoogleFonts.dmSans(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 32),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Color(0xFF2D2D2D)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black26,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: TextField(
                      controller: _textController,
                      maxLines: null,
                      expands: true,
                      style: GoogleFonts.dmSans(color: Colors.white, fontSize: 16),
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        hintText: 'Descreva aqui o que aconteceu...',
                        hintStyle: GoogleFonts.dmSans(color: Colors.white24),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                FFButtonWidget(
                  onPressed: () async {
                    if (_textController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Por favor, descreva o problema.'),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                      return;
                    }
                    
                    await ReportarRecord.collection.add(createReportarRecordData(
                      user: currentUserReference,
                      texto: _textController.text,
                      data: getCurrentTimestamp,
                    ));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Sua mensagem foi enviada. Obrigado!'),
                        backgroundColor: Color(0xFF7F00FF),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    context.safePop();
                  },
                  text: 'Enviar Mensagem',
                  icon: Icon(Icons.send_rounded, size: 18),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 56.0,
                    color: Color(0xFF7F00FF),
                    textStyle: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                    elevation: 4,
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    'Retorno em até 24h úteis',
                    style: GoogleFonts.dmSans(
                      color: Colors.white24,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
