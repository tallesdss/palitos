// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GraficoStruct extends FFFirebaseStruct {
  GraficoStruct({
    DateTime? data,
    double? valor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        _valor = valor,
        super(firestoreUtilData);

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? val) => _data = val;

  bool hasData() => _data != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;

  void incrementValor(double amount) => valor = valor + amount;

  bool hasValor() => _valor != null;

  static GraficoStruct fromMap(Map<String, dynamic> data) => GraficoStruct(
        data: data['data'] as DateTime?,
        valor: castToType<double>(data['valor']),
      );

  static GraficoStruct? maybeFromMap(dynamic data) =>
      data is Map ? GraficoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'data': _data,
        'valor': _valor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DateTime,
        ),
        'valor': serializeParam(
          _valor,
          ParamType.double,
        ),
      }.withoutNulls;

  static GraficoStruct fromSerializableMap(Map<String, dynamic> data) =>
      GraficoStruct(
        data: deserializeParam(
          data['data'],
          ParamType.DateTime,
          false,
        ),
        valor: deserializeParam(
          data['valor'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'GraficoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GraficoStruct && data == other.data && valor == other.valor;
  }

  @override
  int get hashCode => const ListEquality().hash([data, valor]);
}

GraficoStruct createGraficoStruct({
  DateTime? data,
  double? valor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GraficoStruct(
      data: data,
      valor: valor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GraficoStruct? updateGraficoStruct(
  GraficoStruct? grafico, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    grafico
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGraficoStructData(
  Map<String, dynamic> firestoreData,
  GraficoStruct? grafico,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (grafico == null) {
    return;
  }
  if (grafico.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && grafico.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final graficoData = getGraficoFirestoreData(grafico, forFieldValue);
  final nestedData = graficoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = grafico.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGraficoFirestoreData(
  GraficoStruct? grafico, [
  bool forFieldValue = false,
]) {
  if (grafico == null) {
    return {};
  }
  final firestoreData = mapToFirestore(grafico.toMap());

  // Add any Firestore field values
  grafico.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGraficoListFirestoreData(
  List<GraficoStruct>? graficos,
) =>
    graficos?.map((e) => getGraficoFirestoreData(e, true)).toList() ?? [];
