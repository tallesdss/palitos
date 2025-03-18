import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<DocumentReference> _produto = [];
  List<DocumentReference> get produto => _produto;
  set produto(List<DocumentReference> value) {
    _produto = value;
  }

  void addToProduto(DocumentReference value) {
    produto.add(value);
  }

  void removeFromProduto(DocumentReference value) {
    produto.remove(value);
  }

  void removeAtIndexFromProduto(int index) {
    produto.removeAt(index);
  }

  void updateProdutoAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    produto[index] = updateFn(_produto[index]);
  }

  void insertAtIndexInProduto(int index, DocumentReference value) {
    produto.insert(index, value);
  }

  double _valor = 0.0;
  double get valor => _valor;
  set valor(double value) {
    _valor = value;
  }

  double _ultimatransacao = 0.0;
  double get ultimatransacao => _ultimatransacao;
  set ultimatransacao(double value) {
    _ultimatransacao = value;
  }

  List<String> _idproduto = [];
  List<String> get idproduto => _idproduto;
  set idproduto(List<String> value) {
    _idproduto = value;
  }

  void addToIdproduto(String value) {
    idproduto.add(value);
  }

  void removeFromIdproduto(String value) {
    idproduto.remove(value);
  }

  void removeAtIndexFromIdproduto(int index) {
    idproduto.removeAt(index);
  }

  void updateIdprodutoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    idproduto[index] = updateFn(_idproduto[index]);
  }

  void insertAtIndexInIdproduto(int index, String value) {
    idproduto.insert(index, value);
  }

  bool _olhos = true;
  bool get olhos => _olhos;
  set olhos(bool value) {
    _olhos = value;
  }

  List<String> _filtrodeerfil = ['Meus Posts', 'Likes'];
  List<String> get filtrodeerfil => _filtrodeerfil;
  set filtrodeerfil(List<String> value) {
    _filtrodeerfil = value;
  }

  void addToFiltrodeerfil(String value) {
    filtrodeerfil.add(value);
  }

  void removeFromFiltrodeerfil(String value) {
    filtrodeerfil.remove(value);
  }

  void removeAtIndexFromFiltrodeerfil(int index) {
    filtrodeerfil.removeAt(index);
  }

  void updateFiltrodeerfilAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filtrodeerfil[index] = updateFn(_filtrodeerfil[index]);
  }

  void insertAtIndexInFiltrodeerfil(int index, String value) {
    filtrodeerfil.insert(index, value);
  }

  List<String> _fotos = [];
  List<String> get fotos => _fotos;
  set fotos(List<String> value) {
    _fotos = value;
  }

  void addToFotos(String value) {
    fotos.add(value);
  }

  void removeFromFotos(String value) {
    fotos.remove(value);
  }

  void removeAtIndexFromFotos(int index) {
    fotos.removeAt(index);
  }

  void updateFotosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    fotos[index] = updateFn(_fotos[index]);
  }

  void insertAtIndexInFotos(int index, String value) {
    fotos.insert(index, value);
  }

  String _imagen = '';
  String get imagen => _imagen;
  set imagen(String value) {
    _imagen = value;
  }

  double _valortotal = 0.0;
  double get valortotal => _valortotal;
  set valortotal(double value) {
    _valortotal = value;
  }

  double _valorcomissao = 0.0;
  double get valorcomissao => _valorcomissao;
  set valorcomissao(double value) {
    _valorcomissao = value;
  }

  List<HistoricocarrinhoStruct> _carrinho = [];
  List<HistoricocarrinhoStruct> get carrinho => _carrinho;
  set carrinho(List<HistoricocarrinhoStruct> value) {
    _carrinho = value;
  }

  void addToCarrinho(HistoricocarrinhoStruct value) {
    carrinho.add(value);
  }

  void removeFromCarrinho(HistoricocarrinhoStruct value) {
    carrinho.remove(value);
  }

  void removeAtIndexFromCarrinho(int index) {
    carrinho.removeAt(index);
  }

  void updateCarrinhoAtIndex(
    int index,
    HistoricocarrinhoStruct Function(HistoricocarrinhoStruct) updateFn,
  ) {
    carrinho[index] = updateFn(_carrinho[index]);
  }

  void insertAtIndexInCarrinho(int index, HistoricocarrinhoStruct value) {
    carrinho.insert(index, value);
  }

  int _quantidadedeitens = 0;
  int get quantidadedeitens => _quantidadedeitens;
  set quantidadedeitens(int value) {
    _quantidadedeitens = value;
  }

  List<GraficoStruct> _chart = [
    GraficoStruct.fromSerializableMap(
        jsonDecode('{\"data\":\"1706767080000\",\"valor\":\"10\"}')),
    GraficoStruct.fromSerializableMap(
        jsonDecode('{\"data\":\"1706853480000\",\"valor\":\"63\"}')),
    GraficoStruct.fromSerializableMap(
        jsonDecode('{\"data\":\"1706939880000\",\"valor\":\"150\"}')),
    GraficoStruct.fromSerializableMap(
        jsonDecode('{\"data\":\"1707803880000\",\"valor\":\"50\"}'))
  ];
  List<GraficoStruct> get chart => _chart;
  set chart(List<GraficoStruct> value) {
    _chart = value;
  }

  void addToChart(GraficoStruct value) {
    chart.add(value);
  }

  void removeFromChart(GraficoStruct value) {
    chart.remove(value);
  }

  void removeAtIndexFromChart(int index) {
    chart.removeAt(index);
  }

  void updateChartAtIndex(
    int index,
    GraficoStruct Function(GraficoStruct) updateFn,
  ) {
    chart[index] = updateFn(_chart[index]);
  }

  void insertAtIndexInChart(int index, GraficoStruct value) {
    chart.insert(index, value);
  }

  List<DiariaStruct> _diariasProdutos = [];
  List<DiariaStruct> get diariasProdutos => _diariasProdutos;
  set diariasProdutos(List<DiariaStruct> value) {
    _diariasProdutos = value;
  }

  void addToDiariasProdutos(DiariaStruct value) {
    diariasProdutos.add(value);
  }

  void removeFromDiariasProdutos(DiariaStruct value) {
    diariasProdutos.remove(value);
  }

  void removeAtIndexFromDiariasProdutos(int index) {
    diariasProdutos.removeAt(index);
  }

  void updateDiariasProdutosAtIndex(
    int index,
    DiariaStruct Function(DiariaStruct) updateFn,
  ) {
    diariasProdutos[index] = updateFn(_diariasProdutos[index]);
  }

  void insertAtIndexInDiariasProdutos(int index, DiariaStruct value) {
    diariasProdutos.insert(index, value);
  }

  double _valorcarrinhototal = 0.0;
  double get valorcarrinhototal => _valorcarrinhototal;
  set valorcarrinhototal(double value) {
    _valorcarrinhototal = value;
  }

  double _valorcarrinhocomissao = 0.0;
  double get valorcarrinhocomissao => _valorcarrinhocomissao;
  set valorcarrinhocomissao(double value) {
    _valorcarrinhocomissao = value;
  }

  int _quantidadeDiaria = 0;
  int get quantidadeDiaria => _quantidadeDiaria;
  set quantidadeDiaria(int value) {
    _quantidadeDiaria = value;
  }

  List<DocumentReference> _listadeitens = [];
  List<DocumentReference> get listadeitens => _listadeitens;
  set listadeitens(List<DocumentReference> value) {
    _listadeitens = value;
  }

  void addToListadeitens(DocumentReference value) {
    listadeitens.add(value);
  }

  void removeFromListadeitens(DocumentReference value) {
    listadeitens.remove(value);
  }

  void removeAtIndexFromListadeitens(int index) {
    listadeitens.removeAt(index);
  }

  void updateListadeitensAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    listadeitens[index] = updateFn(_listadeitens[index]);
  }

  void insertAtIndexInListadeitens(int index, DocumentReference value) {
    listadeitens.insert(index, value);
  }

  List<VendidosStruct> _vendidos = [];
  List<VendidosStruct> get vendidos => _vendidos;
  set vendidos(List<VendidosStruct> value) {
    _vendidos = value;
  }

  void addToVendidos(VendidosStruct value) {
    vendidos.add(value);
  }

  void removeFromVendidos(VendidosStruct value) {
    vendidos.remove(value);
  }

  void removeAtIndexFromVendidos(int index) {
    vendidos.removeAt(index);
  }

  void updateVendidosAtIndex(
    int index,
    VendidosStruct Function(VendidosStruct) updateFn,
  ) {
    vendidos[index] = updateFn(_vendidos[index]);
  }

  void insertAtIndexInVendidos(int index, VendidosStruct value) {
    vendidos.insert(index, value);
  }

  List<AnotacoessStruct> _anotacoes = [];
  List<AnotacoessStruct> get anotacoes => _anotacoes;
  set anotacoes(List<AnotacoessStruct> value) {
    _anotacoes = value;
  }

  void addToAnotacoes(AnotacoessStruct value) {
    anotacoes.add(value);
  }

  void removeFromAnotacoes(AnotacoessStruct value) {
    anotacoes.remove(value);
  }

  void removeAtIndexFromAnotacoes(int index) {
    anotacoes.removeAt(index);
  }

  void updateAnotacoesAtIndex(
    int index,
    AnotacoessStruct Function(AnotacoessStruct) updateFn,
  ) {
    anotacoes[index] = updateFn(_anotacoes[index]);
  }

  void insertAtIndexInAnotacoes(int index, AnotacoessStruct value) {
    anotacoes.insert(index, value);
  }

  String _htmlContent = '';
  String get htmlContent => _htmlContent;
  set htmlContent(String value) {
    _htmlContent = value;
  }

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? value) {
    _startDate = value;
  }

  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? value) {
    _endDate = value;
  }
}
