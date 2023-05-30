import 'package:extra_lints/src/lint_specifications.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'ast_mocks.mocks.dart';

void main() {
  group('specification', () {
    final importSpecification = ImportSpecification();
    final stringLiteral = StringLiteralSpecification();
    final constructor = ConstructorSpecification();
    final function = FunctionSpecification();

    final completeSpecificaiton = StringLiteralInsideWidgetSpecification();

    test('toString is overridden', () {
      expect(importSpecification.toString(), isNotEmpty);
      expect(stringLiteral.toString(), isNotEmpty);
      expect(constructor.toString(), isNotEmpty);
      expect(function.toString(), isNotEmpty);
      expect(completeSpecificaiton.toString(), isNotEmpty);
    });

    test('Directive AstNode', () {
      final element = MockDirective();
      expect(importSpecification.isSatisfiedBy(element), isTrue);

      // a Directive should never satisfy the specification
      expect(completeSpecificaiton.isSatisfiedBy(element), isFalse);
    });
    test('StringLiteral AstNode', () {
      final element = MockStringLiteral();
      expect(stringLiteral.isSatisfiedBy(element), isTrue);

      // a string literal alone does not satisfy the specification
      expect(completeSpecificaiton.isSatisfiedBy(element), isFalse);
    });
    test('Constructor AstNode', () {
      final element = MockConstructorInitializer();
      expect(constructor.isSatisfiedBy(element), isTrue);

      // a string literal alone does not satisfy the specification
      expect(completeSpecificaiton.isSatisfiedBy(element), isFalse);
    });
    test('Function AstNode', () {
      final element = MockFunctionBody();
      expect(function.isSatisfiedBy(element), isTrue);

      // a string literal alone does not satisfy the specification
      expect(completeSpecificaiton.isSatisfiedBy(element), isFalse);
    });
  });
}
