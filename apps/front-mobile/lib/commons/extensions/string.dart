extension StringExt on String {
  String maybeHandleOverflow(
          {required int? maxChars, String replacement = ''}) =>
      maxChars != null && length > maxChars
          ? replaceRange(maxChars, null, replacement)
          : this;

  String? toNullIfEmpty() => isEmpty ? null : this;
}
