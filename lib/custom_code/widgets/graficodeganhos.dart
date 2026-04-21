// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class Graficodeganhos extends StatefulWidget {
  const Graficodeganhos({
    super.key,
    this.width,
    this.height,
    required this.historico,
  });

  final double? width;
  final double? height;
  final List<HistoricoRecord> historico;

  @override
  State<Graficodeganhos> createState() => _GraficodeganhosState();
}

class _GraficodeganhosState extends State<Graficodeganhos> {
  // Estado para rastrear a posiÃ§Ã£o do toque/mouse
  int? _hoverIndex;
  Offset? _hoverPosition;

  @override
  Widget build(BuildContext context) {
    // Verificar se hÃ¡ dados
    if (widget.historico.isEmpty) {
      return Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? 300,
        alignment: Alignment.center,
        child: const Text('Sem dados disponÃ­veis para exibir'),
      );
    }

    // Ordenar dados por data
    final sortedData = List<HistoricoRecord>.from(widget.historico);
    sortedData.sort((a, b) {
      if (a.data == null && b.data == null) return 0;
      if (a.data == null) return -1;
      if (b.data == null) return 1;
      return a.data!
          .compareTo(b.data!); // Corrigido: adicionado ! para garantir nÃ£o-nulo
    });

    // Encontrar valores mÃ¡ximos para dimensionamento
    double maxComissao = 0;
    for (var item in sortedData) {
      if ((item.comissaoFinal ?? 0) > maxComissao) {
        maxComissao = item.comissaoFinal ?? 0;
      }
    }

