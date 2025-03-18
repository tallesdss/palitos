import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportarRecord extends FirestoreRecord {
  ReportarRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  bool hasTexto() => _texto != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _texto = snapshotData['texto'] as String?;
    _data = snapshotData['data'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reportar');

  static Stream<ReportarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportarRecord.fromSnapshot(s));

  static Future<ReportarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportarRecord.fromSnapshot(s));

  static ReportarRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportarRecordData({
  DocumentReference? user,
  String? texto,
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'texto': texto,
      'data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportarRecordDocumentEquality implements Equality<ReportarRecord> {
  const ReportarRecordDocumentEquality();

  @override
  bool equals(ReportarRecord? e1, ReportarRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.texto == e2?.texto &&
        e1?.data == e2?.data;
  }

  @override
  int hash(ReportarRecord? e) =>
      const ListEquality().hash([e?.user, e?.texto, e?.data]);

  @override
  bool isValidKey(Object? o) => o is ReportarRecord;
}
