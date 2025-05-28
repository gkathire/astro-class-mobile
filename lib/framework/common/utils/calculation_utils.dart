class CalculationUtils {
  static double getPercentageValue(double value, double totalValue) {
    var percentage = ((value / totalValue) * 100);
    return ((percentage * 100).round() / 100);
  }
}
