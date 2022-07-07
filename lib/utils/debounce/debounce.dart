import 'dart:async';

class Debounce {
  final Duration delay;
  Timer? _debounce;

  Debounce({required this.delay});

  void run(action) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(delay, action);
  }

  void cancel() {
    _debounce?.cancel();
  }
}
