import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
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
                .declaredElement
                ?.returnType
                .allSupertypes
                .any((element) => element.isWidget) ??
            false);
  }

  /// checks if it is a FormalParameter with a static type that is a Widget
  bool get isWidgetCompilationUnit {
    return false;
    // this is CompilationUnit &&
    //     ((this as CompilationUnit)
    //             .declaredElement
    //             ?.classes
    //             .any((element) => element.isWidgetClass) ??
    //         false);
  }

  // bool get _a {
  //   return this is DefaultFormalParameter && (this as DefaultFormalParameter).;
  // }
}

// [avoid_string_literals_inside_widget] 2023-05-31T21:50:48.859234 ConstructorDeclarationImpl at app_test.dart 37: false
// [avoid_string_literals_inside_widget] 2023-05-31T21:50:48.859496 ClassDeclarationImpl at app_test.dart 37: false
// [avoid_string_literals_inside_widget] 2023-05-31T21:50:48.859707 CompilationUnitImpl at app_test.dart 37: false

extension _DartTypeParser on DartType {
  bool get isWidget => element?.isWidgetClass ?? false;
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

  bool get _hasCreateStateMethod =>
      // is interface (every class has an interface)
      this is InterfaceOrAugmentationElement &&
      // has a build method
      (this as InterfaceOrAugmentationElement).methods.any(
            (element) => element._isCreateStateMethod,
          );

  bool get _isCreateStateMethod =>
      // is method (or any other function)
      this is FunctionTypedElement &&
      // is named build
      name == 'createState' &&
      // returns Widget
      // (
      ((this as FunctionTypedElement)
              .returnType
              .element
              ?.children
              .any((element) => element._isBuildMethod) ??
          false);

  /// verifies if element has a build method and extends Widget or State
  bool get isWidgetClass => _hasBuildMethod || _hasCreateStateMethod;
}
