import './counts.dart';
import './function.dart';

// Core (49)
Map<String, int> core = {
  'Glistener Elf': 4,
  'Blighted Agent': 4,
  'Noble Hierarch': 4,
  'Might of Old Krosa': 4,
  'Vines of Vastwood': 4,
  'Mutagenic Growth': 4,
  'Become Immense': 1,
  'Blossoming Defense': 1,
  'Groundswell': 1,
  'Disruption': 2,
  'Blinkmoth Nexus': 4,
  'Pendelhaven': 2,
  'Land': 5,
  'Fetchland': 9,
};

// Flex (11 / 19)
Map<String, int> flex = {
  'Become Immense': 3,
  'Blossoming Defense': 3,
  'Groundswell': 3,
  'Disruption': 5,
  'Ironclaw Myr': 2,
  'Distortion Strike': 2,
  'Dryad Arbor': 1,
};

List<String> create(Map<String, int> exclude) {
  List<List<String>> parts = [];
  difference(sum(core, flex), exclude).forEach((name, count) {
    parts.add(List.filled(count, name));
  });
  return parts.expand(identity).toList();
}

List<Map<String, int>> getExclusionList() {
  return combinations(flex, 8);
}
