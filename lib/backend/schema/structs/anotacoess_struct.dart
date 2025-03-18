// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AnotacoessStruct extends FFFirebaseStruct {
  AnotacoessStruct({
    DateTime? data,
    String? texto,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        _texto = texto,
        super(firestoreUtilData);

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? val) => _data = val;

  bool hasData() => _data != null;

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  set texto(String? val) => _texto = val;

  bool hasTexto() => _texto != null;

  static AnotacoessStruct fromMap(Map<String, dynamic> data) =>
      AnotacoessStruct(
        data: data['data'] as DateTime?,
        texto: data['texto'] as String?,
      );

  static AnotacoessStruct? maybeFromMap(dynamic data) => data is Map
      ? AnotacoessStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data,
        'texto': _texto,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DateTime,
        ),
        'texto': serializeParam(
          _texto,
          ParamType.String,
        ),
      }.withoutNulls;

  static AnotacoessStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnotacoessStruct(
        data: deserializeParam(
          data['data'],
          ParamType.DateTime,
          false,
        ),
        texto: deserializeParam(
          data['texto'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AnotacoessStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AnotacoessStruct &&
        data == other.data &&
        texto == other.texto;
  }

  @override
  int get hashCode => const ListEquality().hash([data, texto]);
}

AnotacoessStruct createAnotacoessStruct({
  DateTime? data,
  String? texto,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AnotacoessStruct(
      data: data,
      texto: texto,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AnotacoessStruct? updateAnotacoessStruct(
  AnotacoessStruct? anotacoess, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    anotacoess
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAnotacoessStructData(
  Map<String, dynamic> firestoreData,
  AnotacoessStruct? anotacoess,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (anotacoess == null) {
    return;
  }
  if (anotacoess.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && anotacoess.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final anotacoessData = getAnotacoessFirestoreData(anotacoess, forFieldValue);
  final nestedData = anotacoessData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = anotacoess.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAnotacoessFirestoreData(
  AnotacoessStruct? anotacoess, [
  bool forFieldValue = false,
]) {
  if (anotacoess == null) {
    return {};
  }
  final firestoreData = mapToFirestore(anotacoess.toMap());

  // Add any Firestore field values
  anotacoess.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAnotacoessListFirestoreData(
  List<AnotacoessStruct>? anotacoesss,
) =>
    anotacoesss?.map((e) => getAnotacoessFirestoreData(e, true)).toList() ?? [];
