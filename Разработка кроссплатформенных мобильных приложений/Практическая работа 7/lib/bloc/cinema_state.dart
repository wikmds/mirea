import '../models/cinema.dart';

abstract class CinemaState {}

class CinemaInitial extends CinemaState {}

class CinemaLoading extends CinemaState {}

class CinemaLoaded extends CinemaState {
  final List<Cinema> cinemas;

  CinemaLoaded(this.cinemas);
}

class CinemaError extends CinemaState {
  final String message;

  CinemaError(this.message);
}