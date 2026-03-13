import 'package:fymoney/app/translations/tr_strings.dart';

enum SelectInterval {
  week(name: Strings.week),
  month(name: Strings.month),
  quarter(name: Strings.quarter),
  year(name: Strings.year);

  final String name;

  const SelectInterval({required this.name});
}
