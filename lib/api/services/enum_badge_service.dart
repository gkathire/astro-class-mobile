import 'package:flutter_app/common_widget/badge/theme_badge.dart';
import 'package:flutter_app/common_widget/badge/theme_badge_dark.dart';
import 'package:flutter_app/models/app-enums.dart';
import 'package:flutter/material.dart';

class EnumBadgeService {
  ThemeBadge getPredefinedMovieSceneStatusTypeBadge(int id) {
    if (id == PredefinedMovieSceneStatusTypes.started.value) {
      return ThemeBadge(
          backgroundColor: Colors.blue,
          textColor: Colors.blue,
          fontSize: 10,
          badgeText: "Started");
    } else if (id == PredefinedMovieSceneStatusTypes.cancelled.value) {
      return ThemeBadge(
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 10,
          badgeText: "Cancelled");
    } else if (id == PredefinedMovieSceneStatusTypes.completed.value) {
      return ThemeBadge(
          backgroundColor: Colors.green,
          textColor: Colors.green,
          fontSize: 10,
          badgeText: "Completed");
    } else if (id == PredefinedMovieSceneStatusTypes.partiallyCompleted.value) {
      return ThemeBadge(
          backgroundColor: Colors.lightGreen,
          textColor: Colors.lightGreen,
          fontSize: 10,
          badgeText: "Partially Completed");
    } else if (id == PredefinedMovieSceneStatusTypes.planned.value) {
      return ThemeBadge(
          backgroundColor: Colors.indigo,
          textColor: Colors.indigo,
          fontSize: 10,
          badgeText: "Planned");
    } else {
      return ThemeBadge(
          backgroundColor: Colors.grey,
          textColor: Colors.grey,
          fontSize: 10,
          badgeText: "N/a");
    }
  }

  ThemeBadge getPredefinedBudgetOrExpenseTypeBadge(int id) {
    if (id == PredefinedBudgetOrExpenseTypes.movieArtist.value) {
      return ThemeBadge(
          backgroundColor: Colors.blue,
          textColor: Colors.blue,
          fontSize: 10,
          badgeText: "Movie Artist");
    } else if (id == PredefinedBudgetOrExpenseTypes.movieTechnician.value) {
      return ThemeBadge(
          backgroundColor: Colors.deepPurple,
          textColor: Colors.deepPurple,
          fontSize: 10,
          badgeText: "Movie Technician");
    } else if (id == PredefinedBudgetOrExpenseTypes.movieEquipment.value) {
      return ThemeBadge(
          backgroundColor: Colors.green,
          textColor: Colors.green,
          fontSize: 10,
          badgeText: "Movie Equipment");
    } else if (id == PredefinedBudgetOrExpenseTypes.movieVendor.value) {
      return ThemeBadge(
          backgroundColor: Colors.teal,
          textColor: Colors.teal,
          fontSize: 10,
          badgeText: "Movie Vendor");
    } else if (id == PredefinedBudgetOrExpenseTypes.movieProperty.value) {
      return ThemeBadge(
          backgroundColor: Colors.lime,
          textColor: Colors.lime,
          fontSize: 10,
          badgeText: "Movie Property");
    } else if (id == PredefinedBudgetOrExpenseTypes.movieLocation.value) {
      return ThemeBadge(
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 10,
          badgeText: "Movie Location");
    } else {
      return ThemeBadge(
          backgroundColor: Colors.grey,
          textColor: Colors.grey,
          fontSize: 10,
          badgeText: "N/a");
    }
  }

  ThemeBadge getPredefinedContractStatusTypeBadge(int id) {
    if (id == PredefinedContractStatusTypes.signed.value) {
      return ThemeBadge(
          backgroundColor: Colors.blue,
          textColor: Colors.blue,
          fontSize: 10,
          badgeText: "Signed");
    } else if (id == PredefinedContractStatusTypes.cancelled.value) {
      return ThemeBadge(
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 10,
          badgeText: "Cancelled");
    } else if (id == PredefinedContractStatusTypes.inProgress.value) {
      return ThemeBadge(
          backgroundColor: Colors.green,
          textColor: Colors.green,
          fontSize: 10,
          badgeText: "In Progress");
    } else if (id == PredefinedContractStatusTypes.notStarted.value) {
      return ThemeBadge(
          backgroundColor: Colors.teal,
          textColor: Colors.teal,
          fontSize: 10,
          badgeText: "Not Started");
    } else if (id == PredefinedContractStatusTypes.signatureInProgress.value) {
      return ThemeBadge(
          backgroundColor: Colors.lime,
          textColor: Colors.lime,
          fontSize: 10,
          badgeText: "Signature In Progress");
    } else {
      return ThemeBadge(
          backgroundColor: Colors.grey,
          textColor: Colors.grey,
          fontSize: 10,
          badgeText: "N/a");
    }
  }

