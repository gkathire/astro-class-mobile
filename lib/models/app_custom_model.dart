import 'dart:ui';

import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';

class MovieArtistWithCompanyArtistWithExtendedModel
    extends MovieArtistWithCompanyArtistModel {
  String? artistGroupName;
  String? resourceName;
  int? resourceId;

  MovieArtistWithCompanyArtistWithExtendedModel({
    this.artistGroupName,
    this.resourceName,
    this.resourceId,
    super.movieArtistId,
    super.movieArtistCode,
    super.artistId,
    super.artistTypeId,
    super.artistCharacterName,
    super.parentMovieArtistId,
    super.movieArtistName,
    super.predefinedContractAssignmentStatusTypeId,
    super.contractId,
    super.isDefaultForAllShootDay,
    super.isPartOfMajorCrew,
    super.defaultPreProductionMovieBudgetCategoryId,
    super.defaultProductionMovieBudgetCategoryId,
    super.defaultPostProductionMovieBudgetCategoryId,
    super.position,
    super.movieId,
    super.companyId,
    super.isDeleted,
    super.createdDate,
    super.createdByUserId,
    super.modifiedDate,
    super.modifiedByUserId,
    super.canHaveAdditionalCount,
    super.defaultPreProductionMovieBudgetCategoryName,
    super.defaultProductionMovieBudgetCategoryName,
    super.defaultPostProductionMovieBudgetCategoryName,
    super.defaultPreProductionMovieBudgetCategoryCode,
    super.defaultProductionMovieBudgetCategoryCode,
    super.defaultPostProductionMovieBudgetCategoryCode,
    super.artistFirstName,
    super.artistLastName,
    super.artistWorkPhone,
    super.artistCellPhone,
    super.artistEmail,
    super.artistAssistantName,
    super.artistAssistantPhone,
    super.artistAssistantEmail,
    super.predefinedContractAssignmentStatusTypeName,
    super.contractName,
    super.artistTypeName,
    super.parentMovieArtistName,
    super.companyName,
    super.companyCode,
    super.movieCode,
    super.artistCode,
    super.createdByUserFirstName,
    super.createdByUserLastName,
    super.createdByUserEmail,
    super.modifiedByUserFirstName,
    super.modifiedByUserLastName,
    super.modifiedByUserEmail,
    super.createdBy,
    super.modifiedBy,
    super.existingMovieArtistRates,
    super.isNonMovieArtist,
  });

  MovieArtistWithCompanyArtistWithExtendedModel copyWith(
      {String? artistGroupName,
      String? resourceName,
      int? resourceId,
      int? movieArtistId,
      String? movieArtistCode,
      int? artistId,
      int? artistTypeId,
      String? artistCharacterName,
      int? parentMovieArtistId,
      String? movieArtistName,
      int? predefinedContractAssignmentStatusTypeId,
      int? contractId,
      bool? isDefaultForAllShootDay,
      bool? isPartOfMajorCrew,
      int? defaultPreProductionMovieBudgetCategoryId,
      int? defaultProductionMovieBudgetCategoryId,
      int? defaultPostProductionMovieBudgetCategoryId,
      int? position,
      int? movieId,
      int? companyId,
      bool? isDeleted,
      DateTime? createdDate,
      int? createdByUserId,
      DateTime? modifiedDate,
      int? modifiedByUserId,
      bool? canHaveAdditionalCount,
      String? defaultPreProductionMovieBudgetCategoryName,
      String? defaultProductionMovieBudgetCategoryName,
      String? defaultPostProductionMovieBudgetCategoryName,
      String? defaultPreProductionMovieBudgetCategoryCode,
      String? defaultProductionMovieBudgetCategoryCode,
      String? defaultPostProductionMovieBudgetCategoryCode,
      String? artistFirstName,
      String? artistLastName,
      String? artistWorkPhone,
      String? artistCellPhone,
      String? artistEmail,
      String? artistAssistantName,
      String? artistAssistantPhone,
      String? artistAssistantEmail,
      String? predefinedContractAssignmentStatusTypeName,
      String? contractName,
      String? artistTypeName,
      String? parentMovieArtistName,
      String? companyName,
      String? companyCode,
      String? movieCode,
      String? artistCode,
      String? createdByUserFirstName,
      String? createdByUserLastName,
      String? createdByUserEmail,
      String? modifiedByUserFirstName,
      String? modifiedByUserLastName,
      String? modifiedByUserEmail,
      String? createdBy,
      String? modifiedBy,
      List<MovieArtistRateModel>? existingMovieArtistRates,
      bool? isNonMovieArtist}) {
    return MovieArtistWithCompanyArtistWithExtendedModel(
        artistGroupName: artistGroupName ?? this.artistGroupName,
        resourceName: resourceName ?? this.resourceName,
        resourceId: resourceId ?? this.resourceId,
        artistAssistantEmail: artistAssistantEmail ?? this.artistAssistantEmail,
        artistAssistantName: artistAssistantName ?? this.artistAssistantName,
        artistAssistantPhone: artistAssistantPhone ?? this.artistAssistantPhone,
        artistCellPhone: artistCellPhone ?? this.artistCellPhone,
        artistCharacterName: artistCharacterName ?? this.artistCharacterName,
        artistCode: artistCode ?? this.artistCode,
        artistEmail: artistEmail ?? this.artistEmail,
        artistFirstName: artistFirstName ?? this.artistFirstName,
        artistLastName: artistLastName ?? this.artistLastName,
        artistId: artistId ?? this.artistId,
        artistTypeId: artistTypeId ?? this.artistTypeId,
        artistTypeName: artistTypeName ?? this.artistTypeName,
        artistWorkPhone: artistWorkPhone ?? this.artistWorkPhone,
        canHaveAdditionalCount:
            canHaveAdditionalCount ?? this.canHaveAdditionalCount,
        companyCode: companyCode ?? this.companyCode,
        movieArtistId: movieArtistId ?? this.movieArtistId,
        movieArtistCode: movieArtistCode ?? this.movieArtistCode,
        parentMovieArtistId: parentMovieArtistId ?? this.parentMovieArtistId,
        movieArtistName: movieArtistName ?? this.movieArtistName,
        predefinedContractAssignmentStatusTypeId:
            predefinedContractAssignmentStatusTypeId,
        contractId: contractId,
        isDefaultForAllShootDay: isDefaultForAllShootDay,
        isPartOfMajorCrew: isPartOfMajorCrew,
        defaultPreProductionMovieBudgetCategoryId:
            defaultPreProductionMovieBudgetCategoryId,
        defaultProductionMovieBudgetCategoryId:
            defaultProductionMovieBudgetCategoryId,
        defaultPostProductionMovieBudgetCategoryId:
            defaultPostProductionMovieBudgetCategoryId,
        position: position,
        movieId: movieId,
        companyId: companyId,
        isDeleted: isDeleted,
        createdDate: createdDate,
        createdByUserId: createdByUserId,
        modifiedDate: modifiedDate,
        modifiedByUserId: modifiedByUserId,
        defaultPreProductionMovieBudgetCategoryName:
            defaultPreProductionMovieBudgetCategoryName,
        defaultProductionMovieBudgetCategoryName:
            defaultProductionMovieBudgetCategoryName,
        defaultPostProductionMovieBudgetCategoryName:
            defaultPostProductionMovieBudgetCategoryName,
        defaultPreProductionMovieBudgetCategoryCode:
            defaultPreProductionMovieBudgetCategoryCode,
        defaultProductionMovieBudgetCategoryCode:
            defaultProductionMovieBudgetCategoryCode,
        defaultPostProductionMovieBudgetCategoryCode:
            defaultPostProductionMovieBudgetCategoryCode,
        predefinedContractAssignmentStatusTypeName:
            predefinedContractAssignmentStatusTypeName,
        contractName: contractName,
        parentMovieArtistName: parentMovieArtistName,
        companyName: companyName,
        movieCode: movieCode,
        createdByUserFirstName: createdByUserFirstName,
        createdByUserLastName: createdByUserLastName,
        createdByUserEmail: createdByUserEmail,
        modifiedByUserFirstName: modifiedByUserFirstName,
        modifiedByUserLastName: modifiedByUserLastName,
        modifiedByUserEmail: modifiedByUserEmail,
        createdBy: createdBy,
        modifiedBy: modifiedBy,
        existingMovieArtistRates: existingMovieArtistRates,
        isNonMovieArtist: isNonMovieArtist);
  }
}

