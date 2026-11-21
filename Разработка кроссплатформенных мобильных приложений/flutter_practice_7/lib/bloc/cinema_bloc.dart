import 'package:bloc/bloc.dart';

import '../data/cinemas_data.dart';
import 'cinema_event.dart';
import 'cinema_state.dart';

class CinemaBloc extends Bloc<CinemaEvent, CinemaState> {
  CinemaBloc() : super(CinemaInitial()) {
    on<LoadCinemas>((event, emit) {
      emit(CinemaLoading());

      try {
        emit(CinemaLoaded(cinemas));
      } catch (e) {
        emit(CinemaError('Не удалось загрузить кинотеатры'));
      }
    });
  }
}