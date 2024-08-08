import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_test/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Plugin must be initialized before using
  if (!kIsWeb) {}
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({super.key});

  @override
  Widget build(BuildContext context) {
    return App();

    //  MultiRepositoryProvider(
    //   providers: [
    //     RepositoryProvider<AuthenticationRepository>(
    //       create: (context) => authenticationRepository,
    //     ),
    //   ],
    //   child: MultiBlocProvider(
    //     providers: [
    //       BlocProvider<AuthenticationCubit>(
    //         create: (context) => AuthenticationCubit(authenticationRepository)
    //           ..listeningStatus(),
    //       ),
    //       BlocProvider<UserCubit>(
    //         create: (context) => UserCubit(
    //           SharedPreferenceServiceImpl.create(),
    //           OutletServiceImpl.create(),
    //         ),
    //       ),
    //       BlocProvider<ConnectionCheckCubit>(
    //         create: (context) => ConnectionCheckCubit()..streamConnection(),
    //       ),
    //       BlocProvider<BluetoothPrinterCubit>(
    //         create: (context) => BluetoothPrinterCubit(),
    //       ),
    //       BlocProvider<HomeCubit>(
    //         create: (context) => HomeCubit(FinanceServiceImpl.create()),
    //       ),
    //     ],
    //     child:
    //   ),
    // );
  }
}
