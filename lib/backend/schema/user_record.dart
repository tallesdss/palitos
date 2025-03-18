import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "saldo" field.
  double? _saldo;
  double get saldo => _saldo ?? 0.0;
  bool hasSaldo() => _saldo != null;

  // "vendedor" field.
  bool? _vendedor;
  bool get vendedor => _vendedor ?? false;
  bool hasVendedor() => _vendedor != null;

  // "adm" field.
  bool? _adm;
  bool get adm => _adm ?? false;
  bool hasAdm() => _adm != null;

  // "senha" field.
  int? _senha;
  int get senha => _senha ?? 0;
  bool hasSenha() => _senha != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  bool hasCep() => _cep != null;

  // "statusAtivacao" field.
  bool? _statusAtivacao;
  bool get statusAtivacao => _statusAtivacao ?? false;
  bool hasStatusAtivacao() => _statusAtivacao != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  bool hasEndereco() => _endereco != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "bairro" field.
  String? _bairro;
  String get bairro => _bairro ?? '';
  bool hasBairro() => _bairro != null;

  // "complemento" field.
  String? _complemento;
  String get complemento => _complemento ?? '';
  bool hasComplemento() => _complemento != null;

  // "valorComissao" field.
  int? _valorComissao;
  int get valorComissao => _valorComissao ?? 0;
  bool hasValorComissao() => _valorComissao != null;

  // "vendedorAtivo" field.
  bool? _vendedorAtivo;
  bool get vendedorAtivo => _vendedorAtivo ?? false;
  bool hasVendedorAtivo() => _vendedorAtivo != null;

  // "vendedorDesativado" field.
  bool? _vendedorDesativado;
  bool get vendedorDesativado => _vendedorDesativado ?? false;
  bool hasVendedorDesativado() => _vendedorDesativado != null;

  // "cpf" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "candidato" field.
  bool? _candidato;
  bool get candidato => _candidato ?? false;
  bool hasCandidato() => _candidato != null;

  // "fotocandidato" field.
  String? _fotocandidato;
  String get fotocandidato => _fotocandidato ?? '';
  bool hasFotocandidato() => _fotocandidato != null;

  // "documentocandidato" field.
  String? _documentocandidato;
  String get documentocandidato => _documentocandidato ?? '';
  bool hasDocumentocandidato() => _documentocandidato != null;

  // "cupom" field.
  DocumentReference? _cupom;
  DocumentReference? get cupom => _cupom;
  bool hasCupom() => _cupom != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _saldo = castToType<double>(snapshotData['saldo']);
    _vendedor = snapshotData['vendedor'] as bool?;
    _adm = snapshotData['adm'] as bool?;
    _senha = castToType<int>(snapshotData['senha']);
    _cidade = snapshotData['cidade'] as String?;
    _cep = snapshotData['cep'] as String?;
    _statusAtivacao = snapshotData['statusAtivacao'] as bool?;
    _endereco = snapshotData['endereco'] as String?;
    _estado = snapshotData['estado'] as String?;
    _bairro = snapshotData['bairro'] as String?;
    _complemento = snapshotData['complemento'] as String?;
    _valorComissao = castToType<int>(snapshotData['valorComissao']);
    _vendedorAtivo = snapshotData['vendedorAtivo'] as bool?;
    _vendedorDesativado = snapshotData['vendedorDesativado'] as bool?;
    _cpf = snapshotData['cpf'] as String?;
    _candidato = snapshotData['candidato'] as bool?;
    _fotocandidato = snapshotData['fotocandidato'] as String?;
    _documentocandidato = snapshotData['documentocandidato'] as String?;
    _cupom = snapshotData['cupom'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('User');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  double? saldo,
  bool? vendedor,
  bool? adm,
  int? senha,
  String? cidade,
  String? cep,
  bool? statusAtivacao,
  String? endereco,
  String? estado,
  String? bairro,
  String? complemento,
  int? valorComissao,
  bool? vendedorAtivo,
  bool? vendedorDesativado,
  String? cpf,
  bool? candidato,
  String? fotocandidato,
  String? documentocandidato,
  DocumentReference? cupom,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'saldo': saldo,
      'vendedor': vendedor,
      'adm': adm,
      'senha': senha,
      'cidade': cidade,
      'cep': cep,
      'statusAtivacao': statusAtivacao,
      'endereco': endereco,
      'estado': estado,
      'bairro': bairro,
      'complemento': complemento,
      'valorComissao': valorComissao,
      'vendedorAtivo': vendedorAtivo,
      'vendedorDesativado': vendedorDesativado,
      'cpf': cpf,
      'candidato': candidato,
      'fotocandidato': fotocandidato,
      'documentocandidato': documentocandidato,
      'cupom': cupom,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.saldo == e2?.saldo &&
        e1?.vendedor == e2?.vendedor &&
        e1?.adm == e2?.adm &&
        e1?.senha == e2?.senha &&
        e1?.cidade == e2?.cidade &&
        e1?.cep == e2?.cep &&
        e1?.statusAtivacao == e2?.statusAtivacao &&
        e1?.endereco == e2?.endereco &&
        e1?.estado == e2?.estado &&
        e1?.bairro == e2?.bairro &&
        e1?.complemento == e2?.complemento &&
        e1?.valorComissao == e2?.valorComissao &&
        e1?.vendedorAtivo == e2?.vendedorAtivo &&
        e1?.vendedorDesativado == e2?.vendedorDesativado &&
        e1?.cpf == e2?.cpf &&
        e1?.candidato == e2?.candidato &&
        e1?.fotocandidato == e2?.fotocandidato &&
        e1?.documentocandidato == e2?.documentocandidato &&
        e1?.cupom == e2?.cupom;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.saldo,
        e?.vendedor,
        e?.adm,
        e?.senha,
        e?.cidade,
        e?.cep,
        e?.statusAtivacao,
        e?.endereco,
        e?.estado,
        e?.bairro,
        e?.complemento,
        e?.valorComissao,
        e?.vendedorAtivo,
        e?.vendedorDesativado,
        e?.cpf,
        e?.candidato,
        e?.fotocandidato,
        e?.documentocandidato,
        e?.cupom
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
