import 'package:flutter_app/models/app-enums.dart';
import 'package:flutter/material.dart';

class EnumTextColorService {
  Text getPredefinedBudgetOrExpenseTypeText(int id) {
    if (id == PredefinedBudgetOrExpenseTypes.movieArtist.value) {
      return Text("Movie Artist", style: TextStyle(color: Colors.blue));
    } else if (id == PredefinedBudgetOrExpenseTypes.movieTechnician.value) {
      return Text("Movie Technician", style: TextStyle(color: Colors.purple));
    } else if (id == PredefinedBudgetOrExpenseTypes.movieEquipment.value) {
      return Text("Movie Equipment", style: TextStyle(color: Colors.red));
    } else if (id == PredefinedBudgetOrExpenseTypes.movieVendor.value) {
      return Text("Movie Vendor", style: TextStyle(color: Colors.indigo));
    } else if (id == PredefinedBudgetOrExpenseTypes.movieProperty.value) {
      return Text("Movie Property", style: TextStyle(color: Colors.orange));
    } else if (id == PredefinedBudgetOrExpenseTypes.movieLocation.value) {
      return Text("Movie Location", style: TextStyle(color: Colors.green));
    } else if (id == PredefinedBudgetOrExpenseTypes.custom.value) {
      return Text("Custom", style: TextStyle(color: Colors.blue));
    } else {
      return Text("N/a", style: TextStyle(color: Colors.blue));
    }
  }

  Text getPredefinedCommitmentTaskPriorityTypeText(int id) {
    if (id == PredefinedCommitmentTaskPriorityTypes.high.value) {
      return Text("High", style: TextStyle(color: Colors.red));
    } else if (id == PredefinedCommitmentTaskPriorityTypes.medium.value) {
      return Text("Medium", style: TextStyle(color: Colors.orange));
    } else if (id == PredefinedCommitmentTaskPriorityTypes.low.value) {
      return Text("Low", style: TextStyle(color: Colors.purple));
    } else {
      return Text("N/a", style: TextStyle(color: Colors.blue));
    }
  }

  Text getPredefinedCommitmentTaskStatusTypeText(int id) {
    if (id == PredefinedCommitmentTaskStatusTypes.completed.value) {
      return Text("Completed", style: TextStyle(color: Colors.red));
    } else if (id == PredefinedCommitmentTaskStatusTypes.active.value) {
      return Text("Active", style: TextStyle(color: Colors.purple));
    } else if (id == PredefinedCommitmentTaskStatusTypes.ignored.value) {
      return Text("Ignored", style: TextStyle(color: Colors.blue));
    } else if (id == PredefinedCommitmentTaskStatusTypes.noStarted.value) {
      return Text("Not Started", style: TextStyle(color: Colors.blue));
    } else if (id == PredefinedCommitmentTaskStatusTypes.willDoLater.value) {
      return Text("Will Do Later", style: TextStyle(color: Colors.blue));
    } else {
      return Text("N/a", style: TextStyle(color: Colors.blue));
    }
  }

  Text getPredefinedMovieSceneStatusTypeText(int id) {
    if (id == PredefinedMovieSceneStatusTypes.completed.value) {
      return Text("Completed", style: TextStyle(color: Colors.green));
    } else if (id == PredefinedMovieSceneStatusTypes.planned.value) {
      return Text("Planned", style: TextStyle(color: Colors.purple));
    } else if (id == PredefinedMovieSceneStatusTypes.started.value) {
      return Text("Started", style: TextStyle(color: Colors.orange));
    } else if (id == PredefinedMovieSceneStatusTypes.partiallyCompleted.value) {
      return Text("Partially Completed",
          style: TextStyle(color: Colors.yellow));
    } else if (id == PredefinedMovieSceneStatusTypes.cancelled.value) {
      return Text("Cancelled", style: TextStyle(color: Colors.red));
    } else {
      return Text("N/a", style: TextStyle(color: Colors.blue));
    }
  }