class MovieTechnicianWithCompanyTechnicianWithExtendedModel
    extends MovieTechnicianWithCompanyTechnicianModel {
  String? technicianGroupName;
  String? resourceName;
  int? resourceId;

  MovieTechnicianWithCompanyTechnicianWithExtendedModel({
    this.technicianGroupName,
    this.resourceName,
    this.resourceId,
    super.movieTechnicianId,
    super.movieTechnicianCode,
    super.technicianId,
    super.technicianTypeId,
    super.parentMovieTechnicianId,
    super.movieTechnicianName,
    super.predefinedContractAssignmentStatusTypeId,
    super.contractId,
    super.isDefaultForAllShootDay,
    super.isPartOfMajorCrew,
    super.defaultPreProductionMovieBudgetCategoryId,
    super.defaultProductionMovieBudgetCategoryId,
    super.defaultPostProductionMovieBudgetCategoryId,
    super.position,
    super.movieId,
    super.companyId,
    super.isDeleted,
    super.createdDate,
    super.createdByUserId,
    super.modifiedDate,
    super.modifiedByUserId,
    super.canHaveAdditionalCount,
    super.defaultPreProductionMovieBudgetCategoryName,
    super.defaultProductionMovieBudgetCategoryName,
    super.defaultPostProductionMovieBudgetCategoryName,
    super.defaultPreProductionMovieBudgetCategoryCode,
    super.defaultProductionMovieBudgetCategoryCode,
    super.defaultPostProductionMovieBudgetCategoryCode,
    super.technicianFirstName,
    super.technicianLastName,
    super.technicianWorkPhone,
    super.technicianCellPhone,
    super.technicianEmail,
    super.technicianAssistantName,
    super.technicianAssistantPhone,
    super.technicianAssistantEmail,
    super.predefinedContractAssignmentStatusTypeName,
    super.contractName,
    super.technicianTypeName,
    super.parentMovieTechnicianName,
    super.companyName,
    super.companyCode,
    super.movieCode,
    super.technicianCode,
    super.createdByUserFirstName,
    super.createdByUserLastName,
    super.createdByUserEmail,
    super.modifiedByUserFirstName,
    super.modifiedByUserLastName,
    super.modifiedByUserEmail,
    super.createdBy,
    super.modifiedBy,
    super.existingMovieTechnicianRates,
    super.isNonMovieTechnician,
  });

  MovieTechnicianWithCompanyTechnicianWithExtendedModel copyWith(
      {String? technicianGroupName,
      String? resourceName,
      int? resourceId,
      int? movieTechnicianId,
      String? movieTechnicianCode,
      int? technicianId,
      int? technicianTypeId,
      int? parentMovieTechnicianId,
      String? movieTechnicianName,
      int? predefinedContractAssignmentStatusTypeId,
      int? contractId,
      bool? isDefaultForAllShootDay,
      bool? isPartOfMajorCrew,
      int? defaultPreProductionMovieBudgetCategoryId,
      int? defaultProductionMovieBudgetCategoryId,
      int? defaultPostProductionMovieBudgetCategoryId,
      int? position,
      int? movieId,
      int? companyId,
      bool? isDeleted,
      DateTime? createdDate,
      int? createdByUserId,
      DateTime? modifiedDate,
      int? modifiedByUserId,
      bool? canHaveAdditionalCount,
      String? defaultPreProductionMovieBudgetCategoryName,
      String? defaultProductionMovieBudgetCategoryName,
      String? defaultPostProductionMovieBudgetCategoryName,
      String? defaultPreProductionMovieBudgetCategoryCode,
      String? defaultProductionMovieBudgetCategoryCode,
      String? defaultPostProductionMovieBudgetCategoryCode,
      String? technicianFirstName,
      String? technicianLastName,
      String? technicianWorkPhone,
      String? technicianCellPhone,
      String? technicianEmail,
      String? technicianAssistantName,
      String? technicianAssistantPhone,
      String? technicianAssistantEmail,
      String? predefinedContractAssignmentStatusTypeName,
      String? contractName,
      String? technicianTypeName,
      String? parentMovieTechnicianName,
      String? companyName,
      String? companyCode,
      String? movieCode,
      String? technicianCode,
      String? createdByUserFirstName,
      String? createdByUserLastName,
      String? createdByUserEmail,
      String? modifiedByUserFirstName,
      String? modifiedByUserLastName,
      String? modifiedByUserEmail,
      String? createdBy,
      String? modifiedBy,
      List<MovieTechnicianRateModel>? existingMovieTechnicianRates,
      bool? isNonMovieTechnician}) {
    return MovieTechnicianWithCompanyTechnicianWithExtendedModel(
        technicianGroupName: technicianGroupName ?? this.technicianGroupName,
        resourceName: resourceName ?? this.resourceName,
        resourceId: resourceId ?? this.resourceId,
        technicianAssistantEmail:
            technicianAssistantEmail ?? this.technicianAssistantEmail,
        technicianAssistantName:
            technicianAssistantName ?? this.technicianAssistantName,
        technicianAssistantPhone:
            technicianAssistantPhone ?? this.technicianAssistantPhone,
        technicianCellPhone: technicianCellPhone ?? this.technicianCellPhone,
        technicianCode: technicianCode ?? this.technicianCode,
        technicianEmail: technicianEmail ?? this.technicianEmail,
        technicianFirstName: technicianFirstName ?? this.technicianFirstName,
        technicianLastName: technicianLastName ?? this.technicianLastName,
        technicianId: technicianId ?? this.technicianId,
        technicianTypeId: technicianTypeId ?? this.technicianTypeId,
        technicianTypeName: technicianTypeName ?? this.technicianTypeName,
        technicianWorkPhone: technicianWorkPhone ?? this.technicianWorkPhone,
        canHaveAdditionalCount:
            canHaveAdditionalCount ?? this.canHaveAdditionalCount,
        companyCode: companyCode ?? this.companyCode,
        movieTechnicianId: movieTechnicianId ?? this.movieTechnicianId,
        movieTechnicianCode: movieTechnicianCode ?? this.movieTechnicianCode,
        parentMovieTechnicianId:
            parentMovieTechnicianId ?? this.parentMovieTechnicianId,
        movieTechnicianName: movieTechnicianName ?? this.movieTechnicianName,
        predefinedContractAssignmentStatusTypeId:
            predefinedContractAssignmentStatusTypeId,
        contractId: contractId,
        isDefaultForAllShootDay: isDefaultForAllShootDay,
        isPartOfMajorCrew: isPartOfMajorCrew,
        defaultPreProductionMovieBudgetCategoryId:
            defaultPreProductionMovieBudgetCategoryId,
        defaultProductionMovieBudgetCategoryId:
            defaultProductionMovieBudgetCategoryId,
        defaultPostProductionMovieBudgetCategoryId:
            defaultPostProductionMovieBudgetCategoryId,
        position: position,
        movieId: movieId,
        companyId: companyId,
        isDeleted: isDeleted,
        createdDate: createdDate,
        createdByUserId: createdByUserId,
        modifiedDate: modifiedDate,
        modifiedByUserId: modifiedByUserId,
        defaultPreProductionMovieBudgetCategoryName:
            defaultPreProductionMovieBudgetCategoryName,
        defaultProductionMovieBudgetCategoryName:
            defaultProductionMovieBudgetCategoryName,
        defaultPostProductionMovieBudgetCategoryName:
            defaultPostProductionMovieBudgetCategoryName,
        defaultPreProductionMovieBudgetCategoryCode:
            defaultPreProductionMovieBudgetCategoryCode,
        defaultProductionMovieBudgetCategoryCode:
            defaultProductionMovieBudgetCategoryCode,
        defaultPostProductionMovieBudgetCategoryCode:
            defaultPostProductionMovieBudgetCategoryCode,
        predefinedContractAssignmentStatusTypeName:
            predefinedContractAssignmentStatusTypeName,
        contractName: contractName,
        parentMovieTechnicianName: parentMovieTechnicianName,
        companyName: companyName,
        movieCode: movieCode,
        createdByUserFirstName: createdByUserFirstName,
        createdByUserLastName: createdByUserLastName,
        createdByUserEmail: createdByUserEmail,
        modifiedByUserFirstName: modifiedByUserFirstName,
        modifiedByUserLastName: modifiedByUserLastName,
        modifiedByUserEmail: modifiedByUserEmail,
        createdBy: createdBy,
        modifiedBy: modifiedBy,
        existingMovieTechnicianRates: existingMovieTechnicianRates,
        isNonMovieTechnician: isNonMovieTechnician);
  }
}

