import 'package:flutter_riverpod/flutter_riverpod.dart';

final clockStreamProvider = StreamProvider<DateTime>((ref) => ref.watch(clockUtilsProvider).getClockStream());

class ClockUtils {
  final Ref ref;
  ClockUtils(this.ref);

  Stream<DateTime> getClockStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield DateTime.now();
    }
  }
}

final clockUtilsProvider = Provider(ClockUtils.new);
