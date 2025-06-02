// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astro_class.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorItemModel _$ErrorItemModelFromJson(Map<String, dynamic> json) =>
    ErrorItemModel(
      field: json['field'],
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorItemModelToJson(ErrorItemModel instance) =>
    <String, dynamic>{
      'field': instance.field,
      'message': instance.message,
    };

ReturnListModelUserOutModel _$ReturnListModelUserOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnListModelUserOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReturnListModelUserOutModelToJson(
        ReturnListModelUserOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'count': instance.count,
    };

UserInfoOutModel _$UserInfoOutModelFromJson(Map<String, dynamic> json) =>
    UserInfoOutModel(
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      userType: (json['user_type'] as num?)?.toInt(),
      userStatus: (json['user_status'] as num?)?.toInt(),
      userProfileFileLocation: json['user_profile_file_location'],
      userProfileFileName: json['user_profile_file_name'],
      userProfileFileSize: json['user_profile_file_size'],
      userInfoId: (json['user_info_id'] as num).toInt(),
      externalUserId: json['external_user_id'] as String,
      accountCreatedOn: DateTime.parse(json['account_created_on'] as String),
    );

Map<String, dynamic> _$UserInfoOutModelToJson(UserInfoOutModel instance) =>
    <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'user_type': instance.userType,
      'user_status': instance.userStatus,
      'user_profile_file_location': instance.userProfileFileLocation,
      'user_profile_file_name': instance.userProfileFileName,
      'user_profile_file_size': instance.userProfileFileSize,
      'user_info_id': instance.userInfoId,
      'external_user_id': instance.externalUserId,
      'account_created_on': instance.accountCreatedOn.toIso8601String(),
    };

UserOutModel _$UserOutModelFromJson(Map<String, dynamic> json) => UserOutModel(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      isActive: json['is_active'] as bool,
      dateJoined: DateTime.parse(json['date_joined'] as String),
      lastLogin: json['last_login'],
      isStaff: json['is_staff'] as bool,
      isSuperuser: json['is_superuser'] as bool,
      profile: json['profile'],
    );

Map<String, dynamic> _$UserOutModelToJson(UserOutModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'is_active': instance.isActive,
      'date_joined': instance.dateJoined.toIso8601String(),
      'last_login': instance.lastLogin,
      'is_staff': instance.isStaff,
      'is_superuser': instance.isSuperuser,
      'profile': instance.profile,
    };

