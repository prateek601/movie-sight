import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity = Connectivity();
  late StreamSubscription subscription;

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
        print('changed');
        emitConnectionState(result: result);
      },
    );
  }

  void emitConnectionState({required ConnectivityResult result}) {
    if (result == ConnectivityResult.mobile) {
      emitConnected();
    } else if (result == ConnectivityResult.wifi) {
      emitConnected();
    } else {
      emitDisconnected();
    }
  }

  void cancelSubscription() {
    subscription.cancel();
  }

  void emitConnected() => emit(Connected());

  void emitDisconnected() => emit(Disconnected());
}
