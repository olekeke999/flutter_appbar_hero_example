part of 'details_bloc.dart';

@immutable
sealed class DetailsState {}

final class DetailsContentState extends DetailsState {
  final String newData;

  DetailsContentState({required this.newData});
}

final class LoadingState extends DetailsState {}
