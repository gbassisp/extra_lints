import 'package:analyzer/dart/ast/ast.dart';
import 'package:flutter_sane_lints/src/lint_specifications.dart';
import 'package:test/test.dart';

import 'ast_mocks.mocks.dart';

class AlwaysTrue extends LintSpecification {
  AlwaysTrue();

  @override
  bool isSatisfiedBy(AstNode element) => true;

  @override
  String toString() => 'AlwaysTrue';
}

class AlwaysFalse extends LintSpecification {
  AlwaysFalse();

  @override
  bool isSatisfiedBy(AstNode element) => false;

  @override
  String toString() => 'AlwaysFalse';
}

void main() {
  group('specification', () {
    final importSpecification = ImportSpecification();
    final constructor = ConstructorSpecification();
    final function = ClassSpecification();

    final completeSpecificaiton = StringLiteralInsideWidgetSpecification();

    final alwaysTrue = AlwaysTrue();
    final alwaysFalse = AlwaysFalse();
    final ast = MockDirective();
    test('toString is overridden', () {
      expect(importSpecification.toString(), isNotEmpty);
      expect(constructor.toString(), isNotEmpty);
      expect(function.toString(), isNotEmpty);
      expect(completeSpecificaiton.toString(), isNotEmpty);
    });

    test('Base specifications - sanity check', () {
      expect(alwaysTrue.isSatisfiedBy(ast), isTrue);
      expect(alwaysFalse.isSatisfiedBy(ast), isFalse);
    });
    test('Base specifications', () {
      final and = alwaysTrue.and(alwaysTrue);
      final or = alwaysTrue.or(alwaysFalse);
      final not = alwaysFalse.not();
      final any = AnySpecification([and, or, not]);
      final all = AllSpecification([and, or, not, any]);

      expect(and.isSatisfiedBy(ast), isTrue);
      expect(or.isSatisfiedBy(ast), isTrue);
      expect(not.isSatisfiedBy(ast), isTrue);
      expect(any.isSatisfiedBy(ast), isTrue);
      expect(all.isSatisfiedBy(ast), isTrue);
      expect(all.not().isSatisfiedBy(ast), isFalse);

      expect(all.toString(), isNotEmpty);
    });
  });
}
