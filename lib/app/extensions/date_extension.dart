import 'package:cloud_firestore/cloud_firestore.dart';

DateTime? dateFromJson(dynamic value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
  if (value is String) return DateTime.tryParse(value);
  try {
    return (value as Timestamp).toDate();
  } catch (_) {
    return null;
  }
}

dynamic dateToJson(DateTime? date) => date?.toUtc().toIso8601String();
