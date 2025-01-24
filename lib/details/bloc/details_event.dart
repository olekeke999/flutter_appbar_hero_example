part of 'details_bloc.dart';

@immutable
sealed class DetailsEvent {}

class InitializeEvent extends DetailsEvent {}
