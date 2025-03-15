part of 'is_scure_cubit.dart';

@immutable
sealed class IsScureState {}

final class IsScureInitial extends IsScureState {}
// ignore: must_be_immutable
final class IsScure extends IsScureState {
  bool isScure;
  IsScure({required this.isScure});
}
