import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/framework/infrastructure/interceptor/authinterceptor.dart';
import 'package:astro_mobile/framework/model/result_model.dart';
import 'package:astro_mobile/framework/services/configuration_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var yearago = DateTime.now().subtract(const Duration(days: 365));
  var api = Filmicall.create(
      baseUrl: Uri.parse(ConfigurationService.serverUrl),
      interceptors: [AuthInterceptor()]);

  Future<ResultModel<LoggedInUserModelReturnModel>> doLogin(
      {required String email, required String password}) async {
    var result = await api.apiV1AccountLoginPost(
        body: LoginModel(
            username: email.trim(),
            password: password.trim(),
            rememberMe: false));
    if (result.body == null) {
      return ResultModel.error<LoggedInUserModelReturnModel>(
          'Unable to log in. Please try again later or contact support for further information.');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<LoggedInUserModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<LoggedInUserModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieModelReturnListModel>> getMovies({
    List<int>? predefinedMovieStatusTypeIds,
    List<int>? predefinedMovieStageTypeIds,
    int? companyId,
    bool? showDeleted,
    bool? showEnabled,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
    bool? withDetails,
    List<int>? movieIds,
  }) async {
    var result = await api.apiV1MovieGetmoviesGet(
      predefinedMovieStatusTypeIds: predefinedMovieStatusTypeIds,
      predefinedMovieStageTypeIds: predefinedMovieStageTypeIds,
      companyId: companyId,
      showDeleted: showDeleted,
      showEnabled: showEnabled,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      withDetails: withDetails,
      movieIds: movieIds,
    );
    if (result.body == null) {
      return ResultModel.error<MovieModelReturnListModel>(
          'Unable to Get Movie List');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayModelReturnListModel>>? getDayList({
    int? companyId,
    bool? showDeleted,
    int? movieId,
    List<int>? predefinedMovieShootDayStatusTypeIds,
    List<int>? predefinedMovieShootDayTypeIds,
    List<int>? predefinedLocationTypeIds,
    List<int>? predefinedMovieApprovalStatusForCallsheetTypeIds,
    List<int>? predefinedMovieApprovalStatusForBudgetTypeIds,
    List<int>? movieBudgetDivisionIds,
    List<int>? predefinedCallSheetTypeIds,
    int? movieLocationId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovieshootdaysGet(
      companyId: companyId,
      showDeleted: showDeleted,
      movieId: movieId,
      predefinedMovieShootDayStatusTypeIds:
          predefinedMovieShootDayStatusTypeIds,
      predefinedMovieShootDayTypeIds: predefinedMovieShootDayTypeIds,
      predefinedLocationTypeIds: predefinedLocationTypeIds,
      predefinedMovieApprovalStatusForCallsheetTypeIds:
          predefinedMovieApprovalStatusForCallsheetTypeIds,
      predefinedMovieApprovalStatusForBudgetTypeIds:
          predefinedMovieApprovalStatusForBudgetTypeIds,
      movieBudgetDivisionIds: movieBudgetDivisionIds,
      predefinedCallSheetTypeIds: predefinedCallSheetTypeIds,
      movieLocationId: movieLocationId,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayModelReturnListModel>(
          'Unable to Get Movie List');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayExpenseModelReturnListModel>>?
      getMovieShootDayExpensesWithDetails({
    int? movieId,
    List<int>? predefinedBudgetOrExpenseTypeIds,
    List<int>? movieArtistIds,
    List<int>? movieTechnicianIds,
    List<int>? movieEquipmentIds,
    List<int>? movieVendorIds,
    List<int>? movieBudgetCategoryIds,
    int? predefinedBudgetDivisionTypeId,
    int? companyId,
    bool? showDeleted,
    int? movieShootDayId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
    bool? includeNotes,
  }) async {
    var result = await api.apiV1MovieGetmovieshootdayexpensesGet(
      movieId: movieId,
      predefinedBudgetOrExpenseTypeIds: predefinedBudgetOrExpenseTypeIds,
      movieArtistIds: movieArtistIds,
      movieTechnicianIds: movieTechnicianIds,
      movieEquipmentIds: movieEquipmentIds,
      movieVendorIds: movieVendorIds,
      movieBudgetCategoryIds: movieBudgetCategoryIds,
      predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
      companyId: companyId,
      showDeleted: showDeleted,
      movieShootDayId: movieShootDayId,
      createdByUserId: movieShootDayId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      includeNotes: includeNotes,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayExpenseModelReturnListModel>(
          'Unable to Get Movie List');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayExpenseModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayExpenseModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieShootDayExpenseModelReturnListModel>>?
      getMovieShootDayExpenses({
    int? movieId,
    List<int>? predefinedBudgetOrExpenseTypeIds,
    List<int>? movieArtistIds,
    List<int>? movieTechnicianIds,
    List<int>? movieEquipmentIds,
    List<int>? movieVendorIds,
    List<int>? movieBudgetCategoryIds,
    int? predefinedBudgetDivisionTypeId,
    int? companyId,
    bool? showDeleted,
    int? movieShootDayId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovieshootdayexpenseswithalldetailsGet(
      movieId: movieId,
      predefinedBudgetOrExpenseTypeIds: predefinedBudgetOrExpenseTypeIds,
      movieArtistIds: movieArtistIds,
      movieTechnicianIds: movieTechnicianIds,
      movieEquipmentIds: movieEquipmentIds,
      movieVendorIds: movieVendorIds,
      movieBudgetCategoryIds: movieBudgetCategoryIds,
      predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
      companyId: companyId,
      showDeleted: showDeleted,
      movieShootDayId: movieShootDayId,
      createdByUserId: movieShootDayId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayExpenseModelReturnListModel>(
          'Unable to Get Movie List');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayExpenseModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayExpenseModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieShootDayExpenseModelReturnModel>>?
      getMovieShootDayExpense({
    int? movieShootDayExpenseId,
  }) async {
    var result = await api.apiV1MovieGetmovieshootdayexpenseGet(
        id: movieShootDayExpenseId);
    if (result.body == null) {
      return ResultModel.error<MovieShootDayExpenseModelReturnModel>(
          'Unable to Get Movie Shoot Day Expense');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayExpenseModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayExpenseModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayBudgetModelReturnListModel>>?
      getMovieShootDayBudgets({
    List<int>? movieShootDayBudgetIds,
    int? movieId,
    List<int>? predefinedBudgetOrExpenseTypeIds,
    List<int>? predefinedRateTypeIds,
    List<int>? movieArtistIds,
    List<int>? movieTechnicianIds,
    List<int>? movieEquipmentIds,
    List<int>? movieVendorIds,
    List<int>? movieBudgetCategoryIds,
    int? moviePropertyId,
    int? movieLocationId,
    int? movieArtistId,
    int? movieEquipmentId,
    int? movieTechnicianId,
    int? movieVendorId,
    int? predefinedBudgetDivisionTypeId,
    int? companyId,
    bool? showDeleted,
    int? movieShootDayId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovieshootdaybudgetswithdetailsGet(
        movieShootDayBudgetIds: movieShootDayBudgetIds,
        movieId: movieId,
        predefinedBudgetOrExpenseTypeIds: predefinedBudgetOrExpenseTypeIds,
        predefinedRateTypeIds: predefinedRateTypeIds,
        movieArtistIds: movieArtistIds,
        movieTechnicianIds: movieTechnicianIds,
        movieEquipmentIds: movieEquipmentIds,
        movieVendorIds: movieVendorIds,
        movieBudgetCategoryIds: movieBudgetCategoryIds,
        moviePropertyId: moviePropertyId,
        movieLocationId: movieLocationId,
        movieArtistId: movieArtistId,
        movieEquipmentId: movieEquipmentId,
        movieTechnicianId: movieTechnicianId,
        movieVendorId: movieVendorId,
        predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
        companyId: companyId,
        showDeleted: showDeleted,
        movieShootDayId: movieShootDayId,
        createdByUserId: createdByUserId,
        modifiedByUserId: modifiedByUserId,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<MovieShootDayBudgetModelReturnListModel>(
          'Unable to Get Movie budget List');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayBudgetModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayBudgetModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieShootDayModelReturnListModel>>? getScheduleList({
    int? companyId,
    bool? showDeleted,
    int? movieId,
    List<int>? predefinedMovieShootDayStatusTypeIds,
    List<int>? predefinedMovieShootDayTypeIds,
    List<int>? predefinedLocationTypeIds,
    List<int>? predefinedMovieApprovalStatusForCallsheetTypeIds,
    List<int>? predefinedMovieApprovalStatusForBudgetTypeIds,
    List<int>? movieBudgetDivisionIds,
    List<int>? predefinedCallSheetTypeIds,
    int? movieLocationId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovieshootdaysGet(
      companyId: companyId,
      showDeleted: showDeleted,
      movieId: movieId,
      predefinedMovieShootDayStatusTypeIds:
          predefinedMovieShootDayStatusTypeIds,
      predefinedMovieShootDayTypeIds: predefinedMovieShootDayTypeIds,
      predefinedLocationTypeIds: predefinedLocationTypeIds,
      predefinedMovieApprovalStatusForCallsheetTypeIds:
          predefinedMovieApprovalStatusForCallsheetTypeIds,
      predefinedMovieApprovalStatusForBudgetTypeIds:
          predefinedMovieApprovalStatusForBudgetTypeIds,
      movieBudgetDivisionIds: movieBudgetDivisionIds,
      predefinedCallSheetTypeIds: predefinedCallSheetTypeIds,
      movieLocationId: movieLocationId,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayModelReturnListModel>(
          'Unable to Get Movie List');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayForCallSheetModelReturnModel>>?
      getScheduleDetails({int? movieShootDayId}) async {
    var result = await api.apiV1MovieGetmovieshootdaydetailsforcallsheetGet(
      movieShootDayId: movieShootDayId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayForCallSheetModelReturnModel>(
          'Unable to Get Movie List');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayForCallSheetModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayForCallSheetModelReturnModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieModelReturnModel>>? getMovie({int? id}) async {
    var result = await api.apiV1MovieGetmovieGet(id: id);
    if (result.body == null) {
      return ResultModel.error<MovieModelReturnModel>('Unable to Get Movie');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieSummaryModelReturnModel>>? getMovieSummaries(
      {int? movieId}) async {
    var result = await api.apiV1MovieGetmoviesummariesGet(movieId: movieId);
    if (result.body == null) {
      return ResultModel.error<MovieSummaryModelReturnModel>(
          'Unable to Get Movie Summary');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieSummaryModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieSummaryModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieLocationModelReturnModel>>? getScheduleDayDetails(
      {int? id}) async {
    var result = await api.apiV1MovieGetmovielocationGet(id: id);
    if (result.body == null) {
      return ResultModel.error<MovieLocationModelReturnModel>(
          'Unable to Get Movie List');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieLocationModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieLocationModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDaySummaryModelReturnModel>>?
      getMovieShootDaySummaryByMovieShootDayId({int? movieShootDayId}) async {
    var result =
        await api.apiV1MovieGetmovieshootdaysummarybymovieshootdayidGet(
            movieShootDayId: movieShootDayId);
    if (result.body == null) {
      return ResultModel.error<MovieShootDaySummaryModelReturnModel>(
          'Unable to Get Movie Shoot day daily status report');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDaySummaryModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDaySummaryModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<UserModelReturnModel>>? createUser(
      {http.MultipartFile? UploadedFile,
      List? newPermissionTypeIds,
      String? initialPassword,
      String? companyName,
      String? companyCode,
      String? modifiedByUserFirstName,
      String? modifiedByUserLastName,
      String? modifiedByUserEmail,
      String? userGuid,
      String? userName,
      int? predefinedUserTypeId,
      String? passwordHash,
      DateTime? passwordChangedDate,
      String? email,
      String? firstName,
      String? lastName,
      String? workPhone,
      String? workPhoneExt,
      String? cellPhone,
      bool? active,
      bool? notificationThroughEmail,
      String? oneTimeToken,
      DateTime? oneTimeExpireDateTime,
      int? loginFailedAttempt,
      bool? isAccountLocked,
      DateTime? accountLockedUntil,
      String? newUserActivationGuid,
      DateTime? newUserActivationCompletedOn,
      bool? canConfigureCompany,
      bool? canViewCompany,
      String? profileImageLocation,
      String? profileImageActualFileName,
      int? companyId,
      bool? isDeleted}) async {
    var result = await api.apiV1CompanyCreateuserPost(
        UploadedFile: UploadedFile,
        newPermissionTypeIds: newPermissionTypeIds,
        initialPassword: initialPassword,
        companyName: companyName,
        companyCode: companyCode,
        modifiedByUserFirstName: modifiedByUserFirstName,
        modifiedByUserLastName: modifiedByUserLastName,
        modifiedByUserEmail: modifiedByUserEmail,
        userGuid: userGuid,
        userName: userName,
        predefinedUserTypeId: predefinedUserTypeId,
        passwordHash: passwordHash,
        passwordChangedDate: passwordChangedDate,
        email: email,
        firstName: firstName,
        lastName: lastName,
        workPhone: workPhone,
        workPhoneExt: workPhoneExt,
        cellPhone: cellPhone,
        active: active,
        notificationThroughEmail: notificationThroughEmail,
        oneTimeToken: oneTimeToken,
        oneTimeExpireDateTime: oneTimeExpireDateTime,
        loginFailedAttempt: loginFailedAttempt,
        isAccountLocked: isAccountLocked,
        accountLockedUntil: accountLockedUntil,
        newUserActivationGuid: newUserActivationGuid,
        newUserActivationCompletedOn: newUserActivationCompletedOn,
        canConfigureCompany: canConfigureCompany,
        canViewCompany: canViewCompany,
        profileImageLocation: profileImageLocation,
        profileImageActualFileName: profileImageActualFileName,
        companyId: companyId,
        isDeleted: isDeleted);
    if (result.body == null) {
      return ResultModel.error<UserModelReturnModel>(
          'Unable to Create Movie User');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<UserModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<UserModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<UserModelReturnModel>>? updateUser({
    http.MultipartFile? UploadedFile,
    List? existingPermissionTypeIds,
    String? companyName,
    String? companyCode,
    String? modifiedByUserFirstName,
    String? modifiedByUserLastName,
    String? modifiedByUserEmail,
    int? userId,
    String? userGuid,
    String? userName,
    int? predefinedUserTypeId,
    String? passwordHash,
    DateTime? passwordChangedDate,
    String? email,
    String? firstName,
    String? lastName,
    String? workPhone,
    String? workPhoneExt,
    String? cellPhone,
    bool? active,
    bool? notificationThroughEmail,
    String? oneTimeToken,
    DateTime? oneTimeExpireDateTime,
    int? loginFailedAttempt,
    bool? isAccountLocked,
    DateTime? accountLockedUntil,
    String? newUserActivationGuid,
    DateTime? newUserActivationCompletedOn,
    bool? canConfigureCompany,
    bool? canViewCompany,
    String? profileImageLocation,
    String? profileImageActualFileName,
    int? companyId,
    bool? isDeleted,
  }) async {
    var result = await api.apiV1CompanyUpdateuserbyadminPost(
        UploadedFile: UploadedFile,
        existingPermissionTypeIds: existingPermissionTypeIds,
        companyName: companyName,
        companyCode: companyCode,
        modifiedByUserFirstName: modifiedByUserFirstName,
        modifiedByUserLastName: modifiedByUserLastName,
        modifiedByUserEmail: modifiedByUserEmail,
        userId: userId,
        userGuid: userGuid,
        userName: userName,
        predefinedUserTypeId: predefinedUserTypeId,
        passwordHash: passwordHash,
        passwordChangedDate: passwordChangedDate,
        email: email,
        firstName: firstName,
        lastName: lastName,
        workPhone: workPhone,
        workPhoneExt: workPhoneExt,
        cellPhone: cellPhone,
        active: active,
        notificationThroughEmail: notificationThroughEmail,
        oneTimeToken: oneTimeToken,
        oneTimeExpireDateTime: oneTimeExpireDateTime,
        loginFailedAttempt: loginFailedAttempt,
        isAccountLocked: isAccountLocked,
        accountLockedUntil: accountLockedUntil,
        newUserActivationGuid: newUserActivationGuid,
        newUserActivationCompletedOn: newUserActivationCompletedOn,
        canConfigureCompany: canConfigureCompany,
        canViewCompany: canViewCompany,
        profileImageLocation: profileImageLocation,
        profileImageActualFileName: profileImageActualFileName,
        companyId: companyId,
        isDeleted: isDeleted);
    if (result.body == null) {
      return ResultModel.error<UserModelReturnModel>(
          'Unable to Create Movie User');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<UserModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<UserModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<CompanyModelReturnModel>>? getCompany(
      {int? companyId}) async {
    var result = await api.apiV1CompanyGetcompanyGet(id: companyId);
    if (result.body == null) {
      return ResultModel.error<CompanyModelReturnModel>(
          'Unable to Get Company information');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<CompanyModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<CompanyModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieBudgetDivisionModelReturnListModel>>?
      getMovieBudgetDivisions({
    int? movieId,
    List<int>? movieBudgetDivisionIds,
    int? companyId,
    bool? showDeleted,
    List<int>? predefinedBudgetDivisionTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result =
        await api.apiV1MovieGetmoviebudgetdivisionsGet(movieId: movieId);

    if (result.body == null) {
      return ResultModel.error<MovieBudgetDivisionModelReturnListModel>(
          'Unable to Get Movie List');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieBudgetDivisionModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieBudgetDivisionModelReturnListModel>(
          result.body!);
    }
  }

  Future<
          ResultModel<
              MovieShootDayBudgetExpenseSummaryForAllBudgetDivisionTypeModelReturnModel>>?
      getConsolidatedMovieBudgetExpenseSummaryForAllPredefinedBudgetDivisionTypes({
    int? movieId,
  }) async {
    var result = await api
        .apiV1MovieGetconsolidatedmoviebudgetexpensesummaryforallpredefinedbudgetdivisiontypesGet(
      movieId: movieId,
    );
    if (result.body == null) {
      return ResultModel.error<
              MovieShootDayBudgetExpenseSummaryForAllBudgetDivisionTypeModelReturnModel>(
          'Unable to Get Movie Shoot Day Budget Expense Summary For All Budget Division Type');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieShootDayBudgetExpenseSummaryForAllBudgetDivisionTypeModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<
              MovieShootDayBudgetExpenseSummaryForAllBudgetDivisionTypeModelReturnModel>(
          result.body!);
    }
  }

  Future<
          ResultModel<
              ConsolidatedMovieResourceBudgetExpenseSummaryModelReturnModel>>?
      getConsolidatedBudgetExpenseReportByMovieResource({
    int? movieId,
  }) async {
    var result = await api
        .apiV1MovieGetconsolidatedbudgetexpensereportbymovieresourceGet(
      movieId: movieId,
    );
    if (result.body == null) {
      return ResultModel.error<
              ConsolidatedMovieResourceBudgetExpenseSummaryModelReturnModel>(
          'Unable to Get Movie Budget Expense Report By Movie resource Type');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                ConsolidatedMovieResourceBudgetExpenseSummaryModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<
              ConsolidatedMovieResourceBudgetExpenseSummaryModelReturnModel>(
          result.body!);
    }
  }

  Future<
          ResultModel<
              MonthlyMovieShootDayBudgetExpenseSummaryModelReturnListModel>>?
      getConsolidatedMonthlyBudgetExpenseReport({
    int? movieId,
    int? predefinedBudgetDivisionTypeId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result =
        await api.apiV1MovieGetconsolidatedmonthlybudgetexpensereportGet(
            movieId: movieId,
            predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
            selectedId: selectedId,
            page: page,
            pageSize: pageSize,
            keyword: keyword,
            sortBy: sortBy,
            sortAscending: sortAscending,
            currentRows: currentRows,
            totalRowCount: totalRowCount,
            numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<
              MonthlyMovieShootDayBudgetExpenseSummaryModelReturnListModel>(
          'Unable to Get Movie Budget Expense Report By Movie resource Type');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MonthlyMovieShootDayBudgetExpenseSummaryModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<
              MonthlyMovieShootDayBudgetExpenseSummaryModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieResourceBudgetExpenseSummaryModelReturnListModel>>?
      getConsolidatedBudgetExpenseReportForAllMovieResource({
    int? movieId,
    int? predefinedBudgetOrExpenseTypeId,
    int? predefinedBudgetDivisionTypeId,
    int? movieResourceId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api
        .apiV1MovieGetconsolidatedbudgetexpensereportforallmovieresourceGet(
            movieId: movieId,
            predefinedBudgetOrExpenseTypeId: predefinedBudgetOrExpenseTypeId,
            predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
            movieResourceId: movieResourceId,
            selectedId: selectedId,
            page: page,
            pageSize: pageSize,
            keyword: keyword,
            sortBy: sortBy,
            sortAscending: sortAscending,
            currentRows: currentRows,
            totalRowCount: totalRowCount,
            numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<
              MovieResourceBudgetExpenseSummaryModelReturnListModel>(
          'Unable to Get Movie Budget Expense Report By Movie Cast And Crew');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieResourceBudgetExpenseSummaryModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<
          MovieResourceBudgetExpenseSummaryModelReturnListModel>(result.body!);
    }
  }

  Future<
          ResultModel<
              MovieBudgetExpenseSummaryForAllMovieBudgetCategoryTypeModelReturnListModel>>?
      getConsolidatedMovieBudgetExpenseSummaryForAllMovieBudgetCategoryTypeByPredefinedBudgetDivisionTypeId({
    int? movieId,
    int? predefinedBudgetDivisionTypeId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api
        .apiV1MovieGetconsolidatedmoviebudgetexpensesummaryforallmoviebudgetcategorytypebypredefinedbudgetdivisiontypeidGet(
      movieId: movieId,
      predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<
              MovieBudgetExpenseSummaryForAllMovieBudgetCategoryTypeModelReturnListModel>(
          'Unable to Get Movie Shoot Day Budget Expense Summary For All Budget Category Type');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieBudgetExpenseSummaryForAllMovieBudgetCategoryTypeModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<
              MovieBudgetExpenseSummaryForAllMovieBudgetCategoryTypeModelReturnListModel>(
          result.body!);
    }
  }

  Future<
          ResultModel<
              MovieBudgetExpenseSummaryByBudgetCategoryNameModelReturnListModel>>?
      getConsolidatedMovieBudgetExpenseSummaryByBudgetCategoryName({
    int? predefinedBudgetDivisionTypeId,
    int? movieId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api
        .apiV1MovieGetconsolidatedmoviebudgetexpensesummarybybudgetcategorynameGet(
      movieId: movieId,
      predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<
              MovieBudgetExpenseSummaryByBudgetCategoryNameModelReturnListModel>(
          'Unable to Get Movie Shoot Day Budget Expense Summary For All Budget Category Type');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieBudgetExpenseSummaryByBudgetCategoryNameModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<
              MovieBudgetExpenseSummaryByBudgetCategoryNameModelReturnListModel>(
          result.body!);
    }
  }

  Future<
          ResultModel<
              MovieBudgetExpenseSummaryForAllDepartmentModelReturnListModel>>?
      getConsolidatedMovieBudgetExpenseSummaryForAllDepartmentByPredefinedBudgetDivisionTypeId({
    int? movieId,
    int? predefinedBudgetDivisionTypeId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api
        .apiV1MovieGetconsolidatedmoviebudgetexpensesummaryforalldepartmentbypredefinedbudgetdivisiontypeidGet(
      movieId: movieId,
      predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<
              MovieBudgetExpenseSummaryForAllDepartmentModelReturnListModel>(
          'Unable to Get Movie Shoot Day Budget Expense Summary For All Budget Department Type');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieBudgetExpenseSummaryForAllDepartmentModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<
              MovieBudgetExpenseSummaryForAllDepartmentModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieShootDayModelReturnListModel>>?
      getMovieShootDaysOfShootExpenseDivision({
    int? companyId,
    bool? showDeleted,
    int? movieId,
    List<int>? movieShootDayIds,
    List<int>? predefinedMovieShootDayStatusTypeIds,
    List<int>? predefinedMovieShootDayTypeIds,
    List<int>? predefinedLocationTypeIds,
    List<int>? predefinedMovieApprovalStatusForCallsheetTypeIds,
    List<int>? predefinedMovieApprovalStatusForBudgetTypeIds,
    List<int>? movieBudgetDivisionIds,
    List<int>? predefinedCallSheetTypeIds,
    DateTime? dayOfShoot,
    int? predefinedBudgetDivisionTypeId,
    int? movieLocationId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovieshootdaysofshootexpensedivisionGet(
      movieId: movieId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      companyId: companyId,
      showDeleted: showDeleted,
      movieShootDayIds: movieShootDayIds,
      predefinedMovieShootDayStatusTypeIds:
          predefinedMovieShootDayStatusTypeIds,
      predefinedMovieShootDayTypeIds: predefinedMovieShootDayTypeIds,
      predefinedLocationTypeIds: predefinedLocationTypeIds,
      predefinedMovieApprovalStatusForCallsheetTypeIds:
          predefinedMovieApprovalStatusForCallsheetTypeIds,
      predefinedMovieApprovalStatusForBudgetTypeIds:
          predefinedMovieApprovalStatusForBudgetTypeIds,
      movieBudgetDivisionIds: movieBudgetDivisionIds,
      predefinedCallSheetTypeIds: predefinedCallSheetTypeIds,
      dayOfShoot: dayOfShoot,
      movieLocationId: movieLocationId,
      predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayModelReturnListModel>(
          'Unable to Get Movie Shoot Days');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieBudgetCategoryWithAmountGroupModelReturnListModel>>?
      getMovieShootDaysExpenseSummaryForAllDays({
    int? movieBudgetDivisionId,
  }) async {
    var result =
        await api.apiV1MovieGetmovieshootdaysexpensesummaryforalldaysGet(
      movieBudgetDivisionId: movieBudgetDivisionId,
    );
    if (result.body == null) {
      return ResultModel.error<
              MovieBudgetCategoryWithAmountGroupModelReturnListModel>(
          'Unable to Get Movie shoot day expense summary');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieBudgetCategoryWithAmountGroupModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<
          MovieBudgetCategoryWithAmountGroupModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieBudgetCategoryWithAmountGroupModelReturnListModel>>?
      getMovieShootDaysBudgetSummaryForAllDays({
    int? movieBudgetDivisionId,
  }) async {
    var result =
        await api.apiV1MovieGetmovieshootdaysbudgetsummaryforalldaysGet(
      movieBudgetDivisionId: movieBudgetDivisionId,
    );
    if (result.body == null) {
      return ResultModel.error<
              MovieBudgetCategoryWithAmountGroupModelReturnListModel>(
          'Unable to Get Movie shoot day budget summary');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieBudgetCategoryWithAmountGroupModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<
          MovieBudgetCategoryWithAmountGroupModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayModelReturnListModel>>? getMovieShootDays({
    int? companyId,
    bool? showDeleted,
    int? movieId,
    int? predefinedBudgetDivisionTypeId,
    List<int>? movieShootDayIds,
    List<int>? predefinedMovieShootDayStatusTypeIds,
    List<int>? predefinedMovieShootDayTypeIds,
    List<int>? predefinedLocationTypeIds,
    List<int>? predefinedMovieApprovalStatusForCallsheetTypeIds,
    List<int>? predefinedMovieApprovalStatusForBudgetTypeIds,
    List<int>? movieBudgetDivisionIds,
    List<int>? predefinedCallSheetTypeIds,
    DateTime? dayOfShoot,
    int? movieLocationId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovieshootdaysGet(
      movieId: movieId,
      showDeleted: showDeleted,
      companyId: companyId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
      movieShootDayIds: movieShootDayIds,
      predefinedMovieShootDayStatusTypeIds:
          predefinedMovieShootDayStatusTypeIds,
      predefinedMovieShootDayTypeIds: predefinedMovieShootDayTypeIds,
      predefinedLocationTypeIds: predefinedLocationTypeIds,
      predefinedMovieApprovalStatusForCallsheetTypeIds:
          predefinedMovieApprovalStatusForCallsheetTypeIds,
      predefinedMovieApprovalStatusForBudgetTypeIds:
          predefinedMovieApprovalStatusForBudgetTypeIds,
      movieBudgetDivisionIds: movieBudgetDivisionIds,
      predefinedCallSheetTypeIds: predefinedCallSheetTypeIds,
      dayOfShoot: dayOfShoot,
      movieLocationId: movieLocationId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayModelReturnListModel>(
          'Unable to Get Movie shoot days');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<ChatMessageModelReturnListModel>>? getChatMessages({
    int? companyId,
    bool? showDeleted,
    int? userId,
    int? chatId,
    List<int>? chatIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1ChatGetchatmessagesGet(
        companyId: companyId,
        showDeleted: showDeleted,
        userId: userId,
        chatId: chatId,
        chatIds: chatIds,
        createdByUserId: createdByUserId,
        modifiedByUserId: modifiedByUserId,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<ChatMessageModelReturnListModel>(
          'Unable to Get Chat messages');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ChatMessageModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ChatMessageModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayModelReturnListModel>>?
      getMovieShootDaysByMovieIdAndPredefinedBudgetDivisionTypeId({
    int? companyId,
    bool? showDeleted,
    int? movieId,
    int? predefinedBudgetDivisionTypeId,
    List<int>? movieShootDayIds,
    List<int>? predefinedMovieShootDayStatusTypeIds,
    List<int>? predefinedMovieShootDayTypeIds,
    List<int>? predefinedLocationTypeIds,
    List<int>? predefinedMovieApprovalStatusForCallsheetTypeIds,
    List<int>? predefinedMovieApprovalStatusForBudgetTypeIds,
    List<int>? movieBudgetDivisionIds,
    List<int>? predefinedCallSheetTypeIds,
    DateTime? dayOfShoot,
    int? movieLocationId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api
        .apiV1MovieGetmovieshootdaysbymovieidandpredefinedbudgetdivisiontypeidGet(
      movieId: movieId,
      showDeleted: showDeleted,
      companyId: companyId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
      movieShootDayIds: movieShootDayIds,
      predefinedMovieShootDayStatusTypeIds:
          predefinedMovieShootDayStatusTypeIds,
      predefinedMovieShootDayTypeIds: predefinedMovieShootDayTypeIds,
      predefinedLocationTypeIds: predefinedLocationTypeIds,
      predefinedMovieApprovalStatusForCallsheetTypeIds:
          predefinedMovieApprovalStatusForCallsheetTypeIds,
      predefinedMovieApprovalStatusForBudgetTypeIds:
          predefinedMovieApprovalStatusForBudgetTypeIds,
      movieBudgetDivisionIds: movieBudgetDivisionIds,
      predefinedCallSheetTypeIds: predefinedCallSheetTypeIds,
      dayOfShoot: dayOfShoot,
      movieLocationId: movieLocationId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayModelReturnListModel>(
          'Unable to Get Movie shoot days');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieBudgetCategoryModelReturnListModel>>?
      getMovieBudgetCategories({
    List<int>? movieBudgetCategoryIds,
    int? companyId,
    bool? showDeleted,
    List<int>? movieBudgetDivisionIds,
    int? movieId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmoviebudgetcategoriesGet(
      movieId: movieId,
      showDeleted: showDeleted,
      companyId: companyId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      movieBudgetDivisionIds: movieBudgetDivisionIds,
      movieBudgetCategoryIds: movieBudgetCategoryIds,
    );
    if (result.body == null) {
      return ResultModel.error<MovieBudgetCategoryModelReturnListModel>(
          'Unable to Get Movie Budget Categories');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieBudgetCategoryModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieBudgetCategoryModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieBudgetCategoryModelReturnListModel>>?
      getMovieBudgetCategoriesByPredefinedBudgetDivisionTypeIdAsync({
    int? companyId,
    int? movieId,
    int? predefinedBudgetDivisionTypeId,
  }) async {
    var result = await api
        .apiV1MovieGetmoviebudgetcategoriesbypredefinedbudgetdivisiontypeidGet(
            companyId: companyId,
            movieId: movieId,
            predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId);
    if (result.body == null) {
      return ResultModel.error<MovieBudgetCategoryModelReturnListModel>(
          'Unable to Get Movie Budget Categories');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieBudgetCategoryModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieBudgetCategoryModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieArtistWithCompanyArtistModelReturnListModel>>?
      getMovieArtistsWithMissingCompanyArtists({
    List<int>? movieArtistIds,
    List<int>? defaultPreProductionMovieBudgetCategoryIds,
    List<int>? defaultProductionMovieBudgetCategoryIds,
    List<int>? defaultPostProductionMovieBudgetCategoryIds,
    List<int>? predefinedContractAssignmentStatusTypeIds,
    List<int>? contractIds,
    int? movieId,
    int? companyId,
    bool? showDeleted,
    int? artistId,
    List<int>? artistTypeIds,
    int? parentMovieArtistId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result =
        await api.apiV1MovieGetmovieartistswithmissingcompanyartistsGet(
      movieId: movieId,
      showDeleted: showDeleted,
      companyId: companyId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      artistId: artistId,
      artistTypeIds: artistTypeIds,
      contractIds: contractIds,
      defaultPostProductionMovieBudgetCategoryIds:
          defaultPostProductionMovieBudgetCategoryIds,
      defaultPreProductionMovieBudgetCategoryIds:
          defaultPreProductionMovieBudgetCategoryIds,
      defaultProductionMovieBudgetCategoryIds:
          defaultProductionMovieBudgetCategoryIds,
      predefinedContractAssignmentStatusTypeIds:
          predefinedContractAssignmentStatusTypeIds,
      movieArtistIds: movieArtistIds,
      parentMovieArtistId: parentMovieArtistId,
    );
    if (result.body == null) {
      return ResultModel.error<
              MovieArtistWithCompanyArtistModelReturnListModel>(
          'Unable to Get Movie Artists With Missing Company Artists ');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieArtistWithCompanyArtistModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieArtistWithCompanyArtistModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieTechnicianWithCompanyTechnicianModelReturnListModel>>?
      getMovieTechniciansWithMissingCompanyTechnicians({
    List<int>? movieTechnicianIds,
    List<int>? defaultPreProductionMovieBudgetCategoryIds,
    List<int>? defaultProductionMovieBudgetCategoryIds,
    List<int>? defaultPostProductionMovieBudgetCategoryIds,
    List<int>? predefinedContractAssignmentStatusTypeIds,
    List<int>? contractIds,
    int? movieId,
    int? companyId,
    bool? showDeleted,
    int? technicianId,
    List<int>? technicianTypeIds,
    int? parentMovieTechnicianId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result =
        await api.apiV1MovieGetmovietechnicianswithmissingcompanytechniciansGet(
      movieId: movieId,
      showDeleted: showDeleted,
      companyId: companyId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      technicianId: technicianId,
      technicianTypeIds: technicianTypeIds,
      contractIds: contractIds,
      defaultPostProductionMovieBudgetCategoryIds:
          defaultPostProductionMovieBudgetCategoryIds,
      defaultPreProductionMovieBudgetCategoryIds:
          defaultPreProductionMovieBudgetCategoryIds,
      defaultProductionMovieBudgetCategoryIds:
          defaultProductionMovieBudgetCategoryIds,
      predefinedContractAssignmentStatusTypeIds:
          predefinedContractAssignmentStatusTypeIds,
      movieTechnicianIds: movieTechnicianIds,
      parentMovieTechnicianId: parentMovieTechnicianId,
    );
    if (result.body == null) {
      return ResultModel.error<
              MovieTechnicianWithCompanyTechnicianModelReturnListModel>(
          'Unable to Get Movie Technicians With Missing Company Technicians ');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieTechnicianWithCompanyTechnicianModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<
              MovieTechnicianWithCompanyTechnicianModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieEquipmentWithCompanyEquipmentModelReturnListModel>>?
      getMovieEquipmentsWithMissingCompanyEquipments({
    List<int>? movieEquipmentIds,
    List<int>? defaultPreProductionMovieBudgetCategoryIds,
    List<int>? defaultProductionMovieBudgetCategoryIds,
    List<int>? defaultPostProductionMovieBudgetCategoryIds,
    List<int>? predefinedContractAssignmentStatusTypeIds,
    List<int>? contractIds,
    int? movieId,
    int? companyId,
    bool? showDeleted,
    int? equipmentId,
    List<int>? equipmentTypeIds,
    int? parentMovieEquipmentId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result =
        await api.apiV1MovieGetmovieequipmentswithmissingcompanyequipmentsGet(
      movieId: movieId,
      showDeleted: showDeleted,
      companyId: companyId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      equipmentId: equipmentId,
      equipmentTypeIds: equipmentTypeIds,
      contractIds: contractIds,
      defaultPostProductionMovieBudgetCategoryIds:
          defaultPostProductionMovieBudgetCategoryIds,
      defaultPreProductionMovieBudgetCategoryIds:
          defaultPreProductionMovieBudgetCategoryIds,
      defaultProductionMovieBudgetCategoryIds:
          defaultProductionMovieBudgetCategoryIds,
      predefinedContractAssignmentStatusTypeIds:
          predefinedContractAssignmentStatusTypeIds,
      movieEquipmentIds: movieEquipmentIds,
      parentMovieEquipmentId: parentMovieEquipmentId,
    );
    if (result.body == null) {
      return ResultModel.error<
              MovieEquipmentWithCompanyEquipmentModelReturnListModel>(
          'Unable to Get Movie Equipments With Missing Company Equipments ');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieEquipmentWithCompanyEquipmentModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<
          MovieEquipmentWithCompanyEquipmentModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieVendorWithCompanyVendorModelReturnListModel>>?
      getMovieVendorsWithMissingCompanyVendors({
    List<int>? movieVendorIds,
    List<int>? defaultPreProductionMovieBudgetCategoryIds,
    List<int>? defaultProductionMovieBudgetCategoryIds,
    List<int>? defaultPostProductionMovieBudgetCategoryIds,
    List<int>? predefinedContractAssignmentStatusTypeIds,
    List<int>? contractIds,
    int? movieId,
    int? companyId,
    bool? showDeleted,
    int? vendorId,
    List<int>? vendorTypeIds,
    int? parentMovieVendorId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result =
        await api.apiV1MovieGetmovievendorswithmissingcompanyvendorsGet(
      movieId: movieId,
      showDeleted: showDeleted,
      companyId: companyId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      vendorId: vendorId,
      vendorTypeIds: vendorTypeIds,
      contractIds: contractIds,
      defaultPostProductionMovieBudgetCategoryIds:
          defaultPostProductionMovieBudgetCategoryIds,
      defaultPreProductionMovieBudgetCategoryIds:
          defaultPreProductionMovieBudgetCategoryIds,
      defaultProductionMovieBudgetCategoryIds:
          defaultProductionMovieBudgetCategoryIds,
      predefinedContractAssignmentStatusTypeIds:
          predefinedContractAssignmentStatusTypeIds,
      movieVendorIds: movieVendorIds,
      parentMovieVendorId: parentMovieVendorId,
    );
    if (result.body == null) {
      return ResultModel.error<
              MovieVendorWithCompanyVendorModelReturnListModel>(
          'Unable to Get Movie Vendors With Missing Company Vendors ');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieVendorWithCompanyVendorModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieVendorWithCompanyVendorModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MoviePropertyWithCompanyPropertyModelReturnListModel>>?
      getMoviePropertiesWithMissingCompanyProperties({
    List<int>? moviePropertyIds,
    List<int>? defaultPreProductionMovieBudgetCategoryIds,
    List<int>? defaultProductionMovieBudgetCategoryIds,
    List<int>? defaultPostProductionMovieBudgetCategoryIds,
    List<int>? predefinedContractAssignmentStatusTypeIds,
    List<int>? contractIds,
    int? movieId,
    int? companyId,
    bool? showDeleted,
    int? propertyId,
    List<int>? propertyTypeIds,
    int? parentMoviePropertyId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result =
        await api.apiV1MovieGetmoviepropertieswithmissingcompanypropertiesGet(
      movieId: movieId,
      showDeleted: showDeleted,
      companyId: companyId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      propertyId: propertyId,
      propertyTypeIds: propertyTypeIds,
      contractIds: contractIds,
      defaultPostProductionMovieBudgetCategoryIds:
          defaultPostProductionMovieBudgetCategoryIds,
      defaultPreProductionMovieBudgetCategoryIds:
          defaultPreProductionMovieBudgetCategoryIds,
      defaultProductionMovieBudgetCategoryIds:
          defaultProductionMovieBudgetCategoryIds,
      predefinedContractAssignmentStatusTypeIds:
          predefinedContractAssignmentStatusTypeIds,
      moviePropertyIds: moviePropertyIds,
      parentMoviePropertyId: parentMoviePropertyId,
    );
    if (result.body == null) {
      return ResultModel.error<
              MoviePropertyWithCompanyPropertyModelReturnListModel>(
          'Unable to Get Movie Properties With Missing Company Properties ');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MoviePropertyWithCompanyPropertyModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<
          MoviePropertyWithCompanyPropertyModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<ArtistModelReturnModel>>? getArtist({
    int? id,
  }) async {
    var result = await api.apiV1CompanyGetartistGet(
      id: id,
    );
    if (result.body == null) {
      return ResultModel.error<ArtistModelReturnModel>('Unable to Get Artist');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ArtistModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ArtistModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayArtistModelReturnListModel>>?
      getMovieShootDayArtistByMovieArtistId({int? movieArtistId}) async {
    var result = await api.apiV1MovieGetmovieshootdayartistbymovieartistidGet(
      movieArtistId: movieArtistId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayArtistModelReturnListModel>(
          'Unable to Get Movie Artist');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayArtistModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayArtistModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieArtistRateModelReturnModel>>?
      getPredefinedMovieArtistRateByMovieArtistId(
          {required int? movieArtistId,
          required int? movieShootDayId,
          int? predefinedRateTypeId}) async {
    var result =
        await api.apiV1MovieGetpredefinedmovieartistratebymovieartistidGet(
      movieArtistId: movieArtistId,
      movieShootDayId: movieShootDayId,
      predefinedRateTypeId: predefinedRateTypeId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieArtistRateModelReturnModel>(
          'Unable to Get Movie Artist');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieArtistRateModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieArtistRateModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<TechnicianModelReturnModel>>? getTechnician({
    int? id,
  }) async {
    var result = await api.apiV1CompanyGettechnicianGet(
      id: id,
    );
    if (result.body == null) {
      return ResultModel.error<TechnicianModelReturnModel>(
          'Unable to Get Technician');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<TechnicianModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<TechnicianModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayTechnicianModelReturnListModel>>?
      getMovieShootDayTechnicianByMovieTechnicianId(
          {int? movieTechnicianId}) async {
    var result =
        await api.apiV1MovieGetmovieshootdaytechnicianbymovietechnicianidGet(
      movieTechnicianId: movieTechnicianId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayTechnicianModelReturnListModel>(
          'Unable to Get Movie Technician');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayTechnicianModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayTechnicianModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieTechnicianRateModelReturnModel>>?
      getPredefinedMovieTechnicianRateByMovieTechnicianId(
          {required int? movieTechnicianId,
          required int? movieShootDayId,
          int? predefinedRateTypeId}) async {
    var result = await api
        .apiV1MovieGetpredefinedmovietechnicianratebymovietechnicianidGet(
      movieTechnicianId: movieTechnicianId,
      movieShootDayId: movieShootDayId,
      predefinedRateTypeId: predefinedRateTypeId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieTechnicianRateModelReturnModel>(
          'Unable to Get Movie Technician');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieTechnicianRateModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieTechnicianRateModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<EquipmentModelReturnModel>>? getEquipment({
    int? id,
  }) async {
    var result = await api.apiV1CompanyGetequipmentGet(
      id: id,
    );
    if (result.body == null) {
      return ResultModel.error<EquipmentModelReturnModel>(
          'Unable to Get Equipment');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<EquipmentModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<EquipmentModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayEquipmentModelReturnListModel>>?
      getMovieShootDayEquipmentByMovieEquipmentId(
          {int? movieEquipmentId}) async {
    var result =
        await api.apiV1MovieGetmovieshootdayequipmentbymovieequipmentidGet(
      movieEquipmentId: movieEquipmentId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayEquipmentModelReturnListModel>(
          'Unable to Get Movie Equipment');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayEquipmentModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayEquipmentModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieEquipmentRateModelReturnModel>>?
      getPredefinedMovieEquipmentRateByMovieEquipmentId(
          {required int? movieEquipmentId,
          required int? movieShootDayId,
          int? predefinedRateTypeId}) async {
    var result = await api
        .apiV1MovieGetpredefinedmovieequipmentratebymovieequipmentidGet(
      movieEquipmentId: movieEquipmentId,
      movieShootDayId: movieShootDayId,
      predefinedRateTypeId: predefinedRateTypeId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieEquipmentRateModelReturnModel>(
          'Unable to Get Movie Equipment');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieEquipmentRateModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieEquipmentRateModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<VendorModelReturnModel>>? getVendor({
    int? id,
  }) async {
    var result = await api.apiV1CompanyGetvendorGet(
      id: id,
    );
    if (result.body == null) {
      return ResultModel.error<VendorModelReturnModel>('Unable to Get Vendor');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<VendorModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<VendorModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayVendorModelReturnListModel>>?
      getMovieShootDayVendorByMovieVendorId({int? movieVendorId}) async {
    var result = await api.apiV1MovieGetmovieshootdayvendorbymovievendoridGet(
      movieVendorId: movieVendorId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayVendorModelReturnListModel>(
          'Unable to Get Movie Vendor');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayVendorModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayVendorModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieVendorRateModelReturnModel>>?
      getPredefinedMovieVendorRateByMovieVendorId(
          {required int? movieVendorId,
          required int? movieShootDayId,
          int? predefinedRateTypeId}) async {
    var result =
        await api.apiV1MovieGetpredefinedmovievendorratebymovievendoridGet(
      movieVendorId: movieVendorId,
      movieShootDayId: movieShootDayId,
      predefinedRateTypeId: predefinedRateTypeId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieVendorRateModelReturnModel>(
          'Unable to Get Movie Vendor');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieVendorRateModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieVendorRateModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<PropertyModelReturnModel>>? getProperty({
    int? id,
  }) async {
    var result = await api.apiV1CompanyGetpropertyGet(
      id: id,
    );
    if (result.body == null) {
      return ResultModel.error<PropertyModelReturnModel>(
          'Unable to Get Property');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<PropertyModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<PropertyModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayPropertyModelReturnListModel>>?
      getMovieShootDayPropertyByMoviePropertyId({int? moviePropertyId}) async {
    var result =
        await api.apiV1MovieGetmovieshootdaypropertybymoviepropertyidGet(
      moviePropertyId: moviePropertyId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayPropertyModelReturnListModel>(
          'Unable to Get Movie Property');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayPropertyModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayPropertyModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieShootDayModelReturnModel>>? getMovieShootDay(
      {int? id}) async {
    var result = await api.apiV1MovieGetmovieshootdayGet(
      id: id,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayModelReturnModel>(
          'Unable to Get Movie Property');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MoviePropertyRateModelReturnModel>>?
      getPredefinedMoviePropertyRateByMoviePropertyId(
          {required int? moviePropertyId,
          required int? movieShootDayId,
          int? predefinedRateTypeId}) async {
    var result =
        await api.apiV1MovieGetpredefinedmoviepropertyratebymoviepropertyidGet(
      moviePropertyId: moviePropertyId,
      movieShootDayId: movieShootDayId,
      predefinedRateTypeId: predefinedRateTypeId,
    );
    if (result.body == null) {
      return ResultModel.error<MoviePropertyRateModelReturnModel>(
          'Unable to Get Movie Property');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MoviePropertyRateModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MoviePropertyRateModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayBudgetModelReturnModel>>?
      createMovieShootDayBudget(
          {required MovieShootDayBudgetCreateModel? budgetModel}) async {
    var result =
        await api.apiV1MovieCreatemovieshootdaybudgetPost(body: budgetModel);
    if (result.body == null) {
      return ResultModel.error<MovieShootDayBudgetModelReturnModel>(
          'Unable to Create Movie shoot day budget');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayBudgetModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayBudgetModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayBudgetModelReturnModel>>?
      updateMovieShootDayBudget(
          {required MovieShootDayBudgetUpdateModel? budgetModel}) async {
    var result =
        await api.apiV1MovieUpdatemovieshootdaybudgetPost(body: budgetModel);
    if (result.body == null) {
      return ResultModel.error<MovieShootDayBudgetModelReturnModel>(
          'Unable to Update Movie shoot day budget');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayBudgetModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayBudgetModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayExpenseModelReturnModel>>?
      createMovieShootDayExpense(
          {required MovieShootDayExpenseCreateModel? expenseModel}) async {
    var result =
        await api.apiV1MovieCreatemovieshootdayexpensePost(body: expenseModel);
    if (result.body == null) {
      return ResultModel.error<MovieShootDayExpenseModelReturnModel>(
          'Unable to Create Movie shoot day Expense');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayExpenseModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayExpenseModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayExpenseModelReturnModel>>?
      updateMovieShootDayExpense(
          {required MovieShootDayExpenseUpdateModel? expenseModel}) async {
    var result =
        await api.apiV1MovieUpdatemovieshootdayexpensePost(body: expenseModel);
    if (result.body == null) {
      return ResultModel.error<MovieShootDayExpenseModelReturnModel>(
          'Unable to Update Movie shoot day Expense');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayExpenseModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayExpenseModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<FileAttachmentModelReturnModel>>?
      createMovieFileAttachment({
    http.MultipartFile? UploadedFile,
    int? fileAttachmentFolderId,
    String? fileAttachmentFileName,
    String? fileAttachmentFileLocation,
    String? fileAttachmentPreviewFileLocation,
    bool? fileAttachmentHasPreview,
    int? fileAttachmentFileSizeInBytes,
    String? description,
    int? movieId,
    int? userId,
    int? artistId,
    int? vendorId,
    int? equipmentId,
    int? technicianId,
    int? movieArtistId,
    int? contractId,
    int? movieEquipmentId,
    int? movieLocationId,
    int? movieSceneId,
    int? movieSceneArtistId,
    int? movieSceneEquipmentId,
    int? movieSceneTechnicianId,
    int? movieShootDayId,
    int? movieShootDayArtistId,
    int? movieShootDayBudgetId,
    int? movieShootDayEquipmentId,
    int? movieShootDayExpenseId,
    int? movieShootDayRequirementId,
    int? movieShootDayVendorId,
    int? movieShootDaySceneId,
    int? movieShootDayTechnicianId,
    int? movieTechnicianId,
    int? movieUnitId,
    int? movieUserId,
    int? movieVendorId,
    int? companyId,
  }) async {
    var result = await api.apiV1MovieCreatefileattachmentPost(
      UploadedFile: UploadedFile,
      fileAttachmentFolderId: fileAttachmentFolderId,
      fileAttachmentFileName: fileAttachmentFileName,
      fileAttachmentFileLocation: fileAttachmentFileLocation,
      fileAttachmentPreviewFileLocation: fileAttachmentPreviewFileLocation,
      fileAttachmentHasPreview: fileAttachmentHasPreview,
      fileAttachmentFileSizeInBytes: fileAttachmentFileSizeInBytes,
      description: description,
      movieId: movieId,
      userId: userId,
      artistId: artistId,
      vendorId: vendorId,
      equipmentId: equipmentId,
      technicianId: technicianId,
      movieArtistId: movieArtistId,
      contractId: contractId,
      movieEquipmentId: movieEquipmentId,
      movieLocationId: movieLocationId,
      movieSceneId: movieSceneId,
      movieSceneArtistId: movieSceneArtistId,
      movieSceneEquipmentId: movieSceneEquipmentId,
      movieSceneTechnicianId: movieSceneTechnicianId,
      movieShootDayId: movieShootDayId,
      movieShootDayArtistId: movieShootDayArtistId,
      movieShootDayBudgetId: movieShootDayBudgetId,
      movieShootDayEquipmentId: movieShootDayEquipmentId,
      movieShootDayExpenseId: movieShootDayExpenseId,
      movieShootDayRequirementId: movieShootDayRequirementId,
      movieShootDayVendorId: movieShootDayVendorId,
      movieShootDaySceneId: movieShootDaySceneId,
      movieShootDayTechnicianId: movieShootDayTechnicianId,
      movieTechnicianId: movieTechnicianId,
      movieUnitId: movieUnitId,
      movieUserId: movieUserId,
      movieVendorId: movieVendorId,
      companyId: companyId,
    );
    if (result.body == null) {
      return ResultModel.error<FileAttachmentModelReturnModel>(
          'Unable to Create File Attachments');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<FileAttachmentModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<FileAttachmentModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<FileAttachmentModelReturnListModel>>?
      createMovieMultipleFileAttachment(
          {List<FileAttachmentCreateWithFileFormModel>?
              fileAttachmentCreateWithFileFormModels}) async {
    var result = await api.apiV1MovieCreatemultiplefileattachmentPost(
        fileAttachmentCreateWithFileFormModels:
            fileAttachmentCreateWithFileFormModels);
    if (result.body == null) {
      return ResultModel.error<FileAttachmentModelReturnListModel>(
          'Unable to Create File Attachments');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<FileAttachmentModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<FileAttachmentModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieSceneModelReturnListModel>>? getMovieScenes({
    List<int>? movieSceneIds,
    int? movieId,
    int? excludeMovieScenesWithMovieShootDayId,
    List<int>? excludeMovieSceneIds,
    int? companyId,
    bool? showDeleted,
    int? defaultMovieUnitId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmoviescenesGet(
      movieSceneIds: movieSceneIds,
      movieId: movieId,
      excludeMovieScenesWithMovieShootDayId:
          excludeMovieScenesWithMovieShootDayId,
      excludeMovieSceneIds: excludeMovieSceneIds,
      companyId: companyId,
      showDeleted: showDeleted,
      defaultMovieUnitId: defaultMovieUnitId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieSceneModelReturnListModel>(
          'Unable to get movie scenes');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieSceneModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieSceneModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieUnitModelReturnListModel>>? getMovieUnits({
    List<int>? movieUnitIds,
    int? companyId,
    bool? showDeleted,
    int? movieId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovieunitsGet(
      movieUnitIds: movieUnitIds,
      movieId: movieId,
      companyId: companyId,
      showDeleted: showDeleted,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieUnitModelReturnListModel>(
          'Unable to get movie units');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieUnitModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieUnitModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieLocationModelReturnListModel>>? getMovieLocations({
    List<int>? movieLocationIds,
    int? movieId,
    int? companyId,
    bool? showDeleted,
    List<int>? predefinedLocationTypeIds,
    List<int>? predefinedLocationSubTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovielocationsGet(
      movieId: movieId,
      companyId: companyId,
      showDeleted: showDeleted,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieLocationModelReturnListModel>(
          'Unable to get movie locations');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieLocationModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieLocationModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieSceneModelReturnModel>>? createMovieScene({
    required MovieSceneCreateModel movieSceneCreateModel,
  }) async {
    var result =
        await api.apiV1MovieCreatemoviescenePost(body: movieSceneCreateModel);
    if (result.body == null) {
      return ResultModel.error<MovieSceneModelReturnModel>(
          'Unable to create movie scene');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieSceneModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieSceneModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieSceneModelReturnModel>>? updateMovieScene({
    required MovieSceneUpdateModel movieSceneUpdateModel,
  }) async {
    var result =
        await api.apiV1MovieUpdatemoviescenePost(body: movieSceneUpdateModel);
    if (result.body == null) {
      return ResultModel.error<MovieSceneModelReturnModel>(
          'Unable to update movie scene');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieSceneModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieSceneModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? isContractSignedPreviewPdfFileValid({
    required int? contractId,
  }) async {
    var result = await api.apiV1MovieIscontractsignedpreviewpdffilevalidGet(
        contractId: contractId);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to download contract preview file');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<dynamic>>? downloadContractSignedPreviewPdfFile({
    int? contractId,
  }) async {
    var result = await api.apiV1MovieDownloadcontractsignedpreviewpdffileGet(
        contractId: contractId);
    if (result.body == null) {
      return ResultModel.error<dynamic>(
          'Unable to download movie contract file');
    } else {
      return ResultModel.ok<dynamic>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? isContractPreviewPdfFileValid({
    required int? contractId,
  }) async {
    var result = await api.apiV1MovieIscontractpreviewpdffilevalidGet(
        contractId: contractId);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to download contract preview file');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<dynamic>>? downloadContractPreviewPdfFile({
    int? contractId,
  }) async {
    var result = await api.apiV1MovieDownloadcontractpreviewpdffileGet(
        contractId: contractId);
    if (result.body == null) {
      return ResultModel.error<dynamic>(
          'Unable to download movie contract file');
    } else {
      return ResultModel.ok<dynamic>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markUserAsDeleted({
    required int? id,
  }) async {
    var result = await api.apiV1CompanyMarkuserasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete Company user');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markMovieLocationAsDeleted({
    required int? id,
  }) async {
    var result = await api.apiV1MovieMarkmovielocationasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie location');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markMovieSceneAsDeleted({
    required int? id,
  }) async {
    var result = await api.apiV1MovieMarkmoviesceneasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie scene');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieArtistModelReturnListModel>>? getMovieArtists({
    List<int>? postProductionStatusTypeIds,
    List<int>? preProductionStatusTypeIds,
    List<int>? productionStatusTypeIds,
    List<int>? departmentIds,
    List<int>? movieArtistIds,
    List<int>? defaultPreProductionMovieBudgetCategoryIds,
    List<int>? defaultProductionMovieBudgetCategoryIds,
    List<int>? defaultPostProductionMovieBudgetCategoryIds,
    List<int>? predefinedContractAssignmentStatusTypeIds,
    List<int>? contractIds,
    int? movieId,
    int? companyId,
    bool? showDeleted,
    bool? isPrimaryCast,
    List<int>? movieShootDayBudgetIds,
    int? artistId,
    List<int>? artistTypeIds,
    int? parentMovieArtistId,
    int? movieShootDayId,
    bool? excludeAlreadyAddedMovieArtists,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovieartistsGet(
      postProductionStatusTypeIds: postProductionStatusTypeIds,
      preProductionStatusTypeIds: preProductionStatusTypeIds,
      productionStatusTypeIds: productionStatusTypeIds,
      departmentIds: departmentIds,
      movieArtistIds: movieArtistIds,
      defaultPreProductionMovieBudgetCategoryIds:
          defaultPreProductionMovieBudgetCategoryIds,
      defaultProductionMovieBudgetCategoryIds:
          defaultProductionMovieBudgetCategoryIds,
      defaultPostProductionMovieBudgetCategoryIds:
          defaultPostProductionMovieBudgetCategoryIds,
      predefinedContractAssignmentStatusTypeIds:
          predefinedContractAssignmentStatusTypeIds,
      contractIds: contractIds,
      movieId: movieId,
      companyId: companyId,
      showDeleted: showDeleted,
      isPrimaryCast: isPrimaryCast,
      movieShootDayBudgetIds: movieShootDayBudgetIds,
      artistId: artistId,
      artistTypeIds: artistTypeIds,
      parentMovieArtistId: parentMovieArtistId,
      movieShootDayId: movieShootDayId,
      excludeAlreadyAddedMovieArtists: excludeAlreadyAddedMovieArtists,
      createdByUserId: createdByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      modifiedByUserId: modifiedByUserId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieArtistModelReturnListModel>(
          'Unable to get movie Artists');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieArtistModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieArtistModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieTechnicianModelReturnListModel>>?
      getMovieTechnicians({
    List<int>? postProductionStatusTypeIds,
    List<int>? preProductionStatusTypeIds,
    List<int>? productionStatusTypeIds,
    List<int>? departmentIds,
    List<int>? movieTechnicianIds,
    List<int>? defaultPreProductionMovieBudgetCategoryIds,
    List<int>? defaultProductionMovieBudgetCategoryIds,
    List<int>? defaultPostProductionMovieBudgetCategoryIds,
    List<int>? predefinedContractAssignmentStatusTypeIds,
    List<int>? contractIds,
    int? movieId,
    int? companyId,
    bool? showDeleted,
    bool? isPrimaryCast,
    List<int>? movieShootDayBudgetIds,
    int? technicianId,
    List<int>? technicianTypeIds,
    int? parentMovieTechnicianId,
    int? movieShootDayId,
    bool? excludeAlreadyAddedMovieTechnicians,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovietechniciansGet(
      postProductionStatusTypeIds: postProductionStatusTypeIds,
      preProductionStatusTypeIds: preProductionStatusTypeIds,
      productionStatusTypeIds: productionStatusTypeIds,
      departmentIds: departmentIds,
      movieTechnicianIds: movieTechnicianIds,
      defaultPreProductionMovieBudgetCategoryIds:
          defaultPreProductionMovieBudgetCategoryIds,
      defaultProductionMovieBudgetCategoryIds:
          defaultProductionMovieBudgetCategoryIds,
      defaultPostProductionMovieBudgetCategoryIds:
          defaultPostProductionMovieBudgetCategoryIds,
      predefinedContractAssignmentStatusTypeIds:
          predefinedContractAssignmentStatusTypeIds,
      contractIds: contractIds,
      movieId: movieId,
      companyId: companyId,
      showDeleted: showDeleted,
      movieShootDayBudgetIds: movieShootDayBudgetIds,
      technicianId: technicianId,
      technicianTypeIds: technicianTypeIds,
      parentMovieTechnicianId: parentMovieTechnicianId,
      movieShootDayId: movieShootDayId,
      excludeAlreadyAddedMovieTechnicians: excludeAlreadyAddedMovieTechnicians,
      createdByUserId: createdByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      modifiedByUserId: modifiedByUserId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieTechnicianModelReturnListModel>(
          'Unable to get movie Technicians');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieTechnicianModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieTechnicianModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieEquipmentModelReturnListModel>>? getMovieEquipments({
    List<int>? postProductionStatusTypeIds,
    List<int>? preProductionStatusTypeIds,
    List<int>? productionStatusTypeIds,
    List<int>? departmentIds,
    List<int>? movieEquipmentIds,
    List<int>? defaultPreProductionMovieBudgetCategoryIds,
    List<int>? defaultProductionMovieBudgetCategoryIds,
    List<int>? defaultPostProductionMovieBudgetCategoryIds,
    List<int>? predefinedContractAssignmentStatusTypeIds,
    List<int>? contractIds,
    int? movieId,
    int? companyId,
    bool? showDeleted,
    bool? isPrimaryCast,
    List<int>? movieShootDayBudgetIds,
    int? equipmentId,
    List<int>? equipmentTypeIds,
    int? parentMovieEquipmentId,
    int? movieShootDayId,
    bool? excludeAlreadyAddedMovieEquipments,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovieequipmentsGet(
      postProductionStatusTypeIds: postProductionStatusTypeIds,
      preProductionStatusTypeIds: preProductionStatusTypeIds,
      productionStatusTypeIds: productionStatusTypeIds,
      departmentIds: departmentIds,
      movieEquipmentIds: movieEquipmentIds,
      defaultPreProductionMovieBudgetCategoryIds:
          defaultPreProductionMovieBudgetCategoryIds,
      defaultProductionMovieBudgetCategoryIds:
          defaultProductionMovieBudgetCategoryIds,
      defaultPostProductionMovieBudgetCategoryIds:
          defaultPostProductionMovieBudgetCategoryIds,
      predefinedContractAssignmentStatusTypeIds:
          predefinedContractAssignmentStatusTypeIds,
      contractIds: contractIds,
      movieId: movieId,
      companyId: companyId,
      showDeleted: showDeleted,
      movieShootDayBudgetIds: movieShootDayBudgetIds,
      equipmentId: equipmentId,
      equipmentTypeIds: equipmentTypeIds,
      parentMovieEquipmentId: parentMovieEquipmentId,
      movieShootDayId: movieShootDayId,
      excludeAlreadyAddedMovieEquipments: excludeAlreadyAddedMovieEquipments,
      createdByUserId: createdByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      modifiedByUserId: modifiedByUserId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieEquipmentModelReturnListModel>(
          'Unable to get movie Equipments');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieEquipmentModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieEquipmentModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieVendorModelReturnListModel>>? getMovieVendors({
    List<int>? postProductionStatusTypeIds,
    List<int>? preProductionStatusTypeIds,
    List<int>? productionStatusTypeIds,
    List<int>? departmentIds,
    List<int>? movieVendorIds,
    List<int>? defaultPreProductionMovieBudgetCategoryIds,
    List<int>? defaultProductionMovieBudgetCategoryIds,
    List<int>? defaultPostProductionMovieBudgetCategoryIds,
    List<int>? predefinedContractAssignmentStatusTypeIds,
    List<int>? contractIds,
    int? movieId,
    int? companyId,
    bool? showDeleted,
    List<int>? movieShootDayBudgetIds,
    int? vendorId,
    List<int>? vendorTypeIds,
    int? parentMovieVendorId,
    int? movieShootDayId,
    bool? excludeAlreadyAddedMovieVendors,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovievendorsGet(
      postProductionStatusTypeIds: postProductionStatusTypeIds,
      preProductionStatusTypeIds: preProductionStatusTypeIds,
      productionStatusTypeIds: productionStatusTypeIds,
      departmentIds: departmentIds,
      movieVendorIds: movieVendorIds,
      defaultPreProductionMovieBudgetCategoryIds:
          defaultPreProductionMovieBudgetCategoryIds,
      defaultProductionMovieBudgetCategoryIds:
          defaultProductionMovieBudgetCategoryIds,
      defaultPostProductionMovieBudgetCategoryIds:
          defaultPostProductionMovieBudgetCategoryIds,
      predefinedContractAssignmentStatusTypeIds:
          predefinedContractAssignmentStatusTypeIds,
      contractIds: contractIds,
      movieId: movieId,
      companyId: companyId,
      showDeleted: showDeleted,
      movieShootDayBudgetIds: movieShootDayBudgetIds,
      vendorId: vendorId,
      vendorTypeIds: vendorTypeIds,
      parentMovieVendorId: parentMovieVendorId,
      movieShootDayId: movieShootDayId,
      excludeAlreadyAddedMovieVendors: excludeAlreadyAddedMovieVendors,
      createdByUserId: createdByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      modifiedByUserId: modifiedByUserId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieVendorModelReturnListModel>(
          'Unable to get movie Vendors');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieVendorModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieVendorModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MoviePropertyModelReturnListModel>>? getMovieProperties({
    List<int>? postProductionStatusTypeIds,
    List<int>? preProductionStatusTypeIds,
    List<int>? productionStatusTypeIds,
    List<int>? departmentIds,
    List<int>? moviePropertyIds,
    List<int>? defaultPreProductionMovieBudgetCategoryIds,
    List<int>? defaultProductionMovieBudgetCategoryIds,
    List<int>? defaultPostProductionMovieBudgetCategoryIds,
    List<int>? predefinedContractAssignmentStatusTypeIds,
    List<int>? contractIds,
    int? movieId,
    int? companyId,
    bool? showDeleted,
    List<int>? movieShootDayBudgetIds,
    int? propertyId,
    List<int>? propertyTypeIds,
    int? parentMoviePropertyId,
    int? movieShootDayId,
    bool? excludeAlreadyAddedMovieProperties,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmoviepropertiesGet(
      postProductionStatusTypeIds: postProductionStatusTypeIds,
      preProductionStatusTypeIds: preProductionStatusTypeIds,
      productionStatusTypeIds: productionStatusTypeIds,
      departmentIds: departmentIds,
      moviePropertyIds: moviePropertyIds,
      defaultPreProductionMovieBudgetCategoryIds:
          defaultPreProductionMovieBudgetCategoryIds,
      defaultProductionMovieBudgetCategoryIds:
          defaultProductionMovieBudgetCategoryIds,
      defaultPostProductionMovieBudgetCategoryIds:
          defaultPostProductionMovieBudgetCategoryIds,
      predefinedContractAssignmentStatusTypeIds:
          predefinedContractAssignmentStatusTypeIds,
      contractIds: contractIds,
      movieId: movieId,
      companyId: companyId,
      showDeleted: showDeleted,
      movieShootDayBudgetIds: movieShootDayBudgetIds,
      propertyId: propertyId,
      propertyTypeIds: propertyTypeIds,
      parentMoviePropertyId: parentMoviePropertyId,
      movieShootDayId: movieShootDayId,
      excludeAlreadyAddedMovieProperties: excludeAlreadyAddedMovieProperties,
      createdByUserId: createdByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
      modifiedByUserId: modifiedByUserId,
    );
    if (result.body == null) {
      return ResultModel.error<MoviePropertyModelReturnListModel>(
          'Unable to get movie Properties');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MoviePropertyModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MoviePropertyModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<ArtistModelReturnListModel>>? getArtists({
    List<int>? departmentIds,
    List<int>? artistIds,
    int? companyId,
    bool? showDeleted,
    bool? isPrimaryCast,
    bool? showDisabled,
    List<int>? defaultPreProductionBudgetCategoryIds,
    List<int>? defaultProductionBudgetCategoryIds,
    List<int>? defaultPostProductionBudgetCategoryIds,
    List<int>? artistTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetartistsGet(
      departmentIds: departmentIds,
      artistIds: artistIds,
      companyId: companyId,
      showDeleted: showDeleted,
      isPrimaryCast: isPrimaryCast,
      showDisabled: showDisabled,
      defaultPreProductionBudgetCategoryIds:
          defaultPreProductionBudgetCategoryIds,
      defaultProductionBudgetCategoryIds: defaultProductionBudgetCategoryIds,
      defaultPostProductionBudgetCategoryIds:
          defaultPostProductionBudgetCategoryIds,
      artistTypeIds: artistTypeIds,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<ArtistModelReturnListModel>(
          'Unable to get Artists');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ArtistModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ArtistModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<TechnicianModelReturnListModel>>? getTechnicians({
    List<int>? departmentIds,
    List<int>? technicianIds,
    int? companyId,
    bool? showDeleted,
    bool? showDisabled,
    List<int>? defaultPreProductionBudgetCategoryIds,
    List<int>? defaultProductionBudgetCategoryIds,
    List<int>? defaultPostProductionBudgetCategoryIds,
    List<int>? technicianTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGettechniciansGet(
      departmentIds: departmentIds,
      technicianIds: technicianIds,
      companyId: companyId,
      showDeleted: showDeleted,
      showDisabled: showDisabled,
      defaultPreProductionBudgetCategoryIds:
          defaultPreProductionBudgetCategoryIds,
      defaultProductionBudgetCategoryIds: defaultProductionBudgetCategoryIds,
      defaultPostProductionBudgetCategoryIds:
          defaultPostProductionBudgetCategoryIds,
      technicianTypeIds: technicianTypeIds,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<TechnicianModelReturnListModel>(
          'Unable to get Technicians');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<TechnicianModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<TechnicianModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<EquipmentModelReturnListModel>>? getEquipments({
    List<int>? departmentIds,
    List<int>? equipmentIds,
    int? companyId,
    bool? showDeleted,
    bool? showDisabled,
    List<int>? defaultPreProductionBudgetCategoryIds,
    List<int>? defaultProductionBudgetCategoryIds,
    List<int>? defaultPostProductionBudgetCategoryIds,
    List<int>? equipmentTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetequipmentsGet(
      departmentIds: departmentIds,
      equipmentIds: equipmentIds,
      companyId: companyId,
      showDeleted: showDeleted,
      showDisabled: showDisabled,
      defaultPreProductionBudgetCategoryIds:
          defaultPreProductionBudgetCategoryIds,
      defaultProductionBudgetCategoryIds: defaultProductionBudgetCategoryIds,
      defaultPostProductionBudgetCategoryIds:
          defaultPostProductionBudgetCategoryIds,
      equipmentTypeIds: equipmentTypeIds,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<EquipmentModelReturnListModel>(
          'Unable to get Equipments');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<EquipmentModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<EquipmentModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<VendorModelReturnListModel>>? getVendors({
    List<int>? departmentIds,
    List<int>? vendorIds,
    int? companyId,
    bool? showDeleted,
    bool? showDisabled,
    List<int>? defaultPreProductionBudgetCategoryIds,
    List<int>? defaultProductionBudgetCategoryIds,
    List<int>? defaultPostProductionBudgetCategoryIds,
    List<int>? vendorTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetvendorsGet(
      departmentIds: departmentIds,
      vendorIds: vendorIds,
      companyId: companyId,
      showDeleted: showDeleted,
      showDisabled: showDisabled,
      defaultPreProductionBudgetCategoryIds:
          defaultPreProductionBudgetCategoryIds,
      defaultProductionBudgetCategoryIds: defaultProductionBudgetCategoryIds,
      defaultPostProductionBudgetCategoryIds:
          defaultPostProductionBudgetCategoryIds,
      vendorTypeIds: vendorTypeIds,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<VendorModelReturnListModel>(
          'Unable to get Vendors');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<VendorModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<VendorModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<PropertyModelReturnListModel>>? getProperties({
    List<int>? departmentIds,
    List<int>? propertyIds,
    int? companyId,
    bool? showDeleted,
    bool? showDisabled,
    List<int>? defaultPreProductionBudgetCategoryIds,
    List<int>? defaultProductionBudgetCategoryIds,
    List<int>? defaultPostProductionBudgetCategoryIds,
    List<int>? propertyTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetpropertiesGet(
      departmentIds: departmentIds,
      propertyIds: propertyIds,
      companyId: companyId,
      showDeleted: showDeleted,
      showDisabled: showDisabled,
      defaultPreProductionBudgetCategoryIds:
          defaultPreProductionBudgetCategoryIds,
      defaultProductionBudgetCategoryIds: defaultProductionBudgetCategoryIds,
      defaultPostProductionBudgetCategoryIds:
          defaultPostProductionBudgetCategoryIds,
      propertyTypeIds: propertyTypeIds,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<PropertyModelReturnListModel>(
          'Unable to get Properties');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<PropertyModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<PropertyModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<ArtistTypeModelReturnListModel>>? getArtistTypes({
    int? companyId,
    bool? showDeleted,
    List<int>? defaultPreProductionBudgetCategoryIds,
    List<int>? defaultProductionBudgetCategoryIds,
    List<int>? defaultPostProductionBudgetCategoryIds,
    List<int>? predefinedArtistTypeIds,
    List<int>? artistGroupTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetartisttypesGet(
      companyId: companyId,
      showDeleted: showDeleted,
      defaultPreProductionBudgetCategoryIds:
          defaultPreProductionBudgetCategoryIds,
      defaultProductionBudgetCategoryIds: defaultProductionBudgetCategoryIds,
      defaultPostProductionBudgetCategoryIds:
          defaultPostProductionBudgetCategoryIds,
      predefinedArtistTypeIds: predefinedArtistTypeIds,
      artistGroupTypeIds: artistGroupTypeIds,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<ArtistTypeModelReturnListModel>(
          'Unable to get Artist Types');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ArtistTypeModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ArtistTypeModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<TechnicianTypeModelReturnListModel>>? getTechnicianTypes({
    int? companyId,
    bool? showDeleted,
    List<int>? defaultPreProductionBudgetCategoryIds,
    List<int>? defaultProductionBudgetCategoryIds,
    List<int>? defaultPostProductionBudgetCategoryIds,
    List<int>? predefinedTechnicianTypeIds,
    List<int>? technicianGroupTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGettechniciantypesGet(
      companyId: companyId,
      showDeleted: showDeleted,
      defaultPreProductionBudgetCategoryIds:
          defaultPreProductionBudgetCategoryIds,
      defaultProductionBudgetCategoryIds: defaultProductionBudgetCategoryIds,
      defaultPostProductionBudgetCategoryIds:
          defaultPostProductionBudgetCategoryIds,
      predefinedTechnicianTypeIds: predefinedTechnicianTypeIds,
      technicianGroupTypeIds: technicianGroupTypeIds,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<TechnicianTypeModelReturnListModel>(
          'Unable to get Technician Types');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<TechnicianTypeModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<TechnicianTypeModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<EquipmentTypeModelReturnListModel>>? getEquipmentTypes({
    int? companyId,
    bool? showDeleted,
    List<int>? defaultPreProductionBudgetCategoryIds,
    List<int>? defaultProductionBudgetCategoryIds,
    List<int>? defaultPostProductionBudgetCategoryIds,
    List<int>? predefinedEquipmentTypeIds,
    List<int>? equipmentGroupTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetequipmenttypesGet(
      companyId: companyId,
      showDeleted: showDeleted,
      defaultPreProductionBudgetCategoryIds:
          defaultPreProductionBudgetCategoryIds,
      defaultProductionBudgetCategoryIds: defaultProductionBudgetCategoryIds,
      defaultPostProductionBudgetCategoryIds:
          defaultPostProductionBudgetCategoryIds,
      predefinedEquipmentTypeIds: predefinedEquipmentTypeIds,
      equipmentGroupTypeIds: equipmentGroupTypeIds,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<EquipmentTypeModelReturnListModel>(
          'Unable to get Equipment Types');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<EquipmentTypeModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<EquipmentTypeModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<VendorTypeModelReturnListModel>>? getVendorTypes({
    int? companyId,
    bool? showDeleted,
    List<int>? defaultPreProductionBudgetCategoryIds,
    List<int>? defaultProductionBudgetCategoryIds,
    List<int>? defaultPostProductionBudgetCategoryIds,
    List<int>? predefinedVendorTypeIds,
    List<int>? vendorGroupTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetvendortypesGet(
      companyId: companyId,
      showDeleted: showDeleted,
      defaultPreProductionBudgetCategoryIds:
          defaultPreProductionBudgetCategoryIds,
      defaultProductionBudgetCategoryIds: defaultProductionBudgetCategoryIds,
      defaultPostProductionBudgetCategoryIds:
          defaultPostProductionBudgetCategoryIds,
      predefinedVendorTypeIds: predefinedVendorTypeIds,
      vendorGroupTypeIds: vendorGroupTypeIds,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<VendorTypeModelReturnListModel>(
          'Unable to get Vendor Types');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<VendorTypeModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<VendorTypeModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<PropertyTypeModelReturnListModel>>? getPropertyTypes({
    int? companyId,
    bool? showDeleted,
    List<int>? defaultPreProductionBudgetCategoryIds,
    List<int>? defaultProductionBudgetCategoryIds,
    List<int>? defaultPostProductionBudgetCategoryIds,
    List<int>? predefinedPropertyTypeIds,
    List<int>? propertyGroupTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetpropertytypesGet(
      companyId: companyId,
      showDeleted: showDeleted,
      defaultPreProductionBudgetCategoryIds:
          defaultPreProductionBudgetCategoryIds,
      defaultProductionBudgetCategoryIds: defaultProductionBudgetCategoryIds,
      defaultPostProductionBudgetCategoryIds:
          defaultPostProductionBudgetCategoryIds,
      predefinedPropertyTypeIds: predefinedPropertyTypeIds,
      propertyGroupTypeIds: propertyGroupTypeIds,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<PropertyTypeModelReturnListModel>(
          'Unable to get Property Types');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<PropertyTypeModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<PropertyTypeModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markMovieArtistAsDeleted({
    required int? id,
  }) async {
    var result = await api.apiV1MovieMarkmovieartistasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie artist');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markMovieTechnicianAsDeleted({
    required int? id,
  }) async {
    var result = await api.apiV1MovieMarkmovietechnicianasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie technician');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markMovieEquipmentAsDeleted({
    required int? id,
  }) async {
    var result = await api.apiV1MovieMarkmovieequipmentasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie equipment');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markMovieVendorAsDeleted({
    required int? id,
  }) async {
    var result = await api.apiV1MovieMarkmovievendorasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie vendor');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markMoviePropertyAsDeleted({
    required int? id,
  }) async {
    var result = await api.apiV1MovieMarkmoviepropertyasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie property');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<ContractModelReturnListModel>>? getContracts({
    int? movieLocationId,
    List<int>? contractIds,
    List<int>? predefinedContractForTypeIds,
    List<int>? predefinedContractStatusTypeIds,
    bool? showNonContracts,
    int? movieId,
    int? companyId,
    bool? showDeleted,
    int? contractTemplateId,
    int? artistId,
    int? technicianId,
    int? equipmentId,
    int? vendorId,
    int? propertyId,
    int? movieArtistId,
    int? movieTechnicianId,
    int? movieEquipmentId,
    int? movieVendorId,
    int? moviePropertyId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetcontractsGet(
      movieLocationId: movieLocationId,
      contractIds: contractIds,
      predefinedContractForTypeIds: predefinedContractForTypeIds,
      predefinedContractStatusTypeIds: predefinedContractStatusTypeIds,
      showNonContracts: showNonContracts,
      movieId: movieId,
      companyId: companyId,
      showDeleted: showDeleted,
      contractTemplateId: contractTemplateId,
      artistId: artistId,
      technicianId: technicianId,
      equipmentId: equipmentId,
      vendorId: vendorId,
      propertyId: propertyId,
      movieArtistId: movieArtistId,
      movieTechnicianId: movieTechnicianId,
      movieEquipmentId: movieEquipmentId,
      movieVendorId: movieVendorId,
      moviePropertyId: moviePropertyId,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<ContractModelReturnListModel>(
          'Unable to get Contracts');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ContractModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ContractModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<DepartmentModelReturnListModel>>? getDepartments({
    int? companyId,
    bool? showDeleted,
    List<int>? predefinedDepartmentTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetdepartmentsGet(
      companyId: companyId,
      showDeleted: showDeleted,
      predefinedDepartmentTypeIds: predefinedDepartmentTypeIds,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<DepartmentModelReturnListModel>(
          'Unable to get Departments');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<DepartmentModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<DepartmentModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieArtistModelReturnModel>>? createMovieArtist(
      {required MovieArtistCreateModel? movieArtistCreateModel}) async {
    var result =
        await api.apiV1MovieCreatemovieartistPost(body: movieArtistCreateModel);
    if (result.body == null) {
      return ResultModel.error<MovieArtistModelReturnModel>(
          'Unable to Create Movie Artist');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieArtistModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieArtistModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieTechnicianModelReturnModel>>? createMovieTechnician(
      {required MovieTechnicianCreateModel? movieTechnicianCreateModel}) async {
    var result = await api.apiV1MovieCreatemovietechnicianPost(
        body: movieTechnicianCreateModel);
    if (result.body == null) {
      return ResultModel.error<MovieTechnicianModelReturnModel>(
          'Unable to Create Movie Technician');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieTechnicianModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieTechnicianModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieEquipmentModelReturnModel>>? createMovieEquipment(
      {required MovieEquipmentCreateModel? movieEquipmentCreateModel}) async {
    var result = await api.apiV1MovieCreatemovieequipmentPost(
        body: movieEquipmentCreateModel);
    if (result.body == null) {
      return ResultModel.error<MovieEquipmentModelReturnModel>(
          'Unable to Create Movie Equipment');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieEquipmentModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieEquipmentModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieVendorModelReturnModel>>? createMovieVendor(
      {required MovieVendorCreateModel? movieVendorCreateModel}) async {
    var result =
        await api.apiV1MovieCreatemovievendorPost(body: movieVendorCreateModel);
    if (result.body == null) {
      return ResultModel.error<MovieVendorModelReturnModel>(
          'Unable to Create Movie Vendor');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieVendorModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieVendorModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MoviePropertyModelReturnModel>>? createMovieProperty(
      {required MoviePropertyCreateModel? moviePropertyCreateModel}) async {
    var result = await api.apiV1MovieCreatemoviepropertyPost(
        body: moviePropertyCreateModel);
    if (result.body == null) {
      return ResultModel.error<MoviePropertyModelReturnModel>(
          'Unable to Create Movie Property');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MoviePropertyModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MoviePropertyModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieArtistModelReturnModel>>? updateMovieArtist(
      {required MovieArtistUpdateModel? movieArtistUpdateModel}) async {
    var result =
        await api.apiV1MovieUpdatemovieartistPost(body: movieArtistUpdateModel);
    if (result.body == null) {
      return ResultModel.error<MovieArtistModelReturnModel>(
          'Unable to Update Movie Artist');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieArtistModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieArtistModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieTechnicianModelReturnModel>>? updateMovieTechnician(
      {required MovieTechnicianUpdateModel? movieTechnicianUpdateModel}) async {
    var result = await api.apiV1MovieUpdatemovietechnicianPost(
        body: movieTechnicianUpdateModel);
    if (result.body == null) {
      return ResultModel.error<MovieTechnicianModelReturnModel>(
          'Unable to Update Movie Technician');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieTechnicianModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieTechnicianModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieEquipmentModelReturnModel>>? updateMovieEquipment(
      {required MovieEquipmentUpdateModel? movieEquipmentUpdateModel}) async {
    var result = await api.apiV1MovieUpdatemovieequipmentPost(
        body: movieEquipmentUpdateModel);
    if (result.body == null) {
      return ResultModel.error<MovieEquipmentModelReturnModel>(
          'Unable to Update Movie Equipment');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieEquipmentModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieEquipmentModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieVendorModelReturnModel>>? updateMovieVendor(
      {required MovieVendorUpdateModel? movieVendorUpdateModel}) async {
    var result =
        await api.apiV1MovieUpdatemovievendorPost(body: movieVendorUpdateModel);
    if (result.body == null) {
      return ResultModel.error<MovieVendorModelReturnModel>(
          'Unable to Update Movie Vendor');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieVendorModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieVendorModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MoviePropertyModelReturnModel>>? updateMovieProperty(
      {required MoviePropertyUpdateModel? moviePropertyUpdateModel}) async {
    var result = await api.apiV1MovieUpdatemoviepropertyPost(
        body: moviePropertyUpdateModel);
    if (result.body == null) {
      return ResultModel.error<MoviePropertyModelReturnModel>(
          'Unable to Update Movie Property');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MoviePropertyModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MoviePropertyModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<PostProductionStatusTypeModelReturnListModel>>?
      getPostProductionStatusTypes({
    int? companyId,
    bool? showDeleted,
    List<int>? predefinedPostProductionStatusTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetpostproductionstatustypesGet(
      companyId: companyId,
      predefinedPostProductionStatusTypeIds:
          predefinedPostProductionStatusTypeIds,
      showDeleted: showDeleted,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<PostProductionStatusTypeModelReturnListModel>(
          'Unable to get post production status');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<PostProductionStatusTypeModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<PostProductionStatusTypeModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<PreProductionStatusTypeModelReturnListModel>>?
      getPreProductionStatusTypes({
    int? companyId,
    bool? showDeleted,
    List<int>? predefinedPreProductionStatusTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetpreproductionstatustypesGet(
      companyId: companyId,
      predefinedPreProductionStatusTypeIds:
          predefinedPreProductionStatusTypeIds,
      showDeleted: showDeleted,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<PreProductionStatusTypeModelReturnListModel>(
          'Unable to get pre production status');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<PreProductionStatusTypeModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<PreProductionStatusTypeModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<ContractTemplateModelReturnListModel>>?
      getContractTemplates({
    int? companyId,
    bool? showDeleted,
    List<int>? predefinedContractTemplateForTypeIds,
    List<int>? artistTypeIds,
    List<int>? technicianTypeIds,
    List<int>? equipmentTypeIds,
    List<int>? vendorTypeIds,
    List<int>? propertyTypeIds,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetcontracttemplatesGet(
        companyId: companyId,
        showDeleted: showDeleted,
        predefinedContractTemplateForTypeIds:
            predefinedContractTemplateForTypeIds,
        artistTypeIds: artistTypeIds,
        technicianTypeIds: technicianTypeIds,
        equipmentTypeIds: equipmentTypeIds,
        vendorTypeIds: vendorTypeIds,
        propertyTypeIds: propertyTypeIds,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<ContractTemplateModelReturnListModel>(
          'Unable to get contract templates');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ContractTemplateModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ContractTemplateModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<ContractTemplateModelReturnModel>>? getContractTemplate({
    int? contractTemplateId,
  }) async {
    var result =
        await api.apiV1CompanyGetcontracttemplateGet(id: contractTemplateId);
    if (result.body == null) {
      return ResultModel.error<ContractTemplateModelReturnModel>(
          'Unable to get contract template');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ContractTemplateModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ContractTemplateModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<ProductionStatusTypeModelReturnListModel>>?
      getProductionStatusTypes({
    int? companyId,
    bool? showDeleted,
    List<int>? predefinedProductionStatusTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetproductionstatustypesGet(
      companyId: companyId,
      predefinedProductionStatusTypeIds: predefinedProductionStatusTypeIds,
      showDeleted: showDeleted,
      createdByUserId: createdByUserId,
      modifiedByUserId: modifiedByUserId,
      selectedId: selectedId,
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      sortBy: sortBy,
      sortAscending: sortAscending,
      currentRows: currentRows,
      totalRowCount: totalRowCount,
      numericPageCount: numericPageCount,
    );
    if (result.body == null) {
      return ResultModel.error<ProductionStatusTypeModelReturnListModel>(
          'Unable to get  production status');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ProductionStatusTypeModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ProductionStatusTypeModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<ContractModelReturnModel>>? createContract({
    http.MultipartFile? UploadedFile,
    bool? isDocumentUploadIsSignedDocument,
    int? predefinedContractForTypeId,
    int? contractTemplateId,
    int? movieArtistId,
    int? movieTechnicianId,
    int? movieEquipmentId,
    int? movieVendorId,
    int? moviePropertyId,
    int? artistId,
    int? technicianId,
    int? equipmentId,
    int? vendorId,
    int? propertyId,
    int? movieLocationId,
    String? title,
    String? description,
    String? contractFileName,
    String? contractFileLocation,
    String? contractPreviewFileLocation,
    String? contractSignedFileLocation,
    String? contractSignedPreviewFileLocation,
    String? contractWithCompanyName,
    String? contractWithFirstName,
    String? contractWithLastName,
    String? contractWithEmail,
    String? contractWithPhone,
    String? contractWithAddress1,
    String? contractWithAddress2,
    String? contractWithCity,
    String? contractWithState,
    String? contractWithCountry,
    String? contractWithZipCode,
    int? predefinedContractStatusTypeId,
    int? movieId,
    int? companyId,
    bool? isPreviewFileAvailable,
    DateTime? contractDocumentModifiedDate,
    DateTime? contractDocumentIndexedDate,
  }) async {
    var result = await api.apiV1MovieCreatecontractPost(
        UploadedFile: UploadedFile,
        isDocumentUploadIsSignedDocument: isDocumentUploadIsSignedDocument,
        predefinedContractForTypeId: predefinedContractForTypeId,
        contractTemplateId: contractTemplateId,
        movieArtistId: movieArtistId,
        movieTechnicianId: movieTechnicianId,
        movieEquipmentId: movieEquipmentId,
        movieVendorId: movieVendorId,
        moviePropertyId: moviePropertyId,
        artistId: artistId,
        technicianId: technicianId,
        equipmentId: equipmentId,
        vendorId: vendorId,
        propertyId: propertyId,
        movieLocationId: movieLocationId,
        title: title,
        description: description,
        contractFileName: contractFileName,
        contractFileLocation: contractFileLocation,
        contractPreviewFileLocation: contractPreviewFileLocation,
        contractSignedFileLocation: contractSignedFileLocation,
        contractSignedPreviewFileLocation: contractSignedPreviewFileLocation,
        contractWithCompanyName: contractWithCompanyName,
        contractWithFirstName: contractWithFirstName,
        contractWithLastName: contractWithLastName,
        contractWithEmail: contractWithEmail,
        contractWithPhone: contractWithPhone,
        contractWithAddress1: contractWithAddress1,
        contractWithAddress2: contractWithAddress2,
        contractWithCity: contractWithCity,
        contractWithState: contractWithState,
        contractWithCountry: contractWithCountry,
        contractWithZipCode: contractWithZipCode,
        predefinedContractStatusTypeId: predefinedContractStatusTypeId,
        movieId: movieId,
        companyId: companyId,
        isPreviewFileAvailable: isPreviewFileAvailable,
        contractDocumentModifiedDate: contractDocumentModifiedDate,
        contractDocumentIndexedDate: contractDocumentIndexedDate);
    if (result.body == null) {
      return ResultModel.error<ContractModelReturnModel>(
          'Unable to Create Contract');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ContractModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ContractModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayModelReturnModel>>? createMovieShootDay(
      {MovieShootDayCreateModel? model}) async {
    var result = await api.apiV1MovieCreatemovieshootdayPost(body: model);
    if (result.body == null) {
      return ResultModel.error<MovieShootDayModelReturnModel>(
          'Unable to Create Movie Shoot Day');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? isMovieSettingAvailable(
      {int? movieId}) async {
    var result =
        await api.apiV1MovieIsmoviesettingavailableGet(movieId: movieId);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to get movie setting');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieSettingModelReturnModel>>? getMovieSettingByMovieId(
      {int? movieId}) async {
    var result =
        await api.apiV1MovieGetmoviesettingbymovieidGet(movieid: movieId);
    if (result.body == null) {
      return ResultModel.error<MovieSettingModelReturnModel>(
          'Unable to get movie setting');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieSettingModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieSettingModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieUserModelReturnModel>>? createMovieUser(
      {MovieUserCreateModel? model}) async {
    var result = await api.apiV1MovieCreatemovieuserPost(body: model);
    if (result.body == null) {
      return ResultModel.error<MovieUserModelReturnModel>(
          'Unable to Create Movie User');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieUserModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieUserModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieUserModelReturnModel>>? updateMovieUser(
      {MovieUserUpdateModel? model}) async {
    var result = await api.apiV1MovieUpdatemovieuserPost(body: model);
    if (result.body == null) {
      return ResultModel.error<MovieUserModelReturnModel>(
          'Unable to Update Movie User');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieUserModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieUserModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayModelReturnModel>>? updateMovieShootDay(
      {MovieShootDayUpdateModel? model}) async {
    var result = await api.apiV1MovieUpdatemovieshootdayPost(body: model);
    if (result.body == null) {
      return ResultModel.error<MovieShootDayModelReturnModel>(
          'Unable to Update Movie Shoot Day');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieShootDayModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<ContractModelReturnModel>>? updateContract({
    http.MultipartFile? UploadedFile,
    bool? isDocumentUploadIsSignedDocument,
    int? predefinedContractForTypeId,
    int? contractTemplateId,
    int? contractId,
    int? movieArtistId,
    int? movieTechnicianId,
    int? movieEquipmentId,
    int? movieVendorId,
    int? moviePropertyId,
    int? artistId,
    int? technicianId,
    int? equipmentId,
    int? vendorId,
    int? propertyId,
    int? movieLocationId,
    String? title,
    String? description,
    String? contractFileName,
    String? contractFileLocation,
    String? contractPreviewFileLocation,
    String? contractSignedFileLocation,
    String? contractSignedPreviewFileLocation,
    String? contractWithCompanyName,
    String? contractWithFirstName,
    String? contractWithLastName,
    String? contractWithEmail,
    String? contractWithPhone,
    String? contractWithAddress1,
    String? contractWithAddress2,
    String? contractWithCity,
    String? contractWithState,
    String? contractWithCountry,
    String? contractWithZipCode,
    int? predefinedContractStatusTypeId,
    int? movieId,
    int? companyId,
    bool? isPreviewFileAvailable,
    DateTime? contractDocumentModifiedDate,
    DateTime? contractDocumentIndexedDate,
  }) async {
    var result = await api.apiV1MovieUpdatecontractPost(
        UploadedFile: UploadedFile,
        predefinedContractForTypeId: predefinedContractForTypeId,
        contractTemplateId: contractTemplateId,
        movieArtistId: movieArtistId,
        movieTechnicianId: movieTechnicianId,
        movieEquipmentId: movieEquipmentId,
        movieVendorId: movieVendorId,
        moviePropertyId: moviePropertyId,
        artistId: artistId,
        technicianId: technicianId,
        equipmentId: equipmentId,
        vendorId: vendorId,
        propertyId: propertyId,
        movieLocationId: movieLocationId,
        title: title,
        description: description,
        contractFileName: contractFileName,
        contractFileLocation: contractFileLocation,
        contractPreviewFileLocation: contractPreviewFileLocation,
        contractSignedFileLocation: contractSignedFileLocation,
        contractSignedPreviewFileLocation: contractSignedPreviewFileLocation,
        contractWithCompanyName: contractWithCompanyName,
        contractWithFirstName: contractWithFirstName,
        contractWithLastName: contractWithLastName,
        contractWithEmail: contractWithEmail,
        contractWithPhone: contractWithPhone,
        contractWithAddress1: contractWithAddress1,
        contractWithAddress2: contractWithAddress2,
        contractWithCity: contractWithCity,
        contractWithState: contractWithState,
        contractWithCountry: contractWithCountry,
        contractWithZipCode: contractWithZipCode,
        predefinedContractStatusTypeId: predefinedContractStatusTypeId,
        movieId: movieId,
        companyId: companyId,
        isPreviewFileAvailable: isPreviewFileAvailable,
        contractId: contractId,
        contractDocumentModifiedDate: contractDocumentModifiedDate,
        contractDocumentIndexedDate: contractDocumentIndexedDate);
    if (result.body == null) {
      return ResultModel.error<ContractModelReturnModel>(
          'Unable to Update Contract');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ContractModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ContractModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markContractAsDeleted({
    required int? id,
  }) async {
    var result = await api.apiV1MovieMarkcontractasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>('Unable to delete contract');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markMovieShootDayBudgetAsDeleted({
    required int? id,
  }) async {
    var result =
        await api.apiV1MovieMarkmovieshootdaybudgetasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie shoot day budget');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markMovieShootDayExpenseAsDeleted({
    required int? id,
  }) async {
    var result =
        await api.apiV1MovieMarkmovieshootdayexpenseasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie shoot day expense');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markMovieShootDayAsDeleted({
    required int? id,
  }) async {
    var result = await api.apiV1MovieMarkmovieshootdayasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie shoot day');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<LedgerTypeModelReturnListModel>>? getLedgerTypes({
    int? companyId,
    int? movieId,
    bool? showDeleted,
    List<int>? predefinedLedgerGroupTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetledgertypesGet(
        companyId: companyId,
        showDeleted: showDeleted,
        predefinedLedgerGroupTypeIds: predefinedLedgerGroupTypeIds,
        createdByUserId: createdByUserId,
        modifiedByUserId: modifiedByUserId,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        movieId: movieId,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<LedgerTypeModelReturnListModel>(
          'Unable to get Ledger Types');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<LedgerTypeModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<LedgerTypeModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<ChatModelReturnListModel>>? getChats({
    int? companyId,
    List<int>? selectedChatIds,
    bool? memberOnly,
    bool? showDeleted,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1ChatGetchatsGet(
        companyId: companyId,
        showDeleted: showDeleted,
        createdByUserId: createdByUserId,
        modifiedByUserId: modifiedByUserId,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<ChatModelReturnListModel>('Unable to get Chats');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ChatModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ChatModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<UserModelReturnListModel>>? getUsers({
    List<int>? companyIds,
    bool? active,
    List<int>? predefinedUserTypeIds,
    bool? showDeleted,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1CompanyGetusersGet(
        companyIds: companyIds,
        active: active,
        predefinedUserTypeIds: predefinedUserTypeIds,
        showDeleted: showDeleted,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<UserModelReturnListModel>('Unable to get Users');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<UserModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<UserModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<FileAttachmentModelReturnListModel>>? getFileAttachments({
    int? companyId,
    bool? showDeleted,
    int? parentFileAttachmentId,
    int? movieId,
    int? userId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetfileattachmentsGet(
        companyId: companyId,
        showDeleted: showDeleted,
        movieId: movieId,
        userId: userId,
        createdByUserId: createdByUserId,
        modifiedByUserId: modifiedByUserId,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<FileAttachmentModelReturnListModel>(
          'Unable to get files');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<FileAttachmentModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<FileAttachmentModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<FileAttachmentFolderModelReturnListModel>>?
      getFileAttachmentFolders({
    int? companyId,
    bool? showDeleted,
    int? parentFileAttachmentFolderId,
    int? movieId,
    int? userId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetfileattachmentfoldersGet(
        companyId: companyId,
        showDeleted: showDeleted,
        parentFileAttachmentFolderId: parentFileAttachmentFolderId,
        movieId: movieId,
        userId: userId,
        createdByUserId: createdByUserId,
        modifiedByUserId: modifiedByUserId,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<FileAttachmentFolderModelReturnListModel>(
          'Unable to get Folders');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<FileAttachmentFolderModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<FileAttachmentFolderModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markChatAsDeleted({
    required int? id,
  }) async {
    var result = await api.apiV1MovieMarkmovieshootdayasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie shoot day');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markFileAttachmentFolderAsDeleted({
    required int? id,
  }) async {
    var result =
        await api.apiV1MovieMarkfileattachmentfolderasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete File Attachment Folder');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markMovieUnitAsDeleted({
    required int? id,
  }) async {
    var result = await api.apiV1MovieMarkmovieunitasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie unit');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markMovieCommitmentTaskAsDeleted({
    required int? id,
  }) async {
    var result =
        await api.apiV1MovieMarkmoviecommitmenttaskasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie task');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<BooleanReturnModel>>? markMovieUserAsDeleted({
    required int? id,
  }) async {
    var result = await api.apiV1MovieMarkmovieuserasdeletedDelete(id: id);
    if (result.body == null) {
      return ResultModel.error<BooleanReturnModel>(
          'Unable to delete movie user');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<BooleanReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<BooleanReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieUnitModelReturnModel>>? createMovieUnit(
      {MovieUnitCreateModel? movieUnitCreateModel}) async {
    var result =
        await api.apiV1MovieCreatemovieunitPost(body: movieUnitCreateModel);
    if (result.body == null) {
      return ResultModel.error<MovieUnitModelReturnModel>(
          'Unable to Create movie unit');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieUnitModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieUnitModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieUnitModelReturnModel>>? updateMovieUnit(
      {MovieUnitUpdateModel? movieUnitUpdateModel}) async {
    var result =
        await api.apiV1MovieUpdatemovieunitPost(body: movieUnitUpdateModel);
    if (result.body == null) {
      return ResultModel.error<MovieUnitModelReturnModel>(
          'Unable to Update movie unit');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieUnitModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieUnitModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<ChatModelReturnModel>>? createChat(
      {ChatCreateModel? chatCreateModel}) async {
    var result = await api.apiV1ChatCreatechatPost(body: chatCreateModel);
    if (result.body == null) {
      return ResultModel.error<ChatModelReturnModel>('Unable to Create Chat');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ChatModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ChatModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<ChatModelReturnModel>>? updateChat(
      {ChatUpdateModel? chatUpdateModel}) async {
    var result = await api.apiV1ChatUpdatechatPost(body: chatUpdateModel);
    if (result.body == null) {
      return ResultModel.error<ChatModelReturnModel>('Unable to Update Chat');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ChatModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ChatModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<FileAttachmentFolderModelReturnModel>>?
      updateFileAttachmentFolder(
          {FileAttachmentFolderUpdateModel?
              fileAttachmentFolderUpdateModel}) async {
    var result = await api.apiV1MovieUpdatefileattachmentfolderPost(
        body: fileAttachmentFolderUpdateModel);
    if (result.body == null) {
      return ResultModel.error<FileAttachmentFolderModelReturnModel>(
          'Unable to Update File Attachment Folder');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<FileAttachmentFolderModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<FileAttachmentFolderModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<FileAttachmentFolderModelReturnModel>>?
      createFileAttachmentFolder(
          {FileAttachmentFolderCreateModel?
              fileAttachmentFolderCreateModel}) async {
    var result = await api.apiV1MovieCreatefileattachmentfolderPost(
        body: fileAttachmentFolderCreateModel);
    if (result.body == null) {
      return ResultModel.error<FileAttachmentFolderModelReturnModel>(
          'Unable to Create File Attachment Folder');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<FileAttachmentFolderModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<FileAttachmentFolderModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<dynamic>>? downloadFileAttachmentFile(
      {int? fileAttachmentId}) async {
    var result = await api.apiV1MovieDownloadfileattachmentfileGet(
        fileAttachmentId: fileAttachmentId);
    if (result.body == null) {
      return ResultModel.error<dynamic>('Unable to Download Attachment File');
    } else {
      return ResultModel.ok<dynamic>(result.body!);
    }
  }

  Future<ResultModel<dynamic>>? getUserPicture({int? userId}) async {
    var result = await api.apiV1CompanyGetuserpictureGet(userId: userId);
    if (result.body == null) {
      return ResultModel.error<dynamic>('Unable to get user profile picture');
    } else {
      return ResultModel.ok<dynamic>(result.body!);
    }
  }

  Future<ResultModel<dynamic>>? getMoviePicture({int? movieId}) async {
    var result = await api.apiV1MovieGetmoviepictureGet(movieId: movieId);
    if (result.body == null) {
      return ResultModel.error<dynamic>('Unable to get movie profile picture');
    } else {
      return ResultModel.ok<dynamic>(result.body!);
    }
  }

  Future<ResultModel<dynamic>>? exportMovieShootDayCallSheet({
    int? movieShootDayId,
    bool? includeShootDayTechnicians,
    bool? includeShootDayTotalCrewCount,
  }) async {
    var result = await api.apiV1MovieExportmovieshootdaycallsheetGet(
      movieShootDayId: movieShootDayId,
      includeShootDayTechnicians: includeShootDayTechnicians,
      includeShootDayTotalCrewCount: includeShootDayTotalCrewCount,
    );
    if (result.body == null) {
      return ResultModel.error<dynamic>(
          'Unable to export movie shoot day callsheet');
    } else {
      return ResultModel.ok<dynamic>(result.body!);
    }
  }

  Future<ResultModel<dynamic>>? exportMovieShootDayExpensesToTallyFormatUrl({
    int? movieId,
    int? companyId,
    List<int>? selectedMovieShootDayExpenseIds,
  }) async {
    var result =
        await api.apiV1MovieExportmovieshootdayexpensestotallyformatGet(
            movieId: movieId,
            companyId: companyId,
            selectedMovieShootDayExpenseIds: selectedMovieShootDayExpenseIds);
    if (result.body == null) {
      return ResultModel.error<dynamic>(
          'Unable to export movie shoot day expense as tally format');
    } else {
      return ResultModel.ok<dynamic>(result.body!);
    }
  }

  Future<ResultModel<dynamic>>? exportMovieShootDayBudgetsOfCompanyToCsvUrl({
    int? companyId,
    int? budgetDivisionId,
    int? movieId,
    int? movieBudgetDivisionId,
    int? predefinedBudgetDivisionTypeId,
    int? movieShootDayId,
    bool? isPrimaryCast,
    List<int>? selectedIds,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result =
        await api.apiV1SystemExportmovieshootdaybudgetsofcompanytocsvGet(
            companyId: companyId,
            budgetDivisionId: budgetDivisionId,
            movieId: movieId,
            movieBudgetDivisionId: movieBudgetDivisionId,
            predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
            movieShootDayId: movieShootDayId,
            isPrimaryCast: isPrimaryCast,
            selectedIds: selectedIds,
            selectedId: selectedId,
            page: page,
            pageSize: pageSize,
            keyword: keyword,
            sortBy: sortBy,
            sortAscending: sortAscending,
            currentRows: currentRows,
            totalRowCount: totalRowCount,
            numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<dynamic>(
          'Unable to export movie shoot day budget as csv format');
    } else {
      return ResultModel.ok<dynamic>(result.body!);
    }
  }

  Future<ResultModel<dynamic>>? exportMovieShootDayExpensesOfCompanyToCsvUrl({
    int? companyId,
    int? budgetDivisionId,
    int? movieId,
    int? movieBudgetDivisionId,
    int? predefinedBudgetDivisionTypeId,
    int? movieShootDayId,
    bool? isPrimaryCast,
    List<int>? selectedIds,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result =
        await api.apiV1SystemExportmovieshootdayexpensesofcompanytocsvGet(
            companyId: companyId,
            budgetDivisionId: budgetDivisionId,
            movieId: movieId,
            movieBudgetDivisionId: movieBudgetDivisionId,
            predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
            movieShootDayId: movieShootDayId,
            isPrimaryCast: isPrimaryCast,
            selectedIds: selectedIds,
            selectedId: selectedId,
            page: page,
            pageSize: pageSize,
            keyword: keyword,
            sortBy: sortBy,
            sortAscending: sortAscending,
            currentRows: currentRows,
            totalRowCount: totalRowCount,
            numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<dynamic>(
          'Unable to export movie shoot day expense as csv format');
    } else {
      return ResultModel.ok<dynamic>(result.body!);
    }
  }

  Future<ResultModel<dynamic>>? exportMovieBudgetTopSheetUrl({
    int? movieId,
  }) async {
    var result = await api.apiV1MovieExportmoviebudgettopsheetGet(
      movieId: movieId,
    );
    if (result.body == null) {
      return ResultModel.error<dynamic>(
          'Unable to export movie budget top sheet');
    } else {
      return ResultModel.ok<dynamic>(result.body!);
    }
  }

  Future<ResultModel<MovieCommitmentTaskModelReturnListModel>>?
      getMovieCommitmentTasks({
    DateTime? fromDate,
    DateTime? toDate,
    int? companyId,
    bool? showDeleted,
    int? movieId,
    int? movieUserId,
    int? movieShootDayId,
    List<int>? predefinedCommitmentTaskPriorityTypeIds,
    List<int>? predefinedTaskForTypeIds,
    int? movieArtistId,
    int? movieTechnicianId,
    int? movieEquipmentId,
    int? moviePropertyId,
    int? movieLocationId,
    int? movieLocationCandidateId,
    List<int>? predefinedCommitmentTaskStatusTypeIds,
    int? completedByUserId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmoviecommitmenttasksGet(
        fromDate: fromDate,
        toDate: toDate,
        companyId: companyId,
        showDeleted: showDeleted,
        movieId: movieId,
        movieUserId: movieUserId,
        movieShootDayId: movieShootDayId,
        predefinedCommitmentTaskPriorityTypeIds:
            predefinedCommitmentTaskPriorityTypeIds,
        predefinedTaskForTypeIds: predefinedTaskForTypeIds,
        movieArtistId: movieArtistId,
        movieTechnicianId: movieTechnicianId,
        movieEquipmentId: movieEquipmentId,
        moviePropertyId: moviePropertyId,
        movieLocationId: movieLocationId,
        movieLocationCandidateId: movieLocationCandidateId,
        predefinedCommitmentTaskStatusTypeIds:
            predefinedCommitmentTaskStatusTypeIds,
        completedByUserId: completedByUserId,
        createdByUserId: createdByUserId,
        modifiedByUserId: modifiedByUserId,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<MovieCommitmentTaskModelReturnListModel>(
          'Unable to get Movie Tasks');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieCommitmentTaskModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieCommitmentTaskModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieVoucherModelReturnListModel>>? getMovieVouchers({
    int? companyId,
    int? movieId,
    List<int>? movieIds,
    bool? showDeleted,
    int? movieShootDayExpenseId,
    int? predefinedBudgetDivisionTypeId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovievouchersGet(
        companyId: companyId,
        movieId: movieId,
        movieIds: movieIds,
        showDeleted: showDeleted,
        movieShootDayExpenseId: movieShootDayExpenseId,
        predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
        createdByUserId: createdByUserId,
        modifiedByUserId: modifiedByUserId,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<MovieVoucherModelReturnListModel>(
          'Unable to get movie vouchers');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieVoucherModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieVoucherModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieUserModelReturnListModel>>? getMovieUsers({
    List<int>? movieUserIds,
    int? companyId,
    bool? showDeleted,
    int? movieId,
    int? userId,
    List<int>? predefinedUserTypeIds,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovieusersGet(
        movieUserIds: movieUserIds,
        companyId: companyId,
        showDeleted: showDeleted,
        movieId: movieId,
        userId: userId,
        predefinedUserTypeIds: predefinedUserTypeIds,
        createdByUserId: createdByUserId,
        modifiedByUserId: modifiedByUserId,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<MovieUserModelReturnListModel>(
          'Unable to get Movie Users');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieUserModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieUserModelReturnListModel>(result.body!);
    }
  }

  Future<ResultModel<MovieLocationModelReturnModel>>? createMovieLocation({
    http.MultipartFile? UploadedFile,
    String? notes,
    String? movieLocationCode,
    int? predefinedLocationTypeId,
    int? predefinedLocationSubTypeId,
    String? movieLocationName,
    int? selectedMovieLocationCandidateId,
    int? movieId,
    int? preProductionStatusTypeId,
    int? productionStatusTypeId,
    int? postProductionStatusTypeId,
    int? movieLocationCategoryId,
    num? estimatedRate,
    int? movieShootDayBudgetId,
    int? companyId,
  }) async {
    var result = await api.apiV1MovieCreatemovielocationPost(
        UploadedFile: UploadedFile,
        notes: notes,
        movieLocationCode: movieLocationCode,
        predefinedLocationTypeId: predefinedLocationTypeId,
        predefinedLocationSubTypeId: predefinedLocationSubTypeId,
        movieLocationName: movieLocationName,
        selectedMovieLocationCandidateId: selectedMovieLocationCandidateId,
        movieId: movieId,
        preProductionStatusTypeId: preProductionStatusTypeId,
        productionStatusTypeId: productionStatusTypeId,
        postProductionStatusTypeId: postProductionStatusTypeId,
        movieLocationCategoryId: movieLocationCategoryId,
        estimatedRate: estimatedRate,
        movieShootDayBudgetId: movieShootDayBudgetId,
        companyId: companyId);
    if (result.body == null) {
      return ResultModel.error<MovieLocationModelReturnModel>(
          'Unable to Create movie location');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieLocationModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieLocationModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieVoucherModelReturnModel>>? createMovieVoucher({
    http.MultipartFile? UploadedFile,
    DateTime? movieVoucherDate,
    num? movieVoucherAmount,
    int? movieShootDayExpenseId,
    String? movieVoucherLocation,
    String? movieVoucherActualFileName,
    int? companyId,
  }) async {
    var result = await api.apiV1MovieCreatemovievoucherPost(
        UploadedFile: UploadedFile,
        movieVoucherDate: movieVoucherDate,
        movieVoucherAmount: movieVoucherAmount,
        movieShootDayExpenseId: movieShootDayExpenseId,
        movieVoucherLocation: movieVoucherLocation,
        movieVoucherActualFileName: movieVoucherActualFileName,
        companyId: companyId);
    if (result.body == null) {
      return ResultModel.error<MovieVoucherModelReturnModel>(
          'Unable to Create movie voucher');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieVoucherModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieVoucherModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieLocationModelReturnModel>>? updateMovieLocation({
    http.MultipartFile? UploadedFile,
    String? notes,
    String? movieLocationCode,
    int? predefinedLocationTypeId,
    int? predefinedLocationSubTypeId,
    int? movieLocationId,
    String? movieLocationName,
    int? selectedMovieLocationCandidateId,
    int? movieId,
    int? preProductionStatusTypeId,
    int? productionStatusTypeId,
    int? postProductionStatusTypeId,
    int? movieLocationCategoryId,
    num? estimatedRate,
    int? movieShootDayBudgetId,
    int? companyId,
  }) async {
    var result = await api.apiV1MovieUpdatemovielocationPost(
        UploadedFile: UploadedFile,
        notes: notes,
        movieLocationCode: movieLocationCode,
        predefinedLocationTypeId: predefinedLocationTypeId,
        predefinedLocationSubTypeId: predefinedLocationSubTypeId,
        movieLocationName: movieLocationName,
        selectedMovieLocationCandidateId: selectedMovieLocationCandidateId,
        movieId: movieId,
        movieLocationId: movieLocationId,
        preProductionStatusTypeId: preProductionStatusTypeId,
        productionStatusTypeId: productionStatusTypeId,
        postProductionStatusTypeId: postProductionStatusTypeId,
        movieLocationCategoryId: movieLocationCategoryId,
        estimatedRate: estimatedRate,
        movieShootDayBudgetId: movieShootDayBudgetId,
        companyId: companyId);
    if (result.body == null) {
      return ResultModel.error<MovieLocationModelReturnModel>(
          'Unable to Update movie location');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieLocationModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieLocationModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieCommitmentTaskModelReturnModel>>?
      createMovieCommitmentTask(
          {MovieCommitmentTaskCreateModel?
              movieCommitmentTaskCreateModel}) async {
    var result = await api.apiV1MovieCreatemoviecommitmenttaskPost(
        body: movieCommitmentTaskCreateModel);
    if (result.body == null) {
      return ResultModel.error<MovieCommitmentTaskModelReturnModel>(
          'Unable to Create movie task');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieCommitmentTaskModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieCommitmentTaskModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<ChatMessageModelReturnModel>>? createChatMessage(
      {ChatMessageCreateModel? chatMessageCreateModel}) async {
    var result =
        await api.apiV1ChatCreatechatmessagePost(body: chatMessageCreateModel);
    if (result.body == null) {
      return ResultModel.error<ChatMessageModelReturnModel>(
          'Unable to sent chat message');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<ChatMessageModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<ChatMessageModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieCommitmentTaskModelReturnModel>>?
      updateMovieCommitmentTask(
          {MovieCommitmentTaskUpdateModel?
              movieCommitmentTaskUpdateModel}) async {
    var result = await api.apiV1MovieUpdatemoviecommitmenttaskPost(
        body: movieCommitmentTaskUpdateModel);
    if (result.body == null) {
      return ResultModel.error<MovieCommitmentTaskModelReturnModel>(
          'Unable to update movie task');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieCommitmentTaskModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieCommitmentTaskModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieLocationCandidateModelReturnListModel>>?
      getMovieLocationCandidates({
    List<int>? movieLocationIds,
    int? companyId,
    bool? showDeleted,
    List<int>? predefinedMovieLocationVisitedStatusTypeIds,
    int? movieId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovielocationcandidatesGet(
        movieLocationIds: movieLocationIds,
        companyId: companyId,
        showDeleted: showDeleted,
        predefinedMovieLocationVisitedStatusTypeIds:
            predefinedMovieLocationVisitedStatusTypeIds,
        movieId: movieId,
        createdByUserId: createdByUserId,
        modifiedByUserId: modifiedByUserId,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<MovieLocationCandidateModelReturnListModel>(
          'Unable to get movie location candidates');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieLocationCandidateModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieLocationCandidateModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieLocationCategoryModelReturnListModel>>?
      getMovieLocationCategories({
    List<int>? movieIds,
    int? companyId,
    bool? showDeleted,
    int? parentMovieLocationCategoryId,
    int? movieId,
    int? createdByUserId,
    int? modifiedByUserId,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovielocationcategorysGet(
        companyId: companyId,
        showDeleted: showDeleted,
        movieId: movieId,
        createdByUserId: createdByUserId,
        modifiedByUserId: modifiedByUserId,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<MovieLocationCategoryModelReturnListModel>(
          'Unable to get movie location categories');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieLocationCategoryModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieLocationCategoryModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieScheduleReportModelReturnModel>>? getScheduleReport({
    int? movieId,
  }) async {
    var result = await api.apiV1MovieGetschedulereportGet(
      movieId: movieId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieScheduleReportModelReturnModel>(
          'Unable to get Schedule Report');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<MovieScheduleReportModelReturnModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieScheduleReportModelReturnModel>(result.body!);
    }
  }

  Future<ResultModel<MovieShootDayPaymentStatusModelReturnListModel>>?
      getMovieShootDayPaymentStatus({
    int? movieShootDayId,
  }) async {
    var result = await api.apiV1MovieGetmovieshootdaypaymentstatusGet(
      movieShootDayId: movieShootDayId,
    );
    if (result.body == null) {
      return ResultModel.error<MovieShootDayPaymentStatusModelReturnListModel>(
          'Unable to get movie shoot day payment status report');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieShootDayPaymentStatusModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayPaymentStatusModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieShootDayCallNotificationStatusModelReturnListModel>>?
      getMovieShootDayCallNotificationStatus({
    int? movieShootDayId,
  }) async {
    var result = await api.apiV1MovieGetmovieshootdaycallnotificationstatusGet(
      movieShootDayId: movieShootDayId,
    );
    if (result.body == null) {
      return ResultModel.error<
              MovieShootDayCallNotificationStatusModelReturnListModel>(
          'Unable to get movie shoot day call notification status report');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieShootDayCallNotificationStatusModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<
              MovieShootDayCallNotificationStatusModelReturnListModel>(
          result.body!);
    }
  }

  Future<ResultModel<MovieShootDayAttendanceStatusModelReturnListModel>>?
      getMovieAttendanceStatus({
    int? movieId,
    int? movieShootDayId,
    int? predefinedBudgetDivisionTypeId,
    DateTime? startDate,
    DateTime? endDate,
    int? selectedId,
    int? page,
    int? pageSize,
    String? keyword,
    String? sortBy,
    bool? sortAscending,
    int? currentRows,
    int? totalRowCount,
    int? numericPageCount,
  }) async {
    var result = await api.apiV1MovieGetmovieattendancestatusGet(
        movieId: movieId,
        movieShootDayId: movieShootDayId,
        predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
        startDate: startDate,
        endDate: endDate,
        selectedId: selectedId,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
        sortBy: sortBy,
        sortAscending: sortAscending,
        currentRows: currentRows,
        totalRowCount: totalRowCount,
        numericPageCount: numericPageCount);
    if (result.body == null) {
      return ResultModel.error<
              MovieShootDayAttendanceStatusModelReturnListModel>(
          'Unable to get movie attendance status');
    } else {
      if (!result.body!.isSuccess!) {
        return ResultModel.error<
                MovieShootDayAttendanceStatusModelReturnListModel>(
            result.body!.errorHolder!.friendlyMessage!);
      }
      return ResultModel.ok<MovieShootDayAttendanceStatusModelReturnListModel>(
          result.body!);
    }
  }
}
