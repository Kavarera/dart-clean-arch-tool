// lib/src/generator.dart
import 'dart:io';
import 'package:clean_arch_tool/src/consts/codes.dart';
import 'package:clean_arch_tool/src/consts/dirs.dart';
import 'package:clean_arch_tool/src/utils/progress_state.dart';

// helper untuk menaikkan step & set status
void _next(ProgressState p, String status) {
  p.step += 1;
  p.status = status;
  p.success = true;
  p.done = false;
}

// helper commit DONE/FAILED utk 1 langkah
void _done(ProgressState p, {bool success = true}) {
  p.success = success;
  p.done = true;
}

Future<void> setupCleanArchFilesAndPath(ProgressState p) async {
  try {
    await _setupCores(p);
    await _setupFeaturesDomain(p);
    await _setupFeaturesData(p);
    await _setupFeaturesPresentation(p);
    _done(p, success: true); // final ✔
  } catch (e) {
    _done(p, success: false);
    rethrow;
  }
}

Future<void> _setupFeaturesPresentation(ProgressState p) async {
  if (!Directory(PresentationPath).existsSync()) {
    Directory(PresentationPath).createSync(recursive: true);
  }
  try {
    _next(p, 'Create presentation/pages folder');
    await Future.delayed(const Duration(milliseconds: 300));
    await Directory('$PresentationPath/pages').create(recursive: true);
    _done(p);
    await Future.delayed(const Duration(milliseconds: 300));

    _next(p, 'Create presentation/pages/example_page.dart');
    await Future.delayed(const Duration(milliseconds: 300));
    await File(
      '$PresentationPath/pages/example_page.dart',
    ).writeAsString(ExamplePagesCode);
    _done(p);
    await Future.delayed(const Duration(milliseconds: 300));

    _next(p, 'Create presentation/widgets folder');
    await Future.delayed(const Duration(milliseconds: 300));
    await Directory('$PresentationPath/widgets').create(recursive: true);
    _done(p);
    await Future.delayed(const Duration(milliseconds: 300));

    _next(p, 'Create presentation/widgets/example_widget.dart');
    await Future.delayed(const Duration(milliseconds: 300));
    await File(
      '$PresentationPath/widgets/example_widget.dart',
    ).writeAsString(ExampleWidgetsCode);
    _done(p);
    await Future.delayed(const Duration(milliseconds: 300));

    _next(p, 'Create presentation/controllers folder');
    await Future.delayed(const Duration(milliseconds: 300));
    await Directory('$PresentationPath/controllers').create(recursive: true);
    _done(p);
    await Future.delayed(const Duration(milliseconds: 300));

    _next(p, 'Create presentation/controllers/example_controller.dart');
    await Future.delayed(const Duration(milliseconds: 300));
    await File(
      '$PresentationPath/controllers/example_controller.dart',
    ).writeAsString(ExampleControllerCode);
    _done(p);
    await Future.delayed(const Duration(milliseconds: 300));

    // specific example
    _next(p, 'Create presentation/example_specific folders');
    await Future.delayed(const Duration(milliseconds: 300));
    await Directory(
      '$PresentationPath/example_specific/pages',
    ).create(recursive: true);
    await Directory(
      '$PresentationPath/example_specific/widgets',
    ).create(recursive: true);
    await Directory(
      '$PresentationPath/example_specific/controllers',
    ).create(recursive: true);
    _done(p);
    await Future.delayed(const Duration(milliseconds: 300));

    _next(p, 'Create presentation/example_specific/pages/example_page.dart');
    await Future.delayed(const Duration(milliseconds: 300));
    await File(
      '$PresentationPath/example_specific/pages/example_page.dart',
    ).writeAsString(ExamplePagesCode);
    _done(p);
    await Future.delayed(const Duration(milliseconds: 300));

    _next(
      p,
      'Create presentation/example_specific/widgets/example_widget.dart',
    );
    await Future.delayed(const Duration(milliseconds: 300));
    await File(
      '$PresentationPath/example_specific/widgets/example_widget.dart',
    ).writeAsString(ExampleWidgetsCode);
    _done(p);
    await Future.delayed(const Duration(milliseconds: 300));

    _next(
      p,
      'Create presentation/example_specific/controllers/example_controller.dart',
    );
    await Future.delayed(const Duration(milliseconds: 300));
    await File(
      '$PresentationPath/example_specific/controllers/example_controller.dart',
    ).writeAsString(ExampleControllerCode);
    _done(p);
    await Future.delayed(const Duration(milliseconds: 300));

    // routes
    _next(p, 'Create presentation/routes folder');
    await Future.delayed(const Duration(milliseconds: 300));
    await Directory('$PresentationPath/routes').create(recursive: true);
    _done(p);
    await Future.delayed(const Duration(milliseconds: 300));
  } catch (e) {
    _done(p, success: false);
    throw Exception('Failed to setup presentation: $e');
  }
}

