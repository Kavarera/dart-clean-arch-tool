final String ExamplePagesCode = '''
import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Page'),
      ),
      body: Center(
        child: Text('Hello, Clean Architecture!'),
      ),
    );
  }
}
''';

final String ExampleWidgetsCode = '''
import 'package:flutter/material.dart';
class ExampleWidget extends StatelessWidget {
  final String text;

  ExampleWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(text, style: TextStyle(fontSize: 18)),
    );
  }
}
''';

final String ExampleControllerCode = '''class ExampleController {}''';

final String ExampleRepositoryCode = '''abstract class ExampleRepository {}''';

final String ExampleEntityCode = '''class ExampleEntity{}''';

final String ExampleUsecaseCode = '''class ExampleUsecase{}''';

final String ExampleModelCode =
    '''import '../../domain/entities/example_entity.dart';

    class ExampleModel extends ExampleEntity{}''';

final String ExampleRemoteDataSourceCode =
    '''class ExampleRemoteDataSource {}''';

final String ExampleRepositoryImplCode =
    '''import '../../domain/repositories/example_repository.dart';
    
class ExampleRepositoryImpl implements ExampleRepository {}''';

final String ExampleFailureCode = '''
abstract class Failure implements Exception {
  final String message;
  Failure(this.message);

  @override
  String toString() => "Failure: \$message";
}
''';

final String ExampleConstCode = '''
// Put your global constants here
const String appName = "Clean Arch Tool";
''';

final String ExampleThemeCode = '''
import 'package:flutter/material.dart';

class AppThemes {
  static final light = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
  );

  static final dark = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey,
  );
}
''';

final String ExampleUtilCode = '''
class ExampleUtil {
  static String capitalize(String value) {
    if (value.isEmpty) return value;
    return value[0].toUpperCase() + value.substring(1);
  }
}
''';
