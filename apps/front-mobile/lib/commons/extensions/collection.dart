extension ListExtension<E> on List<E> {
  dynamic get(int value) {
    try {
      return elementAt(value);
    } on RangeError {
      return null;
    }
  }
}
