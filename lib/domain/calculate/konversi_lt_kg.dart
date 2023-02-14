class KonversiLtKg {
  final double massaJenis = 0.90;

  double getKonversiLtToKg(double liter) {
    double result = massaJenis * liter;
    String convert = result.toStringAsFixed(2);
    result = double.tryParse(convert)!;
    // print("Hasil konversi : " + result.toString());
    return result;
  }

  double getKonversiKgToLt(double kg) {
    double result = kg / massaJenis;
    String convert = result.toStringAsFixed(2);
    result = double.tryParse(convert)!;
    // print("Hasil konversi : " + result.toString());
    return result;
  }
}
