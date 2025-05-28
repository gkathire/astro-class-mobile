import 'package:flutter_app/models/app-enums.dart';
import 'package:intl/intl.dart';

class CurrencyConversionUtils {
  static String formatApproxIndianRupees(double? quantity) {
    if (quantity == null) return "";

    if (quantity < 1000) {
      return convertToINRCurrency(quantity);
    } else if (quantity < 100000) {
      // Convert to thousands (e.g., 10,000 -> 10k)
      final thousands = (quantity / 1000);
      return "${convertToINRCurrency(thousands)} k";
    } else if (quantity < 10000000) {
      // Convert to lakhs (e.g., 1,00,000 -> 1L)
      final lakhs = (quantity / 100000);
      return "${convertToINRCurrency(lakhs)} L";
    } else {
      // Convert to crores (e.g., 1,00,00,000 -> 1Cr)
      final crores = (quantity / 10000000);
      return "${convertToINRCurrency(crores)} Cr";
    }
  }

  static String formatApproxUSD(double quantity) {
    if (quantity < 1000) {
      return convertToUSDCurrency(quantity);
    } else if (quantity < 100000) {
      // Convert to thousands (e.g., 10,000 -> 10k)
      final thousands = (quantity / 1000);
      return "${convertToUSDCurrency(thousands)} k";
    } else if (quantity < 10000000) {
      // Convert to lakhs (e.g., 1,00,000 -> 1L)
      final lakhs = (quantity / 100000);
      return "${convertToUSDCurrency(lakhs)} L";
      ;
    } else {
      // Convert to crores (e.g., 1,00,00,000 -> 1Cr)
      final crores = (quantity / 10000000);
      return "${convertToUSDCurrency(crores)} Cr";
    }
  }

  static String convertToINRCurrency(double amount) {
    return NumberFormat.currency(symbol: '₹').format(amount);
  }

  static String convertToUSDCurrency(double amount) {
    return NumberFormat.currency(symbol: '\$').format(amount);
  }

  static String getFormattedCurrencyActualValue(
      {required double amount, required int predefinedCurrencyTypeId}) {
    var result = "";
    if (predefinedCurrencyTypeId == PredefinedCurrencyTypes.iNR.value) {
      result = convertToINRCurrency(amount);
    } else if (predefinedCurrencyTypeId == PredefinedCurrencyTypes.uSD.value) {
      result = convertToUSDCurrency(amount);
    }
    return result;
  }

  static String getFormattedCurrencyApproxValue(
      {required double amount, required int predefinedCurrencyTypeId}) {
    var result = "";
    if (predefinedCurrencyTypeId == PredefinedCurrencyTypes.iNR.value) {
      result = formatApproxIndianRupees(amount);
    } else if (predefinedCurrencyTypeId == PredefinedCurrencyTypes.uSD.value) {
      result = formatApproxUSD(amount);
    }
    return result;
  }
}
