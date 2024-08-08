import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveTwoCubit extends Cubit<bool> {
  ActiveTwoCubit(super.status);

  void toggle(bool status) => emit(status);
}
