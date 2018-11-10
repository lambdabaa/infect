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

bool isEqual(Map<String, int> one, Map<String, int> other) {
  if (one.keys.length != other.keys.length) {
    return false;
  }

  bool result = true;
  one.forEach((key, value) {
    if (value != other[key]) {
      result = false;
    }
  });

  return result;
}

List<Map<String, int>> dedupe(List<Map<String, int>> x) {
  List<int> remove = [];
  for (var i = 0; i < x.length; i++) {
    for (var j = i + 1; j < x.length; j++) {
      if (isEqual(x[i], x[j])) {
        remove.add(j);
      }
    }
  }

  List<Map<String, int>> result = [];
  for (var i = 0; i < x.length; i++) {
    if (!remove.contains(i)) {
      result.add(x[i]);
    }
  }

  return result;
}

/**
 * Generates all combinations of the input collection given
 * a param subset size.
 */
List<Map<String, int>> combinations(Map<String, int> collection, int size) {
  if (size == 0) {
    return [{}];
  }

  List<Map<String, int>> results = [];
  collection.forEach((name, count) {
    if (count < 1) {
      return;
    }

    Map<String, int> takeOne = {};
    takeOne[name] = 1;
    Map<String, int> rest = difference(collection, takeOne);
    List<Map<String, int>> subgoals = combinations(rest, size - 1);
    subgoals.forEach((subgoal) {
      subgoal[name] = subgoal.containsKey(name) ? subgoal[name] + 1 : 1;
      results.add(subgoal);
    });
  });

  return dedupe(results);
}
