import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fymoney/app/di/di.dart';
import 'package:fymoney/app/extensions/context_extension.dart';
import 'package:fymoney/app/navigation/router.dart';
import 'package:fymoney/app/translations/tr_settings.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/hive/repo/hive_user.dart';
import 'package:fymoney/ui/dialogs/change_password_dialog.dart';
import 'package:fymoney/ui/dialogs/delete_account_dialog.dart';
import 'package:fymoney/ui/components/item/settings_row_item.dart';
import 'package:fymoney/ui/components/item/settings_row_language.dart';
import 'package:fymoney/ui/components/navigation/navigation_app_bar.dart';
import 'package:fymoney/ui/screens/home/pages/settings/settings_cubit.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/fonts.dart';
import 'package:fymoney/ui/theme/icons/vector.dart';
import 'package:fymoney/util/auth_util.dart';
import 'package:fymoney/util/device_util.dart';
import 'package:fymoney/util/screen_util.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with AfterLayoutMixin {
  final cubit = getIt.get<SettingsCubit>();

  @override
  void initState() {
    super.initState();
    cubit.initLanguage();
    cubit.getLinked();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: NavigationAppBar(
            sufixCallback: () async {
              await HiveUser.setUserData(userData: null);
              await AuthUtil.signout();
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(Routes.auth, (route) => false);
            },
            sufixIcon: Vector.icExit,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Text(
                  Strings.settings.tr,
                  style: TextStyle(
                    fontFamily: Fonts.inter,
                    color: AppColors.black.withValues(alpha: .5),
                    fontSize: 50.sp,
                  ),
                ),
                spacerVertical(50.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SettingsRowLanguage(
                          icon: Vector.icLanguage,
                          text: Strings.language.tr,
                          selectedOption: state.languageCode,
                          onSelectedChanged: (lang) => cubit.emitLanguage(
                            lang ?? TrSettings.fallbackLocale.languageCode,
                          ),
                        ),
                        if (state.linkedProviders.contains('password'))
                          SettingsRowItem(
                            icon: Vector.icChangePassword,
                            text: Strings.changePassword.tr,
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) => ChangePasswordDialog(),
                            ),
                          ),
                        SettingsRowItem(
                          icon: Vector.icDeleteUser,
                          text: Strings.deleteAccount.tr,
                          tint: AppColors.redButton,
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => DeleteAccountDialog(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                spacerVertical(34),
                GestureDetector(
                  onTap: () => {},
                  child: Text(
                    Strings.termsOfUse.tr,
                    style: TextStyle(
                      fontFamily: Fonts.inter,
                      color: AppColors.purpleLite,
                      fontSize: 46.sp,
                    ),
                  ),
                ),
                spacerVertical(24),
                FutureBuilder<String>(
                  future: DeviceUtil.getAppVersion(),
                  builder: (context, snapshot) {
                    return snapshot.data != null
                        ? Center(
                            child: Text(
                              Strings.version.tr + snapshot.requireData,
                              style: TextStyle(
                                fontFamily: Fonts.inter,
                                color: AppColors.black.withValues(alpha: .6),
                                fontSize: 40.sp,
                              ),
                            ),
                          )
                        : SizedBox();
                  },
                ),
                spacerVertical(context.bottomSafe == 0 ? 50 : 0),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    cubit.getLinked();
  }
}