class MovieEquipmentWithCompanyEquipmentWithExtendedModel
    extends MovieEquipmentWithCompanyEquipmentModel {
  String? equipmentGroupName;
  String? resourceName;
  int? resourceId;

  MovieEquipmentWithCompanyEquipmentWithExtendedModel({
    this.equipmentGroupName,
    this.resourceName,
    this.resourceId,
    super.movieEquipmentId,
    super.movieEquipmentCode,
    super.equipmentId,
    super.equipmentTypeId,
    super.parentMovieEquipmentId,
    super.movieEquipmentName,
    super.predefinedContractAssignmentStatusTypeId,
    super.contractId,
    super.isDefaultForAllShootDay,
    super.defaultPreProductionMovieBudgetCategoryId,
    super.defaultProductionMovieBudgetCategoryId,
    super.defaultPostProductionMovieBudgetCategoryId,
    super.position,
    super.movieId,
    super.companyId,
    super.isDeleted,
    super.createdDate,
    super.createdByUserId,
    super.modifiedDate,
    super.modifiedByUserId,
    super.canHaveAdditionalCount,
    super.defaultPreProductionMovieBudgetCategoryName,
    super.defaultProductionMovieBudgetCategoryName,
    super.defaultPostProductionMovieBudgetCategoryName,
    super.defaultPreProductionMovieBudgetCategoryCode,
    super.defaultProductionMovieBudgetCategoryCode,
    super.defaultPostProductionMovieBudgetCategoryCode,
    super.predefinedContractAssignmentStatusTypeName,
    super.contractName,
    super.equipmentTypeName,
    super.parentMovieEquipmentName,
    super.companyName,
    super.companyCode,
    super.movieCode,
    super.equipmentCode,
    super.createdByUserFirstName,
    super.createdByUserLastName,
    super.createdByUserEmail,
    super.modifiedByUserFirstName,
    super.modifiedByUserLastName,
    super.modifiedByUserEmail,
    super.createdBy,
    super.modifiedBy,
    super.existingMovieEquipmentRates,
    super.isNonMovieEquipment,
    super.equipmentName,
  });

  MovieEquipmentWithCompanyEquipmentWithExtendedModel copyWith(
      {String? equipmentGroupName,
      String? resourceName,
      int? resourceId,
      int? movieEquipmentId,
      String? movieEquipmentCode,
      int? equipmentId,
      int? equipmentTypeId,
      int? parentMovieEquipmentId,
      String? movieEquipmentName,
      int? predefinedContractAssignmentStatusTypeId,
      int? contractId,
      bool? isDefaultForAllShootDay,
      int? defaultPreProductionMovieBudgetCategoryId,
      int? defaultProductionMovieBudgetCategoryId,
      int? defaultPostProductionMovieBudgetCategoryId,
      int? position,
      int? movieId,
      int? companyId,
      bool? isDeleted,
      DateTime? createdDate,
      int? createdByUserId,
      DateTime? modifiedDate,
      int? modifiedByUserId,
      bool? canHaveAdditionalCount,
      String? defaultPreProductionMovieBudgetCategoryName,
      String? defaultProductionMovieBudgetCategoryName,
      String? defaultPostProductionMovieBudgetCategoryName,
      String? defaultPreProductionMovieBudgetCategoryCode,
      String? defaultProductionMovieBudgetCategoryCode,
      String? defaultPostProductionMovieBudgetCategoryCode,
      String? equipmentName,
      String? predefinedContractAssignmentStatusTypeName,
      String? contractName,
      String? equipmentTypeName,
      String? parentMovieEquipmentName,
      String? companyName,
      String? companyCode,
      String? movieCode,
      String? equipmentCode,
      String? createdByUserFirstName,
      String? createdByUserLastName,
      String? createdByUserEmail,
      String? modifiedByUserFirstName,
      String? modifiedByUserLastName,
      String? modifiedByUserEmail,
      String? createdBy,
      String? modifiedBy,
      List<MovieEquipmentRateModel>? existingMovieEquipmentRates,
      bool? isNonMovieEquipment}) {
    return MovieEquipmentWithCompanyEquipmentWithExtendedModel(
        equipmentGroupName: equipmentGroupName ?? this.equipmentGroupName,
        resourceName: resourceName ?? this.resourceName,
        resourceId: resourceId ?? this.resourceId,
        equipmentCode: equipmentCode ?? this.equipmentCode,
        equipmentName: equipmentName ?? this.equipmentName,
        equipmentId: equipmentId ?? this.equipmentId,
        equipmentTypeId: equipmentTypeId ?? this.equipmentTypeId,
        equipmentTypeName: equipmentTypeName ?? this.equipmentTypeName,
        canHaveAdditionalCount:
            canHaveAdditionalCount ?? this.canHaveAdditionalCount,
        companyCode: companyCode ?? this.companyCode,
        movieEquipmentId: movieEquipmentId ?? this.movieEquipmentId,
        movieEquipmentCode: movieEquipmentCode ?? this.movieEquipmentCode,
        parentMovieEquipmentId:
            parentMovieEquipmentId ?? this.parentMovieEquipmentId,
        movieEquipmentName: movieEquipmentName ?? this.movieEquipmentName,
        predefinedContractAssignmentStatusTypeId:
            predefinedContractAssignmentStatusTypeId,
        contractId: contractId,
        isDefaultForAllShootDay: isDefaultForAllShootDay,
        defaultPreProductionMovieBudgetCategoryId:
            defaultPreProductionMovieBudgetCategoryId,
        defaultProductionMovieBudgetCategoryId:
            defaultProductionMovieBudgetCategoryId,
        defaultPostProductionMovieBudgetCategoryId:
            defaultPostProductionMovieBudgetCategoryId,
        position: position,
        movieId: movieId,
        companyId: companyId,
        isDeleted: isDeleted,
        createdDate: createdDate,
        createdByUserId: createdByUserId,
        modifiedDate: modifiedDate,
        modifiedByUserId: modifiedByUserId,
        defaultPreProductionMovieBudgetCategoryName:
            defaultPreProductionMovieBudgetCategoryName,
        defaultProductionMovieBudgetCategoryName:
            defaultProductionMovieBudgetCategoryName,
        defaultPostProductionMovieBudgetCategoryName:
            defaultPostProductionMovieBudgetCategoryName,
        defaultPreProductionMovieBudgetCategoryCode:
            defaultPreProductionMovieBudgetCategoryCode,
        defaultProductionMovieBudgetCategoryCode:
            defaultProductionMovieBudgetCategoryCode,
        defaultPostProductionMovieBudgetCategoryCode:
            defaultPostProductionMovieBudgetCategoryCode,
        predefinedContractAssignmentStatusTypeName:
            predefinedContractAssignmentStatusTypeName,
        contractName: contractName,
        parentMovieEquipmentName: parentMovieEquipmentName,
        companyName: companyName,
        movieCode: movieCode,
        createdByUserFirstName: createdByUserFirstName,
        createdByUserLastName: createdByUserLastName,
        createdByUserEmail: createdByUserEmail,
        modifiedByUserFirstName: modifiedByUserFirstName,
        modifiedByUserLastName: modifiedByUserLastName,
        modifiedByUserEmail: modifiedByUserEmail,
        createdBy: createdBy,
        modifiedBy: modifiedBy,
        existingMovieEquipmentRates: existingMovieEquipmentRates,
        isNonMovieEquipment: isNonMovieEquipment);
  }
}

