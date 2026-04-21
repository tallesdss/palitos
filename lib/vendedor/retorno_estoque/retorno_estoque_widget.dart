import '/backend/backend.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RetornoEstoqueWidget extends StatefulWidget {
  const RetornoEstoqueWidget({
    super.key,
    required this.historico,
  });

  final HistoricoRecord historico;

  static const String routeName = 'RetornoEstoque';
  static const String routePath = '/retornoEstoque';

  @override
  State<RetornoEstoqueWidget> createState() => _RetornoEstoqueWidgetState();
}

class _RetornoEstoqueWidgetState extends State<RetornoEstoqueWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Map<int, TextEditingController> _controllers;
  late List<DiariaStruct> _diarias;

  @override
  void initState() {
    super.initState();
    _diarias = List.from(widget.historico.diarias);
    _controllers = {};
    for (int i = 0; i < _diarias.length; i++) {
      _controllers[i] = TextEditingController(text: '0');
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  int get totalSoldUnits {
    int total = 0;
    _controllers.forEach((index, controller) {
      total += int.tryParse(controller.text) ?? 0;
    });
    return total;
  }

  double get totalSoldValue {
    double total = 0;
    for (int i = 0; i < _diarias.length; i++) {
      int sold = int.tryParse(_controllers[i]!.text) ?? 0;
      total += sold * _diarias[i].valor;
    }
    return total;
  }

  double get totalCommission {
    double total = 0;
    for (int i = 0; i < _diarias.length; i++) {
      int sold = int.tryParse(_controllers[i]!.text) ?? 0;
      total += sold * _diarias[i].comissaokit;
    }
    return total;
  }

  Future<void> _finalizarDia() async {
    // Validate inputs
    for (int i = 0; i < _diarias.length; i++) {
      int sold = int.tryParse(_controllers[i]!.text) ?? 0;
      if (sold > _diarias[i].quantidade) {
        showSnackbar(context, 'A quantidade vendida de ${_diarias[i].nome} não pode ser maior que a carregada (${_diarias[i].quantidade}).');
        return;
      }
    }

    showSnackbar(context, 'Finalizando sessão...', loading: true);

    try {
      // 1. Prepare updated diarias list
      List<DiariaStruct> updatedDiarias = [];
      for (int i = 0; i < _diarias.length; i++) {
        int sold = int.tryParse(_controllers[i]!.text) ?? 0;
        int returned = _diarias[i].quantidade - sold;
        
        updatedDiarias.add(createDiariaStruct(
          produto: _diarias[i].produto,
          valor: _diarias[i].valor,
          quantidade: _diarias[i].quantidade,
          nome: _diarias[i].nome,
          imagem: _diarias[i].imagem,
          comissaokit: _diarias[i].comissaokit,
          totalkit: _diarias[i].totalkit,
          porcentagemkit: _diarias[i].porcentagemkit,
          quantidadefinal: returned,
          vendidosFinal: sold,
          valorvendidoFinal: sold * _diarias[i].valor,
          comissaoFinal: sold * _diarias[i].comissaokit,
        ));
      }

      final totalVendidoVal = totalSoldValue;
      final totalComissaoVal = totalCommission;

      // 2. Update HistoricoRecord
      await widget.historico.reference.update({
        ...createHistoricoRecordData(
          valorFinalcarga: totalVendidoVal,
          comissaoFinal: totalComissaoVal,
          valorpagofinal: 1.0, // Mark as closed (active session query uses == 0)
        ),
        'diarias': getDiariaListFirestoreData(updatedDiarias),
      });

      // 3. Update User Balance (Comissão)
      await currentUserReference!.update({
        'saldo': FieldValue.increment(totalComissaoVal),
      });

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      showSnackbar(context, 'Sessão finalizada com sucesso! Boas vendas!');
      
      context.goNamed('VendedorAdm');
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      showSnackbar(context, 'Erro ao finalizar: $e');
    }
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
            'Finalizar Dia',
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
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(24, 12, 24, 24),
                  itemCount: _diarias.length,
                  itemBuilder: (context, index) {
                    final diaria = _diarias[index];
                    return _buildProductItem(index, diaria);
                  },
                ),
              ),
              _buildBottomSummary(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem(int index, DiariaStruct diaria) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF2D2D2D)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              diaria.imagem != '' ? diaria.imagem : 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=100&h=100&fit=crop',
              width: 60,
              height: 60,
              fit: BoxType.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  diaria.nome,
                  style: GoogleFonts.syne(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Carga: ${diaria.quantidade} unid.',
                  style: GoogleFonts.dmSans(
                    color: Color(0xFF8E8E93),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Vendidos',
                style: GoogleFonts.dmSans(
                  color: Color(0xFF8E8E93),
                  fontSize: 10,
                ),
              ),
              SizedBox(height: 4),
              Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF262626),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _controllers[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.syne(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSummary() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 20,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSummaryStat('Vendas', 'R\$ ${formatNumber(totalSoldValue, formatType: FormatType.decimal)}', Icons.payments_rounded),
              _buildSummaryStat('Comissão', 'R\$ ${formatNumber(totalCommission, formatType: FormatType.decimal)}', Icons.stars_rounded),
            ],
          ),
          SizedBox(height: 24),
          FFButtonWidget(
            onPressed: _finalizarDia,
            text: 'Finalizar e Receber',
            options: FFButtonOptions(
              width: double.infinity,
              height: 56,
              color: Color(0xFF7F00FF),
              textStyle: GoogleFonts.syne(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              borderRadius: BorderRadius.circular(16),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryStat(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Color(0xFF8E8E93), size: 14),
            SizedBox(width: 4),
            Text(
              label,
              style: GoogleFonts.dmSans(
                color: Color(0xFF8E8E93),
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.syne(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
