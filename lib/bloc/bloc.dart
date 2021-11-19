import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'states.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState()) {
    on<LightThemeEvent>((event, emit) => emit(LightThemeState()));
    on<DarkThemeEvent>((event, emit) => emit(DarkThemeState()));
    on<ToggleThemeEvent>((event, emit) => emit(state is LightThemeState? DarkThemeState() : LightThemeState()));
    on<CustomThemeEvent>((event, emit) => emit(CustomThemeState(event.theme)));
  }

/*
  /// Deprecated
  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is LightThemeEvent)
      yield LightThemeState();
    else if (event is DarkThemeEvent)
      yield DarkThemeState();
    else if (event is ToggleThemeEvent)
      yield (state is LightThemeState) ? DarkThemeState() : LightThemeState();
    else if (event is CustomThemeEvent) yield CustomThemeState(event.theme);
  }
  */
}
