import 'package:flutter/material.dart';
import 'package:fymoney/app/extensions/string_extension.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/firebase/repo/user_repo.dart';
import 'package:fymoney/ui/dialogs/base/base_dialog.dart';
import 'package:fymoney/ui/components/fields/password_field.dart';
import 'package:fymoney/util/auth_util.dart';
import 'package:fymoney/util/screen_util.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final oldPasswordCtrl = TextEditingController();
  final newPasswordCtrl = TextEditingController();
  final repeatePasswordCtrl = TextEditingController();

  final oldPasswordNode = FocusNode();
  final newPasswordNode = FocusNode();
  final repeatePasswordNode = FocusNode();

  String? oldPasswordError;
  String? newPasswordError;
  String? repeatePasswordError;

  bool loading = false;

  @override
  void initState() {
    super.initState();

    oldPasswordNode.addListener(() {
      if (!oldPasswordNode.hasFocus) validateOldPassword();
    });
    newPasswordNode.addListener(() {
      if (!newPasswordNode.hasFocus) validatePassword();
    });
    repeatePasswordNode.addListener(() {
      if (!repeatePasswordNode.hasFocus) validateConfirmPassword();
    });
  }

  validateOldPassword() {
    setState(() {
      oldPasswordError = null;
    });

    if (oldPasswordCtrl.text.trim().isEmpty) {
      setState(() {
        oldPasswordError = Strings.theFieldMustBeFilled.tr;
      });
    }
  }

  validatePassword() {
    setState(() {
      newPasswordError = null;
    });

    if (newPasswordCtrl.text.trim().isEmpty) {
      setState(() {
        newPasswordError = Strings.theFieldMustBeFilled.tr;
      });
    } else {
      setState(() {
        newPasswordError = newPasswordCtrl.text.isValidPassword();
      });
    }
  }

  validateConfirmPassword() {
    setState(() {
      repeatePasswordError = null;
    });

    if (repeatePasswordCtrl.text.trim().isEmpty) {
      setState(() {
        repeatePasswordError = Strings.theFieldMustBeFilled.tr;
      });
    } else if (repeatePasswordCtrl.text != newPasswordCtrl.text) {
      setState(() {
        repeatePasswordError = Strings.passwordsDoNotMatch.tr;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      positiveButtonText: Strings.cancel.tr,
      positiveButtonClick: Navigator.of(context).pop,
      negativeButtonText: Strings.change.tr,
      negativeButtonClick: () async {
        if (loading) return;

        validateOldPassword();
        validatePassword();
        validateConfirmPassword();

        if (repeatePasswordError != null ||
            newPasswordError != null ||
            oldPasswordError != null) {
          return;
        }

        setState(() {
          loading = true;
        });

        try {
          final errro = await AuthUtil.changePassword(
            currentPassword: oldPasswordCtrl.text,
            newPassword: newPasswordCtrl.text,
          );
          if (errro == null) {
            UserRepo.savePasswordHash(newPasswordCtrl.text);
            Navigator.of(context).pop();
          } else {
            setState(() {
              oldPasswordError = Strings.wrongOldPassword.tr;
            });
          }
        } finally {
          setState(() {
            loading = false;
          });
        }
      },
      dialogTitle: Strings.changePassword.tr,
      loading: loading,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PasswordField(
            controller: oldPasswordCtrl,
            focusNode: oldPasswordNode,
            title: Strings.oldPassword.tr,
            error: oldPasswordError,
            onChanged: () {
              if (oldPasswordError != null) {
                validateOldPassword();
              }
            },
          ),
          spacerVertical(45),
          PasswordField(
            controller: newPasswordCtrl,
            focusNode: newPasswordNode,
            title: Strings.newPassword.tr,
            error: newPasswordError,
            onChanged: () {
              if (newPasswordError != null) {
                validatePassword();
              }
            },
          ),
          spacerVertical(45),
          PasswordField(
            controller: repeatePasswordCtrl,
            focusNode: repeatePasswordNode,
            title: Strings.confirmPassword.tr,
            error: repeatePasswordError,
            onChanged: () {
              if (repeatePasswordError != null) {
                validateConfirmPassword();
              }
            },
          ),
        ],
      ),
    );
  }
}
