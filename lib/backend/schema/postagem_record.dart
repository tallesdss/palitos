import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostagemRecord extends FirestoreRecord {
  PostagemRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "dono" field.
  DocumentReference? _dono;
  DocumentReference? get dono => _dono;
  bool hasDono() => _dono != null;

  // "nomedono" field.
  String? _nomedono;
  String get nomedono => _nomedono ?? '';
  bool hasNomedono() => _nomedono != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  // "curtidas" field.
  List<DocumentReference>? _curtidas;
  List<DocumentReference> get curtidas => _curtidas ?? const [];
  bool hasCurtidas() => _curtidas != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "fotourl" field.
  String? _fotourl;
  String get fotourl => _fotourl ?? '';
  bool hasFotourl() => _fotourl != null;

  // "favoritos_user" field.
  List<DocumentReference>? _favoritosUser;
  List<DocumentReference> get favoritosUser => _favoritosUser ?? const [];
  bool hasFavoritosUser() => _favoritosUser != null;

  void _initializeFields() {
    _data = snapshotData['data'] as DateTime?;
    _descricao = snapshotData['descricao'] as String?;
    _dono = snapshotData['dono'] as DocumentReference?;
    _nomedono = snapshotData['nomedono'] as String?;
    _imagem = snapshotData['imagem'] as String?;
    _curtidas = getDataList(snapshotData['curtidas']);
    _video = snapshotData['video'] as String?;
    _fotourl = snapshotData['fotourl'] as String?;
    _favoritosUser = getDataList(snapshotData['favoritos_user']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('postagem');

  static Stream<PostagemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostagemRecord.fromSnapshot(s));

  static Future<PostagemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostagemRecord.fromSnapshot(s));

  static PostagemRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostagemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostagemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostagemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostagemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostagemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostagemRecordData({
  DateTime? data,
  String? descricao,
  DocumentReference? dono,
  String? nomedono,
  String? imagem,
  String? video,
  String? fotourl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data': data,
      'descricao': descricao,
      'dono': dono,
      'nomedono': nomedono,
      'imagem': imagem,
      'video': video,
      'fotourl': fotourl,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostagemRecordDocumentEquality implements Equality<PostagemRecord> {
  const PostagemRecordDocumentEquality();

  @override
  bool equals(PostagemRecord? e1, PostagemRecord? e2) {
    const listEquality = ListEquality();
    return e1?.data == e2?.data &&
        e1?.descricao == e2?.descricao &&
        e1?.dono == e2?.dono &&
        e1?.nomedono == e2?.nomedono &&
        e1?.imagem == e2?.imagem &&
        listEquality.equals(e1?.curtidas, e2?.curtidas) &&
        e1?.video == e2?.video &&
        e1?.fotourl == e2?.fotourl &&
        listEquality.equals(e1?.favoritosUser, e2?.favoritosUser);
  }

  @override
  int hash(PostagemRecord? e) => const ListEquality().hash([
        e?.data,
        e?.descricao,
        e?.dono,
        e?.nomedono,
        e?.imagem,
        e?.curtidas,
        e?.video,
        e?.fotourl,
        e?.favoritosUser
      ]);

  @override
  bool isValidKey(Object? o) => o is PostagemRecord;
}
