import '/backend/backend.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VendaRapidaWidget extends StatefulWidget {
  const VendaRapidaWidget({super.key});

  static const String routeName = 'VendaRapida';
  static const String routePath = '/vendaRapida';

  @override
  State<VendaRapidaWidget> createState() => _VendaRapidaWidgetState();
}

class _VendaRapidaWidgetState extends State<VendaRapidaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0A0B10),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => context.safePop(),
          ),
          title: Text(
            'Venda RÃ¡pida',
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
              colors: [Color(0xFF0A0B10), Color(0xFF12141C)],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
          child: StreamBuilder<List<HistoricoRecord>>(
            stream: queryHistoricoRecord(
              queryBuilder: (historico) => historico
                  .where('refeVendedor', isEqualTo: currentUserReference)
                  .where('valorpagofinal', isEqualTo: 0.0)
                  .orderBy('data', descending: true),
              limit: 1,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: Color(0xFF7F00FF)));
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inventory_2_outlined, color: Color(0xFF8E8E93), size: 64),
                      SizedBox(height: 16),
                      Text(
                        'Nenhuma sessÃ£o ativa encontrada.',
                        style: GoogleFonts.dmSans(color: Colors.white70, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Carregue seu carrinho primeiro.',
                        style: GoogleFonts.dmSans(color: Color(0xFF8E8E93), fontSize: 14),
                      ),
                    ],
                  ),
                );
              }

              final session = snapshot.data!.first;
              final diarias = session.diarias;

              return GridView.builder(
                padding: EdgeInsets.all(24),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: diarias.length,
                itemBuilder: (context, index) {
                  final item = diarias[index];
                  return _buildQuickSaleCard(session, item, index);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildQuickSaleCard(HistoricoRecord session, DiariaStruct item, int index) {
    final bool canSell = item.vendidosFinal < item.quantidade;

    return InkWell(
      onTap: canSell ? () => _registerSale(session, index) : null,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xFF1A1D28),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: canSell ? Color(0xFF222535) : Color(0x4DE84040),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      item.imagem != ''
                          ? item.imagem
                          : 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=200&h=200&fit=crop',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  if (!canSell)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'ESGOTADO',
                          style: GoogleFonts.syne(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Text(
              item.nome,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.syne(
                color: Color(0xFFF0EFFB),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag_outlined,
                    color: Color(0xFF6B5FEF), size: 12),
                SizedBox(width: 4),
                Text(
                  '${item.vendidosFinal} / ${item.quantidade}',
                  style: GoogleFonts.dmSans(
                    color: Color(0xFF6B5FEF),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _registerSale(HistoricoRecord session, int index) async {
    try {
      List<DiariaStruct> updatedList = List.from(session.diarias);
      final current = updatedList[index];
      
      final newSold = current.vendidosFinal + 1;
      final newReturned = current.quantidade - newSold;

      updatedList[index] = createDiariaStruct(
        produto: current.produto,
        valor: current.valor,
        quantidade: current.quantidade,
        nome: current.nome,
        imagem: current.imagem,
        comissaokit: current.comissaokit,
        totalkit: current.totalkit,
        porcentagemkit: current.porcentagemkit,
        quantidadefinal: newReturned,
        vendidosFinal: newSold,
        valorvendidoFinal: newSold * current.valor,
        comissaoFinal: newSold * current.comissaokit,
      );

      await session.reference.update({
        'diarias': getDiariaListFirestoreData(updatedList),
      });

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Venda registrada: ${current.nome}'),
          duration: Duration(milliseconds: 700),
          backgroundColor: Color(0xFF7F00FF),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    } catch (e) {
      showSnackbar(context, 'Erro ao registrar venda: $e');
    }
  }
}

