import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_test/core/components/app_dialog.dart';
import 'package:next_test/core/logic/active_cubit.dart';
import 'package:next_test/core/logic/active_two_cubit.dart';
import 'package:next_test/core/logic/login/login_cubit.dart';
import 'package:next_test/core/service/login_service.dart';
import 'package:next_test/login_view.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static RouteSettings routeSettings() {
    return const RouteSettings(name: '/login');
  }

  @override
  Widget build(BuildContext context) {
    final SimpleFontelicoProgressDialog dialog =
        SimpleFontelicoProgressDialog(context: context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(LoginServiceImpl.create()),
        ),
        BlocProvider<ActiveCubit>(
          create: (context) => ActiveCubit(false),
        ),
        BlocProvider<ActiveTwoCubit>(
          create: (context) => ActiveTwoCubit(false),
        ),
      ],
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoaded) {
            dialog.hide();
          }

          if (state is LoginFailed) {
            dialog.hide();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          }

          if (state is LoginLoading) {
            AppDialog().showLoadingDialog(context, dialog);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: LoginView(),
        ),
      ),
    );
  }
}
