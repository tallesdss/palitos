import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutosRecord extends FirestoreRecord {
  ProdutosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "preco" field.
  double? _preco;
  double get preco => _preco ?? 0.0;
  bool hasPreco() => _preco != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "imagens" field.
  List<String>? _imagens;
  List<String> get imagens => _imagens ?? const [];
  bool hasImagens() => _imagens != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "categoriaRefe" field.
  DocumentReference? _categoriaRefe;
  DocumentReference? get categoriaRefe => _categoriaRefe;
  bool hasCategoriaRefe() => _categoriaRefe != null;

  // "comissao" field.
  double? _comissao;
  double get comissao => _comissao ?? 0.0;
  bool hasComissao() => _comissao != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  bool hasQuantidade() => _quantidade != null;

  // "recargas" field.
  List<RecargadeestoqueStruct>? _recargas;
  List<RecargadeestoqueStruct> get recargas => _recargas ?? const [];
  bool hasRecargas() => _recargas != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _preco = castToType<double>(snapshotData['preco']);
    _imagem = snapshotData['imagem'] as String?;
    _tipo = snapshotData['tipo'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _imagens = getDataList(snapshotData['imagens']);
    _descricao = snapshotData['descricao'] as String?;
    _categoriaRefe = snapshotData['categoriaRefe'] as DocumentReference?;
    _comissao = castToType<double>(snapshotData['comissao']);
    _quantidade = castToType<int>(snapshotData['quantidade']);
    _recargas = getStructList(
      snapshotData['recargas'],
      RecargadeestoqueStruct.fromMap,
    );
    _status = snapshotData['status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produtos');

  static Stream<ProdutosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProdutosRecord.fromSnapshot(s));

  static Future<ProdutosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProdutosRecord.fromSnapshot(s));

  static ProdutosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProdutosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProdutosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProdutosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProdutosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProdutosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProdutosRecordData({
  String? nome,
  double? preco,
  String? imagem,
  String? tipo,
  String? categoria,
  String? descricao,
  DocumentReference? categoriaRefe,
  double? comissao,
  int? quantidade,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'preco': preco,
      'imagem': imagem,
      'tipo': tipo,
      'categoria': categoria,
      'descricao': descricao,
      'categoriaRefe': categoriaRefe,
      'comissao': comissao,
      'quantidade': quantidade,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProdutosRecordDocumentEquality implements Equality<ProdutosRecord> {
  const ProdutosRecordDocumentEquality();

  @override
  bool equals(ProdutosRecord? e1, ProdutosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nome == e2?.nome &&
        e1?.preco == e2?.preco &&
        e1?.imagem == e2?.imagem &&
        e1?.tipo == e2?.tipo &&
        e1?.categoria == e2?.categoria &&
        listEquality.equals(e1?.imagens, e2?.imagens) &&
        e1?.descricao == e2?.descricao &&
        e1?.categoriaRefe == e2?.categoriaRefe &&
        e1?.comissao == e2?.comissao &&
        e1?.quantidade == e2?.quantidade &&
        listEquality.equals(e1?.recargas, e2?.recargas) &&
        e1?.status == e2?.status;
  }

  @override
  int hash(ProdutosRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.preco,
        e?.imagem,
        e?.tipo,
        e?.categoria,
        e?.imagens,
        e?.descricao,
        e?.categoriaRefe,
        e?.comissao,
        e?.quantidade,
        e?.recargas,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is ProdutosRecord;
}
