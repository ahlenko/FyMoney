import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fymoney/app/app.dart';
import 'package:fymoney/app/cubits/settings/app_settings_cubit.dart';
import 'package:fymoney/data/firebase/model/transaction_model.dart';
import 'package:fymoney/data/model/enum/select_interval.dart';
import 'package:fymoney/util/auth_util.dart';

abstract class TransactionsRepo {
  static final _firestore = FirebaseFirestore.instance;
  static const subCollection = 'transactions';
  static const collection = 'users';

  static Future<void> createTransaction(TransactionModel transaction) async {
    final userId = AuthUtil.auth.currentUser?.uid;
    if (userId == null) return;

    final collectionRef = _firestore
        .collection(collection)
        .doc(userId)
        .collection(subCollection);

    await collectionRef.add(transaction.toJson());
  }

  static Future<void> updateTransaction(TransactionModel transaction) async {
    final userId = AuthUtil.auth.currentUser?.uid;
    if (userId == null || transaction.id == null) return;

    final docRef = _firestore
        .collection(collection)
        .doc(userId)
        .collection(subCollection)
        .doc(transaction.id);

    await docRef.update(transaction.toJson());
  }

  static Future<void> deleteTransaction(String transactionId) async {
    final userId = AuthUtil.auth.currentUser?.uid;
    if (userId == null) return;

    final docRef = _firestore
        .collection(collection)
        .doc(userId)
        .collection(subCollection)
        .doc(transactionId);

    await docRef.delete();
  }

  static Future<List<TransactionModel>> getTransactions(
    SelectInterval selectInterval,
  ) async {
    final userId = AuthUtil.auth.currentUser?.uid;
    if (userId == null) return [];

    final now = DateTime.now();

    DateTime start;
    DateTime end;

    switch (selectInterval) {
      case SelectInterval.week:
        final firstDay = now.subtract(Duration(days: now.weekday - 1));
        start = DateTime(firstDay.year, firstDay.month, firstDay.day);
        end = start.add(const Duration(days: 7));
        break;

      case SelectInterval.month:
        start = DateTime(now.year, now.month);
        end = DateTime(now.year, now.month + 1);
        break;

      case SelectInterval.quarter:
        final quarter = ((now.month - 1) ~/ 3);
        start = DateTime(now.year, quarter * 3 + 1);
        end = DateTime(now.year, quarter * 3 + 4);
        break;

      case SelectInterval.year:
        start = DateTime(now.year);
        end = DateTime(now.year + 1);
        break;
    }

    final collectionRef = _firestore
        .collection(collection)
        .doc(userId)
        .collection(subCollection)
        .where('createDate', isGreaterThanOrEqualTo: start)
        .where('createDate', isLessThan: end)
        .where(
          'currency',
          isEqualTo: appContext
              .read<AppSettingsCubit>()
              .state
              .selectedCurrency
              .code,
        )
        .orderBy('createDate', descending: true);

    final snapshot = await collectionRef.get();
    return snapshot.docs
        .map((doc) => TransactionModel.fromJson(doc.data()..['id'] = doc.id))
        .toList();
  }

  static Stream<List<TransactionModel>> getTransactionsStream(
    SelectInterval selectInterval,
  ) {
    final userId = AuthUtil.auth.currentUser?.uid;
    if (userId == null) return const Stream.empty();

    final now = DateTime.now();

    DateTime start;
    DateTime end;

    switch (selectInterval) {
      case SelectInterval.week:
        final firstDay = now.subtract(Duration(days: now.weekday - 1));
        start = DateTime(firstDay.year, firstDay.month, firstDay.day);
        end = start.add(const Duration(days: 7));
        break;

      case SelectInterval.month:
        start = DateTime(now.year, now.month);
        end = DateTime(now.year, now.month + 1);
        break;

      case SelectInterval.quarter:
        final quarter = ((now.month - 1) ~/ 3);
        start = DateTime(now.year, quarter * 3 + 1);
        end = DateTime(now.year, quarter * 3 + 4);
        break;

      case SelectInterval.year:
        start = DateTime(now.year);
        end = DateTime(now.year + 1);
        break;
    }

    final collectionRef = _firestore
        .collection(collection)
        .doc(userId)
        .collection(subCollection)
        .where('createDate', isGreaterThanOrEqualTo: start)
        .where('createDate', isLessThan: end)
        .where(
          'currency',
          isEqualTo: appContext
              .read<AppSettingsCubit>()
              .state
              .selectedCurrency
              .code,
        )
        .orderBy('createDate', descending: true);

    return collectionRef.snapshots().map(
      (snapshot) => snapshot.docs
          .map((doc) => TransactionModel.fromJson(doc.data()..['id'] = doc.id))
          .toList(),
    );
  }
}
