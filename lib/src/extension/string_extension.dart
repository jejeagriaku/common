extension StringExtension on String? {
  bool isNumber() {
    RegExp regex = RegExp(r"^\d+$");
    return regex.hasMatch(orEmpty());
  }

  String number() {
    return orEmpty().replaceAll(RegExp(r"[^0-9]"), "");
  }

  String orEmpty() {
    String? value = this;

    if (value != null) return value;
    return "";
  }

  String removeAllWhiteSpace() {
    return orEmpty().replaceAll(RegExp(r"\s+\b|\b\s"), "");
  }

  int intValue() {
    try {
      return int.tryParse(orEmpty()) ?? 0;
    } catch (_) {
      return 0;
    }
  }

  // String? format({String? from, required String to, String? locale}) {
  //   initializeDateFormatting(locale);
  //   String value = this ?? "";
  //   try {
  //     if (from != null) {
  //       DateTime parseDate = DateFormat(from, locale).parse(value);
  //       return DateFormat(to, locale).format(parseDate);
  //     }
  //     return DateFormat(to, locale).format(DateTime.parse(value));
  //   } catch (_) {
  //     return null;
  //   }
  // }

  String separate({
    required String separator,
    required int every,
  }) {
    String text = orEmpty().replaceAll(separator, "");
    return text.chunked(every).join(separator);
  }

  List<String> chunked(int size) {
    List<String> chunks = <String>[];
    String text = orEmpty();

    int maxIteration = (text.length / size).ceil();

    if (text.length < size) {
      return [text];
    }

    for (int i = 0; i < maxIteration; i++) {
      int start = i * size;
      int end = start + size;

      end = end < text.length ? end : text.length;
      chunks.add(text.substring(start, end));
    }

    return chunks;
  }
}
