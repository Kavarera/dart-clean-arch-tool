import 'dart:io';
import 'package:args/args.dart';
import 'package:clean_arch_tool/clean_arch_tool.dart'; // export generator & utils

Future<T> runStep<T>(
  ProgressState p,
  String status,
  Future<T> Function() fn,
) async {
  p.step += 1;
  p.status = status;
  p.success = true;
  p.done = false;
  try {
    final r = await fn();
    p.done = true; // commit DONE
    return r;
  } catch (e) {
    p.success = false;
    p.done = true; // commit FAILED
    rethrow;
  }
}

void main(List<String> arguments) async {
  final parser =
      ArgParser()
        ..addOption('name', abbr: 'n', help: 'Project name')
        ..addFlag('help', abbr: 'h', negatable: false, help: 'Show usage');

  final args = parser.parse(arguments);
  if (args['help'] == true) {
    print(parser.usage);
    exit(0);
  }

  final name = args['name'] ?? 'my_flutter_app';

  final progress = ProgressState();
  final spinner = Spinner(progress);
  spinner.start();

  try {
    await runStep(progress, 'Creating Flutter project "$name"...', () async {
      final result = await Process.run('flutter', [
        'create',
        name,
      ], runInShell: true);
      if (result.exitCode != 0) {
        throw Exception(result.stderr);
      }
    });

    await runStep(progress, 'Generating base directories...', () async {
      final root = Directory(name);
      for (final dir in Dirs) {
        await Directory('${root.path}/$dir').create(recursive: true);
      }
    });

    // Pindah ke root project baru
    Directory.current = Directory(name);

    // Jalankan generator (pakai progress yang sama)
    await setupCleanArchFilesAndPath(progress);

    // Selesai total
    progress.success = true;
    progress.done = true;
    spinner.stop();

    stdout.writeln('\n\nClean architecture structure created successfully!');
  } catch (e) {
    progress.success = false;
    progress.done = true;
    spinner.stop();
    stdout.writeln('❌ Error: $e');
    exit(1);
  }
}
