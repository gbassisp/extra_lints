import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:extra_lints/src/lint_specifications.dart';

/// create plugin to analyze dart files and raise warning on string literals
/// declared inside a class that extends Widget or State
PluginBase createPlugin() => _ExtraLinter();

class _ExtraLinter extends PluginBase {
  _ExtraLinter();

  LintRule? createLint(
    ResolvedUnitResult resolvedUnitResult,
  ) {
    return null;
    //resolvedUnitResult.lint;
  }

  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const AvoidStringLiteralsInsideWidget(),
      ];
}

/// Warning that String literals should not be declared inside a widget class
class AvoidStringLiteralsInsideWidget extends DartLintRule {
  /// Default constructor
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
    if (!context.pubspec.dependencies.containsKey('flutter')) {
      return;
    }

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
}
