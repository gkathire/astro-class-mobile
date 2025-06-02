import 'package:astro_mobile/api/generated/code/astroclass.swagger.dart';
import 'package:astro_mobile/models/app-enums.dart';

class TextByPredefinedType {
  static String getPredefinedBudgetOrExpenseTypeName(
      {int? predefinedBudgetOrExpenseTypeId}) {
    if (predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.movieArtist.value) {
      return "Movie Artist";
    } else if (predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.movieTechnician.value) {
      return "Movie Technician";
    } else if (predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.movieEquipment.value) {
      return "Movie Equipment";
    } else if (predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.movieVendor.value) {
      return "Movie Vendor";
    } else if (predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.movieProperty.value) {
      return "Movie Property";
    } else if (predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.movieLocation.value) {
      return "Movie Location";
    } else if (predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.custom.value) {
      return "Custom";
    } else {
      return "";
    }
  }

  static String getBudgetOrExpenseNameFromModel({dynamic? model}) {
    if (model == null) return "";

    if (model.predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.movieArtist.value) {
      return "${model.movieArtistName}";
    } else if (model.predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.movieTechnician.value) {
      return "${model.movieTechnicianName}";
    } else if (model.predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.movieEquipment.value) {
      return "${model.movieEquipmentName}";
    } else if (model.predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.movieVendor.value) {
      return "${model.movieVendorName}";
    } else if (model.predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.movieProperty.value) {
      return "${model.moviePropertyName}";
    } else if (model.predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.movieLocation.value) {
      return "${model.movieLocationName}";
    } else if (model.predefinedBudgetOrExpenseTypeId ==
        PredefinedBudgetOrExpenseTypes.custom.value) {
      if (model is MovieShootDayBudgetModel) {
        return "${model.budgetEntryName}";
      } else if (model is MovieShootDayExpenseModel) {
        return "${model.expenseEntryName}";
      } else {
        return "N/a";
      }
    } else {
      return "";
    }
  }
}
