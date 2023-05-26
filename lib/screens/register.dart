import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kooho_test/utils/assets.dart';
import 'package:kooho_test/utils/colors.dart';
import 'package:kooho_test/utils/routers.dart';
import 'package:kooho_test/widgets/custom_button.dart';
import 'package:kooho_test/widgets/custom_text_form.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  ValueNotifier<bool> emailvalid = ValueNotifier<bool>(false);
  ValueNotifier<bool> passCheck = ValueNotifier<bool>(true);
  ValueNotifier<String?> nameError = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              Assets.backButton,
              width: 40,
              height: 40,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
            child: Custombutton(
              text: "Switch to Log in",
              onTap: () {},
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Get Started",
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
              const SizedBox(height: 10),
              Text(
                "Be ready to use Kooha in less than 2min ⚡️",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.grey66,
                    ),
              ),
              const SizedBox(height: 30),
              ValueListenableBuilder(
                valueListenable: nameError,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return CustomTextForm(
                    controller: nameController,
                    label: "Full name",
                    hint: "Full name",
                    validator: (p0) {
                      nameError.value = AppExtensions.validateFullName(p0);
                    },
                    errorText: nameError.value,
                  );
                },
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder(
                valueListenable: emailvalid,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return CustomTextForm(
                    controller: emailController,
                    label: "Email address",
                    hint: "Email address",
                    validator: (p0) {
                      emailvalid.value =
                          AppExtensions.validateEmailAddress(p0) == null
                              ? true
                              : false;
                    },
                    suffixIcon: !emailvalid.value
                        ? null
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              Assets.tickCheck,
                              height: 20,
                              width: 20,
                            ),
                          ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder(
                valueListenable: passCheck,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return CustomTextForm(
                    controller: passController,
                    label: "Password",
                    hint: "Password",
                    validator: (p0) {},
                    obscure: passCheck.value,
                    suffixIcon: Custombutton(
                      text: passCheck.value ? "Show" : "Hide",
                      size: const Size(50, 50),
                      bgColor: Colors.transparent,
                      onTap: () {
                        passCheck.value = !passCheck.value;
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    Assets.tickCheck,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.greyAA,
                            ),
                        children: [
                          TextSpan(
                            text:
                                "I have read, understood and I agree to Kooha’s ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.greyAA,
                                ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.amber0D,
                                ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: "&",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.greyAA,
                                ),
                          ),
                          TextSpan(
                            text: ' Terms and Conditions',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.amber0D,
                                ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Custombutton(
                text: "Create account",
                bgColor: AppColors.orange19,
                size: Size(size.width, 60),
                radius: 100,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.whiteFF,
                      fontWeight: FontWeight.bold,
                    ),
                onTap: () {
                  if (FocusScope.of(context).hasFocus) {
                    FocusScope.of(context).unfocus();
                  }
                  if (nameError.value != null) {
                    return;
                  }

                  if (!emailvalid.value) {
                    return;
                  }

                  if (passController.text.trim().isEmpty) {
                    return;
                  }
                  context.replaceNamed(AppRoutes.dashboard);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppExtensions {
  String? validateFieldNotEmpty(String? value) =>
      value == null || value.isEmpty ? 'Field cannot be empty' : null;

  String? validateFieldNotNull<T>(T? value) =>
      value == null ? 'Field cannot be empty' : null;

  static String? validateEmailAddress(String? value) {
    if (value == null) return 'Field cannot be empty';

    if (value.isEmpty) return 'Field cannot be empty';

    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);

    return !emailValid ? 'Enter a Valid Email Address' : null;
  }

  static String? validateFullName<T>(String? value) {
    if (value == null) return 'Field cannot be empty';

    if (value.isEmpty) return 'Field cannot be empty';

    if (value.trim().split(' ').length < 2) {
      return 'Please enter your full name';
    } else {
      return null;
    }
  }
}