class MovieVendorWithCompanyVendorWithExtendedModel
    extends MovieVendorWithCompanyVendorModel {
  String? vendorGroupName;
  String? resourceName;
  int? resourceId;

  MovieVendorWithCompanyVendorWithExtendedModel({
    this.vendorGroupName,
    this.resourceName,
    this.resourceId,
    super.movieVendorId,
    super.movieVendorCode,
    super.vendorId,
    super.vendorTypeId,
    super.parentMovieVendorId,
    super.movieVendorName,
    super.predefinedContractAssignmentStatusTypeId,
    super.contractId,
    super.isDefaultForAllShootDay,
    super.defaultPreProductionMovieBudgetCategoryId,
    super.defaultProductionMovieBudgetCategoryId,
    super.defaultPostProductionMovieBudgetCategoryId,
    super.position,
    super.movieId,
    super.companyId,
    super.isDeleted,
    super.createdDate,
    super.createdByUserId,
    super.modifiedDate,
    super.modifiedByUserId,
    super.canHaveAdditionalCount,
    super.defaultPreProductionMovieBudgetCategoryName,
    super.defaultProductionMovieBudgetCategoryName,
    super.defaultPostProductionMovieBudgetCategoryName,
    super.defaultPreProductionMovieBudgetCategoryCode,
    super.defaultProductionMovieBudgetCategoryCode,
    super.defaultPostProductionMovieBudgetCategoryCode,
    super.vendorName,
    super.predefinedContractAssignmentStatusTypeName,
    super.contractName,
    super.vendorTypeName,
    super.parentMovieVendorName,
    super.companyName,
    super.companyCode,
    super.movieCode,
    super.vendorCode,
    super.createdByUserFirstName,
    super.createdByUserLastName,
    super.createdByUserEmail,
    super.modifiedByUserFirstName,
    super.modifiedByUserLastName,
    super.modifiedByUserEmail,
    super.createdBy,
    super.modifiedBy,
    super.existingMovieVendorRates,
    super.isNonMovieVendor,
  });

  MovieVendorWithCompanyVendorWithExtendedModel copyWith(
      {String? vendorGroupName,
      String? resourceName,
      int? resourceId,
      int? movieVendorId,
      String? movieVendorCode,
      int? vendorId,
      int? vendorTypeId,
      int? parentMovieVendorId,
      String? movieVendorName,
      int? predefinedContractAssignmentStatusTypeId,
      int? contractId,
      bool? isDefaultForAllShootDay,
      int? defaultPreProductionMovieBudgetCategoryId,
      int? defaultProductionMovieBudgetCategoryId,
      int? defaultPostProductionMovieBudgetCategoryId,
      int? position,
      int? movieId,
      int? companyId,
      bool? isDeleted,
      DateTime? createdDate,
      int? createdByUserId,
      DateTime? modifiedDate,
      int? modifiedByUserId,
      bool? canHaveAdditionalCount,
      String? defaultPreProductionMovieBudgetCategoryName,
      String? defaultProductionMovieBudgetCategoryName,
      String? defaultPostProductionMovieBudgetCategoryName,
      String? defaultPreProductionMovieBudgetCategoryCode,
      String? defaultProductionMovieBudgetCategoryCode,
      String? defaultPostProductionMovieBudgetCategoryCode,
      String? vendorName,
      String? predefinedContractAssignmentStatusTypeName,
      String? contractName,
      String? vendorTypeName,
      String? parentMovieVendorName,
      String? companyName,
      String? companyCode,
      String? movieCode,
      String? vendorCode,
      String? createdByUserFirstName,
      String? createdByUserLastName,
      String? createdByUserEmail,
      String? modifiedByUserFirstName,
      String? modifiedByUserLastName,
      String? modifiedByUserEmail,
      String? createdBy,
      String? modifiedBy,
      List<MovieVendorRateModel>? existingMovieVendorRates,
      bool? isNonMovieVendor}) {
    return MovieVendorWithCompanyVendorWithExtendedModel(
      vendorGroupName: vendorGroupName ?? this.vendorGroupName,
      resourceName: resourceName ?? this.resourceName,
      resourceId: resourceId ?? this.resourceId,
      vendorCode: vendorCode ?? this.vendorCode,
      vendorName: vendorName ?? this.vendorName,
      vendorId: vendorId ?? this.vendorId,
      vendorTypeId: vendorTypeId ?? this.vendorTypeId,
      vendorTypeName: vendorTypeName ?? this.vendorTypeName,
      canHaveAdditionalCount:
          canHaveAdditionalCount ?? this.canHaveAdditionalCount,
      companyCode: companyCode ?? this.companyCode,
      movieVendorId: movieVendorId ?? this.movieVendorId,
      movieVendorCode: movieVendorCode ?? this.movieVendorCode,
      parentMovieVendorId: parentMovieVendorId ?? this.parentMovieVendorId,
      movieVendorName: movieVendorName ?? this.movieVendorName,
      predefinedContractAssignmentStatusTypeId:
          predefinedContractAssignmentStatusTypeId,
      contractId: contractId,
      isDefaultForAllShootDay: isDefaultForAllShootDay,
      defaultPreProductionMovieBudgetCategoryId:
          defaultPreProductionMovieBudgetCategoryId,
      defaultProductionMovieBudgetCategoryId:
          defaultProductionMovieBudgetCategoryId,
      defaultPostProductionMovieBudgetCategoryId:
          defaultPostProductionMovieBudgetCategoryId,
      position: position,
      movieId: movieId,
      companyId: companyId,
      isDeleted: isDeleted,
      createdDate: createdDate,
      createdByUserId: createdByUserId,
      modifiedDate: modifiedDate,
      modifiedByUserId: modifiedByUserId,
      defaultPreProductionMovieBudgetCategoryName:
          defaultPreProductionMovieBudgetCategoryName,
      defaultProductionMovieBudgetCategoryName:
          defaultProductionMovieBudgetCategoryName,
      defaultPostProductionMovieBudgetCategoryName:
          defaultPostProductionMovieBudgetCategoryName,
      defaultPreProductionMovieBudgetCategoryCode:
          defaultPreProductionMovieBudgetCategoryCode,
      defaultProductionMovieBudgetCategoryCode:
          defaultProductionMovieBudgetCategoryCode,
      defaultPostProductionMovieBudgetCategoryCode:
          defaultPostProductionMovieBudgetCategoryCode,
      predefinedContractAssignmentStatusTypeName:
          predefinedContractAssignmentStatusTypeName,
      contractName: contractName,
      parentMovieVendorName: parentMovieVendorName,
      companyName: companyName,
      movieCode: movieCode,
      createdByUserFirstName: createdByUserFirstName,
      createdByUserLastName: createdByUserLastName,
      createdByUserEmail: createdByUserEmail,
      modifiedByUserFirstName: modifiedByUserFirstName,
      modifiedByUserLastName: modifiedByUserLastName,
      modifiedByUserEmail: modifiedByUserEmail,
      createdBy: createdBy,
      modifiedBy: modifiedBy,
      existingMovieVendorRates: existingMovieVendorRates,
      isNonMovieVendor: isNonMovieVendor,
    );
  }
}

