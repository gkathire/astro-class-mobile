// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astro_class.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AstroClass extends AstroClass {
  _$AstroClass([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AstroClass;

  @override
  Future<Response<ReturnListModelUserOutModel>> _apiUsersSearchPost(
      {required UserSearchCriteriaModel? body}) {
    final Uri $url = Uri.parse('/api/users/search');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnListModelUserOutModel,
        ReturnListModelUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModelUserOutModel>> _apiUsersUserIdGet(
      {required int? userId}) {
    final Uri $url = Uri.parse('/api/users/${userId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelUserOutModel, ReturnModelUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModelUserOutModel>> _apiUsersUserIdPut({
    required int? userId,
    required UserUpdateModel? body,
  }) {
    final Uri $url = Uri.parse('/api/users/${userId}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ReturnModelUserOutModel, ReturnModelUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModel>> _apiUsersUserIdDelete({required int? userId}) {
    final Uri $url = Uri.parse('/api/users/${userId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModel, ReturnModel>($request);
  }

  @override
  Future<Response<ReturnModelUserOutModel>> _apiUsersPost(
      {required UserCreateModel? body}) {
    final Uri $url = Uri.parse('/api/users');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ReturnModelUserOutModel, ReturnModelUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModelUserOutModel>> _apiUsersUserIdEnablePut(
      {required int? userId}) {
    final Uri $url = Uri.parse('/api/users/${userId}/enable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelUserOutModel, ReturnModelUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModelUserOutModel>> _apiUsersUserIdDisablePut(
      {required int? userId}) {
    final Uri $url = Uri.parse('/api/users/${userId}/disable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelUserOutModel, ReturnModelUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModelUserOutModel>> _apiUsersUserIdCancelPut(
      {required int? userId}) {
    final Uri $url = Uri.parse('/api/users/${userId}/cancel');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelUserOutModel, ReturnModelUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModelUserOutModel>> _apiUsersUserIdBlockPut(
      {required int? userId}) {
    final Uri $url = Uri.parse('/api/users/${userId}/block');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelUserOutModel, ReturnModelUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModel>> _apiUsersUserIdStatusGet(
      {required int? userId}) {
    final Uri $url = Uri.parse('/api/users/${userId}/status');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModel, ReturnModel>($request);
  }

  @override
  Future<Response<List<EnumItemModel>>> _apiCatalogStatusesGet() {
    final Uri $url = Uri.parse('/api/catalog/statuses');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<EnumItemModel>, EnumItemModel>($request);
  }

  @override
  Future<Response<ReturnModelCatalogOutModel>> _apiCatalogCatalogIdGet(
      {required int? catalogId}) {
    final Uri $url = Uri.parse('/api/catalog/${catalogId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelCatalogOutModel, ReturnModelCatalogOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCatalogOutModel>> _apiCatalogCatalogIdPut({
    required int? catalogId,
    required CatalogUpdateModel? body,
  }) {
    final Uri $url = Uri.parse('/api/catalog/${catalogId}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ReturnModelCatalogOutModel, ReturnModelCatalogOutModel>($request);
  }

  @override
  Future<Response<ReturnModel>> _apiCatalogCatalogIdDelete(
      {required int? catalogId}) {
    final Uri $url = Uri.parse('/api/catalog/${catalogId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModel, ReturnModel>($request);
  }

  @override
  Future<Response<ReturnListModelCatalogOutModel>> _apiCatalogGet() {
    final Uri $url = Uri.parse('/api/catalog/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnListModelCatalogOutModel,
        ReturnListModelCatalogOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCatalogOutModel>> _apiCatalogPost(
      {required CatalogCreateModel? body}) {
    final Uri $url = Uri.parse('/api/catalog/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ReturnModelCatalogOutModel, ReturnModelCatalogOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCatalogOutModel>> _apiCatalogCatalogIdEnablePut(
      {required int? catalogId}) {
    final Uri $url = Uri.parse('/api/catalog/${catalogId}/enable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelCatalogOutModel, ReturnModelCatalogOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCatalogOutModel>> _apiCatalogCatalogIdDisablePut(
      {required int? catalogId}) {
    final Uri $url = Uri.parse('/api/catalog/${catalogId}/disable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelCatalogOutModel, ReturnModelCatalogOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCatalogOutModel>> _apiCatalogCatalogIdArchivePut(
      {required int? catalogId}) {
    final Uri $url = Uri.parse('/api/catalog/${catalogId}/archive');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelCatalogOutModel, ReturnModelCatalogOutModel>($request);
  }

  @override
  Future<Response<ReturnListModelCatalogOutModel>> _apiCatalogSearchPost(
      {required CatalogSearchCriteriaModel? body}) {
    final Uri $url = Uri.parse('/api/catalog/search');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnListModelCatalogOutModel,
        ReturnListModelCatalogOutModel>($request);
  }

  @override
  Future<Response<List<EnumItemModel>>> _apiCourseStatusesGet() {
    final Uri $url = Uri.parse('/api/course/statuses');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<EnumItemModel>, EnumItemModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseOutModel>> _apiCourseCourseIdGet(
      {required int? courseId}) {
    final Uri $url = Uri.parse('/api/course/${courseId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelCourseOutModel, ReturnModelCourseOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseOutModel>> _apiCourseCourseIdPut({
    required int? courseId,
    required CourseUpdateModel? body,
  }) {
    final Uri $url = Uri.parse('/api/course/${courseId}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ReturnModelCourseOutModel, ReturnModelCourseOutModel>($request);
  }

  @override
  Future<Response<ReturnModel>> _apiCourseCourseIdDelete(
      {required int? courseId}) {
    final Uri $url = Uri.parse('/api/course/${courseId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModel, ReturnModel>($request);
  }

  @override
  Future<Response<ReturnListModelCourseOutModel>> _apiCourseGet() {
    final Uri $url = Uri.parse('/api/course/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnListModelCourseOutModel,
        ReturnListModelCourseOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseOutModel>> _apiCoursePost(
      {required CourseCreateModel? body}) {
    final Uri $url = Uri.parse('/api/course/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ReturnModelCourseOutModel, ReturnModelCourseOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseOutModel>> _apiCourseCourseIdEnablePut(
      {required int? courseId}) {
    final Uri $url = Uri.parse('/api/course/${courseId}/enable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelCourseOutModel, ReturnModelCourseOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseOutModel>> _apiCourseCourseIdDisablePut(
      {required int? courseId}) {
    final Uri $url = Uri.parse('/api/course/${courseId}/disable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelCourseOutModel, ReturnModelCourseOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseOutModel>> _apiCourseCourseIdArchivePut(
      {required int? courseId}) {
    final Uri $url = Uri.parse('/api/course/${courseId}/archive');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelCourseOutModel, ReturnModelCourseOutModel>($request);
  }

  @override
  Future<Response<ReturnListModelCourseBatchOutModel>>
      _apiCourseCourseIdBatchesGet({required int? courseId}) {
    final Uri $url = Uri.parse('/api/course/${courseId}/batches');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnListModelCourseBatchOutModel,
        ReturnListModelCourseBatchOutModel>($request);
  }

  @override
  Future<Response<ReturnListModelCourseMediaOutModel>>
      _apiCourseCourseIdMediaGet({required int? courseId}) {
    final Uri $url = Uri.parse('/api/course/${courseId}/media');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnListModelCourseMediaOutModel,
        ReturnListModelCourseMediaOutModel>($request);
  }

  @override
  Future<Response<ReturnListModelCourseUserOutModel>>
      _apiCourseCourseIdUsersGet({required int? courseId}) {
    final Uri $url = Uri.parse('/api/course/${courseId}/users');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnListModelCourseUserOutModel,
        ReturnListModelCourseUserOutModel>($request);
  }

  @override
  Future<Response<ReturnListModelCourseUserOutModel>> _apiUserUserIdCoursesGet(
      {required int? userId}) {
    final Uri $url = Uri.parse('/api/user/${userId}/courses');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnListModelCourseUserOutModel,
        ReturnListModelCourseUserOutModel>($request);
  }

  @override
  Future<Response<List<EnumItemModel>>> _apiCourseBatchStatusesGet() {
    final Uri $url = Uri.parse('/api/course_batch/statuses');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<EnumItemModel>, EnumItemModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseBatchOutModel>>
      _apiCourseBatchCourseBatchIdGet({required int? courseBatchId}) {
    final Uri $url = Uri.parse('/api/course_batch/${courseBatchId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelCourseBatchOutModel,
        ReturnModelCourseBatchOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseBatchOutModel>>
      _apiCourseBatchCourseBatchIdPut({
    required int? courseBatchId,
    required CourseBatchUpdateModel? body,
  }) {
    final Uri $url = Uri.parse('/api/course_batch/${courseBatchId}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelCourseBatchOutModel,
        ReturnModelCourseBatchOutModel>($request);
  }

  @override
  Future<Response<ReturnModel>> _apiCourseBatchCourseBatchIdDelete(
      {required int? courseBatchId}) {
    final Uri $url = Uri.parse('/api/course_batch/${courseBatchId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModel, ReturnModel>($request);
  }

  @override
  Future<Response<ReturnListModelCourseBatchOutModel>> _apiCourseBatchGet() {
    final Uri $url = Uri.parse('/api/course_batch/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnListModelCourseBatchOutModel,
        ReturnListModelCourseBatchOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseBatchOutModel>> _apiCourseBatchPost(
      {required CourseBatchCreateModel? body}) {
    final Uri $url = Uri.parse('/api/course_batch/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelCourseBatchOutModel,
        ReturnModelCourseBatchOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseBatchOutModel>>
      _apiCourseBatchCourseBatchIdEnablePut({required int? courseBatchId}) {
    final Uri $url = Uri.parse('/api/course_batch/${courseBatchId}/enable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelCourseBatchOutModel,
        ReturnModelCourseBatchOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseBatchOutModel>>
      _apiCourseBatchCourseBatchIdDisablePut({required int? courseBatchId}) {
    final Uri $url = Uri.parse('/api/course_batch/${courseBatchId}/disable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelCourseBatchOutModel,
        ReturnModelCourseBatchOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseBatchOutModel>>
      _apiCourseBatchCourseBatchIdArchivePut({required int? courseBatchId}) {
    final Uri $url = Uri.parse('/api/course_batch/${courseBatchId}/archive');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelCourseBatchOutModel,
        ReturnModelCourseBatchOutModel>($request);
  }

  @override
  Future<Response<ReturnListModelCourseMediaOutModel>>
      _apiCourseBatchCourseBatchIdMediaGet({required int? courseBatchId}) {
    final Uri $url = Uri.parse('/api/course_batch/${courseBatchId}/media');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnListModelCourseMediaOutModel,
        ReturnListModelCourseMediaOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdGet({required int? courseMediaId}) {
    final Uri $url = Uri.parse('/api/course_media/${courseMediaId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelCourseMediaOutModel,
        ReturnModelCourseMediaOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdPut({
    required int? courseMediaId,
    required CourseMediaUpdateModel? body,
  }) {
    final Uri $url = Uri.parse('/api/course_media/${courseMediaId}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelCourseMediaOutModel,
        ReturnModelCourseMediaOutModel>($request);
  }

  @override
  Future<Response<ReturnModel>> _apiCourseMediaCourseMediaIdDelete(
      {required int? courseMediaId}) {
    final Uri $url = Uri.parse('/api/course_media/${courseMediaId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModel, ReturnModel>($request);
  }

  @override
  Future<Response<ReturnListModelCourseMediaOutModel>> _apiCourseMediaGet() {
    final Uri $url = Uri.parse('/api/course_media/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnListModelCourseMediaOutModel,
        ReturnListModelCourseMediaOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseMediaOutModel>> _apiCourseMediaPost(
      {required CourseMediaCreateModel? body}) {
    final Uri $url = Uri.parse('/api/course_media/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelCourseMediaOutModel,
        ReturnModelCourseMediaOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdEnablePut({required int? courseMediaId}) {
    final Uri $url = Uri.parse('/api/course_media/${courseMediaId}/enable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelCourseMediaOutModel,
        ReturnModelCourseMediaOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdDisablePut({required int? courseMediaId}) {
    final Uri $url = Uri.parse('/api/course_media/${courseMediaId}/disable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelCourseMediaOutModel,
        ReturnModelCourseMediaOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdArchivePut({required int? courseMediaId}) {
    final Uri $url = Uri.parse('/api/course_media/${courseMediaId}/archive');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelCourseMediaOutModel,
        ReturnModelCourseMediaOutModel>($request);
  }

  @override
  Future<Response<List<EnumItemModel>>> _apiCourseMediaTypesGet() {
    final Uri $url = Uri.parse('/api/course_media/types');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<EnumItemModel>, EnumItemModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseUserOutModel>> _apiCourseUserCourseUserIdGet(
      {required int? courseUserId}) {
    final Uri $url = Uri.parse('/api/course_user/${courseUserId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelCourseUserOutModel,
        ReturnModelCourseUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseUserOutModel>>
      _apiCourseUserCourseUserIdPut({
    required int? courseUserId,
    required CourseUserUpdateModel? body,
  }) {
    final Uri $url = Uri.parse('/api/course_user/${courseUserId}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelCourseUserOutModel,
        ReturnModelCourseUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModel>> _apiCourseUserCourseUserIdDelete(
      {required int? courseUserId}) {
    final Uri $url = Uri.parse('/api/course_user/${courseUserId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModel, ReturnModel>($request);
  }

  @override
  Future<Response<ReturnListModelCourseUserOutModel>> _apiCourseUserGet() {
    final Uri $url = Uri.parse('/api/course_user/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnListModelCourseUserOutModel,
        ReturnListModelCourseUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseUserOutModel>> _apiCourseUserPost(
      {required CourseUserCreateModel? body}) {
    final Uri $url = Uri.parse('/api/course_user/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelCourseUserOutModel,
        ReturnModelCourseUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseUserOutModel>>
      _apiCourseUserCourseUserIdEnablePut({required int? courseUserId}) {
    final Uri $url = Uri.parse('/api/course_user/${courseUserId}/enable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelCourseUserOutModel,
        ReturnModelCourseUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseUserOutModel>>
      _apiCourseUserCourseUserIdDisablePut({required int? courseUserId}) {
    final Uri $url = Uri.parse('/api/course_user/${courseUserId}/disable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelCourseUserOutModel,
        ReturnModelCourseUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseUserOutModel>>
      _apiCourseUserCourseUserIdArchivePut({required int? courseUserId}) {
    final Uri $url = Uri.parse('/api/course_user/${courseUserId}/archive');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelCourseUserOutModel,
        ReturnModelCourseUserOutModel>($request);
  }

  @override
  Future<Response<List<EnumItemModel>>> _apiCourseUserStatusesGet() {
    final Uri $url = Uri.parse('/api/course_user/statuses');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<EnumItemModel>, EnumItemModel>($request);
  }

  @override
  Future<Response<ReturnListModelCourseOutModel>> _apiCourseSearchPost(
      {required CourseSearchCriteriaModel? body}) {
    final Uri $url = Uri.parse('/api/course/search');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnListModelCourseOutModel,
        ReturnListModelCourseOutModel>($request);
  }

  @override
  Future<Response<ReturnListModelCourseBatchOutModel>>
      _apiCourseBatchSearchPost(
          {required CourseBatchSearchCriteriaModel? body}) {
    final Uri $url = Uri.parse('/api/course_batch/search');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnListModelCourseBatchOutModel,
        ReturnListModelCourseBatchOutModel>($request);
  }

  @override
  Future<Response<ReturnListModelCourseMediaOutModel>>
      _apiCourseMediaSearchPost(
          {required CourseMediaSearchCriteriaModel? body}) {
    final Uri $url = Uri.parse('/api/course_media/search');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnListModelCourseMediaOutModel,
        ReturnListModelCourseMediaOutModel>($request);
  }

  @override
  Future<Response<ReturnListModelCourseUserOutModel>> _apiCourseUserSearchPost(
      {required CourseUserSearchCriteriaModel? body}) {
    final Uri $url = Uri.parse('/api/course_user/search');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnListModelCourseUserOutModel,
        ReturnListModelCourseUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdMoveToCoursePut({
    required int? courseMediaId,
    required int? newCourseId,
  }) {
    final Uri $url =
        Uri.parse('/api/course_media/${courseMediaId}/move_to_course');
    final Map<String, dynamic> $params = <String, dynamic>{
      'new_course_id': newCourseId
    };
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ReturnModelCourseMediaOutModel,
        ReturnModelCourseMediaOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdMoveToCourseBatchPut({
    required int? courseMediaId,
    required int? newCourseBatchId,
  }) {
    final Uri $url =
        Uri.parse('/api/course_media/${courseMediaId}/move_to_course_batch');
    final Map<String, dynamic> $params = <String, dynamic>{
      'new_course_batch_id': newCourseBatchId
    };
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ReturnModelCourseMediaOutModel,
        ReturnModelCourseMediaOutModel>($request);
  }

  @override
  Future<Response<ReturnModelCourseBatchOutModel>>
      _apiCourseBatchCourseBatchIdMoveToCoursePut({
    required int? courseBatchId,
    required int? newCourseId,
  }) {
    final Uri $url =
        Uri.parse('/api/course_batch/${courseBatchId}/move_to_course');
    final Map<String, dynamic> $params = <String, dynamic>{
      'new_course_id': newCourseId
    };
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ReturnModelCourseBatchOutModel,
        ReturnModelCourseBatchOutModel>($request);
  }

  @override
  Future<Response<List<EnumItemModel>>> _apiMessageTypesGet() {
    final Uri $url = Uri.parse('/api/message/types');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<EnumItemModel>, EnumItemModel>($request);
  }

  @override
  Future<Response<List<EnumItemModel>>> _apiMessageStatusesGet() {
    final Uri $url = Uri.parse('/api/message/statuses');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<EnumItemModel>, EnumItemModel>($request);
  }

  @override
  Future<Response<ReturnModelMessageOutModel>> _apiMessageMessageIdGet(
      {required int? messageId}) {
    final Uri $url = Uri.parse('/api/message/${messageId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelMessageOutModel, ReturnModelMessageOutModel>($request);
  }

  @override
  Future<Response<ReturnModelMessageOutModel>> _apiMessageMessageIdPut({
    required int? messageId,
    required MessageUpdateModel? body,
  }) {
    final Uri $url = Uri.parse('/api/message/${messageId}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ReturnModelMessageOutModel, ReturnModelMessageOutModel>($request);
  }

  @override
  Future<Response<ReturnModel>> _apiMessageMessageIdDelete(
      {required int? messageId}) {
    final Uri $url = Uri.parse('/api/message/${messageId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModel, ReturnModel>($request);
  }

  @override
  Future<Response<ReturnListModelMessageOutModel>> _apiMessageGet() {
    final Uri $url = Uri.parse('/api/message/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnListModelMessageOutModel,
        ReturnListModelMessageOutModel>($request);
  }

  @override
  Future<Response<ReturnModelMessageOutModel>> _apiMessagePost(
      {required MessageCreateModel? body}) {
    final Uri $url = Uri.parse('/api/message/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ReturnModelMessageOutModel, ReturnModelMessageOutModel>($request);
  }

  @override
  Future<Response<ReturnModelMessageOutModel>> _apiMessageMessageIdEnablePut(
      {required int? messageId}) {
    final Uri $url = Uri.parse('/api/message/${messageId}/enable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelMessageOutModel, ReturnModelMessageOutModel>($request);
  }

  @override
  Future<Response<ReturnModelMessageOutModel>> _apiMessageMessageIdDisablePut(
      {required int? messageId}) {
    final Uri $url = Uri.parse('/api/message/${messageId}/disable');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelMessageOutModel, ReturnModelMessageOutModel>($request);
  }

  @override
  Future<Response<ReturnModelMessageOutModel>> _apiMessageMessageIdArchivePut(
      {required int? messageId}) {
    final Uri $url = Uri.parse('/api/message/${messageId}/archive');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelMessageOutModel, ReturnModelMessageOutModel>($request);
  }

  @override
  Future<Response<ReturnModelTokenResponseModel>> _apiAuthLoginPost(
      {required LoginModel? body}) {
    final Uri $url = Uri.parse('/api/auth/login');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelTokenResponseModel,
        ReturnModelTokenResponseModel>($request);
  }

  @override
  Future<Response<ReturnModelTokenValidationModel>> _apiAuthValidatePost(
      {required String? token}) {
    final Uri $url = Uri.parse('/api/auth/validate');
    final Map<String, dynamic> $params = <String, dynamic>{'token': token};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ReturnModelTokenValidationModel,
        ReturnModelTokenValidationModel>($request);
  }

  @override
  Future<Response<ReturnModelUserOutModel>> _apiAuthMeGet() {
    final Uri $url = Uri.parse('/api/auth/me');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<ReturnModelUserOutModel, ReturnModelUserOutModel>($request);
  }

  @override
  Future<Response<ReturnModelTokenResponseModel>> _apiAuthRefreshPost() {
    final Uri $url = Uri.parse('/api/auth/refresh');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelTokenResponseModel,
        ReturnModelTokenResponseModel>($request);
  }

  @override
  Future<Response<ReturnModelOAuth2AuthUrlResponseModel>> _apiAuthGoogleUrlPost(
      {required OAuth2AuthUrlModel? body}) {
    final Uri $url = Uri.parse('/api/auth/google/url');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelOAuth2AuthUrlResponseModel,
        ReturnModelOAuth2AuthUrlResponseModel>($request);
  }

  @override
  Future<Response<ReturnModelOAuth2AuthUrlResponseModel>>
      _apiAuthMicrosoftUrlPost({required OAuth2AuthUrlModel? body}) {
    final Uri $url = Uri.parse('/api/auth/microsoft/url');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelOAuth2AuthUrlResponseModel,
        ReturnModelOAuth2AuthUrlResponseModel>($request);
  }

  @override
  Future<Response<ReturnModelTokenResponseModel>> _apiAuthGoogleCallbackPost(
      {required OAuth2CallbackModel? body}) {
    final Uri $url = Uri.parse('/api/auth/google/callback');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelTokenResponseModel,
        ReturnModelTokenResponseModel>($request);
  }

  @override
  Future<Response<ReturnModelTokenResponseModel>> _apiAuthMicrosoftCallbackPost(
      {required OAuth2CallbackModel? body}) {
    final Uri $url = Uri.parse('/api/auth/microsoft/callback');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelTokenResponseModel,
        ReturnModelTokenResponseModel>($request);
  }

  @override
  Future<Response<ReturnModelOAuth2ErrorModel>> _apiAuthErrorGet() {
    final Uri $url = Uri.parse('/api/auth/error');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReturnModelOAuth2ErrorModel,
        ReturnModelOAuth2ErrorModel>($request);
  }

  @override
  Future<Response<ReturnModelDict>> _apiAuthForgotPasswordPost(
      {required ForgotPasswordModel? body}) {
    final Uri $url = Uri.parse('/api/auth/forgot-password');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelDict, ReturnModelDict>($request);
  }

  @override
  Future<Response<ReturnModelPasswordResetTokenModel>>
      _apiAuthValidateResetTokenPost({required String? token}) {
    final Uri $url = Uri.parse('/api/auth/validate-reset-token');
    final Map<String, dynamic> $params = <String, dynamic>{'token': token};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ReturnModelPasswordResetTokenModel,
        ReturnModelPasswordResetTokenModel>($request);
  }

  @override
  Future<Response<ReturnModelDict>> _apiAuthResetPasswordPost(
      {required ResetPasswordModel? body}) {
    final Uri $url = Uri.parse('/api/auth/reset-password');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelDict, ReturnModelDict>($request);
  }

  @override
  Future<Response<ReturnModelDict>> _apiAuthChangePasswordPost(
      {required ChangePasswordModel? body}) {
    final Uri $url = Uri.parse('/api/auth/change-password');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnModelDict, ReturnModelDict>($request);
  }
}
