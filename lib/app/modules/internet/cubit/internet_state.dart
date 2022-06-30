part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class CheckingConnection extends InternetState {}

class Connected extends InternetState {}

class Disconnected extends InternetState {}