class MoviePropertyWithCompanyPropertyWithExtendedModel
    extends MoviePropertyWithCompanyPropertyModel {
  String? propertyGroupName;
  String? resourceName;
  int? resourceId;

  MoviePropertyWithCompanyPropertyWithExtendedModel({
    this.propertyGroupName,
    this.resourceName,
    this.resourceId,
    super.moviePropertyId,
    super.moviePropertyCode,
    super.propertyId,
    super.propertyTypeId,
    super.parentMoviePropertyId,
    super.moviePropertyName,
    super.predefinedContractAssignmentStatusTypeId,
    super.contractId,
    super.isDefaultForAllShootDay,
    super.defaultPreProductionMovieBudgetCategoryId,
    super.defaultProductionMovieBudgetCategoryId,
    super.defaultPostProductionMovieBudgetCategoryId,
    super.position,
    super.movieId,
    super.companyId,
    super.isDeleted,
    super.createdDate,
    super.createdByUserId,
    super.modifiedDate,
    super.modifiedByUserId,
    super.canHaveAdditionalCount,
    super.defaultPreProductionMovieBudgetCategoryName,
    super.defaultProductionMovieBudgetCategoryName,
    super.defaultPostProductionMovieBudgetCategoryName,
    super.defaultPreProductionMovieBudgetCategoryCode,
    super.defaultProductionMovieBudgetCategoryCode,
    super.defaultPostProductionMovieBudgetCategoryCode,
    super.predefinedContractAssignmentStatusTypeName,
    super.contractName,
    super.propertyTypeName,
    super.parentMoviePropertyName,
    super.companyName,
    super.companyCode,
    super.movieCode,
    super.propertyCode,
    super.createdByUserFirstName,
    super.createdByUserLastName,
    super.createdByUserEmail,
    super.modifiedByUserFirstName,
    super.modifiedByUserLastName,
    super.modifiedByUserEmail,
    super.createdBy,
    super.modifiedBy,
    super.existingMoviePropertyRates,
    super.isNonMovieProperty,
    super.propertyName,
  });

  MoviePropertyWithCompanyPropertyWithExtendedModel copyWith(
      {String? propertyGroupName,
      String? resourceName,
      int? resourceId,
      int? moviePropertyId,
      String? moviePropertyCode,
      int? propertyId,
      int? propertyTypeId,
      int? parentMoviePropertyId,
      String? moviePropertyName,
      int? predefinedContractAssignmentStatusTypeId,
      int? contractId,
      bool? isDefaultForAllShootDay,
      int? defaultPreProductionMovieBudgetCategoryId,
      int? defaultProductionMovieBudgetCategoryId,
      int? defaultPostProductionMovieBudgetCategoryId,
      int? position,
      int? movieId,
      int? companyId,
      bool? isDeleted,
      DateTime? createdDate,
      int? createdByUserId,
      DateTime? modifiedDate,
      int? modifiedByUserId,
      bool? canHaveAdditionalCount,
      String? defaultPreProductionMovieBudgetCategoryName,
      String? defaultProductionMovieBudgetCategoryName,
      String? defaultPostProductionMovieBudgetCategoryName,
      String? defaultPreProductionMovieBudgetCategoryCode,
      String? defaultProductionMovieBudgetCategoryCode,
      String? defaultPostProductionMovieBudgetCategoryCode,
      String? propertyName,
      String? predefinedContractAssignmentStatusTypeName,
      String? contractName,
      String? propertyTypeName,
      String? parentMoviePropertyName,
      String? companyName,
      String? companyCode,
      String? movieCode,
      String? propertyCode,
      String? createdByUserFirstName,
      String? createdByUserLastName,
      String? createdByUserEmail,
      String? modifiedByUserFirstName,
      String? modifiedByUserLastName,
      String? modifiedByUserEmail,
      String? createdBy,
      String? modifiedBy,
      List<MoviePropertyRateModel>? existingMoviePropertyRates,
      bool? isNonMovieProperty}) {
    return MoviePropertyWithCompanyPropertyWithExtendedModel(
        propertyGroupName: propertyGroupName ?? this.propertyGroupName,
        resourceName: resourceName ?? this.resourceName,
        resourceId: resourceId ?? this.resourceId,
        propertyCode: propertyCode ?? this.propertyCode,
        propertyName: propertyName ?? this.propertyName,
        propertyId: propertyId ?? this.propertyId,
        propertyTypeId: propertyTypeId ?? this.propertyTypeId,
        propertyTypeName: propertyTypeName ?? this.propertyTypeName,
        canHaveAdditionalCount:
            canHaveAdditionalCount ?? this.canHaveAdditionalCount,
        companyCode: companyCode ?? this.companyCode,
        moviePropertyId: moviePropertyId ?? this.moviePropertyId,
        moviePropertyCode: moviePropertyCode ?? this.moviePropertyCode,
        parentMoviePropertyId:
            parentMoviePropertyId ?? this.parentMoviePropertyId,
        moviePropertyName: moviePropertyName ?? this.moviePropertyName,
        predefinedContractAssignmentStatusTypeId:
            predefinedContractAssignmentStatusTypeId,
        contractId: contractId,
        isDefaultForAllShootDay: isDefaultForAllShootDay,
        defaultPreProductionMovieBudgetCategoryId:
            defaultPreProductionMovieBudgetCategoryId,
        defaultProductionMovieBudgetCategoryId:
            defaultProductionMovieBudgetCategoryId,
        defaultPostProductionMovieBudgetCategoryId:
            defaultPostProductionMovieBudgetCategoryId,
        position: position,
        movieId: movieId,
        companyId: companyId,
        isDeleted: isDeleted,
        createdDate: createdDate,
        createdByUserId: createdByUserId,
        modifiedDate: modifiedDate,
        modifiedByUserId: modifiedByUserId,
        defaultPreProductionMovieBudgetCategoryName:
            defaultPreProductionMovieBudgetCategoryName,
        defaultProductionMovieBudgetCategoryName:
            defaultProductionMovieBudgetCategoryName,
        defaultPostProductionMovieBudgetCategoryName:
            defaultPostProductionMovieBudgetCategoryName,
        defaultPreProductionMovieBudgetCategoryCode:
            defaultPreProductionMovieBudgetCategoryCode,
        defaultProductionMovieBudgetCategoryCode:
            defaultProductionMovieBudgetCategoryCode,
        defaultPostProductionMovieBudgetCategoryCode:
            defaultPostProductionMovieBudgetCategoryCode,
        predefinedContractAssignmentStatusTypeName:
            predefinedContractAssignmentStatusTypeName,
        contractName: contractName,
        parentMoviePropertyName: parentMoviePropertyName,
        companyName: companyName,
        movieCode: movieCode,
        createdByUserFirstName: createdByUserFirstName,
        createdByUserLastName: createdByUserLastName,
        createdByUserEmail: createdByUserEmail,
        modifiedByUserFirstName: modifiedByUserFirstName,
        modifiedByUserLastName: modifiedByUserLastName,
        modifiedByUserEmail: modifiedByUserEmail,
        createdBy: createdBy,
        modifiedBy: modifiedBy,
        existingMoviePropertyRates: existingMoviePropertyRates,
        isNonMovieProperty: isNonMovieProperty);
  }
}

