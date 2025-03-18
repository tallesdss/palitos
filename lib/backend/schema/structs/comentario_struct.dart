// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ComentarioStruct extends FFFirebaseStruct {
  ComentarioStruct({
    DocumentReference? dono,
    String? texto,
    DateTime? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dono = dono,
        _texto = texto,
        _data = data,
        super(firestoreUtilData);

  // "dono" field.
  DocumentReference? _dono;
  DocumentReference? get dono => _dono;
  set dono(DocumentReference? val) => _dono = val;

  bool hasDono() => _dono != null;

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  set texto(String? val) => _texto = val;

  bool hasTexto() => _texto != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? val) => _data = val;

  bool hasData() => _data != null;

  static ComentarioStruct fromMap(Map<String, dynamic> data) =>
      ComentarioStruct(
        dono: data['dono'] as DocumentReference?,
        texto: data['texto'] as String?,
        data: data['data'] as DateTime?,
      );

  static ComentarioStruct? maybeFromMap(dynamic data) => data is Map
      ? ComentarioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dono': _dono,
        'texto': _texto,
        'data': _data,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dono': serializeParam(
          _dono,
          ParamType.DocumentReference,
        ),
        'texto': serializeParam(
          _texto,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ComentarioStruct fromSerializableMap(Map<String, dynamic> data) =>
      ComentarioStruct(
        dono: deserializeParam(
          data['dono'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['User'],
        ),
        texto: deserializeParam(
          data['texto'],
          ParamType.String,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ComentarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ComentarioStruct &&
        dono == other.dono &&
        texto == other.texto &&
        data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([dono, texto, data]);
}

ComentarioStruct createComentarioStruct({
  DocumentReference? dono,
  String? texto,
  DateTime? data,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ComentarioStruct(
      dono: dono,
      texto: texto,
      data: data,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ComentarioStruct? updateComentarioStruct(
  ComentarioStruct? comentario, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    comentario
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addComentarioStructData(
  Map<String, dynamic> firestoreData,
  ComentarioStruct? comentario,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (comentario == null) {
    return;
  }
  if (comentario.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && comentario.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final comentarioData = getComentarioFirestoreData(comentario, forFieldValue);
  final nestedData = comentarioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = comentario.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getComentarioFirestoreData(
  ComentarioStruct? comentario, [
  bool forFieldValue = false,
]) {
  if (comentario == null) {
    return {};
  }
  final firestoreData = mapToFirestore(comentario.toMap());

  // Add any Firestore field values
  comentario.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getComentarioListFirestoreData(
  List<ComentarioStruct>? comentarios,
) =>
    comentarios?.map((e) => getComentarioFirestoreData(e, true)).toList() ?? [];