  ThemeBadge getPredefinedContractForTypeBadge(int id) {
    if (id == PredefinedContractForTypes.movieArtist.value) {
      return ThemeBadge(
          backgroundColor: Colors.blue,
          textColor: Colors.blue,
          fontSize: 10,
          badgeText: "Movie Artist");
    } else if (id == PredefinedContractForTypes.movieTechnician.value) {
      return ThemeBadge(
          backgroundColor: Colors.deepPurple,
          textColor: Colors.deepPurple,
          fontSize: 10,
          badgeText: "Movie Technician");
    } else if (id == PredefinedContractForTypes.movieEquipment.value) {
      return ThemeBadge(
          backgroundColor: Colors.green,
          textColor: Colors.green,
          fontSize: 10,
          badgeText: "Movie Equipment");
    } else if (id == PredefinedContractForTypes.movieVendor.value) {
      return ThemeBadge(
          backgroundColor: Colors.teal,
          textColor: Colors.teal,
          fontSize: 10,
          badgeText: "Movie Vendor");
    } else if (id == PredefinedContractForTypes.movieProperty.value) {
      return ThemeBadge(
          backgroundColor: Colors.lime,
          textColor: Colors.lime,
          fontSize: 10,
          badgeText: "Movie Property");
    } else if (id == PredefinedContractForTypes.movieLocation.value) {
      return ThemeBadge(
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 10,
          badgeText: "Movie Location");
    }
    if (id == PredefinedContractForTypes.artist.value) {
      return ThemeBadge(
          backgroundColor: Colors.blue,
          textColor: Colors.blue,
          fontSize: 10,
          badgeText: "Artist");
    } else if (id == PredefinedContractForTypes.technician.value) {
      return ThemeBadge(
          backgroundColor: Colors.deepPurple,
          textColor: Colors.deepPurple,
          fontSize: 10,
          badgeText: "Technician");
    } else if (id == PredefinedContractForTypes.equipment.value) {
      return ThemeBadge(
          backgroundColor: Colors.green,
          textColor: Colors.green,
          fontSize: 10,
          badgeText: "Equipment");
    } else if (id == PredefinedContractForTypes.vendor.value) {
      return ThemeBadge(
          backgroundColor: Colors.teal,
          textColor: Colors.teal,
          fontSize: 10,
          badgeText: "Vendor");
    } else if (id == PredefinedContractForTypes.property.value) {
      return ThemeBadge(
          backgroundColor: Colors.lime,
          textColor: Colors.lime,
          fontSize: 10,
          badgeText: "Property");
    } else {
      return ThemeBadge(
          backgroundColor: Colors.grey,
          textColor: Colors.grey,
          fontSize: 10,
          badgeText: "N/a");
    }
  }

  ThemeBadge getPredefinedLocationTypeBadge(int id) {
    if (id == PredefinedLocationTypes.indoor.value) {
      return ThemeBadge(
          backgroundColor: Colors.blue,
          textColor: Colors.blue,
          fontSize: 10,
          badgeText: "Indoor");
    } else if (id == PredefinedLocationTypes.outdoor.value) {
      return ThemeBadge(
          backgroundColor: Colors.green,
          textColor: Colors.green,
          fontSize: 10,
          badgeText: "Outdoor");
    } else {
      return ThemeBadge(
          backgroundColor: Colors.grey,
          textColor: Colors.grey,
          fontSize: 10,
          badgeText: "N/a");
    }
  }

