import 'package:test/test.dart';
import '../lib/deck.dart';

void main() {
  group('deck', () {
    test('create', () {
      List<String> result = create({
        'Become Immense': 2,
        'Blossoming Defense': 1,
        'Groundswell': 0,
        'Disruption': 1,
        'Ironclaw Myr': 2,
        'Distortion Strike': 1,
        'Dryad Arbor': 1,
      });

      expect(result.length, equals(60));
    });

    test('getExclusionList', () {
      expect(getExclusionList().length, equals(822));
    });
  });
}
