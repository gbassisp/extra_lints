import 'package:analyzer/dart/ast/ast.dart';

part 'base_specifications.dart';

/// Specification: ast is any type of directive: import, export, part
class ImportSpecification extends LintSpecification {
  /// Default constructor
  ImportSpecification();

  @override
  bool isSatisfiedBy(AstNode element) => element is Directive;
}

/// Specification: ast is a string literal
class StringLiteralSpecification extends LintSpecification {
  /// Default constructor
  StringLiteralSpecification();

  @override
  bool isSatisfiedBy(AstNode element) => element is StringLiteral;
}

/// Specification: used in a constructor
class ConstructorSpecification extends LintSpecification {
  /// Default constructor
  ConstructorSpecification();

  // TODO(gbassi): check class extends Widget/State
  @override
  bool isSatisfiedBy(AstNode element) => element is InstanceCreationExpression;
}

/// Specification used in a function returning a Widget
class FunctionSpecification extends LintSpecification {
  /// Default constructor
  FunctionSpecification();

  // TODO(gbassi): check function returns Widget
  @override
  bool isSatisfiedBy(AstNode element) =>
      element is FunctionExpressionInvocation &&
      element.staticElement?.returnType
              .getDisplayString(withNullability: false) ==
          'Widget';
}

/// Specification: ast is a string literal used inside the definition of a
/// widget class or in a widget class constructor, or function that returns a
/// widget
class StringLiteralInsideWidgetSpecification extends LintSpecification {
  /// Default constructor
  StringLiteralInsideWidgetSpecification();

  @override
  bool isSatisfiedBy(AstNode element) {
    final isNotImport = ImportSpecification().not();
    // final isStringLiteral = StringLiteralSpecification();
    final isConstructor = ConstructorSpecification();
    final isFunction = FunctionSpecification();

    final specification = isNotImport
        // .and(isStringLiteral)
        .and(
      AnySpecification(
        [
          isConstructor,
          isFunction,
        ],
      ),
    );
    return specification.isSatisfiedBy(element);
  }
}
