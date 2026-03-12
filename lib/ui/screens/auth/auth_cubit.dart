import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fymoney/app/extensions/string_extension.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/firebase/model/user_creation_request.dart';
import 'package:fymoney/data/firebase/repo/user_repo.dart';
import 'package:fymoney/data/hive/repo/hive_user.dart';
import 'package:fymoney/util/auth_util.dart';
import 'package:fymoney/util/device_util.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState()) {
    emailNode.addListener(() {
      if (!emailNode.hasFocus) validateEmail();
    });
    passwordNode.addListener(() {
      if (!passwordNode.hasFocus) validatePassword();
    });
    repeatePasswordNode.addListener(() {
      if (!repeatePasswordNode.hasFocus) validateConfirmPassword();
    });
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatePasswordController =
      TextEditingController();

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode repeatePasswordNode = FocusNode();

  validateEmail() {
    emit(state.copyWith(emailError: null));

    if (emailController.text.trim().isEmpty) {
      emit(state.copyWith(emailError: Strings.theFieldMustBeFilled.tr));
    } else {
      if (!emailController.text.isValidEmail()) {
        emit(state.copyWith(emailError: Strings.pleaseUseAValidEmail.tr));
      }
    }
  }

  validatePassword() {
    emit(state.copyWith(passwordError: null));

    if (passwordController.text.trim().isEmpty) {
      emit(state.copyWith(passwordError: Strings.theFieldMustBeFilled.tr));
    } else if (!state.login) {
      emit(
        state.copyWith(
          passwordError: passwordController.text.isValidPassword(),
        ),
      );
    }
  }

  validateConfirmPassword() {
    emit(state.copyWith(repeatePasswordError: null));

    if (repeatePasswordController.text.trim().isEmpty) {
      emit(
        state.copyWith(repeatePasswordError: Strings.theFieldMustBeFilled.tr),
      );
    } else if (repeatePasswordController.text != passwordController.text) {
      emit(
        state.copyWith(repeatePasswordError: Strings.passwordsDoNotMatch.tr),
      );
    }
  }

  void setLogin(bool login) {
    emit(state.copyWith(login: login));
  }

  performSingInWithEmailPassword({required Function(bool) onSuccess}) async {
    if (state.loading) {
      return;
    }

    validateEmail();
    validatePassword();
    validateConfirmPassword();

    if (state.emailError != null ||
        state.passwordError != null ||
        state.repeatePasswordError != null) {
      return;
    }
    try {
      emit(state.copyWith(loading: true));
      final signinErrors = await AuthUtil.signUp(
        email: emailController.text,
        password: passwordController.text,
      );

      if (signinErrors == null) {
        await afterEmailPasswordLoginSuccess(
          userCreationRequest: UserCreationRequest(
            email: emailController.text.toLowerCase(),
            uid: FirebaseAuth.instance.currentUser?.uid,
          ),
          onSuccess: (newUser) {
            UserRepo.savePasswordHash(passwordController.text);
            onSuccess(newUser);
          },
        );
      } else {
        emit(state.copyWith(emailError: signinErrors.tr));
      }
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  performLoginWithEmailPassword({required Function(bool) onSuccess}) async {
    if (state.loading) {
      return;
    }

    validateEmail();
    validatePassword();

    if (state.emailError != null || state.passwordError != null) {
      return;
    }

    try {
      emit(state.copyWith(loading: true));
      final loginErrors = await AuthUtil.login(
        email: emailController.text,
        password: passwordController.text,
      );

      if (loginErrors == null) {
        await afterEmailPasswordLoginSuccess(
          userCreationRequest: UserCreationRequest(
            email: emailController.text.toLowerCase(),
            uid: FirebaseAuth.instance.currentUser?.uid,
          ),
          onSuccess: (newUser) {
            UserRepo.savePasswordHash(passwordController.text);
            onSuccess(newUser);
          },
        );
      } else {
        emit(state.copyWith(emailError: loginErrors.tr));
      }
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  afterEmailPasswordLoginSuccess({
    required Function(bool) onSuccess,
    required UserCreationRequest userCreationRequest,
  }) async {
    final receivedUserData = await UserRepo.authUser(userCreationRequest);
    if (receivedUserData != null) {
      await HiveUser.setUserData(userData: receivedUserData);
      await UserRepo.clipNewDeviceId(await DeviceUtil.getDeviceId());
      onSuccess(receivedUserData.isNewUser ?? false);
    } else {
      //ToastUtil.showToast(title: Strings.unexpectedError.tr);
    }
  }

  performLofinWithGoogle({required Function(bool) onSuccess}) async {
    if (state.loading) {
      return;
    }
    try {
      emit(state.copyWith(loading: true));
      final creationRequest = await AuthUtil.loginWithGoogle();
      if (creationRequest != null) {
        await afterSocialLoginSuccess(
          onSuccess: onSuccess,
          creationRequest: creationRequest,
        );
      }
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  afterSocialLoginSuccess({
    required Function(bool) onSuccess,
    required UserCreationRequest creationRequest,
  }) async {
    final receivedUserData = await UserRepo.authUser(creationRequest);
    if (receivedUserData != null) {
      await HiveUser.setUserData(userData: receivedUserData);
      await UserRepo.clipNewDeviceId(await DeviceUtil.getDeviceId());
      onSuccess(receivedUserData.isNewUser ?? false);
    } else {
      //ToastUtil.showToast(title: Strings.unexpectedError.tr);
    }
  }
}
