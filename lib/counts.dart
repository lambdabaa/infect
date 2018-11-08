Map<String, int> sum(Map<String, int> base, Map<String, int> delta) {
  Map<String, int> result = {};
  base.forEach((name, count) {
    result[name] = base[name];
  });
  delta.forEach((name, count) {
    result[name] = result.containsKey(name) ?
      result[name] + delta[name] :
      delta[name];
  });
  return result;
}

Map<String, int> difference(Map<String, int> base, Map<String, int> delta) {
  Map<String, int> inverse = {};
  delta.forEach((name, count) {
    inverse[name] = -count;
  });
  return sum(base, inverse);
}
