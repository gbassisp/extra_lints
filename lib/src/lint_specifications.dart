import 'package:analyzer/dart/ast/ast.dart';
import 'package:extra_lints/src/ast_extensions.dart';

part 'base_specifications.dart';

/// Specification: ast is any type of directive: import, export, part
class ImportSpecification extends LintSpecification {
  /// Default constructor
  ImportSpecification();

  @override
  bool isSatisfiedBy(AstNode element) => element is Directive;

  @override
  String toString() => 'IsImport';
}

/// Specification: ast is a string literal
class StringLiteralSpecification extends LintSpecification {
  /// Default constructor
  StringLiteralSpecification();

  @override
  bool isSatisfiedBy(AstNode element) => element is StringLiteral;

  @override
  String toString() => 'IsStringLiteral';
}

/// Specification: used in a constructor
class ConstructorSpecification extends LintSpecification {
  /// Default constructor
  ConstructorSpecification();

  @override
  bool isSatisfiedBy(AstNode element) => element.isWidgetConstructor;

  @override
  String toString() => 'IsConstructor';
}

/// Specification used in a function returning a Widget
class ClassSpecification extends LintSpecification {
  /// Default constructor
  ClassSpecification();

  @override
  bool isSatisfiedBy(AstNode element) => element.isWidgetClass;

  @override
  String toString() => 'IsClass';
}

/// Specification used in a function returning a Widget
class CompilationUnitSpecification extends LintSpecification {
  /// Default constructor
  CompilationUnitSpecification();

  @override
  bool isSatisfiedBy(AstNode element) => element.isWidgetCompilationUnit;

  @override
  String toString() => 'IsCompilationUnit';
}

/// Specification: ast is a string literal used inside the definition of a
/// widget class or in a widget class constructor, or function that returns a
/// widget
class StringLiteralInsideWidgetSpecification extends LintSpecification {
  /// Default constructor
  StringLiteralInsideWidgetSpecification();
  final _isNotImport = ImportSpecification().not();
  final _isConstructor = ConstructorSpecification();
  final _isClass = ClassSpecification();
  final _isCompilationUnit = CompilationUnitSpecification();
  late final _specification = _isNotImport.and(
    AnySpecification(
      [
        _isConstructor,
        _isClass,
        _isCompilationUnit,
      ],
    ),
  );

  @override
  bool isSatisfiedBy(AstNode element) => _specification.isSatisfiedBy(element);

  @override
  String toString() => '$_specification';
}