UserSearchCriteriaModel _$UserSearchCriteriaModelFromJson(
        Map<String, dynamic> json) =>
    UserSearchCriteriaModel(
      searchKeyword: json['search_keyword'],
      pageNumber: (json['page_number'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      sortBy: json['sort_by'],
      sortAscending: json['sort_ascending'] as bool? ?? true,
      username: json['username'],
      email: json['email'],
      userTypes: json['user_types'],
      isActive: json['is_active'],
    );

Map<String, dynamic> _$UserSearchCriteriaModelToJson(
        UserSearchCriteriaModel instance) =>
    <String, dynamic>{
      'search_keyword': instance.searchKeyword,
      'page_number': instance.pageNumber,
      'page_size': instance.pageSize,
      'sort_by': instance.sortBy,
      'sort_ascending': instance.sortAscending,
      'username': instance.username,
      'email': instance.email,
      'user_types': instance.userTypes,
      'is_active': instance.isActive,
    };

ReturnModelUserOutModel _$ReturnModelUserOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnModelUserOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ReturnModelUserOutModelToJson(
        ReturnModelUserOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

UserInfoBaseModel _$UserInfoBaseModelFromJson(Map<String, dynamic> json) =>
    UserInfoBaseModel(
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      userType: (json['user_type'] as num?)?.toInt(),
      userStatus: (json['user_status'] as num?)?.toInt(),
      userProfileFileLocation: json['user_profile_file_location'],
      userProfileFileName: json['user_profile_file_name'],
      userProfileFileSize: json['user_profile_file_size'],
    );

Map<String, dynamic> _$UserInfoBaseModelToJson(UserInfoBaseModel instance) =>
    <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'user_type': instance.userType,
      'user_status': instance.userStatus,
      'user_profile_file_location': instance.userProfileFileLocation,
      'user_profile_file_name': instance.userProfileFileName,
      'user_profile_file_size': instance.userProfileFileSize,
    };

UserUpdateModel _$UserUpdateModelFromJson(Map<String, dynamic> json) =>
    UserUpdateModel(
      username: json['username'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      isActive: json['is_active'],
      userInfo: json['user_info'],
    );

Map<String, dynamic> _$UserUpdateModelToJson(UserUpdateModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'is_active': instance.isActive,
      'user_info': instance.userInfo,
    };

ReturnModel _$ReturnModelFromJson(Map<String, dynamic> json) => ReturnModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ReturnModelToJson(ReturnModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

UserCreateModel _$UserCreateModelFromJson(Map<String, dynamic> json) =>
    UserCreateModel(
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      password: json['password'] as String,
      userInfo:
          UserInfoBaseModel.fromJson(json['user_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCreateModelToJson(UserCreateModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'password': instance.password,
      'user_info': instance.userInfo.toJson(),
    };

EnumItemModel _$EnumItemModelFromJson(Map<String, dynamic> json) =>
    EnumItemModel(
      $value: (json['value'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$EnumItemModelToJson(EnumItemModel instance) =>
    <String, dynamic>{
      'value': instance.$value,
      'name': instance.name,
    };

CatalogOutModel _$CatalogOutModelFromJson(Map<String, dynamic> json) =>
    CatalogOutModel(
      courseId: (json['course_id'] as num).toInt(),
      validForInDays: json['valid_for_in_days'],
      catalogStatus: (json['catalog_status'] as num).toInt(),
      catalogId: (json['catalog_id'] as num).toInt(),
    );

Map<String, dynamic> _$CatalogOutModelToJson(CatalogOutModel instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'valid_for_in_days': instance.validForInDays,
      'catalog_status': instance.catalogStatus,
      'catalog_id': instance.catalogId,
    };

ReturnModelCatalogOutModel _$ReturnModelCatalogOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnModelCatalogOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ReturnModelCatalogOutModelToJson(
        ReturnModelCatalogOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

CatalogUpdateModel _$CatalogUpdateModelFromJson(Map<String, dynamic> json) =>
    CatalogUpdateModel(
      courseId: (json['course_id'] as num).toInt(),
      validForInDays: json['valid_for_in_days'],
      catalogStatus: (json['catalog_status'] as num).toInt(),
    );

Map<String, dynamic> _$CatalogUpdateModelToJson(CatalogUpdateModel instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'valid_for_in_days': instance.validForInDays,
      'catalog_status': instance.catalogStatus,
    };

ReturnListModelCatalogOutModel _$ReturnListModelCatalogOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnListModelCatalogOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReturnListModelCatalogOutModelToJson(
        ReturnListModelCatalogOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'count': instance.count,
    };

CatalogCreateModel _$CatalogCreateModelFromJson(Map<String, dynamic> json) =>
    CatalogCreateModel(
      courseId: (json['course_id'] as num).toInt(),
      validForInDays: json['valid_for_in_days'],
      catalogStatus: (json['catalog_status'] as num).toInt(),
    );

Map<String, dynamic> _$CatalogCreateModelToJson(CatalogCreateModel instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'valid_for_in_days': instance.validForInDays,
      'catalog_status': instance.catalogStatus,
    };

CatalogSearchCriteriaModel _$CatalogSearchCriteriaModelFromJson(
        Map<String, dynamic> json) =>
    CatalogSearchCriteriaModel(
      searchKeyword: json['search_keyword'],
      pageNumber: (json['page_number'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      sortBy: json['sort_by'],
      sortAscending: json['sort_ascending'] as bool? ?? true,
      courseId: json['course_id'],
      catalogStatus: json['catalog_status'],
      validForInDays: json['valid_for_in_days'],
    );

Map<String, dynamic> _$CatalogSearchCriteriaModelToJson(
        CatalogSearchCriteriaModel instance) =>
    <String, dynamic>{
      'search_keyword': instance.searchKeyword,
      'page_number': instance.pageNumber,
      'page_size': instance.pageSize,
      'sort_by': instance.sortBy,
      'sort_ascending': instance.sortAscending,
      'course_id': instance.courseId,
      'catalog_status': instance.catalogStatus,
      'valid_for_in_days': instance.validForInDays,
    };

CourseOutModel _$CourseOutModelFromJson(Map<String, dynamic> json) =>
    CourseOutModel(
      name: json['name'] as String,
      description: json['description'],
      feeType: (json['fee_type'] as num).toInt(),
      courseImageType: (json['course_image_type'] as num).toInt(),
      courseImageTypeHeight: json['course_image_type_height'],
      courseImageTypeWidth: json['course_image_type_width'],
      courseImageTypeBackColor: json['course_image_type_back_color'],
      courseImageTypeFrontColor: json['course_image_type_front_color'],
      position: json['position'],
      courseStatus: (json['course_status'] as num).toInt(),
      courseId: (json['course_id'] as num).toInt(),
    );

Map<String, dynamic> _$CourseOutModelToJson(CourseOutModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'fee_type': instance.feeType,
      'course_image_type': instance.courseImageType,
      'course_image_type_height': instance.courseImageTypeHeight,
      'course_image_type_width': instance.courseImageTypeWidth,
      'course_image_type_back_color': instance.courseImageTypeBackColor,
      'course_image_type_front_color': instance.courseImageTypeFrontColor,
      'position': instance.position,
      'course_status': instance.courseStatus,
      'course_id': instance.courseId,
    };

ReturnModelCourseOutModel _$ReturnModelCourseOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnModelCourseOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ReturnModelCourseOutModelToJson(
        ReturnModelCourseOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

CourseUpdateModel _$CourseUpdateModelFromJson(Map<String, dynamic> json) =>
    CourseUpdateModel(
      name: json['name'] as String,
      description: json['description'],
      feeType: (json['fee_type'] as num).toInt(),
      courseImageType: (json['course_image_type'] as num).toInt(),
      courseImageTypeHeight: json['course_image_type_height'],
      courseImageTypeWidth: json['course_image_type_width'],
      courseImageTypeBackColor: json['course_image_type_back_color'],
      courseImageTypeFrontColor: json['course_image_type_front_color'],
      position: json['position'],
      courseStatus: (json['course_status'] as num).toInt(),
    );

Map<String, dynamic> _$CourseUpdateModelToJson(CourseUpdateModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'fee_type': instance.feeType,
      'course_image_type': instance.courseImageType,
      'course_image_type_height': instance.courseImageTypeHeight,
      'course_image_type_width': instance.courseImageTypeWidth,
      'course_image_type_back_color': instance.courseImageTypeBackColor,
      'course_image_type_front_color': instance.courseImageTypeFrontColor,
      'position': instance.position,
      'course_status': instance.courseStatus,
    };

ReturnListModelCourseOutModel _$ReturnListModelCourseOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnListModelCourseOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReturnListModelCourseOutModelToJson(
        ReturnListModelCourseOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'count': instance.count,
    };

CourseCreateModel _$CourseCreateModelFromJson(Map<String, dynamic> json) =>
    CourseCreateModel(
      name: json['name'] as String,
      description: json['description'],
      feeType: (json['fee_type'] as num).toInt(),
      courseImageType: (json['course_image_type'] as num).toInt(),
      courseImageTypeHeight: json['course_image_type_height'],
      courseImageTypeWidth: json['course_image_type_width'],
      courseImageTypeBackColor: json['course_image_type_back_color'],
      courseImageTypeFrontColor: json['course_image_type_front_color'],
      position: json['position'],
      courseStatus: (json['course_status'] as num).toInt(),
    );

Map<String, dynamic> _$CourseCreateModelToJson(CourseCreateModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'fee_type': instance.feeType,
      'course_image_type': instance.courseImageType,
      'course_image_type_height': instance.courseImageTypeHeight,
      'course_image_type_width': instance.courseImageTypeWidth,
      'course_image_type_back_color': instance.courseImageTypeBackColor,
      'course_image_type_front_color': instance.courseImageTypeFrontColor,
      'position': instance.position,
      'course_status': instance.courseStatus,
    };

CourseBatchOutModel _$CourseBatchOutModelFromJson(Map<String, dynamic> json) =>
    CourseBatchOutModel(
      courseId: (json['course_id'] as num).toInt(),
      batchName: json['batch_name'] as String,
      position: json['position'],
      courseBatchStatus: (json['course_batch_status'] as num).toInt(),
      courseBatchId: (json['course_batch_id'] as num).toInt(),
    );

Map<String, dynamic> _$CourseBatchOutModelToJson(
        CourseBatchOutModel instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'batch_name': instance.batchName,
      'position': instance.position,
      'course_batch_status': instance.courseBatchStatus,
      'course_batch_id': instance.courseBatchId,
    };

ReturnListModelCourseBatchOutModel _$ReturnListModelCourseBatchOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnListModelCourseBatchOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReturnListModelCourseBatchOutModelToJson(
        ReturnListModelCourseBatchOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'count': instance.count,
    };

CourseMediaOutModel _$CourseMediaOutModelFromJson(Map<String, dynamic> json) =>
    CourseMediaOutModel(
      courseId: (json['course_id'] as num).toInt(),
      courseBatchId: json['course_batch_id'],
      position: json['position'],
      title: json['title'] as String,
      description: json['description'],
      courseMediaStatus: (json['course_media_status'] as num).toInt(),
      courseMediaType: (json['course_media_type'] as num).toInt(),
      courseMediaLocation: json['course_media_location'] as String,
      courseMediaSize: json['course_media_size'],
      courseMediaId: (json['course_media_id'] as num).toInt(),
    );

Map<String, dynamic> _$CourseMediaOutModelToJson(
        CourseMediaOutModel instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'course_batch_id': instance.courseBatchId,
      'position': instance.position,
      'title': instance.title,
      'description': instance.description,
      'course_media_status': instance.courseMediaStatus,
      'course_media_type': instance.courseMediaType,
      'course_media_location': instance.courseMediaLocation,
      'course_media_size': instance.courseMediaSize,
      'course_media_id': instance.courseMediaId,
    };

ReturnListModelCourseMediaOutModel _$ReturnListModelCourseMediaOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnListModelCourseMediaOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReturnListModelCourseMediaOutModelToJson(
        ReturnListModelCourseMediaOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'count': instance.count,
    };

CourseUserOutModel _$CourseUserOutModelFromJson(Map<String, dynamic> json) =>
    CourseUserOutModel(
      courseId: (json['course_id'] as num).toInt(),
      courseBatchId: json['course_batch_id'],
      userId: (json['user_id'] as num).toInt(),
      tenantId: json['tenant_id'] as String,
      validUntil: json['valid_until'],
      courseUserStatus: (json['course_user_status'] as num).toInt(),
      courseUserId: (json['course_user_id'] as num).toInt(),
    );

Map<String, dynamic> _$CourseUserOutModelToJson(CourseUserOutModel instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'course_batch_id': instance.courseBatchId,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'valid_until': instance.validUntil,
      'course_user_status': instance.courseUserStatus,
      'course_user_id': instance.courseUserId,
    };

ReturnListModelCourseUserOutModel _$ReturnListModelCourseUserOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnListModelCourseUserOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReturnListModelCourseUserOutModelToJson(
        ReturnListModelCourseUserOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'count': instance.count,
    };

ReturnModelCourseBatchOutModel _$ReturnModelCourseBatchOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnModelCourseBatchOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ReturnModelCourseBatchOutModelToJson(
        ReturnModelCourseBatchOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

CourseBatchUpdateModel _$CourseBatchUpdateModelFromJson(
        Map<String, dynamic> json) =>
    CourseBatchUpdateModel(
      courseId: (json['course_id'] as num).toInt(),
      batchName: json['batch_name'] as String,
      position: json['position'],
      courseBatchStatus: (json['course_batch_status'] as num).toInt(),
    );

Map<String, dynamic> _$CourseBatchUpdateModelToJson(
        CourseBatchUpdateModel instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'batch_name': instance.batchName,
      'position': instance.position,
      'course_batch_status': instance.courseBatchStatus,
    };

CourseBatchCreateModel _$CourseBatchCreateModelFromJson(
        Map<String, dynamic> json) =>
    CourseBatchCreateModel(
      courseId: (json['course_id'] as num).toInt(),
      batchName: json['batch_name'] as String,
      position: json['position'],
      courseBatchStatus: (json['course_batch_status'] as num).toInt(),
    );

Map<String, dynamic> _$CourseBatchCreateModelToJson(
        CourseBatchCreateModel instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'batch_name': instance.batchName,
      'position': instance.position,
      'course_batch_status': instance.courseBatchStatus,
    };

ReturnModelCourseMediaOutModel _$ReturnModelCourseMediaOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnModelCourseMediaOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ReturnModelCourseMediaOutModelToJson(
        ReturnModelCourseMediaOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

CourseMediaUpdateModel _$CourseMediaUpdateModelFromJson(
        Map<String, dynamic> json) =>
    CourseMediaUpdateModel(
      courseId: (json['course_id'] as num).toInt(),
      courseBatchId: json['course_batch_id'],
      position: json['position'],
      title: json['title'] as String,
      description: json['description'],
      courseMediaStatus: (json['course_media_status'] as num).toInt(),
      courseMediaType: (json['course_media_type'] as num).toInt(),
      courseMediaLocation: json['course_media_location'] as String,
      courseMediaSize: json['course_media_size'],
    );

Map<String, dynamic> _$CourseMediaUpdateModelToJson(
        CourseMediaUpdateModel instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'course_batch_id': instance.courseBatchId,
      'position': instance.position,
      'title': instance.title,
      'description': instance.description,
      'course_media_status': instance.courseMediaStatus,
      'course_media_type': instance.courseMediaType,
      'course_media_location': instance.courseMediaLocation,
      'course_media_size': instance.courseMediaSize,
    };

CourseMediaCreateModel _$CourseMediaCreateModelFromJson(
        Map<String, dynamic> json) =>
    CourseMediaCreateModel(
      courseId: (json['course_id'] as num).toInt(),
      courseBatchId: json['course_batch_id'],
      position: json['position'],
      title: json['title'] as String,
      description: json['description'],
      courseMediaStatus: (json['course_media_status'] as num).toInt(),
      courseMediaType: (json['course_media_type'] as num).toInt(),
      courseMediaLocation: json['course_media_location'] as String,
      courseMediaSize: json['course_media_size'],
    );

Map<String, dynamic> _$CourseMediaCreateModelToJson(
        CourseMediaCreateModel instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'course_batch_id': instance.courseBatchId,
      'position': instance.position,
      'title': instance.title,
      'description': instance.description,
      'course_media_status': instance.courseMediaStatus,
      'course_media_type': instance.courseMediaType,
      'course_media_location': instance.courseMediaLocation,
      'course_media_size': instance.courseMediaSize,
    };

ReturnModelCourseUserOutModel _$ReturnModelCourseUserOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnModelCourseUserOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ReturnModelCourseUserOutModelToJson(
        ReturnModelCourseUserOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

CourseUserUpdateModel _$CourseUserUpdateModelFromJson(
        Map<String, dynamic> json) =>
    CourseUserUpdateModel(
      courseId: json['course_id'],
      courseBatchId: json['course_batch_id'],
      userId: json['user_id'],
      tenantId: json['tenant_id'],
      validUntil: json['valid_until'],
      courseUserStatus: json['course_user_status'],
    );

Map<String, dynamic> _$CourseUserUpdateModelToJson(
        CourseUserUpdateModel instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'course_batch_id': instance.courseBatchId,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'valid_until': instance.validUntil,
      'course_user_status': instance.courseUserStatus,
    };

CourseUserCreateModel _$CourseUserCreateModelFromJson(
        Map<String, dynamic> json) =>
    CourseUserCreateModel(
      courseId: (json['course_id'] as num).toInt(),
      courseBatchId: json['course_batch_id'],
      userId: (json['user_id'] as num).toInt(),
      tenantId: json['tenant_id'] as String,
      validUntil: json['valid_until'],
      courseUserStatus: (json['course_user_status'] as num).toInt(),
    );

Map<String, dynamic> _$CourseUserCreateModelToJson(
        CourseUserCreateModel instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'course_batch_id': instance.courseBatchId,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'valid_until': instance.validUntil,
      'course_user_status': instance.courseUserStatus,
    };

CourseSearchCriteriaModel _$CourseSearchCriteriaModelFromJson(
        Map<String, dynamic> json) =>
    CourseSearchCriteriaModel(
      searchKeyword: json['search_keyword'],
      pageNumber: (json['page_number'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      sortBy: json['sort_by'],
      sortAscending: json['sort_ascending'] as bool? ?? true,
      name: json['name'],
      feeType: json['fee_type'],
      courseStatus: json['course_status'],
      courseImageType: json['course_image_type'],
    );

Map<String, dynamic> _$CourseSearchCriteriaModelToJson(
        CourseSearchCriteriaModel instance) =>
    <String, dynamic>{
      'search_keyword': instance.searchKeyword,
      'page_number': instance.pageNumber,
      'page_size': instance.pageSize,
      'sort_by': instance.sortBy,
      'sort_ascending': instance.sortAscending,
      'name': instance.name,
      'fee_type': instance.feeType,
      'course_status': instance.courseStatus,
      'course_image_type': instance.courseImageType,
    };

CourseBatchSearchCriteriaModel _$CourseBatchSearchCriteriaModelFromJson(
        Map<String, dynamic> json) =>
    CourseBatchSearchCriteriaModel(
      searchKeyword: json['search_keyword'],
      pageNumber: (json['page_number'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      sortBy: json['sort_by'],
      sortAscending: json['sort_ascending'] as bool? ?? true,
      courseId: json['course_id'],
      batchStatus: json['batch_status'],
      startDateFrom: json['start_date_from'],
      startDateTo: json['start_date_to'],
      endDateFrom: json['end_date_from'],
      endDateTo: json['end_date_to'],
    );

Map<String, dynamic> _$CourseBatchSearchCriteriaModelToJson(
        CourseBatchSearchCriteriaModel instance) =>
    <String, dynamic>{
      'search_keyword': instance.searchKeyword,
      'page_number': instance.pageNumber,
      'page_size': instance.pageSize,
      'sort_by': instance.sortBy,
      'sort_ascending': instance.sortAscending,
      'course_id': instance.courseId,
      'batch_status': instance.batchStatus,
      'start_date_from': instance.startDateFrom,
      'start_date_to': instance.startDateTo,
      'end_date_from': instance.endDateFrom,
      'end_date_to': instance.endDateTo,
    };

CourseMediaSearchCriteriaModel _$CourseMediaSearchCriteriaModelFromJson(
        Map<String, dynamic> json) =>
    CourseMediaSearchCriteriaModel(
      searchKeyword: json['search_keyword'],
      pageNumber: (json['page_number'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      sortBy: json['sort_by'],
      sortAscending: json['sort_ascending'] as bool? ?? true,
      courseId: json['course_id'],
      courseBatchId: json['course_batch_id'],
      mediaType: json['media_type'],
      mediaStatus: json['media_status'],
    );

Map<String, dynamic> _$CourseMediaSearchCriteriaModelToJson(
        CourseMediaSearchCriteriaModel instance) =>
    <String, dynamic>{
      'search_keyword': instance.searchKeyword,
      'page_number': instance.pageNumber,
      'page_size': instance.pageSize,
      'sort_by': instance.sortBy,
      'sort_ascending': instance.sortAscending,
      'course_id': instance.courseId,
      'course_batch_id': instance.courseBatchId,
      'media_type': instance.mediaType,
      'media_status': instance.mediaStatus,
    };

CourseUserSearchCriteriaModel _$CourseUserSearchCriteriaModelFromJson(
        Map<String, dynamic> json) =>
    CourseUserSearchCriteriaModel(
      searchKeyword: json['search_keyword'],
      pageNumber: (json['page_number'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      sortBy: json['sort_by'],
      sortAscending: json['sort_ascending'] as bool? ?? true,
      courseId: json['course_id'],
      userId: json['user_id'],
      courseUserStatus: json['course_user_status'],
      enrollmentDateFrom: json['enrollment_date_from'],
      enrollmentDateTo: json['enrollment_date_to'],
    );

Map<String, dynamic> _$CourseUserSearchCriteriaModelToJson(
        CourseUserSearchCriteriaModel instance) =>
    <String, dynamic>{
      'search_keyword': instance.searchKeyword,
      'page_number': instance.pageNumber,
      'page_size': instance.pageSize,
      'sort_by': instance.sortBy,
      'sort_ascending': instance.sortAscending,
      'course_id': instance.courseId,
      'user_id': instance.userId,
      'course_user_status': instance.courseUserStatus,
      'enrollment_date_from': instance.enrollmentDateFrom,
      'enrollment_date_to': instance.enrollmentDateTo,
    };

MessageOutModel _$MessageOutModelFromJson(Map<String, dynamic> json) =>
    MessageOutModel(
      messageTitle: json['message_title'] as String,
      messageDescription: json['message_description'] as String,
      messageType: (json['message_type'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      courseId: json['course_id'],
      courseBatchId: json['course_batch_id'],
      messageId: (json['message_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$MessageOutModelToJson(MessageOutModel instance) =>
    <String, dynamic>{
      'message_title': instance.messageTitle,
      'message_description': instance.messageDescription,
      'message_type': instance.messageType,
      'user_id': instance.userId,
      'course_id': instance.courseId,
      'course_batch_id': instance.courseBatchId,
      'message_id': instance.messageId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

ReturnModelMessageOutModel _$ReturnModelMessageOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnModelMessageOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ReturnModelMessageOutModelToJson(
        ReturnModelMessageOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

MessageUpdateModel _$MessageUpdateModelFromJson(Map<String, dynamic> json) =>
    MessageUpdateModel(
      messageTitle: json['message_title'],
      messageDescription: json['message_description'],
      messageType: json['message_type'],
    );

Map<String, dynamic> _$MessageUpdateModelToJson(MessageUpdateModel instance) =>
    <String, dynamic>{
      'message_title': instance.messageTitle,
      'message_description': instance.messageDescription,
      'message_type': instance.messageType,
    };

ReturnListModelMessageOutModel _$ReturnListModelMessageOutModelFromJson(
        Map<String, dynamic> json) =>
    ReturnListModelMessageOutModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReturnListModelMessageOutModelToJson(
        ReturnListModelMessageOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'count': instance.count,
    };

MessageCreateModel _$MessageCreateModelFromJson(Map<String, dynamic> json) =>
    MessageCreateModel(
      messageTitle: json['message_title'] as String,
      messageDescription: json['message_description'] as String,
      messageType: (json['message_type'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      courseId: json['course_id'],
      courseBatchId: json['course_batch_id'],
    );

Map<String, dynamic> _$MessageCreateModelToJson(MessageCreateModel instance) =>
    <String, dynamic>{
      'message_title': instance.messageTitle,
      'message_description': instance.messageDescription,
      'message_type': instance.messageType,
      'user_id': instance.userId,
      'course_id': instance.courseId,
      'course_batch_id': instance.courseBatchId,
    };

ReturnModelTokenResponseModel _$ReturnModelTokenResponseModelFromJson(
        Map<String, dynamic> json) =>
    ReturnModelTokenResponseModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ReturnModelTokenResponseModelToJson(
        ReturnModelTokenResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

TokenResponseModel _$TokenResponseModelFromJson(Map<String, dynamic> json) =>
    TokenResponseModel(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String?,
      expiresIn: (json['expires_in'] as num).toInt(),
      user: UserOutModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenResponseModelToJson(TokenResponseModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'user': instance.user.toJson(),
    };

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

ReturnModelTokenValidationModel _$ReturnModelTokenValidationModelFromJson(
        Map<String, dynamic> json) =>
    ReturnModelTokenValidationModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ReturnModelTokenValidationModelToJson(
        ReturnModelTokenValidationModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

TokenValidationModel _$TokenValidationModelFromJson(
        Map<String, dynamic> json) =>
    TokenValidationModel(
      valid: json['valid'] as bool,
      userId: json['user_id'],
      username: json['username'],
      expiresAt: json['expires_at'],
    );

Map<String, dynamic> _$TokenValidationModelToJson(
        TokenValidationModel instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'user_id': instance.userId,
      'username': instance.username,
      'expires_at': instance.expiresAt,
    };

OAuth2AuthUrlResponseModel _$OAuth2AuthUrlResponseModelFromJson(
        Map<String, dynamic> json) =>
    OAuth2AuthUrlResponseModel(
      authUrl: json['auth_url'] as String,
      state: json['state'],
    );

Map<String, dynamic> _$OAuth2AuthUrlResponseModelToJson(
        OAuth2AuthUrlResponseModel instance) =>
    <String, dynamic>{
      'auth_url': instance.authUrl,
      'state': instance.state,
    };

ReturnModelOAuth2AuthUrlResponseModel
    _$ReturnModelOAuth2AuthUrlResponseModelFromJson(
            Map<String, dynamic> json) =>
        ReturnModelOAuth2AuthUrlResponseModel(
          data: json['data'],
          status: json['status'] as bool? ?? true,
          message: json['message'] as String?,
          errors: json['errors'],
        );

Map<String, dynamic> _$ReturnModelOAuth2AuthUrlResponseModelToJson(
        ReturnModelOAuth2AuthUrlResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

OAuth2AuthUrlModel _$OAuth2AuthUrlModelFromJson(Map<String, dynamic> json) =>
    OAuth2AuthUrlModel(
      redirectUri: json['redirect_uri'] as String,
    );

Map<String, dynamic> _$OAuth2AuthUrlModelToJson(OAuth2AuthUrlModel instance) =>
    <String, dynamic>{
      'redirect_uri': instance.redirectUri,
    };

OAuth2CallbackModel _$OAuth2CallbackModelFromJson(Map<String, dynamic> json) =>
    OAuth2CallbackModel(
      authorizationCode: json['authorization_code'] as String,
      redirectUri: json['redirect_uri'] as String,
      state: json['state'],
    );

Map<String, dynamic> _$OAuth2CallbackModelToJson(
        OAuth2CallbackModel instance) =>
    <String, dynamic>{
      'authorization_code': instance.authorizationCode,
      'redirect_uri': instance.redirectUri,
      'state': instance.state,
    };

OAuth2ErrorModel _$OAuth2ErrorModelFromJson(Map<String, dynamic> json) =>
    OAuth2ErrorModel(
      error: json['error'] as String,
      errorDescription: json['error_description'],
      errorUri: json['error_uri'],
    );

Map<String, dynamic> _$OAuth2ErrorModelToJson(OAuth2ErrorModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'error_description': instance.errorDescription,
      'error_uri': instance.errorUri,
    };

ReturnModelOAuth2ErrorModel _$ReturnModelOAuth2ErrorModelFromJson(
        Map<String, dynamic> json) =>
    ReturnModelOAuth2ErrorModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ReturnModelOAuth2ErrorModelToJson(
        ReturnModelOAuth2ErrorModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

ReturnModelDict _$ReturnModelDictFromJson(Map<String, dynamic> json) =>
    ReturnModelDict(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ReturnModelDictToJson(ReturnModelDict instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

ForgotPasswordModel _$ForgotPasswordModelFromJson(Map<String, dynamic> json) =>
    ForgotPasswordModel(
      email: json['email'] as String,
    );

Map<String, dynamic> _$ForgotPasswordModelToJson(
        ForgotPasswordModel instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

PasswordResetTokenModel _$PasswordResetTokenModelFromJson(
        Map<String, dynamic> json) =>
    PasswordResetTokenModel(
      token: json['token'] as String,
      valid: json['valid'] as bool,
      expiresAt: json['expires_at'],
      userId: json['user_id'],
    );

Map<String, dynamic> _$PasswordResetTokenModelToJson(
        PasswordResetTokenModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'valid': instance.valid,
      'expires_at': instance.expiresAt,
      'user_id': instance.userId,
    };

ReturnModelPasswordResetTokenModel _$ReturnModelPasswordResetTokenModelFromJson(
        Map<String, dynamic> json) =>
    ReturnModelPasswordResetTokenModel(
      data: json['data'],
      status: json['status'] as bool? ?? true,
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ReturnModelPasswordResetTokenModelToJson(
        ReturnModelPasswordResetTokenModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

ResetPasswordModel _$ResetPasswordModelFromJson(Map<String, dynamic> json) =>
    ResetPasswordModel(
      token: json['token'] as String,
      newPassword: json['new_password'] as String,
      confirmPassword: json['confirm_password'] as String,
    );

Map<String, dynamic> _$ResetPasswordModelToJson(ResetPasswordModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'new_password': instance.newPassword,
      'confirm_password': instance.confirmPassword,
    };

ChangePasswordModel _$ChangePasswordModelFromJson(Map<String, dynamic> json) =>
    ChangePasswordModel(
      currentPassword: json['current_password'] as String,
      newPassword: json['new_password'] as String,
      confirmPassword: json['confirm_password'] as String,
    );

Map<String, dynamic> _$ChangePasswordModelToJson(
        ChangePasswordModel instance) =>
    <String, dynamic>{
      'current_password': instance.currentPassword,
      'new_password': instance.newPassword,
      'confirm_password': instance.confirmPassword,
    };
