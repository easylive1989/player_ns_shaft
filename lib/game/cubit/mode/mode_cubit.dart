import 'package:flutter_bloc/flutter_bloc.dart';

part 'mode_state.dart';

class ModeCubit extends Cubit<ModeState> {
  ModeCubit({required ModeState state}) : super(state);

  bool get isNormalMode => state is NormalMode;
}
