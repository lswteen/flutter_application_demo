import 'package:flutter_test/flutter_test.dart';
import 'package:namer_app/models/counter.dart';  // 파일 경로를 프로젝트에 맞게 수정하세요.

void main() {
  group('Counter', () {
    test('initial value should be 0', () {
      final counter = Counter();

      expect(counter.counter, 0);
    });

    test('increment method should increase the counter value', () {
      final counter = Counter();

      counter.increment();

      expect(counter.counter, 1);
    });
  });
}
