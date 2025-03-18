import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransacoesRecord extends FirestoreRecord {
  TransacoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "pagador" field.
  DocumentReference? _pagador;
  DocumentReference? get pagador => _pagador;
  bool hasPagador() => _pagador != null;

  // "recebedor" field.
  DocumentReference? _recebedor;
  DocumentReference? get recebedor => _recebedor;
  bool hasRecebedor() => _recebedor != null;

  // "produtos" field.
  List<DocumentReference>? _produtos;
  List<DocumentReference> get produtos => _produtos ?? const [];
  bool hasProdutos() => _produtos != null;

  // "minhas" field.
  List<DocumentReference>? _minhas;
  List<DocumentReference> get minhas => _minhas ?? const [];
  bool hasMinhas() => _minhas != null;

  // "nomedopagador" field.
  String? _nomedopagador;
  String get nomedopagador => _nomedopagador ?? '';
  bool hasNomedopagador() => _nomedopagador != null;

  // "nomedorecebedor" field.
  String? _nomedorecebedor;
  String get nomedorecebedor => _nomedorecebedor ?? '';
  bool hasNomedorecebedor() => _nomedorecebedor != null;

  void _initializeFields() {
    _data = snapshotData['data'] as DateTime?;
    _valor = castToType<double>(snapshotData['valor']);
    _pagador = snapshotData['pagador'] as DocumentReference?;
    _recebedor = snapshotData['recebedor'] as DocumentReference?;
    _produtos = getDataList(snapshotData['produtos']);
    _minhas = getDataList(snapshotData['minhas']);
    _nomedopagador = snapshotData['nomedopagador'] as String?;
    _nomedorecebedor = snapshotData['nomedorecebedor'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transacoes');

  static Stream<TransacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransacoesRecord.fromSnapshot(s));

  static Future<TransacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransacoesRecord.fromSnapshot(s));

  static TransacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransacoesRecordData({
  DateTime? data,
  double? valor,
  DocumentReference? pagador,
  DocumentReference? recebedor,
  String? nomedopagador,
  String? nomedorecebedor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data': data,
      'valor': valor,
      'pagador': pagador,
      'recebedor': recebedor,
      'nomedopagador': nomedopagador,
      'nomedorecebedor': nomedorecebedor,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransacoesRecordDocumentEquality implements Equality<TransacoesRecord> {
  const TransacoesRecordDocumentEquality();

  @override
  bool equals(TransacoesRecord? e1, TransacoesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.data == e2?.data &&
        e1?.valor == e2?.valor &&
        e1?.pagador == e2?.pagador &&
        e1?.recebedor == e2?.recebedor &&
        listEquality.equals(e1?.produtos, e2?.produtos) &&
        listEquality.equals(e1?.minhas, e2?.minhas) &&
        e1?.nomedopagador == e2?.nomedopagador &&
        e1?.nomedorecebedor == e2?.nomedorecebedor;
  }

  @override
  int hash(TransacoesRecord? e) => const ListEquality().hash([
        e?.data,
        e?.valor,
        e?.pagador,
        e?.recebedor,
        e?.produtos,
        e?.minhas,
        e?.nomedopagador,
        e?.nomedorecebedor
      ]);

  @override
  bool isValidKey(Object? o) => o is TransacoesRecord;
}
