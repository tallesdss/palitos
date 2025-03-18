// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RecargadeestoqueStruct extends FFFirebaseStruct {
  RecargadeestoqueStruct({
    DateTime? data,
    int? quatidade,
    double? totalValor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        _quatidade = quatidade,
        _totalValor = totalValor,
        super(firestoreUtilData);

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? val) => _data = val;

  bool hasData() => _data != null;

  // "quatidade" field.
  int? _quatidade;
  int get quatidade => _quatidade ?? 0;
  set quatidade(int? val) => _quatidade = val;

  void incrementQuatidade(int amount) => quatidade = quatidade + amount;

  bool hasQuatidade() => _quatidade != null;

  // "totalValor" field.
  double? _totalValor;
  double get totalValor => _totalValor ?? 0.0;
  set totalValor(double? val) => _totalValor = val;

  void incrementTotalValor(double amount) => totalValor = totalValor + amount;

  bool hasTotalValor() => _totalValor != null;

  static RecargadeestoqueStruct fromMap(Map<String, dynamic> data) =>
      RecargadeestoqueStruct(
        data: data['data'] as DateTime?,
        quatidade: castToType<int>(data['quatidade']),
        totalValor: castToType<double>(data['totalValor']),
      );

  static RecargadeestoqueStruct? maybeFromMap(dynamic data) => data is Map
      ? RecargadeestoqueStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data,
        'quatidade': _quatidade,
        'totalValor': _totalValor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DateTime,
        ),
        'quatidade': serializeParam(
          _quatidade,
          ParamType.int,
        ),
        'totalValor': serializeParam(
          _totalValor,
          ParamType.double,
        ),
      }.withoutNulls;

  static RecargadeestoqueStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RecargadeestoqueStruct(
        data: deserializeParam(
          data['data'],
          ParamType.DateTime,
          false,
        ),
        quatidade: deserializeParam(
          data['quatidade'],
          ParamType.int,
          false,
        ),
        totalValor: deserializeParam(
          data['totalValor'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'RecargadeestoqueStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecargadeestoqueStruct &&
        data == other.data &&
        quatidade == other.quatidade &&
        totalValor == other.totalValor;
  }

  @override
  int get hashCode => const ListEquality().hash([data, quatidade, totalValor]);
}

RecargadeestoqueStruct createRecargadeestoqueStruct({
  DateTime? data,
  int? quatidade,
  double? totalValor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecargadeestoqueStruct(
      data: data,
      quatidade: quatidade,
      totalValor: totalValor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecargadeestoqueStruct? updateRecargadeestoqueStruct(
  RecargadeestoqueStruct? recargadeestoque, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recargadeestoque
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecargadeestoqueStructData(
  Map<String, dynamic> firestoreData,
  RecargadeestoqueStruct? recargadeestoque,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recargadeestoque == null) {
    return;
  }
  if (recargadeestoque.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recargadeestoque.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recargadeestoqueData =
      getRecargadeestoqueFirestoreData(recargadeestoque, forFieldValue);
  final nestedData =
      recargadeestoqueData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = recargadeestoque.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecargadeestoqueFirestoreData(
  RecargadeestoqueStruct? recargadeestoque, [
  bool forFieldValue = false,
]) {
  if (recargadeestoque == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recargadeestoque.toMap());

  // Add any Firestore field values
  recargadeestoque.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecargadeestoqueListFirestoreData(
  List<RecargadeestoqueStruct>? recargadeestoques,
) =>
    recargadeestoques
        ?.map((e) => getRecargadeestoqueFirestoreData(e, true))
        .toList() ??
    [];
