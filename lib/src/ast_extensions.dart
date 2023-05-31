import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';

/// this adds some custom methods to the AstNode class
extension AstParser on AstNode {
  /// checks if it is an Expression with a static type that is a Widget
  bool get isWidgetClass {
    // https://github.com/invertase/dart_custom_lint/issues/42
    return this is Expression &&
        ((this as Expression).staticType?.element?.isWidgetClass ?? false);
  }
}

/// if it is not "Widget", then use recursion to check if supertype is widget
extension ElementParser on Element {
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
