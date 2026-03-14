import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fymoney/app/di/di.dart';
import 'package:fymoney/app/extensions/context_extension.dart';
import 'package:fymoney/app/navigation/router.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/ui/components/button/custom_button.dart';
import 'package:fymoney/ui/components/button/social_button.dart';
import 'package:fymoney/ui/components/fields/email_field.dart';
import 'package:fymoney/ui/components/fields/password_field.dart';
import 'package:fymoney/ui/screens/auth/auth_cubit.dart';
import 'package:fymoney/ui/theme/colors.dart';
import 'package:fymoney/ui/theme/fonts/types.dart';
import 'package:fymoney/ui/theme/icons/vector.dart';
import 'package:fymoney/util/screen_util.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final cubit = getIt.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  height:
                      context.screenHeight -
                      context.topSafe -
                      context.bottomSafe,
                  child: Column(
                    children: [
                      spacerVertical(272.h),
                      SvgPicture.asset(Vector.logoLarge, width: 906.w),
                      spacerVertical(75.h),
                      Text(
                        state.login ? Strings.logIn.tr : Strings.signIn.tr,
                        style: Types.inter70Regular,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 160.w),
                        child: Column(
                          children: [
                            EmailField(
                              controller: cubit.emailController,
                              error: state.emailError,
                              focusNode: cubit.emailNode,
                              title: Strings.email.tr,
                              onChanged: () {
                                if (state.emailError != null) {
                                  cubit.validateEmail();
                                }
                              },
                            ),
                            spacerVertical(14),
                            PasswordField(
                              controller: cubit.passwordController,
                              error: state.passwordError,
                              focusNode: cubit.passwordNode,
                              title: Strings.password.tr,
                              onChanged: () {
                                if (state.passwordError != null) {
                                  cubit.validatePassword();
                                }
                              },
                            ),
                            if (!state.login) ...[
                              spacerVertical(14),
                              PasswordField(
                                controller: cubit.repeatePasswordController,
                                error: state.repeatePasswordError,
                                focusNode: cubit.repeatePasswordNode,
                                title: Strings.repeatePassword.tr,
                                onChanged: () {
                                  if (state.repeatePasswordError != null) {
                                    cubit.validateConfirmPassword();
                                  }
                                },
                              ),
                            ],
                            spacerVertical(47),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 55.w),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      title: state.login
                                          ? Strings.login.tr
                                          : Strings.register.tr,
                                      color: AppColors.darkPurple,
                                      onPressed: () => state.login
                                          ? cubit.performLoginWithEmailPassword(
                                              onSuccess: (newUser) =>
                                                  Navigator.of(
                                                    context,
                                                  ).pushReplacementNamed(
                                                    Routes.home,
                                                  ),
                                            )
                                          : cubit
                                                .performSingInWithEmailPassword(
                                                  onSuccess: (newUser) =>
                                                      Navigator.of(
                                                        context,
                                                      ).pushReplacementNamed(
                                                        Routes.home,
                                                      ),
                                                ),
                                    ),
                                  ),
                                  spacerHorizontal(24),
                                  SocialButton(
                                    icon: Vector.googleLogo,
                                    onPressed: () =>
                                        cubit.performLofinWithGoogle(
                                          onSuccess: (newUser) => Navigator.of(
                                            context,
                                          ).pushReplacementNamed(Routes.home),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Center(
                          child: state.loading
                              ? CircularProgressIndicator(
                                  color: AppColors.purple,
                                )
                              : SizedBox(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => cubit.setLogin(!state.login),
                        child: Text(
                          state.login
                              ? Strings.createAccount.tr
                              : Strings.login.tr,
                          style: Types.inter55Regular.copyWith(
                            color: AppColors.purple,
                          ),
                        ),
                      ),
                      spacerVertical(context.bottomSafe == 0 ? 135 : 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
