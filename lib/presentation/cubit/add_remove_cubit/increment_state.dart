part of 'increment_cubit.dart';

class IncrementState extends Equatable {
  final int qty;
  const IncrementState(this.qty);

  @override
  List<Object> get props => [qty];
}
