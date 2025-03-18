import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoricoRecord extends FirestoreRecord {
  HistoricoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "refeVendedor" field.
  DocumentReference? _refeVendedor;
  DocumentReference? get refeVendedor => _refeVendedor;
  bool hasRefeVendedor() => _refeVendedor != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "valorCarga" field.
  double? _valorCarga;
  double get valorCarga => _valorCarga ?? 0.0;
  bool hasValorCarga() => _valorCarga != null;

  // "comissaoTotal" field.
  double? _comissaoTotal;
  double get comissaoTotal => _comissaoTotal ?? 0.0;
  bool hasComissaoTotal() => _comissaoTotal != null;

  // "aprovacao" field.
  bool? _aprovacao;
  bool get aprovacao => _aprovacao ?? false;
  bool hasAprovacao() => _aprovacao != null;

  // "diarias" field.
  List<DiariaStruct>? _diarias;
  List<DiariaStruct> get diarias => _diarias ?? const [];
  bool hasDiarias() => _diarias != null;

  // "codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  bool hasCodigo() => _codigo != null;

  // "valorFinalcarga" field.
  double? _valorFinalcarga;
  double get valorFinalcarga => _valorFinalcarga ?? 0.0;
  bool hasValorFinalcarga() => _valorFinalcarga != null;

  // "comissaoFinal" field.
  double? _comissaoFinal;
  double get comissaoFinal => _comissaoFinal ?? 0.0;
  bool hasComissaoFinal() => _comissaoFinal != null;

  // "valorpagofinal" field.
  double? _valorpagofinal;
  double get valorpagofinal => _valorpagofinal ?? 0.0;
  bool hasValorpagofinal() => _valorpagofinal != null;

  // "anotacoes" field.
  List<AnotacoessStruct>? _anotacoes;
  List<AnotacoessStruct> get anotacoes => _anotacoes ?? const [];
  bool hasAnotacoes() => _anotacoes != null;

  // "aviso" field.
  String? _aviso;
  String get aviso => _aviso ?? '';
  bool hasAviso() => _aviso != null;

  // "comissaoFinalcupom" field.
  double? _comissaoFinalcupom;
  double get comissaoFinalcupom => _comissaoFinalcupom ?? 0.0;
  bool hasComissaoFinalcupom() => _comissaoFinalcupom != null;

  void _initializeFields() {
    _refeVendedor = snapshotData['refeVendedor'] as DocumentReference?;
    _data = snapshotData['data'] as DateTime?;
    _valorCarga = castToType<double>(snapshotData['valorCarga']);
    _comissaoTotal = castToType<double>(snapshotData['comissaoTotal']);
    _aprovacao = snapshotData['aprovacao'] as bool?;
    _diarias = getStructList(
      snapshotData['diarias'],
      DiariaStruct.fromMap,
    );
    _codigo = snapshotData['codigo'] as String?;
    _valorFinalcarga = castToType<double>(snapshotData['valorFinalcarga']);
    _comissaoFinal = castToType<double>(snapshotData['comissaoFinal']);
    _valorpagofinal = castToType<double>(snapshotData['valorpagofinal']);
    _anotacoes = getStructList(
      snapshotData['anotacoes'],
      AnotacoessStruct.fromMap,
    );
    _aviso = snapshotData['aviso'] as String?;
    _comissaoFinalcupom =
        castToType<double>(snapshotData['comissaoFinalcupom']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Historico');

  static Stream<HistoricoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoricoRecord.fromSnapshot(s));

  static Future<HistoricoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoricoRecord.fromSnapshot(s));

  static HistoricoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoricoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoricoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoricoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoricoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoricoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoricoRecordData({
  DocumentReference? refeVendedor,
  DateTime? data,
  double? valorCarga,
  double? comissaoTotal,
  bool? aprovacao,
  String? codigo,
  double? valorFinalcarga,
  double? comissaoFinal,
  double? valorpagofinal,
  String? aviso,
  double? comissaoFinalcupom,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'refeVendedor': refeVendedor,
      'data': data,
      'valorCarga': valorCarga,
      'comissaoTotal': comissaoTotal,
      'aprovacao': aprovacao,
      'codigo': codigo,
      'valorFinalcarga': valorFinalcarga,
      'comissaoFinal': comissaoFinal,
      'valorpagofinal': valorpagofinal,
      'aviso': aviso,
      'comissaoFinalcupom': comissaoFinalcupom,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoricoRecordDocumentEquality implements Equality<HistoricoRecord> {
  const HistoricoRecordDocumentEquality();

  @override
  bool equals(HistoricoRecord? e1, HistoricoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.refeVendedor == e2?.refeVendedor &&
        e1?.data == e2?.data &&
        e1?.valorCarga == e2?.valorCarga &&
        e1?.comissaoTotal == e2?.comissaoTotal &&
        e1?.aprovacao == e2?.aprovacao &&
        listEquality.equals(e1?.diarias, e2?.diarias) &&
        e1?.codigo == e2?.codigo &&
        e1?.valorFinalcarga == e2?.valorFinalcarga &&
        e1?.comissaoFinal == e2?.comissaoFinal &&
        e1?.valorpagofinal == e2?.valorpagofinal &&
        listEquality.equals(e1?.anotacoes, e2?.anotacoes) &&
        e1?.aviso == e2?.aviso &&
        e1?.comissaoFinalcupom == e2?.comissaoFinalcupom;
  }

  @override
  int hash(HistoricoRecord? e) => const ListEquality().hash([
        e?.refeVendedor,
        e?.data,
        e?.valorCarga,
        e?.comissaoTotal,
        e?.aprovacao,
        e?.diarias,
        e?.codigo,
        e?.valorFinalcarga,
        e?.comissaoFinal,
        e?.valorpagofinal,
        e?.anotacoes,
        e?.aviso,
        e?.comissaoFinalcupom
      ]);

  @override
  bool isValidKey(Object? o) => o is HistoricoRecord;
}
