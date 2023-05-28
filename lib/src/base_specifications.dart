part of 'lint_specifications.dart';

/// abstract class to represent the Specification pattern
abstract class LintSpecification {
  /// check if the [element] is valid
  bool isSatisfiedBy(AstNode element);

  /// AND operation
  LintSpecification and(LintSpecification other) =>
      AndSpecification(this, other);

  /// OR operation
  LintSpecification or(LintSpecification other) => OrSpecification(this, other);

  /// NOT operation
  LintSpecification not() => NotSpecification(this);
}

/// AND operation
class AndSpecification extends LintSpecification {
  /// Default constructor
  AndSpecification(this._first, this._second);

  final LintSpecification _first;
  final LintSpecification _second;

  @override
  bool isSatisfiedBy(AstNode element) =>
      _first.isSatisfiedBy(element) && _second.isSatisfiedBy(element);
}

/// OR operation
class OrSpecification extends LintSpecification {
  /// Default constructor
  OrSpecification(this._first, this._second);

  final LintSpecification _first;
  final LintSpecification _second;

  @override
  bool isSatisfiedBy(AstNode element) =>
      _first.isSatisfiedBy(element) || _second.isSatisfiedBy(element);
}

/// NOT operation
class NotSpecification extends LintSpecification {
  /// Default constructor
  NotSpecification(this._specification);

  final LintSpecification _specification;

  @override
  bool isSatisfiedBy(AstNode element) => !_specification.isSatisfiedBy(element);
}

/// ANY operation
class AnySpecification extends LintSpecification {
  /// Default constructor
  AnySpecification(this._specifications);

  final List<LintSpecification> _specifications;

  @override
  bool isSatisfiedBy(AstNode element) {
    for (final specification in _specifications) {
      if (specification.isSatisfiedBy(element)) {
        return true;
      }
    }
    return false;
  }
}

/// ALL operation
class AllSpecification extends LintSpecification {
  /// Default constructor
  AllSpecification(this._specifications);

  final List<LintSpecification> _specifications;

  @override
  bool isSatisfiedBy(AstNode element) {
    for (final specification in _specifications) {
      if (!specification.isSatisfiedBy(element)) {
        return false;
      }
    }
    return true;
  }
}
