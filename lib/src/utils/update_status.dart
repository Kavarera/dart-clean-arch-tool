import 'dart:async';
import 'dart:io';

import 'progress_state.dart';

class Spinner {
  final List<String> _frames = ['\\', '|', '/', '-'];
  int _frameIndex = 0;
  final ProgressState _state;
  Timer? _timer;

  Spinner(this._state);

  bool get _running => _timer?.isActive == true;

  void start({int intervalMs = 100}) {
    if (_running)
      return; // <-- idempotent: kalau sudah jalan, jangan start lagi
    _timer = Timer.periodic(Duration(milliseconds: intervalMs), (_) {
      if (_state.done) {
        // Tampilkan hasil step, tapi JANGAN cancel timer
        // stdout.writeln('\x1B[2K\r'); // clear line, lalu carriage return
        stdout.writeln('\n\t\tDONE'); // clear line, lalu carriage return
        // stdout.writeln('Step ${_state.step}: ${_state.status} DONE');
        // stdout.writeln('Step ${_state.step}: ${_state.status} $icon');
        _state.done = false; // siap animasi step berikutnya
        return;
      }

      // Animasi 1 baris
      stdout.write(
        '\rStep ${_state.step}: ${_state.status} ${_frames[_frameIndex % _frames.length]}',
      );
      stdout.flush();
      _frameIndex++;
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }
}
