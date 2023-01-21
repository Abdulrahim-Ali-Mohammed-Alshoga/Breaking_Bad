import 'package:breaking_bad/business_logic/cubit/system_state.dart';
import 'package:breaking_bad/constants/hive_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class SystemCubit extends Cubit<SystemState> {
  SystemCubit() :super(SystemInitialState());

  late bool light;
  // late bool search = false;
  var box = Hive.box(lightOrDark);

  Future<void> changTheme() async {
    light = !light;
    await box.put(lightTabal, light);
    emit(SystemInitialState());
  }

  isLight() {
    if (box.get(lightTabal) == null || box.get(lightTabal) == false) {
      light = false;
    }
    else {
      light = true;
    }
  }

  // isSearch() {
  //   search = !search;
  //   emit(SystemInitialState());
  // }
  // action() {
  //   emit(SystemInitialState());
  // }
}
