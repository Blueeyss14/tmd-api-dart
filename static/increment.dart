class TambahData {
  static int dataDatambah = 1;

  static void increment() {
    dataDatambah++;
  }

  static void decrement() {
    dataDatambah--;

    if (dataDatambah < 1) {
      dataDatambah = 1;
    }
  }
}
