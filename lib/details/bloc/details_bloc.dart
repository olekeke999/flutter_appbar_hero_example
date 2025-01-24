import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(LoadingState()) {
    on<InitializeEvent>((event, emit) async => await _onInitialize(emit));
  }

  Future<void> _onInitialize(Emitter<DetailsState> emit) async {
    // mocking network request for loading
    await Future.delayed(const Duration(seconds: 2));
    emit(DetailsContentState(newData: 'new network data'));
  }
}
