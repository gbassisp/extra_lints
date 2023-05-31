import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';

/// this adds some custom methods to the AstNode class
extension AstParser on AstNode {
  /// checks if the ast node is a function that returns a Widget
  bool get isWidgetFunction =>
      _isWidgetFunction ||
      _isWidgetFunctionDeclaration ||
      _isWidgetFunctionBody;

  bool get _isWidgetFunctionDeclaration {
    return this is FunctionDeclaration &&
        (this as FunctionDeclaration).functionExpression.body.isWidgetFunction;
  }

  bool get _isWidgetFunctionBody {
    return this is BlockFunctionBody &&
        (this as BlockFunctionBody).block.isWidgetFunction;
  }

  bool get _isWidgetFunction {
    return this is FunctionExpressionInvocation &&
        ((this as FunctionExpressionInvocation)
                .staticElement
                ?.returnType
                .element
                ?.isWidgetClass ??
            false);
  }

  /// checks if a ClassDeclaration has build method
  bool get _hasBuildMethod {
    return this is ClassDeclaration &&
        (this as ClassDeclaration).members.any((element) =>
            element is MethodDeclaration &&
            (element.declaredElement?.isWidgetClass ?? false));
  }

  bool get _crazyApproach {
    try {
      return ((this as dynamic).element as Element).isWidgetClass;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// checks if constructor is a widget
  bool get isWidgetConstructor {
    return _hasBuildMethod ||
        _tryAgain ||
        _crazyApproach ||
        this is InstanceCreationExpression &&
            ((this as InstanceCreationExpression)
                    .staticParameterElement
                    ?.isWidgetClass ??
                false);
  }

  bool get _tryAgain {
    // https://github.com/invertase/dart_custom_lint/issues/42
    return this is Expression &&
        ((this as Expression).staticType?.element?.isWidgetClass ?? false);
  }
}

/// if it is not "Widget", then use recursion to check if supertype is widget
extension ElementParser on Element {
  // bool get _isWidgetClass {
  //   return this is ClassElement &&
  //       (this as ClassElement).allSupertypes.any(
  //             (element) => element
  //                 .getDisplayString(
  //                   withNullability: false,
  //                 )
  //                 .contains('Widget'),
  //           );
  // }

  // bool get _isStateClass {
  //   return this is ClassElement &&
  //       (this as ClassElement).allSupertypes.any(
  //             (element) => element
  //                 .getDisplayString(
  //                   withNullability: false,
  //                 )
  //                 .contains('State'),
  //           );
  // }

  bool get _hasBuildMethod =>
      // is interface (every class has an interface)
      this is InterfaceOrAugmentationElement &&
      // has a build method
      (this as InterfaceOrAugmentationElement).methods.any(
            (element) => element._isBuildMethod,
          );

  bool get _isBuildMethod =>
      // is method (or any other function)
      this is FunctionTypedElement &&
      // is named build
      (name == 'build' &&
          // returns Widget
          (this as FunctionTypedElement)
                  .returnType
                  .getDisplayString(withNullability: false) ==
              'Widget');

  /// verifies if element has a build method and extends Widget or State
  bool get isWidgetClass =>
      // (_isWidgetClass || _isStateClass) ||
      _hasBuildMethod;
}
