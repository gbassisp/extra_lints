// ignore_for_file: invalid_use_of_internal_member

import 'dart:io';

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:flutter_sane_lints/src/flutter_sane_lints.dart';
import 'package:test/test.dart';

List<File> getFiles() {
  final currentDir = Directory.current.uri;
  final libDir = Directory.fromUri(Uri.parse('${currentDir}example/lib'));
  final testDir = Directory.fromUri(Uri.parse('${currentDir}example/test'));

  final libFiles = libDir
      .listSync(recursive: true)
      .where((element) => element is File && element.path.endsWith('.dart'))
      .cast<File>();

  final testFiles = testDir
      .listSync(recursive: true)
      .where((element) => element is File && element.path.endsWith('.dart'))
      .cast<File>();

  return [...libFiles, ...testFiles];
}

int getExpectedErrorsCount(File file, String code) {
  final content = file.readAsStringSync();
  final lines = content.split('\n');
  final errors = lines.where(
    (element) => element.contains('// expect_lint: $code'),
  );
  return errors.length;
}

void main() {
  // load files before start testing
  final files = getFiles();
  group('FlutterSaneLints', () {
    test('can be instantiated', () {
      final plugin = createPlugin();
      final lints = plugin.getLintRules(CustomLintConfigs.empty);

      expect(lints, isNotEmpty);
    });

    test('files are found', () {
      expect(files, isNotEmpty);
    });

    for (final file in files) {
      test('run plugin on example project - file: $file', () async {
        final plugin = createPlugin();
        final lints = plugin.getLintRules(CustomLintConfigs.empty);

        for (final lint in lints) {
          expect(lint, isA<TestableDartRule>());
          final errors = await (lint as TestableDartRule).testFile(file);
          final expected = getExpectedErrorsCount(file, lint.code.name);
          expect(
            errors.length,
            expected,
            reason: 'Expected $expected errors, found ${errors.length} errors. '
                'Failed ${lint.runtimeType} on ${file.path}'
                'Found these errors: $errors',
          );
        }
      });
    }
  });
}
