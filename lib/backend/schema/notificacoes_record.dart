import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificacoesRecord extends FirestoreRecord {
  NotificacoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "validade" field.
  DateTime? _validade;
  DateTime? get validade => _validade;
  bool hasValidade() => _validade != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  bool hasTexto() => _texto != null;

  // "datadeCriacao" field.
  DateTime? _datadeCriacao;
  DateTime? get datadeCriacao => _datadeCriacao;
  bool hasDatadeCriacao() => _datadeCriacao != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _validade = snapshotData['validade'] as DateTime?;
    _imagem = snapshotData['imagem'] as String?;
    _texto = snapshotData['texto'] as String?;
    _datadeCriacao = snapshotData['datadeCriacao'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificacoes');

  static Stream<NotificacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacoesRecord.fromSnapshot(s));

  static Future<NotificacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacoesRecord.fromSnapshot(s));

  static NotificacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacoesRecordData({
  String? titulo,
  DateTime? validade,
  String? imagem,
  String? texto,
  DateTime? datadeCriacao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'validade': validade,
      'imagem': imagem,
      'texto': texto,
      'datadeCriacao': datadeCriacao,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacoesRecordDocumentEquality
    implements Equality<NotificacoesRecord> {
  const NotificacoesRecordDocumentEquality();

  @override
  bool equals(NotificacoesRecord? e1, NotificacoesRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.validade == e2?.validade &&
        e1?.imagem == e2?.imagem &&
        e1?.texto == e2?.texto &&
        e1?.datadeCriacao == e2?.datadeCriacao;
  }

  @override
  int hash(NotificacoesRecord? e) => const ListEquality()
      .hash([e?.titulo, e?.validade, e?.imagem, e?.texto, e?.datadeCriacao]);

  @override
  bool isValidKey(Object? o) => o is NotificacoesRecord;
}
