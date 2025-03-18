import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CupomRecord extends FirestoreRecord {
  CupomRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  bool hasTexto() => _texto != null;

  // "datadevalidade" field.
  DateTime? _datadevalidade;
  DateTime? get datadevalidade => _datadevalidade;
  bool hasDatadevalidade() => _datadevalidade != null;

  // "porcentagem" field.
  double? _porcentagem;
  double get porcentagem => _porcentagem ?? 0.0;
  bool hasPorcentagem() => _porcentagem != null;

  // "usuarios" field.
  List<DocumentReference>? _usuarios;
  List<DocumentReference> get usuarios => _usuarios ?? const [];
  bool hasUsuarios() => _usuarios != null;

  // "fundo" field.
  String? _fundo;
  String get fundo => _fundo ?? '';
  bool hasFundo() => _fundo != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _texto = snapshotData['texto'] as String?;
    _datadevalidade = snapshotData['datadevalidade'] as DateTime?;
    _porcentagem = castToType<double>(snapshotData['porcentagem']);
    _usuarios = getDataList(snapshotData['usuarios']);
    _fundo = snapshotData['fundo'] as String?;
    _imagem = snapshotData['imagem'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cupom');

  static Stream<CupomRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CupomRecord.fromSnapshot(s));

  static Future<CupomRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CupomRecord.fromSnapshot(s));

  static CupomRecord fromSnapshot(DocumentSnapshot snapshot) => CupomRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CupomRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CupomRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CupomRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CupomRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCupomRecordData({
  String? nome,
  String? texto,
  DateTime? datadevalidade,
  double? porcentagem,
  String? fundo,
  String? imagem,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'texto': texto,
      'datadevalidade': datadevalidade,
      'porcentagem': porcentagem,
      'fundo': fundo,
      'imagem': imagem,
    }.withoutNulls,
  );

  return firestoreData;
}

class CupomRecordDocumentEquality implements Equality<CupomRecord> {
  const CupomRecordDocumentEquality();

  @override
  bool equals(CupomRecord? e1, CupomRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nome == e2?.nome &&
        e1?.texto == e2?.texto &&
        e1?.datadevalidade == e2?.datadevalidade &&
        e1?.porcentagem == e2?.porcentagem &&
        listEquality.equals(e1?.usuarios, e2?.usuarios) &&
        e1?.fundo == e2?.fundo &&
        e1?.imagem == e2?.imagem;
  }

  @override
  int hash(CupomRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.texto,
        e?.datadevalidade,
        e?.porcentagem,
        e?.usuarios,
        e?.fundo,
        e?.imagem
      ]);

  @override
  bool isValidKey(Object? o) => o is CupomRecord;
}
