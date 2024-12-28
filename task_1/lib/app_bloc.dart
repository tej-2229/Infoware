import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/app_events.dart';
import 'package:task_1/app_service.dart';
import 'package:task_1/app_states.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<FetchDataEvent>((event, emit) async {
      emit(AppLoading());
      try {
        final items = await ApiService.fetchData();
        emit(AppLoaded(items));
      } catch (e) {
        emit(AppError(e.toString()));
      }
    });
  }
}