Future<void> _setupFeaturesDomain(ProgressState p) async {
  if (!Directory(DomainPath).existsSync()) {
    Directory(DomainPath).createSync(recursive: true);
  }
  try {
    _next(p, 'Create domain/entities folder');
    await Directory('$DomainPath/entities').create(recursive: true);
    _done(p);

    _next(p, 'Create domain/entities/example_entity.dart');
    await File(
      '$DomainPath/entities/example_entity.dart',
    ).writeAsString(ExampleEntityCode);
    _done(p);

    _next(p, 'Create domain/repositories folder');
    await Directory('$DomainPath/repositories').create(recursive: true);
    _done(p);

    _next(p, 'Create domain/repositories/example_repository.dart');
    await File(
      '$DomainPath/repositories/example_repository.dart',
    ).writeAsString(ExampleRepositoryCode);
    _done(p);

    _next(p, 'Create domain/usecases folder');
    await Directory('$DomainPath/usecases').create(recursive: true);
    _done(p);

    _next(p, 'Create domain/usecases/example_usecase.dart');
    await File(
      '$DomainPath/usecases/example_usecase.dart',
    ).writeAsString(ExampleUsecaseCode);
    _done(p);
  } catch (e) {
    _done(p, success: false);
    throw Exception('Failed to setup domain: $e');
  }
}

Future<void> _setupFeaturesData(ProgressState p) async {
  if (!Directory(DataPath).existsSync()) {
    Directory(DataPath).createSync(recursive: true);
  }
  try {
    _next(p, 'Create data/models folder');
    await Directory('$DataPath/models').create(recursive: true);
    _done(p);

    _next(p, 'Create data/models/example_model.dart');
    await File(
      '$DataPath/models/example_model.dart',
    ).writeAsString(ExampleModelCode);
    _done(p);

    _next(p, 'Create data/datasources folder');
    await Directory('$DataPath/datasources').create(recursive: true);
    _done(p);

    _next(p, 'Create data/datasources/example_remote_data_source.dart');
    await File(
      '$DataPath/datasources/example_remote_data_source.dart',
    ).writeAsString(ExampleRemoteDataSourceCode);
    _done(p);

    _next(p, 'Create data/repositories folder');
    await Directory('$DataPath/repositories').create(recursive: true);
    _done(p);

    _next(p, 'Create data/repositories/example_repository_impl.dart');
    await File(
      '$DataPath/repositories/example_repository_impl.dart',
    ).writeAsString(ExampleRepositoryImplCode);
    _done(p);
  } catch (e) {
    _done(p, success: false);
    throw Exception('Failed to setup data: $e');
  }
}

Future<void> _setupCores(ProgressState p) async {
  final coreDir = Directory(Dirs[0]);
  if (!coreDir.existsSync()) {
    coreDir.createSync(recursive: true);
  }
  try {
    _next(p, 'Create core/failures folder');
    await Directory('${coreDir.path}/failures').create(recursive: true);
    _done(p);

    _next(p, 'Create core/failures/base_failure.dart');
    await File(
      '${coreDir.path}/failures/base_failure.dart',
    ).writeAsString(ExampleFailureCode);
    _done(p);

    _next(p, 'Create core/const.dart');
    await File('${coreDir.path}/const.dart').writeAsString(ExampleConstCode);
    _done(p);

    _next(p, 'Create core/themes.dart');
    await File('${coreDir.path}/themes.dart').writeAsString(ExampleThemeCode);
    _done(p);

    _next(p, 'Create core/utils folder');
    await Directory('${coreDir.path}/utils').create(recursive: true);
    _done(p);

    _next(p, 'Create core/utils/example_util.dart');
    await File(
      '${coreDir.path}/utils/example_util.dart',
    ).writeAsString(ExampleUtilCode);
    _done(p);
  } catch (e) {
    _done(p, success: false);
    throw Exception('Failed to setup core: $e');
  }
}
