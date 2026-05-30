import 'dart:async';
import 'dart:ui';

bool _didBack = false;

class Debouncer {
  Debouncer({required this.milliseconds});
  final int milliseconds;

  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void confirm(VoidCallback confirm, VoidCallback action) async {
    print('didBack: $_didBack');
    if (_didBack) {
      return action();
    }
    _didBack = true;
    confirm();
    await Future.delayed(Duration(milliseconds: milliseconds), () => _didBack = false);
  }
}