class HomeScreenCategoryItemMenuModel {
  String categoryMenuIcon;
  int categoryMenuTypeId;
  String categoryMenuLabel;
  HomeScreenCategoryItemMenuModel({
    required this.categoryMenuLabel,
    required this.categoryMenuIcon,
    required this.categoryMenuTypeId,
  });
}

class HomeScreenCategoryMenuModel {
  List<HomeScreenCategoryItemMenuModel> homeScreenCategoryItems;
  String categorySectionTitle;
  HomeScreenCategoryMenuModel(
      {required this.homeScreenCategoryItems,
      required this.categorySectionTitle});
}

class MovieBudgetExpenseSummaryPieChartContainer {
  Color categoryColor;
  double totalBudgetAmount;
  double totalExpenseAmount;
  double totalPaidAmount;
  String sectionName;
  MovieBudgetExpenseSummaryPieChartContainer(
      {required this.totalBudgetAmount,
      required this.totalExpenseAmount,
      required this.totalPaidAmount,
      required this.sectionName,
      required this.categoryColor});
}

class MovieBudgetExpenseMonthlySummaryContainerModel {
  List<MonthlyMovieShootDayBudgetExpenseSummaryModel> reportSummary;
  String yearText;
  int year;
  MovieBudgetExpenseMonthlySummaryContainerModel(
      {required this.reportSummary,
      required this.yearText,
      required this.year});
}

