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
  // ignore: use_to_and_as_if_applicable
  LintSpecification not() => NotSpecification(this);

  @override
  String toString() {
    assert(false, 'toString() should be overridden to make debugging easier');
    return super.toString();
  }
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

  @override
  String toString() => '($_first AND $_second)';
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

  @override
  String toString() => '($_first OR $_second)';
}

/// NOT operation
class NotSpecification extends LintSpecification {
  /// Default constructor
  NotSpecification(this._specification);

  final LintSpecification _specification;

  @override
  bool isSatisfiedBy(AstNode element) => !_specification.isSatisfiedBy(element);

  @override
  String toString() => '(NOT $_specification)';
}

/// ANY operation
class AnySpecification extends LintSpecification {
  /// Default constructor
  AnySpecification(this._specifications);

  final List<LintSpecification> _specifications;

  /// Combine all specifications with OR
  LintSpecification get combined => _specifications.reduce((a, b) => a.or(b));

  @override
  bool isSatisfiedBy(AstNode element) => combined.isSatisfiedBy(element);

  @override
  String toString() => '$combined';
}

/// ALL operation
class AllSpecification extends LintSpecification {
  /// Default constructor
  AllSpecification(this._specifications);

  final List<LintSpecification> _specifications;

  /// Combine all specifications with AND
  LintSpecification get combined => _specifications.reduce((a, b) => a.and(b));

  @override
  bool isSatisfiedBy(AstNode element) => combined.isSatisfiedBy(element);

  @override
  String toString() => '$combined';
}