  ThemeBadge getPredefinedLocationSubTypeBadge(int id) {
    if (id == PredefinedLocationSubTypes.inCity.value) {
      return ThemeBadge(
          backgroundColor: Colors.blue,
          textColor: Colors.blue,
          fontSize: 10,
          badgeText: "In City");
    } else if (id == PredefinedLocationSubTypes.inState.value) {
      return ThemeBadge(
          backgroundColor: Colors.green,
          textColor: Colors.green,
          fontSize: 10,
          badgeText: "In State");
    } else if (id == PredefinedLocationSubTypes.outOfState.value) {
      return ThemeBadge(
          backgroundColor: Colors.teal,
          textColor: Colors.teal,
          fontSize: 10,
          badgeText: "Out Of State");
    } else if (id == PredefinedLocationSubTypes.outOfCountry.value) {
      return ThemeBadge(
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 10,
          badgeText: "Out Of Country");
    } else {
      return ThemeBadge(
          backgroundColor: Colors.grey,
          textColor: Colors.grey,
          fontSize: 10,
          badgeText: "N/a");
    }
  }

  ThemeBadge getPredefinedBudgetDivisionTypeBadge(int id) {
    if (id == PredefinedBudgetDivisionTypes.preProduction.value) {
      return ThemeBadge(
          backgroundColor: Colors.blue,
          textColor: Colors.blue,
          fontSize: 10,
          badgeText: "Pre Production");
    } else if (id == PredefinedBudgetDivisionTypes.production.value) {
      return ThemeBadge(
          backgroundColor: Colors.green,
          textColor: Colors.green,
          fontSize: 10,
          badgeText: "Production");
    } else if (id == PredefinedBudgetDivisionTypes.postProduction.value) {
      return ThemeBadge(
          backgroundColor: Colors.teal,
          textColor: Colors.teal,
          fontSize: 10,
          badgeText: "Post Production");
    } else if (id == PredefinedBudgetDivisionTypes.others.value) {
      return ThemeBadge(
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 10,
          badgeText: "Other");
    } else {
      return ThemeBadge(
          backgroundColor: Colors.grey,
          textColor: Colors.grey,
          fontSize: 10,
          badgeText: "N/a");
    }
  }

  ThemeBadgeDark getPredefinedBudgetDivisionTypeBadgeDark(int id) {
    if (id == PredefinedBudgetDivisionTypes.preProduction.value) {
      return ThemeBadgeDark(
          backgroundColor: Colors.blue,
          fontSize: 10,
          badgeText: "Pre Production");
    } else if (id == PredefinedBudgetDivisionTypes.production.value) {
      return ThemeBadgeDark(
          backgroundColor: Color(0xff0dc183),
          fontSize: 10,
          badgeText: "Production");
    } else if (id == PredefinedBudgetDivisionTypes.postProduction.value) {
      return ThemeBadgeDark(
          backgroundColor: Colors.teal,
          fontSize: 10,
          badgeText: "Post Production");
    } else if (id == PredefinedBudgetDivisionTypes.others.value) {
      return ThemeBadgeDark(
          backgroundColor: Colors.orange, fontSize: 10, badgeText: "Other");
    } else {
      return ThemeBadgeDark(
          backgroundColor: Colors.grey, fontSize: 10, badgeText: "N/a");
    }
  }

  ThemeBadge getPredefinedPhoneCallNotificationStatusTypeBadge(int typeId) {
    if (typeId == PredefinedPhoneCallNotificationStatusTypes.notNeeded.value) {
      return ThemeBadge(
          backgroundColor: Colors.teal,
          textColor: Colors.teal,
          fontSize: 10,
          badgeText: "Not Needed");
    } else if (typeId ==
        PredefinedPhoneCallNotificationStatusTypes.scheduled.value) {
      return ThemeBadge(
          backgroundColor: Colors.green,
          textColor: Colors.green,
          fontSize: 10,
          badgeText: "Scheduled");
    } else if (typeId ==
        PredefinedPhoneCallNotificationStatusTypes.confirmed.value) {
      return ThemeBadge(
          backgroundColor: Colors.purple,
          textColor: Colors.purple,
          fontSize: 10,
          badgeText: "Confirmed");
    } else if (typeId ==
        PredefinedPhoneCallNotificationStatusTypes.notConfirmed.value) {
      return ThemeBadge(
          backgroundColor: Colors.orange,
          textColor: Colors.orange,
          fontSize: 10,
          badgeText: "Not Confirmed");
    } else if (typeId ==
        PredefinedPhoneCallNotificationStatusTypes.declined.value) {
      return ThemeBadge(
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 10,
          badgeText: "Declined");
    } else if (typeId ==
        PredefinedPhoneCallNotificationStatusTypes.notificationError.value) {
      return ThemeBadge(
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 10,
          badgeText: "Notification Error");
    } else {
      return ThemeBadge(
          backgroundColor: Colors.blue,
          textColor: Colors.blue,
          fontSize: 10,
          badgeText: "N/A");
    }
  }

