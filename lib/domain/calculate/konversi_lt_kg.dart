class KonversiLtKg {
  final double massaJenis = 0.138;

  double getKonversiLtToKg(int liter) {
    double result = massaJenis * liter;
    String convert = result.toStringAsFixed(2);
    result = double.tryParse(convert)!;
    // print("Hasil konversi : " + result.toString());
    return result;
  }
}
