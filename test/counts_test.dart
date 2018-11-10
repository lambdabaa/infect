import 'package:test/test.dart';
import '../lib/counts.dart';

void main() {
  group('counts', () {
    test('sum', () {
      Map<String, int> base = {'foo': 2, 'bar': 2, 'baz': 2, 'qux': 2};
      Map<String, int> delta = {'bar': 1, 'baz': 2, 'qux': 3};
      Map<String, int> diff = sum(base, delta);
      expect(diff['foo'], equals(2));
      expect(diff['bar'], equals(3));
      expect(diff['baz'], equals(4));
      expect(diff['qux'], equals(5));
    });

    test('difference', () {
      Map<String, int> base = {'foo': 2, 'bar': 3, 'baz': 4, 'qux': 5};
      Map<String, int> delta = {'bar': 1, 'baz': 2, 'qux': 3};
      Map<String, int> diff = difference(base, delta);
      expect(diff['foo'], equals(2));
      expect(diff['bar'], equals(2));
      expect(diff['baz'], equals(2));
      expect(diff['qux'], equals(2));
    });

    test('dedupe', () {
      List<Map<String, int>> result = dedupe(
          [{'foo': 1, 'bar': 1}, {'foo': 2}, {'bar': 1, 'foo': 1}]);
      expect(result.length, equals(2));
    });

    test('combinations', () {
      Map<String, int> collection  = {'foo': 2, 'bar': 3, 'baz': 4, 'qux': 5};
      List<Map<String, int>> results = combinations(collection, 2);
      expect(results.length, equals(10));
    });
  });
}
