part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeFailure extends HomeState {
  final String errormsg;

  HomeFailure({required this.errormsg});
}
final class HomeSuccess extends HomeState {
  final String predict;

  HomeSuccess({required this.predict});
}
