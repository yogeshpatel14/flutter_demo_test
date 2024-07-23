part of 'counter_bloc.dart';

sealed class CountEvent {}

class IncreamentCount extends CountEvent {}

class DecreamentCount extends CountEvent {}