class MovieDailyStatusReportCommentModel {
  String? resourceName;
  int? resourceId;
  int? predefinedResourceTypeId;
  String? predefinedResourceTypeName;
  String? categoryName;
  int? categoryId;
  String? commentedBy;
  String? comment;

  MovieDailyStatusReportCommentModel({
    required this.resourceName,
    required this.resourceId,
    required this.categoryName,
    required this.categoryId,
    required this.comment,
    required this.commentedBy,
    required this.predefinedResourceTypeId,
    required this.predefinedResourceTypeName,
  });
}

class ProductionProcessScreenTypeModel {
  int predefinedScreenTypeId;
  String title;
  String summary;
  String imageUrl;

  ProductionProcessScreenTypeModel({
    required this.predefinedScreenTypeId,
    required this.title,
    required this.summary,
    required this.imageUrl,
  });
}

class FileAttachmentFolderContainerModel {
  List<FileAttachmentFolderContainerModel> folders;
  List<FileAttachmentModel> files;
  int? parentFolderId;
  String? parentFolderName;
  int? currentFolderId;
  String currentFolderName;
  FileAttachmentFolderContainerModel({
    required this.folders,
    required this.files,
    required this.parentFolderId,
    required this.parentFolderName,
    required this.currentFolderId,
    required this.currentFolderName,
  });
}

class BudgetExpenseSummaryCategoryModel {
  String? budgetCategoryName;
  int? budgetCategoryId;
  int? predefinedBudgetDivisionTypeId;
  String? predefinedBudgetDivisionTypeName;
  double? totalCategoryBudgetAmount;
  double? totalCategoryExpenseAmount;
  List<BudgetExpenseSummaryCategoryModel>? childCategories;
  List<MovieShootDayBudgetExpenseModel>? categoryBudgetExpenseList;
  bool isExpanded = false;
}

class MovieShootDayBudgetExpenseModel {
  double? totalBudgetAmount;
  double? totalExpenseAmount;
  String? movieShootDaySummary;
  int? movieShootDayNumber;
  int? movieShootDayId;
  int? movieBudgetCategoryId;
  String? movieBudgetCategoryName;
}
