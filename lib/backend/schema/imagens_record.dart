import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImagensRecord extends FirestoreRecord {
  ImagensRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fundo" field.
  List<String>? _fundo;
  List<String> get fundo => _fundo ?? const [];
  bool hasFundo() => _fundo != null;

  // "imagens" field.
  List<String>? _imagens;
  List<String> get imagens => _imagens ?? const [];
  bool hasImagens() => _imagens != null;

  void _initializeFields() {
    _fundo = getDataList(snapshotData['fundo']);
    _imagens = getDataList(snapshotData['imagens']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('imagens');

  static Stream<ImagensRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImagensRecord.fromSnapshot(s));

  static Future<ImagensRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImagensRecord.fromSnapshot(s));

  static ImagensRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ImagensRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImagensRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImagensRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImagensRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImagensRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImagensRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class ImagensRecordDocumentEquality implements Equality<ImagensRecord> {
  const ImagensRecordDocumentEquality();

  @override
  bool equals(ImagensRecord? e1, ImagensRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.fundo, e2?.fundo) &&
        listEquality.equals(e1?.imagens, e2?.imagens);
  }

  @override
  int hash(ImagensRecord? e) =>
      const ListEquality().hash([e?.fundo, e?.imagens]);

  @override
  bool isValidKey(Object? o) => o is ImagensRecord;
}
