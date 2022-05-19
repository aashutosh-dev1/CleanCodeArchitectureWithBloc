import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'increment_state.dart';

class IncrementCubit extends Cubit<IncrementState> {
  IncrementCubit() : super(const IncrementState(1));

  increaseQuantity() {
    emit(IncrementState(state.qty + 1));
  }

  decrementQuantity() {
    if (state.qty == 1) {
      emit(const IncrementState(1));
    } else {
      emit(IncrementState(state.qty - 1));
    }
  }

  resetQuantity() {
    emit(const IncrementState(1));
  }
}
