import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/type.dart';

/// this adds some custom methods to the AstNode class
extension AstParser on AstNode {
  /// checks if it is an Expression with a static type that is a Widget
  bool get isWidgetClass {
    // https://github.com/invertase/dart_custom_lint/issues/42
    return this is Expression &&
        ((this as Expression).staticType?.isWidget ?? false);
  }

  /// checks if it is a FormalParameter with a static type that is a Widget
  bool get isWidgetConstructor {
    return this is ConstructorDeclaration &&
        ((this as ConstructorDeclaration)
                .declaredFragment
                ?.element
                .returnType
                .allSupertypes
                .any((element) => element.isWidget) ??
            false);
  }

  /// checks if it is a FormalParameter with a static type that is a Widget
  bool get isWithinWidget {
    return this is VariableDeclaration &&
            ((this as VariableDeclaration)
                    .declaredElement2
                    ?.enclosingElement2
                    ?.isWidgetClass ??
                false) ||
        _isWithinWidgetRecursively;
  }

  bool get _isWithinWidgetRecursively {
    return this is VariableDeclaration &&
        ((this as VariableDeclaration)
                .declaredElement2
                ?.enclosingElement2
                ?._recursiveEnclosingElementIsWidget ??
            false);
  }
}

extension _DartTypeParser on DartType {
  bool get isWidget => element3?.isWidgetClass ?? false;
}

/// if it is not "Widget", then use recursion to check if supertype is widget
extension ElementParser on Element2 {
  bool get _recursiveEnclosingElementIsWidget {
    if (enclosingElement2 == null) {
      return false;
    }
    if (enclosingElement2!.isWidgetClass) {
      return true;
    }
    return enclosingElement2!._recursiveEnclosingElementIsWidget;
  }

  bool get _hasBuildMethod =>
      // is interface (every class has an interface)
      this is InterfaceElement2 &&
      // has a build method
      (this as InterfaceElement2).methods2.any(
            (element) => element._isBuildMethod,
          );

  bool get _isBuildMethod =>
      // is method (or any other function)
      this is FunctionTypedElement2 &&
      // is named build
      (name3 == 'build' &&
          // returns Widget
          (this as FunctionTypedElement2).returnType.getDisplayString() ==
              'Widget');

  bool get _hasCreateStateMethod =>
      // is interface (every class has an interface)
      this is InterfaceElement2 &&
      // has a build method
      (this as InterfaceElement2).methods2.any(
            (element) => element._isCreateStateMethod,
          );

  bool get _isCreateStateMethod =>
      // is method (or any other function)
      this is FunctionTypedElement2 &&
      // is named build
      name3 == 'createState' &&
      // returns Widget
      // (
      ((this as FunctionTypedElement2)
              .returnType
              .element3
              ?.children2
              .any((element) => element._isBuildMethod) ??
          false);

  /// verifies if element has a build method and extends Widget or State
  bool get isWidgetClass => _hasBuildMethod || _hasCreateStateMethod;
}