    // Se nÃ£o houver comissÃµes, exibir mensagem
    if (maxComissao <= 0) {
      return Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? 300,
        alignment: Alignment.center,
        child: const Text('Sem comissÃµes registradas'),
      );
    }

    // Adicionar um pouco de espaÃ§o acima do valor mÃ¡ximo
    maxComissao *= 1.2;

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'EvoluÃ§Ã£o de ComissÃµes',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return GestureDetector(
                  onPanUpdate: (details) {
                    // Detecta a posiÃ§Ã£o do toque/arraste e encontra o ponto mais prÃ³ximo
                    _updateHoverPosition(details.localPosition,
                        constraints.maxWidth, sortedData.length);
                  },
                  onTapDown: (details) {
                    // Detecta o toque e encontra o ponto mais prÃ³ximo
                    _updateHoverPosition(details.localPosition,
                        constraints.maxWidth, sortedData.length);
                  },
                  onPanEnd: (_) {
                    // Limpa a posiÃ§Ã£o quando o toque termina
                    setState(() {
                      _hoverIndex = null;
                      _hoverPosition = null;
                    });
                  },
                  onTapUp: (_) {
                    // MantÃ©m a posiÃ§Ã£o apÃ³s o toque para mostrar o tooltip
                    // Opcionalmente, vocÃª pode querer limpar apÃ³s um atraso
                    // Future.delayed(Duration(seconds: 3), () {
                    //   setState(() {
                    //     _hoverIndex = null;
                    //     _hoverPosition = null;
                    //   });
                    // });
                  },
                  child: Stack(
                    children: [
                      // GrÃ¡fico principal
                      CustomPaint(
                        size: Size(constraints.maxWidth, constraints.maxHeight),
                        painter: GraficoCustomPainter(
                          sortedData: sortedData,
                          maxComissao: maxComissao,
                          corPrimaria: FlutterFlowTheme.of(context).primary,
                          context: context,
                          hoverIndex: _hoverIndex,
                          hoverPosition: _hoverPosition,
                        ),
                      ),

                      // Tooltip / Caixa de informaÃ§Ãµes
                      if (_hoverIndex != null &&
                          _hoverIndex! < sortedData.length &&
                          _hoverPosition != null)
                        Positioned(
                          left: _posicionarTooltip(
                              _hoverPosition!.dx, constraints.maxWidth),
                          top: _hoverPosition!.dy -
                              70, // Posiciona acima do ponto
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  sortedData[_hoverIndex!].data != null
                                      ? DateFormat('dd/MM/yyyy').format(
                                          sortedData[_hoverIndex!].data!)
                                      : 'Data nÃ£o disponÃ­vel',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'R\$${(sortedData[_hoverIndex!].comissaoFinal ?? 0).toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          // Legenda de datas
          SizedBox(
            height: 20,
            child: sortedData.isEmpty
                ? const SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (sortedData.first.data != null)
                        Text(
                          DateFormat('dd/MM').format(sortedData.first.data!),
                          style: TextStyle(
                            fontSize: 10,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      if (sortedData.length > 1 && sortedData.last.data != null)
                        Text(
                          DateFormat('dd/MM').format(sortedData.last.data!),
                          style: TextStyle(
                            fontSize: 10,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  // MÃ©todo para atualizar a posiÃ§Ã£o do hover com base na entrada do usuÃ¡rio
  void _updateHoverPosition(Offset position, double width, int dataLength) {
    if (dataLength <= 1) return;

    // Calcula o Ã­ndice com base na posiÃ§Ã£o horizontal
    final double segmentWidth = width / (dataLength - 1);
    int index = (position.dx / segmentWidth).round();

    // Garante que o Ã­ndice estÃ¡ dentro dos limites
    index = index.clamp(0, dataLength - 1);

    setState(() {
      _hoverIndex = index;
      _hoverPosition = position;
    });
  }

  // Ajusta a posiÃ§Ã£o do tooltip para evitar que ele saia da tela
  double _posicionarTooltip(double x, double maxWidth) {
    const tooltipWidth = 120; // Largura estimada do tooltip

    // Se o tooltip ultrapassar a borda direita
    if (x + tooltipWidth > maxWidth) {
      return maxWidth - tooltipWidth;
    }

    // Se o tooltip ultrapassar a borda esquerda
    if (x - tooltipWidth / 2 < 0) {
      return 0;
    }

    // Centraliza o tooltip no ponto
    return x - tooltipWidth / 2;
  }
}

// Custom Painter para desenhar o grÃ¡fico
class GraficoCustomPainter extends CustomPainter {
  final List<HistoricoRecord> sortedData;
  final double maxComissao;
  final Color corPrimaria;
  final BuildContext context;
  final int? hoverIndex; // Ãndice do ponto sobre o qual o mouse estÃ¡
  final Offset? hoverPosition; // PosiÃ§Ã£o exata do mouse/toque

  GraficoCustomPainter({
    required this.sortedData,
    required this.maxComissao,
    required this.corPrimaria,
    required this.context,
    this.hoverIndex,
    this.hoverPosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = corPrimaria
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final fillPaint = Paint()
      ..color = corPrimaria.withValues(alpha: 0.2)
      ..style = PaintingStyle.fill;

    final gridPaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final crosshairPaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    // Desenhar linhas de grade horizontais
    for (int i = 0; i <= 4; i++) {
      double y = size.height - (i * size.height / 4);
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }

    // Verificar se hÃ¡ dados para desenhar
    if (sortedData.isEmpty) return;

    // Criar o caminho para a linha do grÃ¡fico
    final path = Path();
    final fillPath = Path();

    // Iniciar o caminho na base
    fillPath.moveTo(0, size.height);

    // Lista para armazenar as coordenadas de cada ponto
    List<Offset> points = [];

    for (int i = 0; i < sortedData.length; i++) {
      double x = i * size.width / (sortedData.length - 1);
      double comissao = sortedData[i].comissaoFinal ?? 0;
      double y = size.height - (comissao / maxComissao * size.height);

      // Armazena o ponto para uso posterior
      points.add(Offset(x, y));

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }

      // Desenhar ponto
      canvas.drawCircle(
        Offset(x, y),
        4,
        Paint()..color = corPrimaria,
      );

      // Destacar o ponto selecionado
      if (hoverIndex == i) {
        canvas.drawCircle(
          Offset(x, y),
          6,
          Paint()..color = Colors.white,
        );
        canvas.drawCircle(
          Offset(x, y),
          5,
          Paint()..color = corPrimaria,
        );
      }
    }

    // Completar o caminho de preenchimento
    fillPath.lineTo(size.width, size.height);
    fillPath.close();

    // Desenhar o grÃ¡fico
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);

    // Desenhar valores no eixo Y
    final textStyle = TextStyle(
      color: Colors.grey,
      fontSize: 10,
    );

    for (int i = 0; i <= 4; i++) {
      double valor = (maxComissao * i / 4);
      double y = size.height - (i * size.height / 4);

      // Desenhar texto usando o mÃ©todo alternativo
      final texto = 'R\$${valor.toInt()}';
      final textSpan = TextSpan(
        text: texto,
        style: textStyle,
      );

      // Usando o Directionality do contexto para obter a direÃ§Ã£o do texto
      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.right,
        textDirection: Directionality.of(context),
      );

      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(-textPainter.width - 4, y - textPainter.height / 2),
      );
    }

    // Desenhar linhas de crosshair (linha de referÃªncia)
    if (hoverIndex != null && hoverIndex! < points.length) {
      final point = points[hoverIndex!];

      // Linha vertical
      canvas.drawLine(
        Offset(point.dx, 0),
        Offset(point.dx, size.height),
        crosshairPaint,
      );

      // Linha horizontal
      canvas.drawLine(
        Offset(0, point.dy),
        Offset(size.width, point.dy),
        crosshairPaint,
      );
    }
  }

  @override
  bool shouldRepaint(GraficoCustomPainter oldDelegate) {
    return oldDelegate.hoverIndex != hoverIndex ||
        oldDelegate.hoverPosition != hoverPosition ||
        oldDelegate.sortedData != sortedData;
  }
}

