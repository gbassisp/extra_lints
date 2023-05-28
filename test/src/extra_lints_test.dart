import 'package:extra_lints/extra_lints.dart';
import 'package:test/test.dart';

void main() {
  group('ExtraLinter', () {
    test('can be instantiated', () {
      expect(createPlugin(), isNotNull);
    });
  });
}
