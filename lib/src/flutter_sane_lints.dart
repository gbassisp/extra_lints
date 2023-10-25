import 'dart:io';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/syntactic_entity.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:flutter_sane_lints/src/lint_specifications.dart';
import 'package:meta/meta.dart';

/// create plugin to analyze dart files and raise warning on string literals
/// declared inside a class that extends Widget or State
PluginBase createPlugin() => _FlutterSaneLints();

class _FlutterSaneLints extends PluginBase {
  _FlutterSaneLints();

  LintRule? createLint(
    ResolvedUnitResult resolvedUnitResult,
  ) {
    return null;
    //resolvedUnitResult.lint;
  }

  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const AvoidStringLiteralsInsideWidget(),
        const AvoidIfWithEnum(),
      ];
}

/// A [DartLintRule] that raises a warning on string literals declared inside
/// a class that extends Widget or State, or a Widget constructor.
class AvoidStringLiteralsInsideWidget extends DartLintRule
    with TestableDartRule {
  /// Default const constructor
  const AvoidStringLiteralsInsideWidget() : super(code: _code);

  /// Metadata about the warning that will show-up in the IDE.
  /// This is used for `// ignore: code` and enabling/disabling the lint
  static const _code = LintCode(
    name: _name,
    problemMessage: 'String literals should not be declared inside a widget '
        'class. '
        'If this string is used for presentation, such as in a Text widget, '
        'it will make harder adding l10n support. '
        'If this string is used for comparison, such as: membership == "free", '
        'it is a sign of primitive obsession.',
    correctionMessage:
        'If this is for presentation, follow Flutter guidelines on l10n. '
        'If this is for comparison, consider using an enum instead.',
    errorSeverity: ErrorSeverity.WARNING,
    uniqueName: _name,
  );

  static const _name = 'avoid_string_literals_inside_widget';

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // must be flutter project
    // if (!context.pubspec.dependencies.containsKey('flutter')) {
    //   return;
    // }

    final specification = StringLiteralInsideWidgetSpecification();

    // string literal registry
    context.registry.addStringLiteral((node) {
      final w = node.thisOrAncestorMatching<AstNode>(
        specification.isSatisfiedBy,
      );

      if (w != null) {
        reporter.reportErrorForNode(code, node);
      }
    });
    // string interpolation registry
    context.registry.addStringInterpolation((node) {
      final w = node.thisOrAncestorMatching<AstNode>(
        specification.isSatisfiedBy,
      );

      if (w != null) {
        reporter.reportErrorForNode(code, node);
      }
    });
  }

  @visibleForTesting
  @override
  Future<List<AnalysisError>> testFile(File file) {
    // expose this method for testing
    // ignore: invalid_use_of_visible_for_testing_member
    return super.testAnalyzeAndRun(file);
  }
}

/// A [DartLintRule] that raises a warning on string literals declared inside
/// a class that extends Widget or State, or a Widget constructor.
class AvoidIfWithEnum extends DartLintRule with TestableDartRule {
  /// Default const constructor
  const AvoidIfWithEnum() : super(code: _code);

  /// Metadata about the warning that will show-up in the IDE.
  /// This is used for `// ignore: code` and enabling/disabling the lint
  static const _code = LintCode(
    name: _name,
    problemMessage: 'Enums should always be used with switch statements. '
        'This ensures your logic is reviewed when new values are added. '
        'Use exhaustive_cases from dart default rules as well.',
    correctionMessage: 'Use a switch statement.',
    errorSeverity: ErrorSeverity.WARNING,
    uniqueName: _name,
  );

  static const _name = 'avoid_if_with_enum';

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    bool visitConditional(SyntacticEntity node) {
      // print('$node is ${node.runtimeType}');
      return node is AstNode &&
          (node is SimpleIdentifier && node.staticElement is EnumElement ||
              node.childEntities.any(visitConditional));
    }

    // if statement
    context.registry.addIfStatement((node) {
      if (node.condition.childEntities.any(visitConditional)) {
        reporter.reportErrorForNode(code, node);
      }
    });
  }

  @visibleForTesting
  @override
  Future<List<AnalysisError>> testFile(File file) {
    // expose this method for testing
    // ignore: invalid_use_of_visible_for_testing_member
    return super.testAnalyzeAndRun(file);
  }
}

/// an interface to allow testing of [DartLintRule]
@visibleForTesting
mixin TestableDartRule on DartLintRule {
  /// run the lint rule on a file
  @visibleForTesting
  Future<List<AnalysisError>> testFile(File file);
}
