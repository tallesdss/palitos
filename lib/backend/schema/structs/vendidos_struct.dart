// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class VendidosStruct extends FFFirebaseStruct {
  VendidosStruct({
    DocumentReference? produto,
    double? valor,
    int? quantidade,
    String? nome,
    String? imagem,
    double? comissaokit,
    double? totalkit,
    double? porcentagemkit,
    int? quantidadefinal,
    int? vendidosFinal,
    double? comissaoFinal,
    double? porcentdaComissao,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _produto = produto,
        _valor = valor,
        _quantidade = quantidade,
        _nome = nome,
        _imagem = imagem,
        _comissaokit = comissaokit,
        _totalkit = totalkit,
        _porcentagemkit = porcentagemkit,
        _quantidadefinal = quantidadefinal,
        _vendidosFinal = vendidosFinal,
        _comissaoFinal = comissaoFinal,
        _porcentdaComissao = porcentdaComissao,
        super(firestoreUtilData);

  // "produto" field.
  DocumentReference? _produto;
  DocumentReference? get produto => _produto;
  set produto(DocumentReference? val) => _produto = val;

  bool hasProduto() => _produto != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;

  void incrementValor(double amount) => valor = valor + amount;

  bool hasValor() => _valor != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  set quantidade(int? val) => _quantidade = val;

  void incrementQuantidade(int amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  set imagem(String? val) => _imagem = val;

  bool hasImagem() => _imagem != null;

  // "comissaokit" field.
  double? _comissaokit;
  double get comissaokit => _comissaokit ?? 0.0;
  set comissaokit(double? val) => _comissaokit = val;

  void incrementComissaokit(double amount) =>
      comissaokit = comissaokit + amount;

  bool hasComissaokit() => _comissaokit != null;

  // "totalkit" field.
  double? _totalkit;
  double get totalkit => _totalkit ?? 0.0;
  set totalkit(double? val) => _totalkit = val;

  void incrementTotalkit(double amount) => totalkit = totalkit + amount;

  bool hasTotalkit() => _totalkit != null;

  // "porcentagemkit" field.
  double? _porcentagemkit;
  double get porcentagemkit => _porcentagemkit ?? 0.0;
  set porcentagemkit(double? val) => _porcentagemkit = val;

  void incrementPorcentagemkit(double amount) =>
      porcentagemkit = porcentagemkit + amount;

  bool hasPorcentagemkit() => _porcentagemkit != null;

  // "quantidadefinal" field.
  int? _quantidadefinal;
  int get quantidadefinal => _quantidadefinal ?? 0;
  set quantidadefinal(int? val) => _quantidadefinal = val;

  void incrementQuantidadefinal(int amount) =>
      quantidadefinal = quantidadefinal + amount;

  bool hasQuantidadefinal() => _quantidadefinal != null;

  // "vendidosFinal" field.
  int? _vendidosFinal;
  int get vendidosFinal => _vendidosFinal ?? 0;
  set vendidosFinal(int? val) => _vendidosFinal = val;

  void incrementVendidosFinal(int amount) =>
      vendidosFinal = vendidosFinal + amount;

  bool hasVendidosFinal() => _vendidosFinal != null;

  // "comissaoFinal" field.
  double? _comissaoFinal;
  double get comissaoFinal => _comissaoFinal ?? 0.0;
  set comissaoFinal(double? val) => _comissaoFinal = val;

  void incrementComissaoFinal(double amount) =>
      comissaoFinal = comissaoFinal + amount;

  bool hasComissaoFinal() => _comissaoFinal != null;

  // "porcentdaComissao" field.
  double? _porcentdaComissao;
  double get porcentdaComissao => _porcentdaComissao ?? 0.0;
  set porcentdaComissao(double? val) => _porcentdaComissao = val;

  void incrementPorcentdaComissao(double amount) =>
      porcentdaComissao = porcentdaComissao + amount;

  bool hasPorcentdaComissao() => _porcentdaComissao != null;

  static VendidosStruct fromMap(Map<String, dynamic> data) => VendidosStruct(
        produto: data['produto'] as DocumentReference?,
        valor: castToType<double>(data['valor']),
        quantidade: castToType<int>(data['quantidade']),
        nome: data['nome'] as String?,
        imagem: data['imagem'] as String?,
        comissaokit: castToType<double>(data['comissaokit']),
        totalkit: castToType<double>(data['totalkit']),
        porcentagemkit: castToType<double>(data['porcentagemkit']),
        quantidadefinal: castToType<int>(data['quantidadefinal']),
        vendidosFinal: castToType<int>(data['vendidosFinal']),
        comissaoFinal: castToType<double>(data['comissaoFinal']),
        porcentdaComissao: castToType<double>(data['porcentdaComissao']),
      );

  static VendidosStruct? maybeFromMap(dynamic data) =>
      data is Map ? VendidosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'produto': _produto,
        'valor': _valor,
        'quantidade': _quantidade,
        'nome': _nome,
        'imagem': _imagem,
        'comissaokit': _comissaokit,
        'totalkit': _totalkit,
        'porcentagemkit': _porcentagemkit,
        'quantidadefinal': _quantidadefinal,
        'vendidosFinal': _vendidosFinal,
        'comissaoFinal': _comissaoFinal,
        'porcentdaComissao': _porcentdaComissao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'produto': serializeParam(
          _produto,
          ParamType.DocumentReference,
        ),
        'valor': serializeParam(
          _valor,
          ParamType.double,
        ),
        'quantidade': serializeParam(
          _quantidade,
          ParamType.int,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'imagem': serializeParam(
          _imagem,
          ParamType.String,
        ),
        'comissaokit': serializeParam(
          _comissaokit,
          ParamType.double,
        ),
        'totalkit': serializeParam(
          _totalkit,
          ParamType.double,
        ),
        'porcentagemkit': serializeParam(
          _porcentagemkit,
          ParamType.double,
        ),
        'quantidadefinal': serializeParam(
          _quantidadefinal,
          ParamType.int,
        ),
        'vendidosFinal': serializeParam(
          _vendidosFinal,
          ParamType.int,
        ),
        'comissaoFinal': serializeParam(
          _comissaoFinal,
          ParamType.double,
        ),
        'porcentdaComissao': serializeParam(
          _porcentdaComissao,
          ParamType.double,
        ),
      }.withoutNulls;

  static VendidosStruct fromSerializableMap(Map<String, dynamic> data) =>
      VendidosStruct(
        produto: deserializeParam(
          data['produto'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['produtos'],
        ),
        valor: deserializeParam(
          data['valor'],
          ParamType.double,
          false,
        ),
        quantidade: deserializeParam(
          data['quantidade'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        imagem: deserializeParam(
          data['imagem'],
          ParamType.String,
          false,
        ),
        comissaokit: deserializeParam(
          data['comissaokit'],
          ParamType.double,
          false,
        ),
        totalkit: deserializeParam(
          data['totalkit'],
          ParamType.double,
          false,
        ),
        porcentagemkit: deserializeParam(
          data['porcentagemkit'],
          ParamType.double,
          false,
        ),
        quantidadefinal: deserializeParam(
          data['quantidadefinal'],
          ParamType.int,
          false,
        ),
        vendidosFinal: deserializeParam(
          data['vendidosFinal'],
          ParamType.int,
          false,
        ),
        comissaoFinal: deserializeParam(
          data['comissaoFinal'],
          ParamType.double,
          false,
        ),
        porcentdaComissao: deserializeParam(
          data['porcentdaComissao'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'VendidosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VendidosStruct &&
        produto == other.produto &&
        valor == other.valor &&
        quantidade == other.quantidade &&
        nome == other.nome &&
        imagem == other.imagem &&
        comissaokit == other.comissaokit &&
        totalkit == other.totalkit &&
        porcentagemkit == other.porcentagemkit &&
        quantidadefinal == other.quantidadefinal &&
        vendidosFinal == other.vendidosFinal &&
        comissaoFinal == other.comissaoFinal &&
        porcentdaComissao == other.porcentdaComissao;
  }

  @override
  int get hashCode => const ListEquality().hash([
        produto,
        valor,
        quantidade,
        nome,
        imagem,
        comissaokit,
        totalkit,
        porcentagemkit,
        quantidadefinal,
        vendidosFinal,
        comissaoFinal,
        porcentdaComissao
      ]);
}

VendidosStruct createVendidosStruct({
  DocumentReference? produto,
  double? valor,
  int? quantidade,
  String? nome,
  String? imagem,
  double? comissaokit,
  double? totalkit,
  double? porcentagemkit,
  int? quantidadefinal,
  int? vendidosFinal,
  double? comissaoFinal,
  double? porcentdaComissao,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VendidosStruct(
      produto: produto,
      valor: valor,
      quantidade: quantidade,
      nome: nome,
      imagem: imagem,
      comissaokit: comissaokit,
      totalkit: totalkit,
      porcentagemkit: porcentagemkit,
      quantidadefinal: quantidadefinal,
      vendidosFinal: vendidosFinal,
      comissaoFinal: comissaoFinal,
      porcentdaComissao: porcentdaComissao,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VendidosStruct? updateVendidosStruct(
  VendidosStruct? vendidos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    vendidos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVendidosStructData(
  Map<String, dynamic> firestoreData,
  VendidosStruct? vendidos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (vendidos == null) {
    return;
  }
  if (vendidos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && vendidos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final vendidosData = getVendidosFirestoreData(vendidos, forFieldValue);
  final nestedData = vendidosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = vendidos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVendidosFirestoreData(
  VendidosStruct? vendidos, [
  bool forFieldValue = false,
]) {
  if (vendidos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(vendidos.toMap());

  // Add any Firestore field values
  vendidos.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVendidosListFirestoreData(
  List<VendidosStruct>? vendidoss,
) =>
    vendidoss?.map((e) => getVendidosFirestoreData(e, true)).toList() ?? [];
