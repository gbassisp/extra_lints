import 'package:extra_lints/src/lint_specifications.dart';
import 'package:test/test.dart';

import 'ast_mocks.mocks.dart';

void main() {
  group('specification', () {
    final importSpecification = ImportSpecification();
    final stringLiteral = StringLiteralSpecification();
    final completeSpecificaiton = StringLiteralInsideWidgetSpecification();

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
  });
}
