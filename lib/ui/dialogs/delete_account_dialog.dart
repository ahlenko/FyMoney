import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/app/navigation/router.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/firebase/repo/user_repo.dart';
import 'package:fymoney/data/hive/repo/hive_user.dart';
import 'package:fymoney/ui/dialogs/base/base_dialog.dart';
import 'package:fymoney/ui/screens/home/home_cubit.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/ui/theme/fonts/types.dart';
import 'package:fymoney/util/auth_util.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DeleteAccountDialog extends StatefulWidget {
  const DeleteAccountDialog({super.key});

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      loading: loading,
      positiveButtonText: Strings.cancel.tr,
      positiveButtonClick: Navigator.of(context).pop,
      negativeButtonText: Strings.delete.tr,
      negativeButtonClick: () async {
        if (loading) return;

        setState(() {
          loading = true;
        });

        try {
          if (await AuthUtil.deleteUser(context) == null) {
            await UserRepo.deleteUserData();
            await HiveUser.setUserData(userData: null);
            context.read<HomeCubit>().cancelTransactionsStream();
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(Routes.auth, (route) => false);
          }
        } finally {
          setState(() {
            loading = false;
          });
        }
      },
      dialogTitle: Strings.confirmation.tr,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.youReallyWoonnaToDeleteAccount.tr,
            textAlign: TextAlign.center,
            style: Types.inter42Regular.copyWith(
              color: AppColors.black.withValues(alpha: .7),
            ),
          ),
        ],
      ),
    );
  }
}
