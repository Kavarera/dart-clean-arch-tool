# CLEAN ARCH TOOL
A command-line tool for automating the creation of clean architecture folder and file structures in Flutter projects. This tool helps developers start a Flutter project with a neat and well-structured architecture using just one command.

## Features
- Create a new Flutter project with clean architecture structure (core, features, data, domain, presentation)
- Automatically generate example files (entity, repository, usecase, model, controller, widget, etc.)
- Easy to customize

## Installation
Clone this repository, then run the following command:

```bash
dart pub global activate clean_arch_tool
```


## Usage
Run the following command in the terminal:

```bash
clean_arch_tool -n my_project
```

Options:
- `-n`, `--name` : Name of the Flutter project to be created (default: my_flutter_app)
- `-h`, `--help` : Show help

## Example Output Structure

```
project_name/
    lib/
        core/
            failures/
                base_failure.dart
            const.dart
            themes.dart
            utils/
                example_util.dart
        features/
            example/
                data/
                    models/
                        example_model.dart
                    datasources/
                        example_remote_data_source.dart
                    repositories/
                        example_repository_impl.dart
                domain/
                    entities/
                        example_entity.dart
                    repositories/
                        example_repository.dart
                    usecases/
                        example_usecase.dart
                presentation/
                    pages/
                        example_page.dart
                    widgets/
                        example_widget.dart
                    controllers/
                        example_controller.dart
                    example_specific/
                        pages/
                            example_page.dart
                        widgets/
                            example_widget.dart
                        controllers/
                            example_controller.dart
                    routes/
```

## Contributor
 - Kavarera (Owner)

