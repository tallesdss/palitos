// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class HistoricocarrinhoStruct extends FFFirebaseStruct {
  HistoricocarrinhoStruct({
    DocumentReference? produto,
    int? entrada,
    int? saida,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _produto = produto,
        _entrada = entrada,
        _saida = saida,
        super(firestoreUtilData);

  // "produto" field.
  DocumentReference? _produto;
  DocumentReference? get produto => _produto;
  set produto(DocumentReference? val) => _produto = val;

  bool hasProduto() => _produto != null;

  // "entrada" field.
  int? _entrada;
  int get entrada => _entrada ?? 0;
  set entrada(int? val) => _entrada = val;

  void incrementEntrada(int amount) => entrada = entrada + amount;

  bool hasEntrada() => _entrada != null;

  // "saida" field.
  int? _saida;
  int get saida => _saida ?? 0;
  set saida(int? val) => _saida = val;

  void incrementSaida(int amount) => saida = saida + amount;

  bool hasSaida() => _saida != null;

  static HistoricocarrinhoStruct fromMap(Map<String, dynamic> data) =>
      HistoricocarrinhoStruct(
        produto: data['produto'] as DocumentReference?,
        entrada: castToType<int>(data['entrada']),
        saida: castToType<int>(data['saida']),
      );

  static HistoricocarrinhoStruct? maybeFromMap(dynamic data) => data is Map
      ? HistoricocarrinhoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'produto': _produto,
        'entrada': _entrada,
        'saida': _saida,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'produto': serializeParam(
          _produto,
          ParamType.DocumentReference,
        ),
        'entrada': serializeParam(
          _entrada,
          ParamType.int,
        ),
        'saida': serializeParam(
          _saida,
          ParamType.int,
        ),
      }.withoutNulls;

  static HistoricocarrinhoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HistoricocarrinhoStruct(
        produto: deserializeParam(
          data['produto'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['produtos'],
        ),
        entrada: deserializeParam(
          data['entrada'],
          ParamType.int,
          false,
        ),
        saida: deserializeParam(
          data['saida'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'HistoricocarrinhoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HistoricocarrinhoStruct &&
        produto == other.produto &&
        entrada == other.entrada &&
        saida == other.saida;
  }

  @override
  int get hashCode => const ListEquality().hash([produto, entrada, saida]);
}

HistoricocarrinhoStruct createHistoricocarrinhoStruct({
  DocumentReference? produto,
  int? entrada,
  int? saida,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HistoricocarrinhoStruct(
      produto: produto,
      entrada: entrada,
      saida: saida,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HistoricocarrinhoStruct? updateHistoricocarrinhoStruct(
  HistoricocarrinhoStruct? historicocarrinho, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    historicocarrinho
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHistoricocarrinhoStructData(
  Map<String, dynamic> firestoreData,
  HistoricocarrinhoStruct? historicocarrinho,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (historicocarrinho == null) {
    return;
  }
  if (historicocarrinho.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && historicocarrinho.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final historicocarrinhoData =
      getHistoricocarrinhoFirestoreData(historicocarrinho, forFieldValue);
  final nestedData =
      historicocarrinhoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = historicocarrinho.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHistoricocarrinhoFirestoreData(
  HistoricocarrinhoStruct? historicocarrinho, [
  bool forFieldValue = false,
]) {
  if (historicocarrinho == null) {
    return {};
  }
  final firestoreData = mapToFirestore(historicocarrinho.toMap());

  // Add any Firestore field values
  historicocarrinho.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHistoricocarrinhoListFirestoreData(
  List<HistoricocarrinhoStruct>? historicocarrinhos,
) =>
    historicocarrinhos
        ?.map((e) => getHistoricocarrinhoFirestoreData(e, true))
        .toList() ??
    [];