  ThemeBadge getPredefinedEmailNotificationStatusTypeBadge(int typeId) {
    if (typeId == PredefinedEmailNotificationStatusTypes.notNeeded.value) {
      return ThemeBadge(
          backgroundColor: Colors.teal,
          textColor: Colors.teal,
          fontSize: 10,
          badgeText: "Not Needed");
    } else if (typeId ==
        PredefinedEmailNotificationStatusTypes.scheduled.value) {
      return ThemeBadge(
          backgroundColor: Colors.green,
          textColor: Colors.green,
          fontSize: 10,
          badgeText: "Scheduled");
    } else if (typeId ==
        PredefinedEmailNotificationStatusTypes.confirmed.value) {
      return ThemeBadge(
          backgroundColor: Colors.purple,
          textColor: Colors.purple,
          fontSize: 10,
          badgeText: "Confirmed");
    } else if (typeId ==
        PredefinedEmailNotificationStatusTypes.notConfirmed.value) {
      return ThemeBadge(
          backgroundColor: Colors.orange,
          textColor: Colors.orange,
          fontSize: 10,
          badgeText: "Not Confirmed");
    } else if (typeId ==
        PredefinedEmailNotificationStatusTypes.declined.value) {
      return ThemeBadge(
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 10,
          badgeText: "Declined");
    } else if (typeId ==
        PredefinedEmailNotificationStatusTypes.notificationError.value) {
      return ThemeBadge(
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 10,
          badgeText: "Notification Error");
    } else {
      return ThemeBadge(
          backgroundColor: Colors.blue,
          textColor: Colors.blue,
          fontSize: 10,
          badgeText: "N/A");
    }
  }

  ThemeBadge getPredefinedPaymentStatusTypeBadge(int id) {
    if (id == PredefinedPaymentStatusTypes.paid.value) {
      return ThemeBadge(
          backgroundColor: Colors.green,
          textColor: Colors.green,
          fontSize: 10,
          badgeText: "Paid");
    } else if (id == PredefinedPaymentStatusTypes.notPaid.value) {
      return ThemeBadge(
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 10,
          badgeText: "Not Paid");
    } else if (id == PredefinedPaymentStatusTypes.canPayLater.value) {
      return ThemeBadge(
          backgroundColor: Colors.orange,
          textColor: Colors.orange,
          fontSize: 10,
          badgeText: "Can Pay Later");
    } else if (id == PredefinedPaymentStatusTypes.dispute.value) {
      return ThemeBadge(
          backgroundColor: Colors.teal,
          textColor: Colors.teal,
          fontSize: 10,
          badgeText: "Dispute");
    } else if (id == PredefinedPaymentStatusTypes.manuallyPaid.value) {
      return ThemeBadge(
          backgroundColor: Colors.indigo,
          textColor: Colors.indigo,
          fontSize: 10,
          badgeText: "Manually Paid");
    } else if (id == PredefinedPaymentStatusTypes.partiallyPaid.value) {
      return ThemeBadge(
          backgroundColor: Colors.purple,
          textColor: Colors.purple,
          fontSize: 10,
          badgeText: "Partially Paid");
    } else if (id ==
        PredefinedPaymentStatusTypes.shouldBePaidImmediately.value) {
      return ThemeBadge(
          backgroundColor: Colors.teal,
          textColor: Colors.teal,
          fontSize: 10,
          badgeText: "Should Be Paid Immediately");
    } else {
      return ThemeBadge(
          backgroundColor: Colors.grey,
          textColor: Colors.grey,
          fontSize: 10,
          badgeText: "N/a");
    }
  }
}
