import 'package:common/src/extension/iterable_extension.dart';
import 'package:common/src/extension/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test Compact Map", () {
    List<String?> source = ["1", null, "2", "a", "3"];
    List<int> expected = [1, 2, 3];
    List<int> result = source.compactMap(mapper: (value) {
      return int.tryParse(value.orEmpty());
    }).toList();

    expect(result, expected);
  });

  test("Test Compact Map without literally mapping", () {
    List<String?> source = ["1", null, "2", null, null, "3"];
    List<String> expected = ["1", "2", "3"];
    List<String> result = source.compactMap(mapper: (value) => value).toList();

    expect(result, expected);
  });

  test("Test Compact Map without Mapper", () {
    List<String?> source = ["1", null, "2", null, null, "3"];
    List<String> expected = ["1", "2", "3"];
    List<String> result = source.compactMap<String>().toList();

    expect(result, expected);
  });
}
