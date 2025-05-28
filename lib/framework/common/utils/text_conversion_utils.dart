class TextConversionUtils {
  static String wrapLongText(String? value, int size) {
    if (value == null || size < 1) return "";
    return value.length >= size
        ? '${value.substring(0, (size - 1))}...'
        : value;
  }

  static String wrapLongTextForDropdownMenu(
    String? value,
  ) {
    return wrapLongText(value, 25);
  }

  static String trimAllWhiteSpace(String value) {
    return value.replaceAll(RegExp(r'\s+'), '');
  }
}
