class KonversiLtKg {
  final double massaJenis = 0.138;

  double getKonversiLtToKg(int liter) {
    double result = massaJenis * liter;
    return result;
  }
}
