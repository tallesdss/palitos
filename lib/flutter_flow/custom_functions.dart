import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool buscarreceitassd(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

double? arredondamento(double? resultado) {
  if (resultado == null) {
    return null;
  }

  // Transforma o número em string e pega os primeiros 4 caracteres
  String truncatedString = resultado.toString().substring(0, 4);

  // Converte de volta para double
  double truncatedNumber = double.parse(truncatedString);

  return truncatedNumber;
}

double somarlistadedouble(List<double> valores) {
  // receba uma lista com double, some todos os itens da lista e retorne um numero double
  double soma = 0.0;
  for (double valor in valores) {
    soma += valor;
  }
  return soma;
}

List<DateTime>? retornatodososdiasdomes(DateTime datadomes) {
  // receba data e hora e retone todos os dias do mes em que essa data pertence em uma lista
  List<DateTime> daysInMonth = [];
  int year = datadomes.year;
  int month = datadomes.month;
  int daysInMonthCount = DateTime(year, month + 1, 0).day;

  for (int i = 1; i <= daysInMonthCount; i++) {
    daysInMonth.add(DateTime(year, month, i));
  }

  return daysInMonth;
}

double somandovalortotaldoestoque(List<ProdutosRecord> produtos) {
  double total = 0.0;

  for (var produto in produtos) {
    total += (produto.quantidade ?? 0) * (produto.preco ?? 0.0);
  }

  return total;
}

List<DocumentReference> retornartransacoesentredatas(
  DateTime data,
  DateTime data2,
  DocumentReference minhas,
) {
  if (minhas == null) {
    return [];
  }

  FirebaseFirestore.instance
      .collection('transação')
      .where('usuario', isEqualTo: minhas)
      .where('dataCriacao', isGreaterThanOrEqualTo: data)
      .where('dataCriacao', isLessThanOrEqualTo: data2)
      .get()
      .then((snapshot) => snapshot.docs.map((doc) => doc.reference).toList())
      .catchError((error) {
    print("Erro ao buscar transações: $error");
    return <DocumentReference>[];
  });

  return [];
}

DateTime retornardatas(
  int dias,
  DateTime datadehoje,
) {
  return datadehoje.subtract(Duration(days: dias));
}

double recebestringretornadouble(String numero) {
  // receba em string e retorne em double.
  return double.parse(numero);
}
