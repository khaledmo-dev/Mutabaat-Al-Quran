import 'package:flutter_test/flutter_test.dart';
import 'package:quran_test/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('TableViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
