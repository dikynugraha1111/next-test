import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_test/core/components/app_button.dart';
import 'package:next_test/core/components/app_text_field.dart';
import 'package:next_test/core/logic/active_cubit.dart';
import 'package:next_test/core/logic/active_two_cubit.dart';
import 'package:next_test/core/logic/login/login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> header() {
      return [
        Text(
          "Daftarkan Akun",
        ),
        const SizedBox(height: 10.0),
        Text(
          "Silahkan masukan data diri anda",
        ),
      ];
    }

    Widget registerForm() {
      return ListView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          AppValidatorTextField(
            controller: nameController,
            hintText: "Staf ID",
            labelText: "Ketik staf ID",
            withUpperLabel: true,
            isMandatory: true,
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return "Isi nama lengkap";
              }
              return null;
            },
          ),
          const SizedBox(height: 18.0),
          AppValidatorTextField(
            controller: phoneController,
            hintText: "Staf Name",
            labelText: "Ketik Staf name",
            inputType: TextInputType.text,
            withUpperLabel: true,
            isMandatory: true,
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return "Isi staf name";
              }
              return null;
            },
          ),
          const SizedBox(height: 18.0),
          AppValidatorTextField(
            controller: emailController,
            hintText: "Hobby",
            labelText: "Hobby",
            withUpperLabel: true,
            validator: (String? value) {
              return null;
            },
          ),
          const SizedBox(height: 18.0),
          BlocBuilder<ActiveCubit, bool>(
            builder: (context, state) {
              return AppValidatorTextField(
                controller: passwordController,
                labelText: "Password",
                withUpperLabel: true,
                isMandatory: false,
                isObscure: !state,
                hintText: "Masukan Kata Sandi",
                suffixWidget: IconButton(
                  icon: Icon(state ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    context.read<ActiveCubit>().toggle(!state);
                  },
                ),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Isi password";
                  }
                  if (value!.length < 6) {
                    return "Minimal 6 karakter";
                  }
                  return null;
                },
              );
            },
          ),
          BlocBuilder<ActiveTwoCubit, bool>(
            builder: (context, state) {
              return AppValidatorTextField(
                controller: confirmPasswordController,
                labelText: "Confirm Password",
                withUpperLabel: true,
                isMandatory: false,
                isObscure: !state,
                hintText: "Masukan Kata Sandi",
                suffixWidget: IconButton(
                  icon: Icon(state ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    context.read<ActiveCubit>().toggle(!state);
                  },
                ),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Isi password";
                  }
                  if (value!.length < 6) {
                    return "Minimal 6 karakter";
                  }
                  return null;
                },
              );
            },
          ),
          const SizedBox(height: 32.0),
        ],
      );
    }

    Widget submitButton() {
      return AppPrimaryFullButton(
        "Daftar",
        () {
          if (formKey.currentState!.validate()) {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            context.read<LoginCubit>().login(
                  nameController.text,
                  confirmPasswordController.text,
                );
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Sukses Submit Button"),
              backgroundColor: Colors.green,
            ));
          }
        },
      );
    }

    Widget loginSection() {
      return InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Wrap(
          children: [
            Text(
              "Sudah Mempunyai Akun? ",
              textAlign: TextAlign.center,
            ),
            Text(
              "Masuk",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 18.0),
            ...header(),
            const SizedBox(height: 32.0),
            Expanded(child: registerForm()),
            const SizedBox(height: 16.0),
            submitButton(),
            const SizedBox(height: 16.0),
            // loginSection(),
            // const SizedBox(height: 18.0),
          ],
        ),
      ),
    );
  }
}
