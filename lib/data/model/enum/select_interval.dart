import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fymoney/app/app.dart';
import 'package:fymoney/app/cubits/settings/app_settings_cubit.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum SelectInterval {
  week(name: Strings.week),
  month(name: Strings.month),
  quarter(name: Strings.quarter),
  year(name: Strings.year);

  final String name;

  const SelectInterval({required this.name});

  getDateInterval() {
    final locale = appContext.read<AppSettingsCubit>().state.languageCode;
    switch (this) {
      case SelectInterval.week:
        final firstDay = DateTime.now().subtract(
          Duration(days: DateTime.now().weekday - 1),
        );
        final start = DateTime(firstDay.year, firstDay.month, firstDay.day);
        final end = start.add(const Duration(days: 7));
        return '${DateFormat("dd MMMM", locale).format(start)} - ${DateFormat("dd MMMM", locale).format(end)}';
      case SelectInterval.month:
        return DateFormat(
          "MMM yyyy",
          locale,
        ).format(DateTime.now()).toString().capitalizeFirst;
      case SelectInterval.quarter:
        return '${(DateTime.now().month - 1) ~/ 3 + 1} ${Strings.quarter.tr} ${DateTime.now().year} ';
      case SelectInterval.year:
        return '${DateTime.now().year} ${Strings.year.tr}';
    }
  }
}