  Text getPredefinedMovieShootDayStatusTypeText(int id) {
    if (id == PredefinedMovieShootDayStatusTypes.completed.value) {
      return Text("Completed", style: TextStyle(color: Colors.green));
    } else if (id == PredefinedMovieShootDayStatusTypes.planned.value) {
      return Text("Planned", style: TextStyle(color: Colors.purple));
    } else if (id == PredefinedMovieShootDayStatusTypes.started.value) {
      return Text("Started", style: TextStyle(color: Colors.blue));
    } else if (id == PredefinedMovieShootDayStatusTypes.notPlanned.value) {
      return Text("Not planned", style: TextStyle(color: Colors.indigo));
    } else if (id == PredefinedMovieShootDayStatusTypes.cancelled.value) {
      return Text("Cancelled", style: TextStyle(color: Colors.red));
    } else if (id == PredefinedMovieShootDayStatusTypes.planning.value) {
      return Text("planning", style: TextStyle(color: Colors.teal));
    } else {
      return Text("N/a", style: TextStyle(color: Colors.blue));
    }
  }

  Text predefinedMovieShootDayStatusTypeText(int id) {
    if (id == PredefinedMovieShootDayStatusTypes.cancelled.value) {
      return Text("Planning", style: TextStyle(color: Colors.red));
    } else if (id == PredefinedMovieShootDayStatusTypes.planned.value) {
      return Text("Planned", style: TextStyle(color: Colors.purple));
    } else if (id == PredefinedMovieShootDayStatusTypes.completed.value) {
      return Text("Completed", style: TextStyle(color: Colors.deepPurple));
    } else if (id == PredefinedMovieShootDayStatusTypes.started.value) {
      return Text("Started", style: TextStyle(color: Colors.indigoAccent));
    } else if (id == PredefinedMovieShootDayStatusTypes.planning.value) {
      return Text("Planning", style: TextStyle(color: Colors.orangeAccent));
    } else if (id == PredefinedMovieShootDayStatusTypes.notPlanned.value) {
      return Text("Not Planned", style: TextStyle(color: Colors.teal));
    } else {
      return Text("N/a", style: TextStyle(color: Colors.blue));
    }
  }

  Text getPredefinedContractForTypeText(int id) {
    if (id == PredefinedContractForTypes.general.value) {
      return Text("General", style: TextStyle(color: Colors.red));
    } else if (id == PredefinedContractForTypes.artist.value) {
      return Text("Artist", style: TextStyle(color: Colors.purple));
    } else if (id == PredefinedContractForTypes.technician.value) {
      return Text("Technician", style: TextStyle(color: Colors.deepPurple));
    } else if (id == PredefinedContractForTypes.equipment.value) {
      return Text("Equipment", style: TextStyle(color: Colors.indigoAccent));
    } else if (id == PredefinedContractForTypes.vendor.value) {
      return Text("Vendor", style: TextStyle(color: Colors.orangeAccent));
    } else if (id == PredefinedContractForTypes.property.value) {
      return Text("Property", style: TextStyle(color: Colors.teal));
    } else if (id == PredefinedContractForTypes.movieArtist.value) {
      return Text("Movie Artist", style: TextStyle(color: Colors.blue));
    } else if (id == PredefinedContractForTypes.movieTechnician.value) {
      return Text("Movie Technician", style: TextStyle(color: Colors.purple));
    } else if (id == PredefinedContractForTypes.movieEquipment.value) {
      return Text("Movie Equipment", style: TextStyle(color: Colors.red));
    } else if (id == PredefinedContractForTypes.movieVendor.value) {
      return Text("Movie Vendor", style: TextStyle(color: Colors.indigo));
    } else if (id == PredefinedContractForTypes.movieProperty.value) {
      return Text("Movie Property", style: TextStyle(color: Colors.orange));
    } else if (id == PredefinedContractForTypes.movieLocation.value) {
      return Text("Movie Location", style: TextStyle(color: Colors.green));
    } else {
      return Text("N/a", style: TextStyle(color: Colors.blue));
    }
  }
}
