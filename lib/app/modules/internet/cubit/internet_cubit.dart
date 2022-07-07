import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity = Connectivity();
  late StreamSubscription subscription;
  bool firstTime = true;

  InternetCubit() : super(CheckingConnection()) {
    checkConnectivity();
    subscribeConnectionStream();
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await connectivity.checkConnectivity();
    emitConnectionState(result: connectivityResult);
  }

  void subscribeConnectionStream() {
    subscription = connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        emitConnectionState(result: result);
      },
    );
  }

  void emitConnectionState({required ConnectivityResult result}) {
    if (result == ConnectivityResult.none) {
      emitDisconnected();
    } else {
      if(!firstTime) {
        emitConnected();
      }
    }
    firstTime = false;
  }

  void cancelSubscription() {
    subscription.cancel();
  }

  void emitConnected() => emit(Connected());

  void emitDisconnected() => emit(Disconnected());
}
