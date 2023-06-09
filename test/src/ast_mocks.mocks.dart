// Mocks generated by Mockito 5.4.0 from annotations
// in flutter_sane_lints/test/src/ast_mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:analyzer/dart/ast/ast.dart' as _i3;
import 'package:analyzer/dart/ast/precedence.dart' as _i4;
import 'package:analyzer/dart/ast/syntactic_entity.dart' as _i5;
import 'package:analyzer/dart/ast/token.dart' as _i2;
import 'package:analyzer/dart/element/element.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeToken_0 extends _i1.SmartFake implements _i2.Token {
  _FakeToken_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNodeList_1<E extends _i3.AstNode> extends _i1.SmartFake
    implements _i3.NodeList<E> {
  _FakeNodeList_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAstNode_2 extends _i1.SmartFake implements _i3.AstNode {
  _FakeAstNode_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePrecedence_3 extends _i1.SmartFake implements _i4.Precedence {
  _FakePrecedence_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeExpression_4 extends _i1.SmartFake implements _i3.Expression {
  _FakeExpression_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Directive].
///
/// See the documentation for Mockito's code generation for more information.
class MockDirective extends _i1.Mock implements _i3.Directive {
  MockDirective() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Token get firstTokenAfterCommentAndMetadata => (super.noSuchMethod(
        Invocation.getter(#firstTokenAfterCommentAndMetadata),
        returnValue: _FakeToken_0(
          this,
          Invocation.getter(#firstTokenAfterCommentAndMetadata),
        ),
      ) as _i2.Token);
  @override
  _i3.NodeList<_i3.Annotation> get metadata => (super.noSuchMethod(
        Invocation.getter(#metadata),
        returnValue: _FakeNodeList_1<_i3.Annotation>(
          this,
          Invocation.getter(#metadata),
        ),
      ) as _i3.NodeList<_i3.Annotation>);
  @override
  List<_i3.AstNode> get sortedCommentAndAnnotations => (super.noSuchMethod(
        Invocation.getter(#sortedCommentAndAnnotations),
        returnValue: <_i3.AstNode>[],
      ) as List<_i3.AstNode>);
  @override
  _i2.Token get beginToken => (super.noSuchMethod(
        Invocation.getter(#beginToken),
        returnValue: _FakeToken_0(
          this,
          Invocation.getter(#beginToken),
        ),
      ) as _i2.Token);
  @override
  Iterable<_i5.SyntacticEntity> get childEntities => (super.noSuchMethod(
        Invocation.getter(#childEntities),
        returnValue: <_i5.SyntacticEntity>[],
      ) as Iterable<_i5.SyntacticEntity>);
  @override
  int get end => (super.noSuchMethod(
        Invocation.getter(#end),
        returnValue: 0,
      ) as int);
  @override
  _i2.Token get endToken => (super.noSuchMethod(
        Invocation.getter(#endToken),
        returnValue: _FakeToken_0(
          this,
          Invocation.getter(#endToken),
        ),
      ) as _i2.Token);
  @override
  bool get isSynthetic => (super.noSuchMethod(
        Invocation.getter(#isSynthetic),
        returnValue: false,
      ) as bool);
  @override
  int get length => (super.noSuchMethod(
        Invocation.getter(#length),
        returnValue: 0,
      ) as int);
  @override
  int get offset => (super.noSuchMethod(
        Invocation.getter(#offset),
        returnValue: 0,
      ) as int);
  @override
  _i3.AstNode get root => (super.noSuchMethod(
        Invocation.getter(#root),
        returnValue: _FakeAstNode_2(
          this,
          Invocation.getter(#root),
        ),
      ) as _i3.AstNode);
  @override
  E? accept<E>(_i3.AstVisitor<E>? visitor) =>
      (super.noSuchMethod(Invocation.method(
        #accept,
        [visitor],
      )) as E?);
  @override
  _i2.Token? findPrevious(_i2.Token? target) =>
      (super.noSuchMethod(Invocation.method(
        #findPrevious,
        [target],
      )) as _i2.Token?);
  @override
  E? getProperty<E>(String? name) => (super.noSuchMethod(Invocation.method(
        #getProperty,
        [name],
      )) as E?);
  @override
  void setProperty(
    String? name,
    Object? value,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #setProperty,
          [
            name,
            value,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  E? thisOrAncestorMatching<E extends _i3.AstNode>(
          bool Function(_i3.AstNode)? predicate) =>
      (super.noSuchMethod(Invocation.method(
        #thisOrAncestorMatching,
        [predicate],
      )) as E?);
  @override
  String toSource() => (super.noSuchMethod(
        Invocation.method(
          #toSource,
          [],
        ),
        returnValue: '',
      ) as String);
  @override
  void visitChildren(_i3.AstVisitor<dynamic>? visitor) => super.noSuchMethod(
        Invocation.method(
          #visitChildren,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [StringLiteral].
///
/// See the documentation for Mockito's code generation for more information.
class MockStringLiteral extends _i1.Mock implements _i3.StringLiteral {
  MockStringLiteral() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get inConstantContext => (super.noSuchMethod(
        Invocation.getter(#inConstantContext),
        returnValue: false,
      ) as bool);
  @override
  bool get isAssignable => (super.noSuchMethod(
        Invocation.getter(#isAssignable),
        returnValue: false,
      ) as bool);
  @override
  _i4.Precedence get precedence => (super.noSuchMethod(
        Invocation.getter(#precedence),
        returnValue: _FakePrecedence_3(
          this,
          Invocation.getter(#precedence),
        ),
      ) as _i4.Precedence);
  @override
  _i3.Expression get unParenthesized => (super.noSuchMethod(
        Invocation.getter(#unParenthesized),
        returnValue: _FakeExpression_4(
          this,
          Invocation.getter(#unParenthesized),
        ),
      ) as _i3.Expression);
  @override
  _i2.Token get beginToken => (super.noSuchMethod(
        Invocation.getter(#beginToken),
        returnValue: _FakeToken_0(
          this,
          Invocation.getter(#beginToken),
        ),
      ) as _i2.Token);
  @override
  Iterable<_i5.SyntacticEntity> get childEntities => (super.noSuchMethod(
        Invocation.getter(#childEntities),
        returnValue: <_i5.SyntacticEntity>[],
      ) as Iterable<_i5.SyntacticEntity>);
  @override
  int get end => (super.noSuchMethod(
        Invocation.getter(#end),
        returnValue: 0,
      ) as int);
  @override
  _i2.Token get endToken => (super.noSuchMethod(
        Invocation.getter(#endToken),
        returnValue: _FakeToken_0(
          this,
          Invocation.getter(#endToken),
        ),
      ) as _i2.Token);
  @override
  bool get isSynthetic => (super.noSuchMethod(
        Invocation.getter(#isSynthetic),
        returnValue: false,
      ) as bool);
  @override
  int get length => (super.noSuchMethod(
        Invocation.getter(#length),
        returnValue: 0,
      ) as int);
  @override
  int get offset => (super.noSuchMethod(
        Invocation.getter(#offset),
        returnValue: 0,
      ) as int);
  @override
  _i3.AstNode get root => (super.noSuchMethod(
        Invocation.getter(#root),
        returnValue: _FakeAstNode_2(
          this,
          Invocation.getter(#root),
        ),
      ) as _i3.AstNode);
  @override
  E? accept<E>(_i3.AstVisitor<E>? visitor) =>
      (super.noSuchMethod(Invocation.method(
        #accept,
        [visitor],
      )) as E?);
  @override
  _i2.Token? findPrevious(_i2.Token? target) =>
      (super.noSuchMethod(Invocation.method(
        #findPrevious,
        [target],
      )) as _i2.Token?);
  @override
  E? getProperty<E>(String? name) => (super.noSuchMethod(Invocation.method(
        #getProperty,
        [name],
      )) as E?);
  @override
  void setProperty(
    String? name,
    Object? value,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #setProperty,
          [
            name,
            value,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  E? thisOrAncestorMatching<E extends _i3.AstNode>(
          bool Function(_i3.AstNode)? predicate) =>
      (super.noSuchMethod(Invocation.method(
        #thisOrAncestorMatching,
        [predicate],
      )) as E?);
  @override
  String toSource() => (super.noSuchMethod(
        Invocation.method(
          #toSource,
          [],
        ),
        returnValue: '',
      ) as String);
  @override
  void visitChildren(_i3.AstVisitor<dynamic>? visitor) => super.noSuchMethod(
        Invocation.method(
          #visitChildren,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ConstructorInitializer].
///
/// See the documentation for Mockito's code generation for more information.
class MockConstructorInitializer extends _i1.Mock
    implements _i3.ConstructorInitializer {
  MockConstructorInitializer() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Token get beginToken => (super.noSuchMethod(
        Invocation.getter(#beginToken),
        returnValue: _FakeToken_0(
          this,
          Invocation.getter(#beginToken),
        ),
      ) as _i2.Token);
  @override
  Iterable<_i5.SyntacticEntity> get childEntities => (super.noSuchMethod(
        Invocation.getter(#childEntities),
        returnValue: <_i5.SyntacticEntity>[],
      ) as Iterable<_i5.SyntacticEntity>);
  @override
  int get end => (super.noSuchMethod(
        Invocation.getter(#end),
        returnValue: 0,
      ) as int);
  @override
  _i2.Token get endToken => (super.noSuchMethod(
        Invocation.getter(#endToken),
        returnValue: _FakeToken_0(
          this,
          Invocation.getter(#endToken),
        ),
      ) as _i2.Token);
  @override
  bool get isSynthetic => (super.noSuchMethod(
        Invocation.getter(#isSynthetic),
        returnValue: false,
      ) as bool);
  @override
  int get length => (super.noSuchMethod(
        Invocation.getter(#length),
        returnValue: 0,
      ) as int);
  @override
  int get offset => (super.noSuchMethod(
        Invocation.getter(#offset),
        returnValue: 0,
      ) as int);
  @override
  _i3.AstNode get root => (super.noSuchMethod(
        Invocation.getter(#root),
        returnValue: _FakeAstNode_2(
          this,
          Invocation.getter(#root),
        ),
      ) as _i3.AstNode);
  @override
  E? accept<E>(_i3.AstVisitor<E>? visitor) =>
      (super.noSuchMethod(Invocation.method(
        #accept,
        [visitor],
      )) as E?);
  @override
  _i2.Token? findPrevious(_i2.Token? target) =>
      (super.noSuchMethod(Invocation.method(
        #findPrevious,
        [target],
      )) as _i2.Token?);
  @override
  E? getProperty<E>(String? name) => (super.noSuchMethod(Invocation.method(
        #getProperty,
        [name],
      )) as E?);
  @override
  void setProperty(
    String? name,
    Object? value,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #setProperty,
          [
            name,
            value,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  E? thisOrAncestorMatching<E extends _i3.AstNode>(
          bool Function(_i3.AstNode)? predicate) =>
      (super.noSuchMethod(Invocation.method(
        #thisOrAncestorMatching,
        [predicate],
      )) as E?);
  @override
  String toSource() => (super.noSuchMethod(
        Invocation.method(
          #toSource,
          [],
        ),
        returnValue: '',
      ) as String);
  @override
  void visitChildren(_i3.AstVisitor<dynamic>? visitor) => super.noSuchMethod(
        Invocation.method(
          #visitChildren,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [FunctionBody].
///
/// See the documentation for Mockito's code generation for more information.
class MockFunctionBody extends _i1.Mock implements _i3.FunctionBody {
  MockFunctionBody() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isAsynchronous => (super.noSuchMethod(
        Invocation.getter(#isAsynchronous),
        returnValue: false,
      ) as bool);
  @override
  bool get isGenerator => (super.noSuchMethod(
        Invocation.getter(#isGenerator),
        returnValue: false,
      ) as bool);
  @override
  bool get isSynchronous => (super.noSuchMethod(
        Invocation.getter(#isSynchronous),
        returnValue: false,
      ) as bool);
  @override
  _i2.Token get beginToken => (super.noSuchMethod(
        Invocation.getter(#beginToken),
        returnValue: _FakeToken_0(
          this,
          Invocation.getter(#beginToken),
        ),
      ) as _i2.Token);
  @override
  Iterable<_i5.SyntacticEntity> get childEntities => (super.noSuchMethod(
        Invocation.getter(#childEntities),
        returnValue: <_i5.SyntacticEntity>[],
      ) as Iterable<_i5.SyntacticEntity>);
  @override
  int get end => (super.noSuchMethod(
        Invocation.getter(#end),
        returnValue: 0,
      ) as int);
  @override
  _i2.Token get endToken => (super.noSuchMethod(
        Invocation.getter(#endToken),
        returnValue: _FakeToken_0(
          this,
          Invocation.getter(#endToken),
        ),
      ) as _i2.Token);
  @override
  bool get isSynthetic => (super.noSuchMethod(
        Invocation.getter(#isSynthetic),
        returnValue: false,
      ) as bool);
  @override
  int get length => (super.noSuchMethod(
        Invocation.getter(#length),
        returnValue: 0,
      ) as int);
  @override
  int get offset => (super.noSuchMethod(
        Invocation.getter(#offset),
        returnValue: 0,
      ) as int);
  @override
  _i3.AstNode get root => (super.noSuchMethod(
        Invocation.getter(#root),
        returnValue: _FakeAstNode_2(
          this,
          Invocation.getter(#root),
        ),
      ) as _i3.AstNode);
  @override
  bool isPotentiallyMutatedInClosure(_i6.VariableElement? variable) =>
      (super.noSuchMethod(
        Invocation.method(
          #isPotentiallyMutatedInClosure,
          [variable],
        ),
        returnValue: false,
      ) as bool);
  @override
  bool isPotentiallyMutatedInScope(_i6.VariableElement? variable) =>
      (super.noSuchMethod(
        Invocation.method(
          #isPotentiallyMutatedInScope,
          [variable],
        ),
        returnValue: false,
      ) as bool);
  @override
  E? accept<E>(_i3.AstVisitor<E>? visitor) =>
      (super.noSuchMethod(Invocation.method(
        #accept,
        [visitor],
      )) as E?);
  @override
  _i2.Token? findPrevious(_i2.Token? target) =>
      (super.noSuchMethod(Invocation.method(
        #findPrevious,
        [target],
      )) as _i2.Token?);
  @override
  E? getProperty<E>(String? name) => (super.noSuchMethod(Invocation.method(
        #getProperty,
        [name],
      )) as E?);
  @override
  void setProperty(
    String? name,
    Object? value,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #setProperty,
          [
            name,
            value,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  E? thisOrAncestorMatching<E extends _i3.AstNode>(
          bool Function(_i3.AstNode)? predicate) =>
      (super.noSuchMethod(Invocation.method(
        #thisOrAncestorMatching,
        [predicate],
      )) as E?);
  @override
  String toSource() => (super.noSuchMethod(
        Invocation.method(
          #toSource,
          [],
        ),
        returnValue: '',
      ) as String);
  @override
  void visitChildren(_i3.AstVisitor<dynamic>? visitor) => super.noSuchMethod(
        Invocation.method(
          #visitChildren,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );
}
