import 'package:flutter_bloc/flutter_bloc.dart';

part 'mode_state.dart';

class ModeCubit extends Cubit<ModeState> {
  ModeCubit({required String? mode}) : super(modeMap[mode] ?? NormalMode());

  static Map<String, ModeState> modeMap = {
    'n': NormalMode(),
    'm': MarryMode(),
  };

  bool get isNormalMode => state is NormalMode;
}
