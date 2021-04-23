/*
  Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.
*/

List<T> topKFrequent<T>(List<T> elements, int k) {
  var occurances = <T, int>{};

  /// Iterate over each element in [elements] and count the element's occurance in the list
  elements.forEach((el) {
    /// If the element exists as a key in the map, increment its value by 1
    /// If the key does not exist, add it with the value of 1
    occurances.update(el, (value) => value + 1, ifAbsent: () => 1);
  });

  /// Sort [occurances] based on the value of each key from highest to lowest
  /// Cascade notation is used here to ensure that [occurances] map is not modified, but a reference to [occurances] that are sorted is returned
  var sortedOccurances = occurances.keys.toList()
    ..sort((first, second) => occurances[second]! - occurances[first]!);

  /// Return the first [k] elements of [sortedOccurances]
  return sortedOccurances.sublist(0, k);
}
