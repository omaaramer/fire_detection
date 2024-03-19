part of 'fire_cubit.dart';

@immutable
sealed class FireState {}

final class FireSafeState extends FireState {}

final class FireWarning extends FireState {}
