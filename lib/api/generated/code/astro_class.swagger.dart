// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;

part 'astro_class.swagger.chopper.dart';
part 'astro_class.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class AstroClass extends ChopperService {
  static AstroClass create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$AstroClass(client);
    }

    final newClient = ChopperClient(
        services: [_$AstroClass()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$AstroClass(newClient);
  }

  ///List Users
  Future<chopper.Response<ReturnListModelUserOutModel>> apiUsersSearchPost(
      {required UserSearchCriteriaModel? body}) {
    generatedMapping.putIfAbsent(ReturnListModelUserOutModel,
        () => ReturnListModelUserOutModel.fromJsonFactory);

    return _apiUsersSearchPost(body: body);
  }

  ///List Users
  @Post(
    path: '/api/users/search',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnListModelUserOutModel>> _apiUsersSearchPost(
      {@Body() required UserSearchCriteriaModel? body});

  ///Get User By Id
  ///@param user_id
  Future<chopper.Response<ReturnModelUserOutModel>> apiUsersUserIdGet(
      {required int? userId}) {
    generatedMapping.putIfAbsent(
        ReturnModelUserOutModel, () => ReturnModelUserOutModel.fromJsonFactory);

    return _apiUsersUserIdGet(userId: userId);
  }

  ///Get User By Id
  ///@param user_id
  @Get(path: '/api/users/{user_id}')
  Future<chopper.Response<ReturnModelUserOutModel>> _apiUsersUserIdGet(
      {@Path('user_id') required int? userId});

  ///Update User
  ///@param user_id
  Future<chopper.Response<ReturnModelUserOutModel>> apiUsersUserIdPut({
    required int? userId,
    required UserUpdateModel? body,
  }) {
    generatedMapping.putIfAbsent(
        ReturnModelUserOutModel, () => ReturnModelUserOutModel.fromJsonFactory);

    return _apiUsersUserIdPut(userId: userId, body: body);
  }

  ///Update User
  ///@param user_id
  @Put(
    path: '/api/users/{user_id}',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelUserOutModel>> _apiUsersUserIdPut({
    @Path('user_id') required int? userId,
    @Body() required UserUpdateModel? body,
  });

  ///Delete User
  ///@param user_id
  Future<chopper.Response<ReturnModel>> apiUsersUserIdDelete(
      {required int? userId}) {
    generatedMapping.putIfAbsent(
        ReturnModel, () => ReturnModel.fromJsonFactory);

    return _apiUsersUserIdDelete(userId: userId);
  }

  ///Delete User
  ///@param user_id
  @Delete(path: '/api/users/{user_id}')
  Future<chopper.Response<ReturnModel>> _apiUsersUserIdDelete(
      {@Path('user_id') required int? userId});

  ///Create User
  Future<chopper.Response<ReturnModelUserOutModel>> apiUsersPost(
      {required UserCreateModel? body}) {
    generatedMapping.putIfAbsent(
        ReturnModelUserOutModel, () => ReturnModelUserOutModel.fromJsonFactory);

    return _apiUsersPost(body: body);
  }

  ///Create User
  @Post(
    path: '/api/users',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelUserOutModel>> _apiUsersPost(
      {@Body() required UserCreateModel? body});

  ///Enable User
  ///@param user_id
  Future<chopper.Response<ReturnModelUserOutModel>> apiUsersUserIdEnablePut(
      {required int? userId}) {
    generatedMapping.putIfAbsent(
        ReturnModelUserOutModel, () => ReturnModelUserOutModel.fromJsonFactory);

    return _apiUsersUserIdEnablePut(userId: userId);
  }

  ///Enable User
  ///@param user_id
  @Put(
    path: '/api/users/{user_id}/enable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelUserOutModel>> _apiUsersUserIdEnablePut(
      {@Path('user_id') required int? userId});

  ///Disable User
  ///@param user_id
  Future<chopper.Response<ReturnModelUserOutModel>> apiUsersUserIdDisablePut(
      {required int? userId}) {
    generatedMapping.putIfAbsent(
        ReturnModelUserOutModel, () => ReturnModelUserOutModel.fromJsonFactory);

    return _apiUsersUserIdDisablePut(userId: userId);
  }

  ///Disable User
  ///@param user_id
  @Put(
    path: '/api/users/{user_id}/disable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelUserOutModel>> _apiUsersUserIdDisablePut(
      {@Path('user_id') required int? userId});

  ///Cancel User
  ///@param user_id
  Future<chopper.Response<ReturnModelUserOutModel>> apiUsersUserIdCancelPut(
      {required int? userId}) {
    generatedMapping.putIfAbsent(
        ReturnModelUserOutModel, () => ReturnModelUserOutModel.fromJsonFactory);

    return _apiUsersUserIdCancelPut(userId: userId);
  }

  ///Cancel User
  ///@param user_id
  @Put(
    path: '/api/users/{user_id}/cancel',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelUserOutModel>> _apiUsersUserIdCancelPut(
      {@Path('user_id') required int? userId});

  ///Block User
  ///@param user_id
  Future<chopper.Response<ReturnModelUserOutModel>> apiUsersUserIdBlockPut(
      {required int? userId}) {
    generatedMapping.putIfAbsent(
        ReturnModelUserOutModel, () => ReturnModelUserOutModel.fromJsonFactory);

    return _apiUsersUserIdBlockPut(userId: userId);
  }

  ///Block User
  ///@param user_id
  @Put(
    path: '/api/users/{user_id}/block',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelUserOutModel>> _apiUsersUserIdBlockPut(
      {@Path('user_id') required int? userId});

  ///Get User Status
  ///@param user_id
  Future<chopper.Response<ReturnModel>> apiUsersUserIdStatusGet(
      {required int? userId}) {
    generatedMapping.putIfAbsent(
        ReturnModel, () => ReturnModel.fromJsonFactory);

    return _apiUsersUserIdStatusGet(userId: userId);
  }

  ///Get User Status
  ///@param user_id
  @Get(path: '/api/users/{user_id}/status')
  Future<chopper.Response<ReturnModel>> _apiUsersUserIdStatusGet(
      {@Path('user_id') required int? userId});

  ///List Catalog Statuses
  Future<chopper.Response<List<EnumItemModel>>> apiCatalogStatusesGet() {
    generatedMapping.putIfAbsent(
        EnumItemModel, () => EnumItemModel.fromJsonFactory);

    return _apiCatalogStatusesGet();
  }

  ///List Catalog Statuses
  @Get(path: '/api/catalog/statuses')
  Future<chopper.Response<List<EnumItemModel>>> _apiCatalogStatusesGet();

  ///Get Catalog By Id
  ///@param catalog_id
  Future<chopper.Response<ReturnModelCatalogOutModel>> apiCatalogCatalogIdGet(
      {required int? catalogId}) {
    generatedMapping.putIfAbsent(ReturnModelCatalogOutModel,
        () => ReturnModelCatalogOutModel.fromJsonFactory);

    return _apiCatalogCatalogIdGet(catalogId: catalogId);
  }

  ///Get Catalog By Id
  ///@param catalog_id
  @Get(path: '/api/catalog/{catalog_id}')
  Future<chopper.Response<ReturnModelCatalogOutModel>> _apiCatalogCatalogIdGet(
      {@Path('catalog_id') required int? catalogId});

  ///Update Catalog
  ///@param catalog_id
  Future<chopper.Response<ReturnModelCatalogOutModel>> apiCatalogCatalogIdPut({
    required int? catalogId,
    required CatalogUpdateModel? body,
  }) {
    generatedMapping.putIfAbsent(ReturnModelCatalogOutModel,
        () => ReturnModelCatalogOutModel.fromJsonFactory);

    return _apiCatalogCatalogIdPut(catalogId: catalogId, body: body);
  }

  ///Update Catalog
  ///@param catalog_id
  @Put(
    path: '/api/catalog/{catalog_id}',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCatalogOutModel>> _apiCatalogCatalogIdPut({
    @Path('catalog_id') required int? catalogId,
    @Body() required CatalogUpdateModel? body,
  });

  ///Delete Catalog
  ///@param catalog_id
  Future<chopper.Response<ReturnModel>> apiCatalogCatalogIdDelete(
      {required int? catalogId}) {
    generatedMapping.putIfAbsent(
        ReturnModel, () => ReturnModel.fromJsonFactory);

    return _apiCatalogCatalogIdDelete(catalogId: catalogId);
  }

  ///Delete Catalog
  ///@param catalog_id
  @Delete(path: '/api/catalog/{catalog_id}')
  Future<chopper.Response<ReturnModel>> _apiCatalogCatalogIdDelete(
      {@Path('catalog_id') required int? catalogId});

  ///List Catalogs
  Future<chopper.Response<ReturnListModelCatalogOutModel>> apiCatalogGet() {
    generatedMapping.putIfAbsent(ReturnListModelCatalogOutModel,
        () => ReturnListModelCatalogOutModel.fromJsonFactory);

    return _apiCatalogGet();
  }

  ///List Catalogs
  @Get(path: '/api/catalog/')
  Future<chopper.Response<ReturnListModelCatalogOutModel>> _apiCatalogGet();

  ///Create Catalog
  Future<chopper.Response<ReturnModelCatalogOutModel>> apiCatalogPost(
      {required CatalogCreateModel? body}) {
    generatedMapping.putIfAbsent(ReturnModelCatalogOutModel,
        () => ReturnModelCatalogOutModel.fromJsonFactory);

    return _apiCatalogPost(body: body);
  }

  ///Create Catalog
  @Post(
    path: '/api/catalog/',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCatalogOutModel>> _apiCatalogPost(
      {@Body() required CatalogCreateModel? body});

  ///Enable Catalog
  ///@param catalog_id
  Future<chopper.Response<ReturnModelCatalogOutModel>>
      apiCatalogCatalogIdEnablePut({required int? catalogId}) {
    generatedMapping.putIfAbsent(ReturnModelCatalogOutModel,
        () => ReturnModelCatalogOutModel.fromJsonFactory);

    return _apiCatalogCatalogIdEnablePut(catalogId: catalogId);
  }

  ///Enable Catalog
  ///@param catalog_id
  @Put(
    path: '/api/catalog/{catalog_id}/enable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCatalogOutModel>>
      _apiCatalogCatalogIdEnablePut(
          {@Path('catalog_id') required int? catalogId});

  ///Disable Catalog
  ///@param catalog_id
  Future<chopper.Response<ReturnModelCatalogOutModel>>
      apiCatalogCatalogIdDisablePut({required int? catalogId}) {
    generatedMapping.putIfAbsent(ReturnModelCatalogOutModel,
        () => ReturnModelCatalogOutModel.fromJsonFactory);

    return _apiCatalogCatalogIdDisablePut(catalogId: catalogId);
  }

  ///Disable Catalog
  ///@param catalog_id
  @Put(
    path: '/api/catalog/{catalog_id}/disable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCatalogOutModel>>
      _apiCatalogCatalogIdDisablePut(
          {@Path('catalog_id') required int? catalogId});

  ///Archive Catalog
  ///@param catalog_id
  Future<chopper.Response<ReturnModelCatalogOutModel>>
      apiCatalogCatalogIdArchivePut({required int? catalogId}) {
    generatedMapping.putIfAbsent(ReturnModelCatalogOutModel,
        () => ReturnModelCatalogOutModel.fromJsonFactory);

    return _apiCatalogCatalogIdArchivePut(catalogId: catalogId);
  }

  ///Archive Catalog
  ///@param catalog_id
  @Put(
    path: '/api/catalog/{catalog_id}/archive',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCatalogOutModel>>
      _apiCatalogCatalogIdArchivePut(
          {@Path('catalog_id') required int? catalogId});

  ///Search Catalogs
  Future<chopper.Response<ReturnListModelCatalogOutModel>> apiCatalogSearchPost(
      {required CatalogSearchCriteriaModel? body}) {
    generatedMapping.putIfAbsent(ReturnListModelCatalogOutModel,
        () => ReturnListModelCatalogOutModel.fromJsonFactory);

    return _apiCatalogSearchPost(body: body);
  }

  ///Search Catalogs
  @Post(
    path: '/api/catalog/search',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnListModelCatalogOutModel>>
      _apiCatalogSearchPost(
          {@Body() required CatalogSearchCriteriaModel? body});

  ///List Course Statuses
  Future<chopper.Response<List<EnumItemModel>>> apiCourseStatusesGet() {
    generatedMapping.putIfAbsent(
        EnumItemModel, () => EnumItemModel.fromJsonFactory);

    return _apiCourseStatusesGet();
  }

  ///List Course Statuses
  @Get(path: '/api/course/statuses')
  Future<chopper.Response<List<EnumItemModel>>> _apiCourseStatusesGet();

  ///Get Course By Id
  ///@param course_id
  Future<chopper.Response<ReturnModelCourseOutModel>> apiCourseCourseIdGet(
      {required int? courseId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseOutModel,
        () => ReturnModelCourseOutModel.fromJsonFactory);

    return _apiCourseCourseIdGet(courseId: courseId);
  }

  ///Get Course By Id
  ///@param course_id
  @Get(path: '/api/course/{course_id}')
  Future<chopper.Response<ReturnModelCourseOutModel>> _apiCourseCourseIdGet(
      {@Path('course_id') required int? courseId});

  ///Update Course
  ///@param course_id
  Future<chopper.Response<ReturnModelCourseOutModel>> apiCourseCourseIdPut({
    required int? courseId,
    required CourseUpdateModel? body,
  }) {
    generatedMapping.putIfAbsent(ReturnModelCourseOutModel,
        () => ReturnModelCourseOutModel.fromJsonFactory);

    return _apiCourseCourseIdPut(courseId: courseId, body: body);
  }

  ///Update Course
  ///@param course_id
  @Put(
    path: '/api/course/{course_id}',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseOutModel>> _apiCourseCourseIdPut({
    @Path('course_id') required int? courseId,
    @Body() required CourseUpdateModel? body,
  });

  ///Delete Course
  ///@param course_id
  Future<chopper.Response<ReturnModel>> apiCourseCourseIdDelete(
      {required int? courseId}) {
    generatedMapping.putIfAbsent(
        ReturnModel, () => ReturnModel.fromJsonFactory);

    return _apiCourseCourseIdDelete(courseId: courseId);
  }

  ///Delete Course
  ///@param course_id
  @Delete(path: '/api/course/{course_id}')
  Future<chopper.Response<ReturnModel>> _apiCourseCourseIdDelete(
      {@Path('course_id') required int? courseId});

  ///List Courses
  Future<chopper.Response<ReturnListModelCourseOutModel>> apiCourseGet() {
    generatedMapping.putIfAbsent(ReturnListModelCourseOutModel,
        () => ReturnListModelCourseOutModel.fromJsonFactory);

    return _apiCourseGet();
  }

  ///List Courses
  @Get(path: '/api/course/')
  Future<chopper.Response<ReturnListModelCourseOutModel>> _apiCourseGet();

  ///Create Course
  Future<chopper.Response<ReturnModelCourseOutModel>> apiCoursePost(
      {required CourseCreateModel? body}) {
    generatedMapping.putIfAbsent(ReturnModelCourseOutModel,
        () => ReturnModelCourseOutModel.fromJsonFactory);

    return _apiCoursePost(body: body);
  }

  ///Create Course
  @Post(
    path: '/api/course/',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseOutModel>> _apiCoursePost(
      {@Body() required CourseCreateModel? body});

  ///Enable Course
  ///@param course_id
  Future<chopper.Response<ReturnModelCourseOutModel>>
      apiCourseCourseIdEnablePut({required int? courseId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseOutModel,
        () => ReturnModelCourseOutModel.fromJsonFactory);

    return _apiCourseCourseIdEnablePut(courseId: courseId);
  }

  ///Enable Course
  ///@param course_id
  @Put(
    path: '/api/course/{course_id}/enable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseOutModel>>
      _apiCourseCourseIdEnablePut({@Path('course_id') required int? courseId});

  ///Disable Course
  ///@param course_id
  Future<chopper.Response<ReturnModelCourseOutModel>>
      apiCourseCourseIdDisablePut({required int? courseId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseOutModel,
        () => ReturnModelCourseOutModel.fromJsonFactory);

    return _apiCourseCourseIdDisablePut(courseId: courseId);
  }

  ///Disable Course
  ///@param course_id
  @Put(
    path: '/api/course/{course_id}/disable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseOutModel>>
      _apiCourseCourseIdDisablePut({@Path('course_id') required int? courseId});

  ///Archive Course
  ///@param course_id
  Future<chopper.Response<ReturnModelCourseOutModel>>
      apiCourseCourseIdArchivePut({required int? courseId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseOutModel,
        () => ReturnModelCourseOutModel.fromJsonFactory);

    return _apiCourseCourseIdArchivePut(courseId: courseId);
  }

  ///Archive Course
  ///@param course_id
  @Put(
    path: '/api/course/{course_id}/archive',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseOutModel>>
      _apiCourseCourseIdArchivePut({@Path('course_id') required int? courseId});

  ///List Batches For Course
  ///@param course_id
  Future<chopper.Response<ReturnListModelCourseBatchOutModel>>
      apiCourseCourseIdBatchesGet({required int? courseId}) {
    generatedMapping.putIfAbsent(ReturnListModelCourseBatchOutModel,
        () => ReturnListModelCourseBatchOutModel.fromJsonFactory);

    return _apiCourseCourseIdBatchesGet(courseId: courseId);
  }

  ///List Batches For Course
  ///@param course_id
  @Get(path: '/api/course/{course_id}/batches')
  Future<chopper.Response<ReturnListModelCourseBatchOutModel>>
      _apiCourseCourseIdBatchesGet({@Path('course_id') required int? courseId});

  ///List Media For Course
  ///@param course_id
  Future<chopper.Response<ReturnListModelCourseMediaOutModel>>
      apiCourseCourseIdMediaGet({required int? courseId}) {
    generatedMapping.putIfAbsent(ReturnListModelCourseMediaOutModel,
        () => ReturnListModelCourseMediaOutModel.fromJsonFactory);

    return _apiCourseCourseIdMediaGet(courseId: courseId);
  }

  ///List Media For Course
  ///@param course_id
  @Get(path: '/api/course/{course_id}/media')
  Future<chopper.Response<ReturnListModelCourseMediaOutModel>>
      _apiCourseCourseIdMediaGet({@Path('course_id') required int? courseId});

  ///List Users For Course
  ///@param course_id
  Future<chopper.Response<ReturnListModelCourseUserOutModel>>
      apiCourseCourseIdUsersGet({required int? courseId}) {
    generatedMapping.putIfAbsent(ReturnListModelCourseUserOutModel,
        () => ReturnListModelCourseUserOutModel.fromJsonFactory);

    return _apiCourseCourseIdUsersGet(courseId: courseId);
  }

  ///List Users For Course
  ///@param course_id
  @Get(path: '/api/course/{course_id}/users')
  Future<chopper.Response<ReturnListModelCourseUserOutModel>>
      _apiCourseCourseIdUsersGet({@Path('course_id') required int? courseId});

  ///List Courses For User
  ///@param user_id
  Future<chopper.Response<ReturnListModelCourseUserOutModel>>
      apiUserUserIdCoursesGet({required int? userId}) {
    generatedMapping.putIfAbsent(ReturnListModelCourseUserOutModel,
        () => ReturnListModelCourseUserOutModel.fromJsonFactory);

    return _apiUserUserIdCoursesGet(userId: userId);
  }

  ///List Courses For User
  ///@param user_id
  @Get(path: '/api/user/{user_id}/courses')
  Future<chopper.Response<ReturnListModelCourseUserOutModel>>
      _apiUserUserIdCoursesGet({@Path('user_id') required int? userId});

  ///List Course Batch Statuses
  Future<chopper.Response<List<EnumItemModel>>> apiCourseBatchStatusesGet() {
    generatedMapping.putIfAbsent(
        EnumItemModel, () => EnumItemModel.fromJsonFactory);

    return _apiCourseBatchStatusesGet();
  }

  ///List Course Batch Statuses
  @Get(path: '/api/course_batch/statuses')
  Future<chopper.Response<List<EnumItemModel>>> _apiCourseBatchStatusesGet();

  ///Get Course Batch By Id
  ///@param course_batch_id
  Future<chopper.Response<ReturnModelCourseBatchOutModel>>
      apiCourseBatchCourseBatchIdGet({required int? courseBatchId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseBatchOutModel,
        () => ReturnModelCourseBatchOutModel.fromJsonFactory);

    return _apiCourseBatchCourseBatchIdGet(courseBatchId: courseBatchId);
  }

  ///Get Course Batch By Id
  ///@param course_batch_id
  @Get(path: '/api/course_batch/{course_batch_id}')
  Future<chopper.Response<ReturnModelCourseBatchOutModel>>
      _apiCourseBatchCourseBatchIdGet(
          {@Path('course_batch_id') required int? courseBatchId});

  ///Update Course Batch
  ///@param course_batch_id
  Future<chopper.Response<ReturnModelCourseBatchOutModel>>
      apiCourseBatchCourseBatchIdPut({
    required int? courseBatchId,
    required CourseBatchUpdateModel? body,
  }) {
    generatedMapping.putIfAbsent(ReturnModelCourseBatchOutModel,
        () => ReturnModelCourseBatchOutModel.fromJsonFactory);

    return _apiCourseBatchCourseBatchIdPut(
        courseBatchId: courseBatchId, body: body);
  }

  ///Update Course Batch
  ///@param course_batch_id
  @Put(
    path: '/api/course_batch/{course_batch_id}',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseBatchOutModel>>
      _apiCourseBatchCourseBatchIdPut({
    @Path('course_batch_id') required int? courseBatchId,
    @Body() required CourseBatchUpdateModel? body,
  });

  ///Delete Course Batch
  ///@param course_batch_id
  Future<chopper.Response<ReturnModel>> apiCourseBatchCourseBatchIdDelete(
      {required int? courseBatchId}) {
    generatedMapping.putIfAbsent(
        ReturnModel, () => ReturnModel.fromJsonFactory);

    return _apiCourseBatchCourseBatchIdDelete(courseBatchId: courseBatchId);
  }

  ///Delete Course Batch
  ///@param course_batch_id
  @Delete(path: '/api/course_batch/{course_batch_id}')
  Future<chopper.Response<ReturnModel>> _apiCourseBatchCourseBatchIdDelete(
      {@Path('course_batch_id') required int? courseBatchId});

  ///List Course Batches
  Future<chopper.Response<ReturnListModelCourseBatchOutModel>>
      apiCourseBatchGet() {
    generatedMapping.putIfAbsent(ReturnListModelCourseBatchOutModel,
        () => ReturnListModelCourseBatchOutModel.fromJsonFactory);

    return _apiCourseBatchGet();
  }

  ///List Course Batches
  @Get(path: '/api/course_batch/')
  Future<chopper.Response<ReturnListModelCourseBatchOutModel>>
      _apiCourseBatchGet();

  ///Create Course Batch
  Future<chopper.Response<ReturnModelCourseBatchOutModel>> apiCourseBatchPost(
      {required CourseBatchCreateModel? body}) {
    generatedMapping.putIfAbsent(ReturnModelCourseBatchOutModel,
        () => ReturnModelCourseBatchOutModel.fromJsonFactory);

    return _apiCourseBatchPost(body: body);
  }

  ///Create Course Batch
  @Post(
    path: '/api/course_batch/',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseBatchOutModel>> _apiCourseBatchPost(
      {@Body() required CourseBatchCreateModel? body});

  ///Enable Course Batch
  ///@param course_batch_id
  Future<chopper.Response<ReturnModelCourseBatchOutModel>>
      apiCourseBatchCourseBatchIdEnablePut({required int? courseBatchId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseBatchOutModel,
        () => ReturnModelCourseBatchOutModel.fromJsonFactory);

    return _apiCourseBatchCourseBatchIdEnablePut(courseBatchId: courseBatchId);
  }

  ///Enable Course Batch
  ///@param course_batch_id
  @Put(
    path: '/api/course_batch/{course_batch_id}/enable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseBatchOutModel>>
      _apiCourseBatchCourseBatchIdEnablePut(
          {@Path('course_batch_id') required int? courseBatchId});

  ///Disable Course Batch
  ///@param course_batch_id
  Future<chopper.Response<ReturnModelCourseBatchOutModel>>
      apiCourseBatchCourseBatchIdDisablePut({required int? courseBatchId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseBatchOutModel,
        () => ReturnModelCourseBatchOutModel.fromJsonFactory);

    return _apiCourseBatchCourseBatchIdDisablePut(courseBatchId: courseBatchId);
  }

  ///Disable Course Batch
  ///@param course_batch_id
  @Put(
    path: '/api/course_batch/{course_batch_id}/disable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseBatchOutModel>>
      _apiCourseBatchCourseBatchIdDisablePut(
          {@Path('course_batch_id') required int? courseBatchId});

  ///Archive Course Batch
  ///@param course_batch_id
  Future<chopper.Response<ReturnModelCourseBatchOutModel>>
      apiCourseBatchCourseBatchIdArchivePut({required int? courseBatchId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseBatchOutModel,
        () => ReturnModelCourseBatchOutModel.fromJsonFactory);

    return _apiCourseBatchCourseBatchIdArchivePut(courseBatchId: courseBatchId);
  }

  ///Archive Course Batch
  ///@param course_batch_id
  @Put(
    path: '/api/course_batch/{course_batch_id}/archive',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseBatchOutModel>>
      _apiCourseBatchCourseBatchIdArchivePut(
          {@Path('course_batch_id') required int? courseBatchId});

  ///List Media For Course Batch
  ///@param course_batch_id
  Future<chopper.Response<ReturnListModelCourseMediaOutModel>>
      apiCourseBatchCourseBatchIdMediaGet({required int? courseBatchId}) {
    generatedMapping.putIfAbsent(ReturnListModelCourseMediaOutModel,
        () => ReturnListModelCourseMediaOutModel.fromJsonFactory);

    return _apiCourseBatchCourseBatchIdMediaGet(courseBatchId: courseBatchId);
  }

  ///List Media For Course Batch
  ///@param course_batch_id
  @Get(path: '/api/course_batch/{course_batch_id}/media')
  Future<chopper.Response<ReturnListModelCourseMediaOutModel>>
      _apiCourseBatchCourseBatchIdMediaGet(
          {@Path('course_batch_id') required int? courseBatchId});

  ///Get Course Media By Id
  ///@param course_media_id
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      apiCourseMediaCourseMediaIdGet({required int? courseMediaId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseMediaOutModel,
        () => ReturnModelCourseMediaOutModel.fromJsonFactory);

    return _apiCourseMediaCourseMediaIdGet(courseMediaId: courseMediaId);
  }

  ///Get Course Media By Id
  ///@param course_media_id
  @Get(path: '/api/course_media/{course_media_id}')
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdGet(
          {@Path('course_media_id') required int? courseMediaId});

  ///Update Course Media
  ///@param course_media_id
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      apiCourseMediaCourseMediaIdPut({
    required int? courseMediaId,
    required CourseMediaUpdateModel? body,
  }) {
    generatedMapping.putIfAbsent(ReturnModelCourseMediaOutModel,
        () => ReturnModelCourseMediaOutModel.fromJsonFactory);

    return _apiCourseMediaCourseMediaIdPut(
        courseMediaId: courseMediaId, body: body);
  }

  ///Update Course Media
  ///@param course_media_id
  @Put(
    path: '/api/course_media/{course_media_id}',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdPut({
    @Path('course_media_id') required int? courseMediaId,
    @Body() required CourseMediaUpdateModel? body,
  });

  ///Delete Course Media
  ///@param course_media_id
  Future<chopper.Response<ReturnModel>> apiCourseMediaCourseMediaIdDelete(
      {required int? courseMediaId}) {
    generatedMapping.putIfAbsent(
        ReturnModel, () => ReturnModel.fromJsonFactory);

    return _apiCourseMediaCourseMediaIdDelete(courseMediaId: courseMediaId);
  }

  ///Delete Course Media
  ///@param course_media_id
  @Delete(path: '/api/course_media/{course_media_id}')
  Future<chopper.Response<ReturnModel>> _apiCourseMediaCourseMediaIdDelete(
      {@Path('course_media_id') required int? courseMediaId});

  ///List Course Media
  Future<chopper.Response<ReturnListModelCourseMediaOutModel>>
      apiCourseMediaGet() {
    generatedMapping.putIfAbsent(ReturnListModelCourseMediaOutModel,
        () => ReturnListModelCourseMediaOutModel.fromJsonFactory);

    return _apiCourseMediaGet();
  }

  ///List Course Media
  @Get(path: '/api/course_media/')
  Future<chopper.Response<ReturnListModelCourseMediaOutModel>>
      _apiCourseMediaGet();

  ///Create Course Media
  Future<chopper.Response<ReturnModelCourseMediaOutModel>> apiCourseMediaPost(
      {required CourseMediaCreateModel? body}) {
    generatedMapping.putIfAbsent(ReturnModelCourseMediaOutModel,
        () => ReturnModelCourseMediaOutModel.fromJsonFactory);

    return _apiCourseMediaPost(body: body);
  }

  ///Create Course Media
  @Post(
    path: '/api/course_media/',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseMediaOutModel>> _apiCourseMediaPost(
      {@Body() required CourseMediaCreateModel? body});

  ///Enable Course Media
  ///@param course_media_id
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      apiCourseMediaCourseMediaIdEnablePut({required int? courseMediaId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseMediaOutModel,
        () => ReturnModelCourseMediaOutModel.fromJsonFactory);

    return _apiCourseMediaCourseMediaIdEnablePut(courseMediaId: courseMediaId);
  }

  ///Enable Course Media
  ///@param course_media_id
  @Put(
    path: '/api/course_media/{course_media_id}/enable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdEnablePut(
          {@Path('course_media_id') required int? courseMediaId});

  ///Disable Course Media
  ///@param course_media_id
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      apiCourseMediaCourseMediaIdDisablePut({required int? courseMediaId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseMediaOutModel,
        () => ReturnModelCourseMediaOutModel.fromJsonFactory);

    return _apiCourseMediaCourseMediaIdDisablePut(courseMediaId: courseMediaId);
  }

  ///Disable Course Media
  ///@param course_media_id
  @Put(
    path: '/api/course_media/{course_media_id}/disable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdDisablePut(
          {@Path('course_media_id') required int? courseMediaId});

  ///Archive Course Media
  ///@param course_media_id
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      apiCourseMediaCourseMediaIdArchivePut({required int? courseMediaId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseMediaOutModel,
        () => ReturnModelCourseMediaOutModel.fromJsonFactory);

    return _apiCourseMediaCourseMediaIdArchivePut(courseMediaId: courseMediaId);
  }

  ///Archive Course Media
  ///@param course_media_id
  @Put(
    path: '/api/course_media/{course_media_id}/archive',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdArchivePut(
          {@Path('course_media_id') required int? courseMediaId});

  ///List Course Media Types
  Future<chopper.Response<List<EnumItemModel>>> apiCourseMediaTypesGet() {
    generatedMapping.putIfAbsent(
        EnumItemModel, () => EnumItemModel.fromJsonFactory);

    return _apiCourseMediaTypesGet();
  }

  ///List Course Media Types
  @Get(path: '/api/course_media/types')
  Future<chopper.Response<List<EnumItemModel>>> _apiCourseMediaTypesGet();

  ///Get Course User By Id
  ///@param course_user_id
  Future<chopper.Response<ReturnModelCourseUserOutModel>>
      apiCourseUserCourseUserIdGet({required int? courseUserId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseUserOutModel,
        () => ReturnModelCourseUserOutModel.fromJsonFactory);

    return _apiCourseUserCourseUserIdGet(courseUserId: courseUserId);
  }

  ///Get Course User By Id
  ///@param course_user_id
  @Get(path: '/api/course_user/{course_user_id}')
  Future<chopper.Response<ReturnModelCourseUserOutModel>>
      _apiCourseUserCourseUserIdGet(
          {@Path('course_user_id') required int? courseUserId});

  ///Update Course User
  ///@param course_user_id
  Future<chopper.Response<ReturnModelCourseUserOutModel>>
      apiCourseUserCourseUserIdPut({
    required int? courseUserId,
    required CourseUserUpdateModel? body,
  }) {
    generatedMapping.putIfAbsent(ReturnModelCourseUserOutModel,
        () => ReturnModelCourseUserOutModel.fromJsonFactory);

    return _apiCourseUserCourseUserIdPut(
        courseUserId: courseUserId, body: body);
  }

  ///Update Course User
  ///@param course_user_id
  @Put(
    path: '/api/course_user/{course_user_id}',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseUserOutModel>>
      _apiCourseUserCourseUserIdPut({
    @Path('course_user_id') required int? courseUserId,
    @Body() required CourseUserUpdateModel? body,
  });

  ///Delete Course User
  ///@param course_user_id
  Future<chopper.Response<ReturnModel>> apiCourseUserCourseUserIdDelete(
      {required int? courseUserId}) {
    generatedMapping.putIfAbsent(
        ReturnModel, () => ReturnModel.fromJsonFactory);

    return _apiCourseUserCourseUserIdDelete(courseUserId: courseUserId);
  }

  ///Delete Course User
  ///@param course_user_id
  @Delete(path: '/api/course_user/{course_user_id}')
  Future<chopper.Response<ReturnModel>> _apiCourseUserCourseUserIdDelete(
      {@Path('course_user_id') required int? courseUserId});

  ///List Course Users
  Future<chopper.Response<ReturnListModelCourseUserOutModel>>
      apiCourseUserGet() {
    generatedMapping.putIfAbsent(ReturnListModelCourseUserOutModel,
        () => ReturnListModelCourseUserOutModel.fromJsonFactory);

    return _apiCourseUserGet();
  }

  ///List Course Users
  @Get(path: '/api/course_user/')
  Future<chopper.Response<ReturnListModelCourseUserOutModel>>
      _apiCourseUserGet();

  ///Create Course User
  Future<chopper.Response<ReturnModelCourseUserOutModel>> apiCourseUserPost(
      {required CourseUserCreateModel? body}) {
    generatedMapping.putIfAbsent(ReturnModelCourseUserOutModel,
        () => ReturnModelCourseUserOutModel.fromJsonFactory);

    return _apiCourseUserPost(body: body);
  }

  ///Create Course User
  @Post(
    path: '/api/course_user/',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseUserOutModel>> _apiCourseUserPost(
      {@Body() required CourseUserCreateModel? body});

  ///Enable Course User
  ///@param course_user_id
  Future<chopper.Response<ReturnModelCourseUserOutModel>>
      apiCourseUserCourseUserIdEnablePut({required int? courseUserId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseUserOutModel,
        () => ReturnModelCourseUserOutModel.fromJsonFactory);

    return _apiCourseUserCourseUserIdEnablePut(courseUserId: courseUserId);
  }

  ///Enable Course User
  ///@param course_user_id
  @Put(
    path: '/api/course_user/{course_user_id}/enable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseUserOutModel>>
      _apiCourseUserCourseUserIdEnablePut(
          {@Path('course_user_id') required int? courseUserId});

  ///Disable Course User
  ///@param course_user_id
  Future<chopper.Response<ReturnModelCourseUserOutModel>>
      apiCourseUserCourseUserIdDisablePut({required int? courseUserId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseUserOutModel,
        () => ReturnModelCourseUserOutModel.fromJsonFactory);

    return _apiCourseUserCourseUserIdDisablePut(courseUserId: courseUserId);
  }

  ///Disable Course User
  ///@param course_user_id
  @Put(
    path: '/api/course_user/{course_user_id}/disable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseUserOutModel>>
      _apiCourseUserCourseUserIdDisablePut(
          {@Path('course_user_id') required int? courseUserId});

  ///Archive Course User
  ///@param course_user_id
  Future<chopper.Response<ReturnModelCourseUserOutModel>>
      apiCourseUserCourseUserIdArchivePut({required int? courseUserId}) {
    generatedMapping.putIfAbsent(ReturnModelCourseUserOutModel,
        () => ReturnModelCourseUserOutModel.fromJsonFactory);

    return _apiCourseUserCourseUserIdArchivePut(courseUserId: courseUserId);
  }

  ///Archive Course User
  ///@param course_user_id
  @Put(
    path: '/api/course_user/{course_user_id}/archive',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseUserOutModel>>
      _apiCourseUserCourseUserIdArchivePut(
          {@Path('course_user_id') required int? courseUserId});

  ///List Course User Statuses
  Future<chopper.Response<List<EnumItemModel>>> apiCourseUserStatusesGet() {
    generatedMapping.putIfAbsent(
        EnumItemModel, () => EnumItemModel.fromJsonFactory);

    return _apiCourseUserStatusesGet();
  }

  ///List Course User Statuses
  @Get(path: '/api/course_user/statuses')
  Future<chopper.Response<List<EnumItemModel>>> _apiCourseUserStatusesGet();

  ///Search Courses
  Future<chopper.Response<ReturnListModelCourseOutModel>> apiCourseSearchPost(
      {required CourseSearchCriteriaModel? body}) {
    generatedMapping.putIfAbsent(ReturnListModelCourseOutModel,
        () => ReturnListModelCourseOutModel.fromJsonFactory);

    return _apiCourseSearchPost(body: body);
  }

  ///Search Courses
  @Post(
    path: '/api/course/search',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnListModelCourseOutModel>> _apiCourseSearchPost(
      {@Body() required CourseSearchCriteriaModel? body});

  ///Search Course Batches
  Future<chopper.Response<ReturnListModelCourseBatchOutModel>>
      apiCourseBatchSearchPost(
          {required CourseBatchSearchCriteriaModel? body}) {
    generatedMapping.putIfAbsent(ReturnListModelCourseBatchOutModel,
        () => ReturnListModelCourseBatchOutModel.fromJsonFactory);

    return _apiCourseBatchSearchPost(body: body);
  }

  ///Search Course Batches
  @Post(
    path: '/api/course_batch/search',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnListModelCourseBatchOutModel>>
      _apiCourseBatchSearchPost(
          {@Body() required CourseBatchSearchCriteriaModel? body});

  ///Search Course Media
  Future<chopper.Response<ReturnListModelCourseMediaOutModel>>
      apiCourseMediaSearchPost(
          {required CourseMediaSearchCriteriaModel? body}) {
    generatedMapping.putIfAbsent(ReturnListModelCourseMediaOutModel,
        () => ReturnListModelCourseMediaOutModel.fromJsonFactory);

    return _apiCourseMediaSearchPost(body: body);
  }

  ///Search Course Media
  @Post(
    path: '/api/course_media/search',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnListModelCourseMediaOutModel>>
      _apiCourseMediaSearchPost(
          {@Body() required CourseMediaSearchCriteriaModel? body});

  ///Search Course Users
  Future<chopper.Response<ReturnListModelCourseUserOutModel>>
      apiCourseUserSearchPost({required CourseUserSearchCriteriaModel? body}) {
    generatedMapping.putIfAbsent(ReturnListModelCourseUserOutModel,
        () => ReturnListModelCourseUserOutModel.fromJsonFactory);

    return _apiCourseUserSearchPost(body: body);
  }

  ///Search Course Users
  @Post(
    path: '/api/course_user/search',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnListModelCourseUserOutModel>>
      _apiCourseUserSearchPost(
          {@Body() required CourseUserSearchCriteriaModel? body});

  ///Move Course Media To Course
  ///@param course_media_id
  ///@param new_course_id
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      apiCourseMediaCourseMediaIdMoveToCoursePut({
    required int? courseMediaId,
    required int? newCourseId,
  }) {
    generatedMapping.putIfAbsent(ReturnModelCourseMediaOutModel,
        () => ReturnModelCourseMediaOutModel.fromJsonFactory);

    return _apiCourseMediaCourseMediaIdMoveToCoursePut(
        courseMediaId: courseMediaId, newCourseId: newCourseId);
  }

  ///Move Course Media To Course
  ///@param course_media_id
  ///@param new_course_id
  @Put(
    path: '/api/course_media/{course_media_id}/move_to_course',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdMoveToCoursePut({
    @Path('course_media_id') required int? courseMediaId,
    @Query('new_course_id') required int? newCourseId,
  });

  ///Move Course Media To Course Batch
  ///@param course_media_id
  ///@param new_course_batch_id
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      apiCourseMediaCourseMediaIdMoveToCourseBatchPut({
    required int? courseMediaId,
    required int? newCourseBatchId,
  }) {
    generatedMapping.putIfAbsent(ReturnModelCourseMediaOutModel,
        () => ReturnModelCourseMediaOutModel.fromJsonFactory);

    return _apiCourseMediaCourseMediaIdMoveToCourseBatchPut(
        courseMediaId: courseMediaId, newCourseBatchId: newCourseBatchId);
  }

  ///Move Course Media To Course Batch
  ///@param course_media_id
  ///@param new_course_batch_id
  @Put(
    path: '/api/course_media/{course_media_id}/move_to_course_batch',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseMediaOutModel>>
      _apiCourseMediaCourseMediaIdMoveToCourseBatchPut({
    @Path('course_media_id') required int? courseMediaId,
    @Query('new_course_batch_id') required int? newCourseBatchId,
  });

  ///Move Course Batch To Course
  ///@param course_batch_id
  ///@param new_course_id
  Future<chopper.Response<ReturnModelCourseBatchOutModel>>
      apiCourseBatchCourseBatchIdMoveToCoursePut({
    required int? courseBatchId,
    required int? newCourseId,
  }) {
    generatedMapping.putIfAbsent(ReturnModelCourseBatchOutModel,
        () => ReturnModelCourseBatchOutModel.fromJsonFactory);

    return _apiCourseBatchCourseBatchIdMoveToCoursePut(
        courseBatchId: courseBatchId, newCourseId: newCourseId);
  }

  ///Move Course Batch To Course
  ///@param course_batch_id
  ///@param new_course_id
  @Put(
    path: '/api/course_batch/{course_batch_id}/move_to_course',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelCourseBatchOutModel>>
      _apiCourseBatchCourseBatchIdMoveToCoursePut({
    @Path('course_batch_id') required int? courseBatchId,
    @Query('new_course_id') required int? newCourseId,
  });

  ///List Message Types
  Future<chopper.Response<List<EnumItemModel>>> apiMessageTypesGet() {
    generatedMapping.putIfAbsent(
        EnumItemModel, () => EnumItemModel.fromJsonFactory);

    return _apiMessageTypesGet();
  }

  ///List Message Types
  @Get(path: '/api/message/types')
  Future<chopper.Response<List<EnumItemModel>>> _apiMessageTypesGet();

  ///List Message Statuses
  Future<chopper.Response<List<EnumItemModel>>> apiMessageStatusesGet() {
    generatedMapping.putIfAbsent(
        EnumItemModel, () => EnumItemModel.fromJsonFactory);

    return _apiMessageStatusesGet();
  }

  ///List Message Statuses
  @Get(path: '/api/message/statuses')
  Future<chopper.Response<List<EnumItemModel>>> _apiMessageStatusesGet();

  ///Get Message By Id
  ///@param message_id
  Future<chopper.Response<ReturnModelMessageOutModel>> apiMessageMessageIdGet(
      {required int? messageId}) {
    generatedMapping.putIfAbsent(ReturnModelMessageOutModel,
        () => ReturnModelMessageOutModel.fromJsonFactory);

    return _apiMessageMessageIdGet(messageId: messageId);
  }

  ///Get Message By Id
  ///@param message_id
  @Get(path: '/api/message/{message_id}')
  Future<chopper.Response<ReturnModelMessageOutModel>> _apiMessageMessageIdGet(
      {@Path('message_id') required int? messageId});

  ///Update Message
  ///@param message_id
  Future<chopper.Response<ReturnModelMessageOutModel>> apiMessageMessageIdPut({
    required int? messageId,
    required MessageUpdateModel? body,
  }) {
    generatedMapping.putIfAbsent(ReturnModelMessageOutModel,
        () => ReturnModelMessageOutModel.fromJsonFactory);

    return _apiMessageMessageIdPut(messageId: messageId, body: body);
  }

  ///Update Message
  ///@param message_id
  @Put(
    path: '/api/message/{message_id}',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelMessageOutModel>> _apiMessageMessageIdPut({
    @Path('message_id') required int? messageId,
    @Body() required MessageUpdateModel? body,
  });

  ///Delete Message
  ///@param message_id
  Future<chopper.Response<ReturnModel>> apiMessageMessageIdDelete(
      {required int? messageId}) {
    generatedMapping.putIfAbsent(
        ReturnModel, () => ReturnModel.fromJsonFactory);

    return _apiMessageMessageIdDelete(messageId: messageId);
  }

  ///Delete Message
  ///@param message_id
  @Delete(path: '/api/message/{message_id}')
  Future<chopper.Response<ReturnModel>> _apiMessageMessageIdDelete(
      {@Path('message_id') required int? messageId});

  ///List Messages
  Future<chopper.Response<ReturnListModelMessageOutModel>> apiMessageGet() {
    generatedMapping.putIfAbsent(ReturnListModelMessageOutModel,
        () => ReturnListModelMessageOutModel.fromJsonFactory);

    return _apiMessageGet();
  }

  ///List Messages
  @Get(path: '/api/message/')
  Future<chopper.Response<ReturnListModelMessageOutModel>> _apiMessageGet();

  ///Create Message
  Future<chopper.Response<ReturnModelMessageOutModel>> apiMessagePost(
      {required MessageCreateModel? body}) {
    generatedMapping.putIfAbsent(ReturnModelMessageOutModel,
        () => ReturnModelMessageOutModel.fromJsonFactory);

    return _apiMessagePost(body: body);
  }

  ///Create Message
  @Post(
    path: '/api/message/',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelMessageOutModel>> _apiMessagePost(
      {@Body() required MessageCreateModel? body});

  ///Enable Message
  ///@param message_id
  Future<chopper.Response<ReturnModelMessageOutModel>>
      apiMessageMessageIdEnablePut({required int? messageId}) {
    generatedMapping.putIfAbsent(ReturnModelMessageOutModel,
        () => ReturnModelMessageOutModel.fromJsonFactory);

    return _apiMessageMessageIdEnablePut(messageId: messageId);
  }

  ///Enable Message
  ///@param message_id
  @Put(
    path: '/api/message/{message_id}/enable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelMessageOutModel>>
      _apiMessageMessageIdEnablePut(
          {@Path('message_id') required int? messageId});

  ///Disable Message
  ///@param message_id
  Future<chopper.Response<ReturnModelMessageOutModel>>
      apiMessageMessageIdDisablePut({required int? messageId}) {
    generatedMapping.putIfAbsent(ReturnModelMessageOutModel,
        () => ReturnModelMessageOutModel.fromJsonFactory);

    return _apiMessageMessageIdDisablePut(messageId: messageId);
  }

  ///Disable Message
  ///@param message_id
  @Put(
    path: '/api/message/{message_id}/disable',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelMessageOutModel>>
      _apiMessageMessageIdDisablePut(
          {@Path('message_id') required int? messageId});

  ///Archive Message
  ///@param message_id
  Future<chopper.Response<ReturnModelMessageOutModel>>
      apiMessageMessageIdArchivePut({required int? messageId}) {
    generatedMapping.putIfAbsent(ReturnModelMessageOutModel,
        () => ReturnModelMessageOutModel.fromJsonFactory);

    return _apiMessageMessageIdArchivePut(messageId: messageId);
  }

  ///Archive Message
  ///@param message_id
  @Put(
    path: '/api/message/{message_id}/archive',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelMessageOutModel>>
      _apiMessageMessageIdArchivePut(
          {@Path('message_id') required int? messageId});

  ///Login
  Future<chopper.Response<ReturnModelTokenResponseModel>> apiAuthLoginPost(
      {required LoginModel? body}) {
    generatedMapping.putIfAbsent(ReturnModelTokenResponseModel,
        () => ReturnModelTokenResponseModel.fromJsonFactory);

    return _apiAuthLoginPost(body: body);
  }

  ///Login
  @Post(
    path: '/api/auth/login',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelTokenResponseModel>> _apiAuthLoginPost(
      {@Body() required LoginModel? body});

  ///Validate Token
  ///@param token
  Future<chopper.Response<ReturnModelTokenValidationModel>> apiAuthValidatePost(
      {required String? token}) {
    generatedMapping.putIfAbsent(ReturnModelTokenValidationModel,
        () => ReturnModelTokenValidationModel.fromJsonFactory);

    return _apiAuthValidatePost(token: token);
  }

  ///Validate Token
  ///@param token
  @Post(
    path: '/api/auth/validate',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelTokenValidationModel>>
      _apiAuthValidatePost({@Query('token') required String? token});

  ///Get Current User Info
  Future<chopper.Response<ReturnModelUserOutModel>> apiAuthMeGet() {
    generatedMapping.putIfAbsent(
        ReturnModelUserOutModel, () => ReturnModelUserOutModel.fromJsonFactory);

    return _apiAuthMeGet();
  }

  ///Get Current User Info
  @Get(path: '/api/auth/me')
  Future<chopper.Response<ReturnModelUserOutModel>> _apiAuthMeGet();

  ///Refresh Token
  Future<chopper.Response<ReturnModelTokenResponseModel>> apiAuthRefreshPost() {
    generatedMapping.putIfAbsent(ReturnModelTokenResponseModel,
        () => ReturnModelTokenResponseModel.fromJsonFactory);

    return _apiAuthRefreshPost();
  }

  ///Refresh Token
  @Post(
    path: '/api/auth/refresh',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelTokenResponseModel>> _apiAuthRefreshPost();

  ///Get Google Auth Url
  Future<chopper.Response<ReturnModelOAuth2AuthUrlResponseModel>>
      apiAuthGoogleUrlPost({required OAuth2AuthUrlModel? body}) {
    generatedMapping.putIfAbsent(ReturnModelOAuth2AuthUrlResponseModel,
        () => ReturnModelOAuth2AuthUrlResponseModel.fromJsonFactory);

    return _apiAuthGoogleUrlPost(body: body);
  }

  ///Get Google Auth Url
  @Post(
    path: '/api/auth/google/url',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelOAuth2AuthUrlResponseModel>>
      _apiAuthGoogleUrlPost({@Body() required OAuth2AuthUrlModel? body});

  ///Get Microsoft Auth Url
  Future<chopper.Response<ReturnModelOAuth2AuthUrlResponseModel>>
      apiAuthMicrosoftUrlPost({required OAuth2AuthUrlModel? body}) {
    generatedMapping.putIfAbsent(ReturnModelOAuth2AuthUrlResponseModel,
        () => ReturnModelOAuth2AuthUrlResponseModel.fromJsonFactory);

    return _apiAuthMicrosoftUrlPost(body: body);
  }

  ///Get Microsoft Auth Url
  @Post(
    path: '/api/auth/microsoft/url',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelOAuth2AuthUrlResponseModel>>
      _apiAuthMicrosoftUrlPost({@Body() required OAuth2AuthUrlModel? body});

  ///Google Oauth Callback
  Future<chopper.Response<ReturnModelTokenResponseModel>>
      apiAuthGoogleCallbackPost({required OAuth2CallbackModel? body}) {
    generatedMapping.putIfAbsent(ReturnModelTokenResponseModel,
        () => ReturnModelTokenResponseModel.fromJsonFactory);

    return _apiAuthGoogleCallbackPost(body: body);
  }

  ///Google Oauth Callback
  @Post(
    path: '/api/auth/google/callback',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelTokenResponseModel>>
      _apiAuthGoogleCallbackPost({@Body() required OAuth2CallbackModel? body});

  ///Microsoft Oauth Callback
  Future<chopper.Response<ReturnModelTokenResponseModel>>
      apiAuthMicrosoftCallbackPost({required OAuth2CallbackModel? body}) {
    generatedMapping.putIfAbsent(ReturnModelTokenResponseModel,
        () => ReturnModelTokenResponseModel.fromJsonFactory);

    return _apiAuthMicrosoftCallbackPost(body: body);
  }

  ///Microsoft Oauth Callback
  @Post(
    path: '/api/auth/microsoft/callback',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelTokenResponseModel>>
      _apiAuthMicrosoftCallbackPost(
          {@Body() required OAuth2CallbackModel? body});

  ///Oauth Error
  Future<chopper.Response<ReturnModelOAuth2ErrorModel>> apiAuthErrorGet() {
    generatedMapping.putIfAbsent(ReturnModelOAuth2ErrorModel,
        () => ReturnModelOAuth2ErrorModel.fromJsonFactory);

    return _apiAuthErrorGet();
  }

  ///Oauth Error
  @Get(path: '/api/auth/error')
  Future<chopper.Response<ReturnModelOAuth2ErrorModel>> _apiAuthErrorGet();

  ///Forgot Password
  Future<chopper.Response<ReturnModelDict>> apiAuthForgotPasswordPost(
      {required ForgotPasswordModel? body}) {
    generatedMapping.putIfAbsent(
        ReturnModelDict, () => ReturnModelDict.fromJsonFactory);

    return _apiAuthForgotPasswordPost(body: body);
  }

  ///Forgot Password
  @Post(
    path: '/api/auth/forgot-password',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelDict>> _apiAuthForgotPasswordPost(
      {@Body() required ForgotPasswordModel? body});

  ///Validate Reset Token
  ///@param token
  Future<chopper.Response<ReturnModelPasswordResetTokenModel>>
      apiAuthValidateResetTokenPost({required String? token}) {
    generatedMapping.putIfAbsent(ReturnModelPasswordResetTokenModel,
        () => ReturnModelPasswordResetTokenModel.fromJsonFactory);

    return _apiAuthValidateResetTokenPost(token: token);
  }

  ///Validate Reset Token
  ///@param token
  @Post(
    path: '/api/auth/validate-reset-token',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelPasswordResetTokenModel>>
      _apiAuthValidateResetTokenPost({@Query('token') required String? token});

  ///Reset Password
  Future<chopper.Response<ReturnModelDict>> apiAuthResetPasswordPost(
      {required ResetPasswordModel? body}) {
    generatedMapping.putIfAbsent(
        ReturnModelDict, () => ReturnModelDict.fromJsonFactory);

    return _apiAuthResetPasswordPost(body: body);
  }

  ///Reset Password
  @Post(
    path: '/api/auth/reset-password',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelDict>> _apiAuthResetPasswordPost(
      {@Body() required ResetPasswordModel? body});

  ///Change Password
  Future<chopper.Response<ReturnModelDict>> apiAuthChangePasswordPost(
      {required ChangePasswordModel? body}) {
    generatedMapping.putIfAbsent(
        ReturnModelDict, () => ReturnModelDict.fromJsonFactory);

    return _apiAuthChangePasswordPost(body: body);
  }

  ///Change Password
  @Post(
    path: '/api/auth/change-password',
    optionalBody: true,
  )
  Future<chopper.Response<ReturnModelDict>> _apiAuthChangePasswordPost(
      {@Body() required ChangePasswordModel? body});
}

@JsonSerializable(explicitToJson: true)
class ErrorItemModel {
  const ErrorItemModel({
    this.field,
    required this.message,
  });

  factory ErrorItemModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorItemModelFromJson(json);

  static const toJsonFactory = _$ErrorItemModelToJson;
  Map<String, dynamic> toJson() => _$ErrorItemModelToJson(this);

  @JsonKey(name: 'field')
  final dynamic field;
  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$ErrorItemModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ErrorItemModel &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(field) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ErrorItemModelExtension on ErrorItemModel {
  ErrorItemModel copyWith({dynamic field, String? message}) {
    return ErrorItemModel(
        field: field ?? this.field, message: message ?? this.message);
  }

  ErrorItemModel copyWithWrapped(
      {Wrapped<dynamic>? field, Wrapped<String>? message}) {
    return ErrorItemModel(
        field: (field != null ? field.value : this.field),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnListModelUserOutModel {
  const ReturnListModelUserOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
    this.count,
  });

  factory ReturnListModelUserOutModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnListModelUserOutModelFromJson(json);

  static const toJsonFactory = _$ReturnListModelUserOutModelToJson;
  Map<String, dynamic> toJson() => _$ReturnListModelUserOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  @JsonKey(name: 'count')
  final int? count;
  static const fromJsonFactory = _$ReturnListModelUserOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnListModelUserOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      const DeepCollectionEquality().hash(count) ^
      runtimeType.hashCode;
}

extension $ReturnListModelUserOutModelExtension on ReturnListModelUserOutModel {
  ReturnListModelUserOutModel copyWith(
      {dynamic data,
      bool? status,
      String? message,
      dynamic errors,
      int? count}) {
    return ReturnListModelUserOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        count: count ?? this.count);
  }

  ReturnListModelUserOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors,
      Wrapped<int?>? count}) {
    return ReturnListModelUserOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors),
        count: (count != null ? count.value : this.count));
  }
}

@JsonSerializable(explicitToJson: true)
class UserInfoOutModel {
  const UserInfoOutModel({
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.country,
    this.userType,
    this.userStatus,
    this.userProfileFileLocation,
    this.userProfileFileName,
    this.userProfileFileSize,
    required this.userInfoId,
    required this.externalUserId,
    required this.accountCreatedOn,
  });

  factory UserInfoOutModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoOutModelFromJson(json);

  static const toJsonFactory = _$UserInfoOutModelToJson;
  Map<String, dynamic> toJson() => _$UserInfoOutModelToJson(this);

  @JsonKey(name: 'address1')
  final dynamic address1;
  @JsonKey(name: 'address2')
  final dynamic address2;
  @JsonKey(name: 'city')
  final dynamic city;
  @JsonKey(name: 'state')
  final dynamic state;
  @JsonKey(name: 'country')
  final dynamic country;
  @JsonKey(name: 'user_type')
  final int? userType;
  @JsonKey(name: 'user_status')
  final int? userStatus;
  @JsonKey(name: 'user_profile_file_location')
  final dynamic userProfileFileLocation;
  @JsonKey(name: 'user_profile_file_name')
  final dynamic userProfileFileName;
  @JsonKey(name: 'user_profile_file_size')
  final dynamic userProfileFileSize;
  @JsonKey(name: 'user_info_id')
  final int userInfoId;
  @JsonKey(name: 'external_user_id')
  final String externalUserId;
  @JsonKey(name: 'account_created_on')
  final DateTime accountCreatedOn;
  static const fromJsonFactory = _$UserInfoOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserInfoOutModel &&
            (identical(other.address1, address1) ||
                const DeepCollectionEquality()
                    .equals(other.address1, address1)) &&
            (identical(other.address2, address2) ||
                const DeepCollectionEquality()
                    .equals(other.address2, address2)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.userType, userType) ||
                const DeepCollectionEquality()
                    .equals(other.userType, userType)) &&
            (identical(other.userStatus, userStatus) ||
                const DeepCollectionEquality()
                    .equals(other.userStatus, userStatus)) &&
            (identical(
                    other.userProfileFileLocation, userProfileFileLocation) ||
                const DeepCollectionEquality().equals(
                    other.userProfileFileLocation, userProfileFileLocation)) &&
            (identical(other.userProfileFileName, userProfileFileName) ||
                const DeepCollectionEquality()
                    .equals(other.userProfileFileName, userProfileFileName)) &&
            (identical(other.userProfileFileSize, userProfileFileSize) ||
                const DeepCollectionEquality()
                    .equals(other.userProfileFileSize, userProfileFileSize)) &&
            (identical(other.userInfoId, userInfoId) ||
                const DeepCollectionEquality()
                    .equals(other.userInfoId, userInfoId)) &&
            (identical(other.externalUserId, externalUserId) ||
                const DeepCollectionEquality()
                    .equals(other.externalUserId, externalUserId)) &&
            (identical(other.accountCreatedOn, accountCreatedOn) ||
                const DeepCollectionEquality()
                    .equals(other.accountCreatedOn, accountCreatedOn)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(address1) ^
      const DeepCollectionEquality().hash(address2) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(userType) ^
      const DeepCollectionEquality().hash(userStatus) ^
      const DeepCollectionEquality().hash(userProfileFileLocation) ^
      const DeepCollectionEquality().hash(userProfileFileName) ^
      const DeepCollectionEquality().hash(userProfileFileSize) ^
      const DeepCollectionEquality().hash(userInfoId) ^
      const DeepCollectionEquality().hash(externalUserId) ^
      const DeepCollectionEquality().hash(accountCreatedOn) ^
      runtimeType.hashCode;
}

extension $UserInfoOutModelExtension on UserInfoOutModel {
  UserInfoOutModel copyWith(
      {dynamic address1,
      dynamic address2,
      dynamic city,
      dynamic state,
      dynamic country,
      int? userType,
      int? userStatus,
      dynamic userProfileFileLocation,
      dynamic userProfileFileName,
      dynamic userProfileFileSize,
      int? userInfoId,
      String? externalUserId,
      DateTime? accountCreatedOn}) {
    return UserInfoOutModel(
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        userType: userType ?? this.userType,
        userStatus: userStatus ?? this.userStatus,
        userProfileFileLocation:
            userProfileFileLocation ?? this.userProfileFileLocation,
        userProfileFileName: userProfileFileName ?? this.userProfileFileName,
        userProfileFileSize: userProfileFileSize ?? this.userProfileFileSize,
        userInfoId: userInfoId ?? this.userInfoId,
        externalUserId: externalUserId ?? this.externalUserId,
        accountCreatedOn: accountCreatedOn ?? this.accountCreatedOn);
  }

  UserInfoOutModel copyWithWrapped(
      {Wrapped<dynamic>? address1,
      Wrapped<dynamic>? address2,
      Wrapped<dynamic>? city,
      Wrapped<dynamic>? state,
      Wrapped<dynamic>? country,
      Wrapped<int?>? userType,
      Wrapped<int?>? userStatus,
      Wrapped<dynamic>? userProfileFileLocation,
      Wrapped<dynamic>? userProfileFileName,
      Wrapped<dynamic>? userProfileFileSize,
      Wrapped<int>? userInfoId,
      Wrapped<String>? externalUserId,
      Wrapped<DateTime>? accountCreatedOn}) {
    return UserInfoOutModel(
        address1: (address1 != null ? address1.value : this.address1),
        address2: (address2 != null ? address2.value : this.address2),
        city: (city != null ? city.value : this.city),
        state: (state != null ? state.value : this.state),
        country: (country != null ? country.value : this.country),
        userType: (userType != null ? userType.value : this.userType),
        userStatus: (userStatus != null ? userStatus.value : this.userStatus),
        userProfileFileLocation: (userProfileFileLocation != null
            ? userProfileFileLocation.value
            : this.userProfileFileLocation),
        userProfileFileName: (userProfileFileName != null
            ? userProfileFileName.value
            : this.userProfileFileName),
        userProfileFileSize: (userProfileFileSize != null
            ? userProfileFileSize.value
            : this.userProfileFileSize),
        userInfoId: (userInfoId != null ? userInfoId.value : this.userInfoId),
        externalUserId: (externalUserId != null
            ? externalUserId.value
            : this.externalUserId),
        accountCreatedOn: (accountCreatedOn != null
            ? accountCreatedOn.value
            : this.accountCreatedOn));
  }
}

@JsonSerializable(explicitToJson: true)
class UserOutModel {
  const UserOutModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isActive,
    required this.dateJoined,
    required this.lastLogin,
    required this.isStaff,
    required this.isSuperuser,
    this.profile,
  });

  factory UserOutModel.fromJson(Map<String, dynamic> json) =>
      _$UserOutModelFromJson(json);

  static const toJsonFactory = _$UserOutModelToJson;
  Map<String, dynamic> toJson() => _$UserOutModelToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'date_joined')
  final DateTime dateJoined;
  @JsonKey(name: 'last_login')
  final dynamic lastLogin;
  @JsonKey(name: 'is_staff')
  final bool isStaff;
  @JsonKey(name: 'is_superuser')
  final bool isSuperuser;
  @JsonKey(name: 'profile')
  final dynamic profile;
  static const fromJsonFactory = _$UserOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserOutModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality()
                    .equals(other.isActive, isActive)) &&
            (identical(other.dateJoined, dateJoined) ||
                const DeepCollectionEquality()
                    .equals(other.dateJoined, dateJoined)) &&
            (identical(other.lastLogin, lastLogin) ||
                const DeepCollectionEquality()
                    .equals(other.lastLogin, lastLogin)) &&
            (identical(other.isStaff, isStaff) ||
                const DeepCollectionEquality()
                    .equals(other.isStaff, isStaff)) &&
            (identical(other.isSuperuser, isSuperuser) ||
                const DeepCollectionEquality()
                    .equals(other.isSuperuser, isSuperuser)) &&
            (identical(other.profile, profile) ||
                const DeepCollectionEquality().equals(other.profile, profile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(isActive) ^
      const DeepCollectionEquality().hash(dateJoined) ^
      const DeepCollectionEquality().hash(lastLogin) ^
      const DeepCollectionEquality().hash(isStaff) ^
      const DeepCollectionEquality().hash(isSuperuser) ^
      const DeepCollectionEquality().hash(profile) ^
      runtimeType.hashCode;
}

extension $UserOutModelExtension on UserOutModel {
  UserOutModel copyWith(
      {int? id,
      String? username,
      String? email,
      String? firstName,
      String? lastName,
      bool? isActive,
      DateTime? dateJoined,
      dynamic lastLogin,
      bool? isStaff,
      bool? isSuperuser,
      dynamic profile}) {
    return UserOutModel(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        isActive: isActive ?? this.isActive,
        dateJoined: dateJoined ?? this.dateJoined,
        lastLogin: lastLogin ?? this.lastLogin,
        isStaff: isStaff ?? this.isStaff,
        isSuperuser: isSuperuser ?? this.isSuperuser,
        profile: profile ?? this.profile);
  }

  UserOutModel copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String>? username,
      Wrapped<String>? email,
      Wrapped<String>? firstName,
      Wrapped<String>? lastName,
      Wrapped<bool>? isActive,
      Wrapped<DateTime>? dateJoined,
      Wrapped<dynamic>? lastLogin,
      Wrapped<bool>? isStaff,
      Wrapped<bool>? isSuperuser,
      Wrapped<dynamic>? profile}) {
    return UserOutModel(
        id: (id != null ? id.value : this.id),
        username: (username != null ? username.value : this.username),
        email: (email != null ? email.value : this.email),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        isActive: (isActive != null ? isActive.value : this.isActive),
        dateJoined: (dateJoined != null ? dateJoined.value : this.dateJoined),
        lastLogin: (lastLogin != null ? lastLogin.value : this.lastLogin),
        isStaff: (isStaff != null ? isStaff.value : this.isStaff),
        isSuperuser:
            (isSuperuser != null ? isSuperuser.value : this.isSuperuser),
        profile: (profile != null ? profile.value : this.profile));
  }
}

@JsonSerializable(explicitToJson: true)
class UserSearchCriteriaModel {
  const UserSearchCriteriaModel({
    this.searchKeyword,
    this.pageNumber,
    this.pageSize,
    this.sortBy,
    this.sortAscending,
    this.username,
    this.email,
    this.userTypes,
    this.isActive,
  });

  factory UserSearchCriteriaModel.fromJson(Map<String, dynamic> json) =>
      _$UserSearchCriteriaModelFromJson(json);

  static const toJsonFactory = _$UserSearchCriteriaModelToJson;
  Map<String, dynamic> toJson() => _$UserSearchCriteriaModelToJson(this);

  @JsonKey(name: 'search_keyword')
  final dynamic searchKeyword;
  @JsonKey(name: 'page_number')
  final int? pageNumber;
  @JsonKey(name: 'page_size')
  final int? pageSize;
  @JsonKey(name: 'sort_by')
  final dynamic sortBy;
  @JsonKey(name: 'sort_ascending', defaultValue: true)
  final bool? sortAscending;
  @JsonKey(name: 'username')
  final dynamic username;
  @JsonKey(name: 'email')
  final dynamic email;
  @JsonKey(name: 'user_types')
  final dynamic userTypes;
  @JsonKey(name: 'is_active')
  final dynamic isActive;
  static const fromJsonFactory = _$UserSearchCriteriaModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserSearchCriteriaModel &&
            (identical(other.searchKeyword, searchKeyword) ||
                const DeepCollectionEquality()
                    .equals(other.searchKeyword, searchKeyword)) &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.sortBy, sortBy) ||
                const DeepCollectionEquality().equals(other.sortBy, sortBy)) &&
            (identical(other.sortAscending, sortAscending) ||
                const DeepCollectionEquality()
                    .equals(other.sortAscending, sortAscending)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.userTypes, userTypes) ||
                const DeepCollectionEquality()
                    .equals(other.userTypes, userTypes)) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality()
                    .equals(other.isActive, isActive)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(searchKeyword) ^
      const DeepCollectionEquality().hash(pageNumber) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(sortBy) ^
      const DeepCollectionEquality().hash(sortAscending) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(userTypes) ^
      const DeepCollectionEquality().hash(isActive) ^
      runtimeType.hashCode;
}

extension $UserSearchCriteriaModelExtension on UserSearchCriteriaModel {
  UserSearchCriteriaModel copyWith(
      {dynamic searchKeyword,
      int? pageNumber,
      int? pageSize,
      dynamic sortBy,
      bool? sortAscending,
      dynamic username,
      dynamic email,
      dynamic userTypes,
      dynamic isActive}) {
    return UserSearchCriteriaModel(
        searchKeyword: searchKeyword ?? this.searchKeyword,
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize,
        sortBy: sortBy ?? this.sortBy,
        sortAscending: sortAscending ?? this.sortAscending,
        username: username ?? this.username,
        email: email ?? this.email,
        userTypes: userTypes ?? this.userTypes,
        isActive: isActive ?? this.isActive);
  }

  UserSearchCriteriaModel copyWithWrapped(
      {Wrapped<dynamic>? searchKeyword,
      Wrapped<int?>? pageNumber,
      Wrapped<int?>? pageSize,
      Wrapped<dynamic>? sortBy,
      Wrapped<bool?>? sortAscending,
      Wrapped<dynamic>? username,
      Wrapped<dynamic>? email,
      Wrapped<dynamic>? userTypes,
      Wrapped<dynamic>? isActive}) {
    return UserSearchCriteriaModel(
        searchKeyword:
            (searchKeyword != null ? searchKeyword.value : this.searchKeyword),
        pageNumber: (pageNumber != null ? pageNumber.value : this.pageNumber),
        pageSize: (pageSize != null ? pageSize.value : this.pageSize),
        sortBy: (sortBy != null ? sortBy.value : this.sortBy),
        sortAscending:
            (sortAscending != null ? sortAscending.value : this.sortAscending),
        username: (username != null ? username.value : this.username),
        email: (email != null ? email.value : this.email),
        userTypes: (userTypes != null ? userTypes.value : this.userTypes),
        isActive: (isActive != null ? isActive.value : this.isActive));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModelUserOutModel {
  const ReturnModelUserOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModelUserOutModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelUserOutModelFromJson(json);

  static const toJsonFactory = _$ReturnModelUserOutModelToJson;
  Map<String, dynamic> toJson() => _$ReturnModelUserOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory = _$ReturnModelUserOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModelUserOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelUserOutModelExtension on ReturnModelUserOutModel {
  ReturnModelUserOutModel copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModelUserOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModelUserOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModelUserOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class UserInfoBaseModel {
  const UserInfoBaseModel({
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.country,
    this.userType,
    this.userStatus,
    this.userProfileFileLocation,
    this.userProfileFileName,
    this.userProfileFileSize,
  });

  factory UserInfoBaseModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoBaseModelFromJson(json);

  static const toJsonFactory = _$UserInfoBaseModelToJson;
  Map<String, dynamic> toJson() => _$UserInfoBaseModelToJson(this);

  @JsonKey(name: 'address1')
  final dynamic address1;
  @JsonKey(name: 'address2')
  final dynamic address2;
  @JsonKey(name: 'city')
  final dynamic city;
  @JsonKey(name: 'state')
  final dynamic state;
  @JsonKey(name: 'country')
  final dynamic country;
  @JsonKey(name: 'user_type')
  final int? userType;
  @JsonKey(name: 'user_status')
  final int? userStatus;
  @JsonKey(name: 'user_profile_file_location')
  final dynamic userProfileFileLocation;
  @JsonKey(name: 'user_profile_file_name')
  final dynamic userProfileFileName;
  @JsonKey(name: 'user_profile_file_size')
  final dynamic userProfileFileSize;
  static const fromJsonFactory = _$UserInfoBaseModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserInfoBaseModel &&
            (identical(other.address1, address1) ||
                const DeepCollectionEquality()
                    .equals(other.address1, address1)) &&
            (identical(other.address2, address2) ||
                const DeepCollectionEquality()
                    .equals(other.address2, address2)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.userType, userType) ||
                const DeepCollectionEquality()
                    .equals(other.userType, userType)) &&
            (identical(other.userStatus, userStatus) ||
                const DeepCollectionEquality()
                    .equals(other.userStatus, userStatus)) &&
            (identical(
                    other.userProfileFileLocation, userProfileFileLocation) ||
                const DeepCollectionEquality().equals(
                    other.userProfileFileLocation, userProfileFileLocation)) &&
            (identical(other.userProfileFileName, userProfileFileName) ||
                const DeepCollectionEquality()
                    .equals(other.userProfileFileName, userProfileFileName)) &&
            (identical(other.userProfileFileSize, userProfileFileSize) ||
                const DeepCollectionEquality()
                    .equals(other.userProfileFileSize, userProfileFileSize)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(address1) ^
      const DeepCollectionEquality().hash(address2) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(userType) ^
      const DeepCollectionEquality().hash(userStatus) ^
      const DeepCollectionEquality().hash(userProfileFileLocation) ^
      const DeepCollectionEquality().hash(userProfileFileName) ^
      const DeepCollectionEquality().hash(userProfileFileSize) ^
      runtimeType.hashCode;
}

extension $UserInfoBaseModelExtension on UserInfoBaseModel {
  UserInfoBaseModel copyWith(
      {dynamic address1,
      dynamic address2,
      dynamic city,
      dynamic state,
      dynamic country,
      int? userType,
      int? userStatus,
      dynamic userProfileFileLocation,
      dynamic userProfileFileName,
      dynamic userProfileFileSize}) {
    return UserInfoBaseModel(
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        userType: userType ?? this.userType,
        userStatus: userStatus ?? this.userStatus,
        userProfileFileLocation:
            userProfileFileLocation ?? this.userProfileFileLocation,
        userProfileFileName: userProfileFileName ?? this.userProfileFileName,
        userProfileFileSize: userProfileFileSize ?? this.userProfileFileSize);
  }

  UserInfoBaseModel copyWithWrapped(
      {Wrapped<dynamic>? address1,
      Wrapped<dynamic>? address2,
      Wrapped<dynamic>? city,
      Wrapped<dynamic>? state,
      Wrapped<dynamic>? country,
      Wrapped<int?>? userType,
      Wrapped<int?>? userStatus,
      Wrapped<dynamic>? userProfileFileLocation,
      Wrapped<dynamic>? userProfileFileName,
      Wrapped<dynamic>? userProfileFileSize}) {
    return UserInfoBaseModel(
        address1: (address1 != null ? address1.value : this.address1),
        address2: (address2 != null ? address2.value : this.address2),
        city: (city != null ? city.value : this.city),
        state: (state != null ? state.value : this.state),
        country: (country != null ? country.value : this.country),
        userType: (userType != null ? userType.value : this.userType),
        userStatus: (userStatus != null ? userStatus.value : this.userStatus),
        userProfileFileLocation: (userProfileFileLocation != null
            ? userProfileFileLocation.value
            : this.userProfileFileLocation),
        userProfileFileName: (userProfileFileName != null
            ? userProfileFileName.value
            : this.userProfileFileName),
        userProfileFileSize: (userProfileFileSize != null
            ? userProfileFileSize.value
            : this.userProfileFileSize));
  }
}

@JsonSerializable(explicitToJson: true)
class UserUpdateModel {
  const UserUpdateModel({
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.isActive,
    this.userInfo,
  });

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateModelFromJson(json);

  static const toJsonFactory = _$UserUpdateModelToJson;
  Map<String, dynamic> toJson() => _$UserUpdateModelToJson(this);

  @JsonKey(name: 'username')
  final dynamic username;
  @JsonKey(name: 'email')
  final dynamic email;
  @JsonKey(name: 'first_name')
  final dynamic firstName;
  @JsonKey(name: 'last_name')
  final dynamic lastName;
  @JsonKey(name: 'is_active')
  final dynamic isActive;
  @JsonKey(name: 'user_info')
  final dynamic userInfo;
  static const fromJsonFactory = _$UserUpdateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserUpdateModel &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality()
                    .equals(other.isActive, isActive)) &&
            (identical(other.userInfo, userInfo) ||
                const DeepCollectionEquality()
                    .equals(other.userInfo, userInfo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(isActive) ^
      const DeepCollectionEquality().hash(userInfo) ^
      runtimeType.hashCode;
}

extension $UserUpdateModelExtension on UserUpdateModel {
  UserUpdateModel copyWith(
      {dynamic username,
      dynamic email,
      dynamic firstName,
      dynamic lastName,
      dynamic isActive,
      dynamic userInfo}) {
    return UserUpdateModel(
        username: username ?? this.username,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        isActive: isActive ?? this.isActive,
        userInfo: userInfo ?? this.userInfo);
  }

  UserUpdateModel copyWithWrapped(
      {Wrapped<dynamic>? username,
      Wrapped<dynamic>? email,
      Wrapped<dynamic>? firstName,
      Wrapped<dynamic>? lastName,
      Wrapped<dynamic>? isActive,
      Wrapped<dynamic>? userInfo}) {
    return UserUpdateModel(
        username: (username != null ? username.value : this.username),
        email: (email != null ? email.value : this.email),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        isActive: (isActive != null ? isActive.value : this.isActive),
        userInfo: (userInfo != null ? userInfo.value : this.userInfo));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModel {
  const ReturnModel({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelFromJson(json);

  static const toJsonFactory = _$ReturnModelToJson;
  Map<String, dynamic> toJson() => _$ReturnModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory = _$ReturnModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelExtension on ReturnModel {
  ReturnModel copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class UserCreateModel {
  const UserCreateModel({
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.userInfo,
  });

  factory UserCreateModel.fromJson(Map<String, dynamic> json) =>
      _$UserCreateModelFromJson(json);

  static const toJsonFactory = _$UserCreateModelToJson;
  Map<String, dynamic> toJson() => _$UserCreateModelToJson(this);

  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'user_info')
  final UserInfoBaseModel userInfo;
  static const fromJsonFactory = _$UserCreateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserCreateModel &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.userInfo, userInfo) ||
                const DeepCollectionEquality()
                    .equals(other.userInfo, userInfo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(userInfo) ^
      runtimeType.hashCode;
}

extension $UserCreateModelExtension on UserCreateModel {
  UserCreateModel copyWith(
      {String? username,
      String? email,
      String? firstName,
      String? lastName,
      String? password,
      UserInfoBaseModel? userInfo}) {
    return UserCreateModel(
        username: username ?? this.username,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        userInfo: userInfo ?? this.userInfo);
  }

  UserCreateModel copyWithWrapped(
      {Wrapped<String>? username,
      Wrapped<String>? email,
      Wrapped<String>? firstName,
      Wrapped<String>? lastName,
      Wrapped<String>? password,
      Wrapped<UserInfoBaseModel>? userInfo}) {
    return UserCreateModel(
        username: (username != null ? username.value : this.username),
        email: (email != null ? email.value : this.email),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        password: (password != null ? password.value : this.password),
        userInfo: (userInfo != null ? userInfo.value : this.userInfo));
  }
}

@JsonSerializable(explicitToJson: true)
class EnumItemModel {
  const EnumItemModel({
    required this.$value,
    required this.name,
  });

  factory EnumItemModel.fromJson(Map<String, dynamic> json) =>
      _$EnumItemModelFromJson(json);

  static const toJsonFactory = _$EnumItemModelToJson;
  Map<String, dynamic> toJson() => _$EnumItemModelToJson(this);

  @JsonKey(name: 'value')
  final int $value;
  @JsonKey(name: 'name')
  final String name;
  static const fromJsonFactory = _$EnumItemModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EnumItemModel &&
            (identical(other.$value, $value) ||
                const DeepCollectionEquality().equals(other.$value, $value)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash($value) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $EnumItemModelExtension on EnumItemModel {
  EnumItemModel copyWith({int? $value, String? name}) {
    return EnumItemModel(
        $value: $value ?? this.$value, name: name ?? this.name);
  }

  EnumItemModel copyWithWrapped({Wrapped<int>? $value, Wrapped<String>? name}) {
    return EnumItemModel(
        $value: ($value != null ? $value.value : this.$value),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class CatalogOutModel {
  const CatalogOutModel({
    required this.courseId,
    this.validForInDays,
    required this.catalogStatus,
    required this.catalogId,
  });

  factory CatalogOutModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogOutModelFromJson(json);

  static const toJsonFactory = _$CatalogOutModelToJson;
  Map<String, dynamic> toJson() => _$CatalogOutModelToJson(this);

  @JsonKey(name: 'course_id')
  final int courseId;
  @JsonKey(name: 'valid_for_in_days')
  final dynamic validForInDays;
  @JsonKey(name: 'catalog_status')
  final int catalogStatus;
  @JsonKey(name: 'catalog_id')
  final int catalogId;
  static const fromJsonFactory = _$CatalogOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CatalogOutModel &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.validForInDays, validForInDays) ||
                const DeepCollectionEquality()
                    .equals(other.validForInDays, validForInDays)) &&
            (identical(other.catalogStatus, catalogStatus) ||
                const DeepCollectionEquality()
                    .equals(other.catalogStatus, catalogStatus)) &&
            (identical(other.catalogId, catalogId) ||
                const DeepCollectionEquality()
                    .equals(other.catalogId, catalogId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(validForInDays) ^
      const DeepCollectionEquality().hash(catalogStatus) ^
      const DeepCollectionEquality().hash(catalogId) ^
      runtimeType.hashCode;
}

extension $CatalogOutModelExtension on CatalogOutModel {
  CatalogOutModel copyWith(
      {int? courseId,
      dynamic validForInDays,
      int? catalogStatus,
      int? catalogId}) {
    return CatalogOutModel(
        courseId: courseId ?? this.courseId,
        validForInDays: validForInDays ?? this.validForInDays,
        catalogStatus: catalogStatus ?? this.catalogStatus,
        catalogId: catalogId ?? this.catalogId);
  }

  CatalogOutModel copyWithWrapped(
      {Wrapped<int>? courseId,
      Wrapped<dynamic>? validForInDays,
      Wrapped<int>? catalogStatus,
      Wrapped<int>? catalogId}) {
    return CatalogOutModel(
        courseId: (courseId != null ? courseId.value : this.courseId),
        validForInDays: (validForInDays != null
            ? validForInDays.value
            : this.validForInDays),
        catalogStatus:
            (catalogStatus != null ? catalogStatus.value : this.catalogStatus),
        catalogId: (catalogId != null ? catalogId.value : this.catalogId));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModelCatalogOutModel {
  const ReturnModelCatalogOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModelCatalogOutModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelCatalogOutModelFromJson(json);

  static const toJsonFactory = _$ReturnModelCatalogOutModelToJson;
  Map<String, dynamic> toJson() => _$ReturnModelCatalogOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory = _$ReturnModelCatalogOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModelCatalogOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelCatalogOutModelExtension on ReturnModelCatalogOutModel {
  ReturnModelCatalogOutModel copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModelCatalogOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModelCatalogOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModelCatalogOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class CatalogUpdateModel {
  const CatalogUpdateModel({
    required this.courseId,
    this.validForInDays,
    required this.catalogStatus,
  });

  factory CatalogUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogUpdateModelFromJson(json);

  static const toJsonFactory = _$CatalogUpdateModelToJson;
  Map<String, dynamic> toJson() => _$CatalogUpdateModelToJson(this);

  @JsonKey(name: 'course_id')
  final int courseId;
  @JsonKey(name: 'valid_for_in_days')
  final dynamic validForInDays;
  @JsonKey(name: 'catalog_status')
  final int catalogStatus;
  static const fromJsonFactory = _$CatalogUpdateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CatalogUpdateModel &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.validForInDays, validForInDays) ||
                const DeepCollectionEquality()
                    .equals(other.validForInDays, validForInDays)) &&
            (identical(other.catalogStatus, catalogStatus) ||
                const DeepCollectionEquality()
                    .equals(other.catalogStatus, catalogStatus)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(validForInDays) ^
      const DeepCollectionEquality().hash(catalogStatus) ^
      runtimeType.hashCode;
}

extension $CatalogUpdateModelExtension on CatalogUpdateModel {
  CatalogUpdateModel copyWith(
      {int? courseId, dynamic validForInDays, int? catalogStatus}) {
    return CatalogUpdateModel(
        courseId: courseId ?? this.courseId,
        validForInDays: validForInDays ?? this.validForInDays,
        catalogStatus: catalogStatus ?? this.catalogStatus);
  }

  CatalogUpdateModel copyWithWrapped(
      {Wrapped<int>? courseId,
      Wrapped<dynamic>? validForInDays,
      Wrapped<int>? catalogStatus}) {
    return CatalogUpdateModel(
        courseId: (courseId != null ? courseId.value : this.courseId),
        validForInDays: (validForInDays != null
            ? validForInDays.value
            : this.validForInDays),
        catalogStatus:
            (catalogStatus != null ? catalogStatus.value : this.catalogStatus));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnListModelCatalogOutModel {
  const ReturnListModelCatalogOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
    this.count,
  });

  factory ReturnListModelCatalogOutModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnListModelCatalogOutModelFromJson(json);

  static const toJsonFactory = _$ReturnListModelCatalogOutModelToJson;
  Map<String, dynamic> toJson() => _$ReturnListModelCatalogOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  @JsonKey(name: 'count')
  final int? count;
  static const fromJsonFactory = _$ReturnListModelCatalogOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnListModelCatalogOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      const DeepCollectionEquality().hash(count) ^
      runtimeType.hashCode;
}

extension $ReturnListModelCatalogOutModelExtension
    on ReturnListModelCatalogOutModel {
  ReturnListModelCatalogOutModel copyWith(
      {dynamic data,
      bool? status,
      String? message,
      dynamic errors,
      int? count}) {
    return ReturnListModelCatalogOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        count: count ?? this.count);
  }

  ReturnListModelCatalogOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors,
      Wrapped<int?>? count}) {
    return ReturnListModelCatalogOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors),
        count: (count != null ? count.value : this.count));
  }
}

@JsonSerializable(explicitToJson: true)
class CatalogCreateModel {
  const CatalogCreateModel({
    required this.courseId,
    this.validForInDays,
    required this.catalogStatus,
  });

  factory CatalogCreateModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogCreateModelFromJson(json);

  static const toJsonFactory = _$CatalogCreateModelToJson;
  Map<String, dynamic> toJson() => _$CatalogCreateModelToJson(this);

  @JsonKey(name: 'course_id')
  final int courseId;
  @JsonKey(name: 'valid_for_in_days')
  final dynamic validForInDays;
  @JsonKey(name: 'catalog_status')
  final int catalogStatus;
  static const fromJsonFactory = _$CatalogCreateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CatalogCreateModel &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.validForInDays, validForInDays) ||
                const DeepCollectionEquality()
                    .equals(other.validForInDays, validForInDays)) &&
            (identical(other.catalogStatus, catalogStatus) ||
                const DeepCollectionEquality()
                    .equals(other.catalogStatus, catalogStatus)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(validForInDays) ^
      const DeepCollectionEquality().hash(catalogStatus) ^
      runtimeType.hashCode;
}

extension $CatalogCreateModelExtension on CatalogCreateModel {
  CatalogCreateModel copyWith(
      {int? courseId, dynamic validForInDays, int? catalogStatus}) {
    return CatalogCreateModel(
        courseId: courseId ?? this.courseId,
        validForInDays: validForInDays ?? this.validForInDays,
        catalogStatus: catalogStatus ?? this.catalogStatus);
  }

  CatalogCreateModel copyWithWrapped(
      {Wrapped<int>? courseId,
      Wrapped<dynamic>? validForInDays,
      Wrapped<int>? catalogStatus}) {
    return CatalogCreateModel(
        courseId: (courseId != null ? courseId.value : this.courseId),
        validForInDays: (validForInDays != null
            ? validForInDays.value
            : this.validForInDays),
        catalogStatus:
            (catalogStatus != null ? catalogStatus.value : this.catalogStatus));
  }
}

@JsonSerializable(explicitToJson: true)
class CatalogSearchCriteriaModel {
  const CatalogSearchCriteriaModel({
    this.searchKeyword,
    this.pageNumber,
    this.pageSize,
    this.sortBy,
    this.sortAscending,
    this.courseId,
    this.catalogStatus,
    this.validForInDays,
  });

  factory CatalogSearchCriteriaModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogSearchCriteriaModelFromJson(json);

  static const toJsonFactory = _$CatalogSearchCriteriaModelToJson;
  Map<String, dynamic> toJson() => _$CatalogSearchCriteriaModelToJson(this);

  @JsonKey(name: 'search_keyword')
  final dynamic searchKeyword;
  @JsonKey(name: 'page_number')
  final int? pageNumber;
  @JsonKey(name: 'page_size')
  final int? pageSize;
  @JsonKey(name: 'sort_by')
  final dynamic sortBy;
  @JsonKey(name: 'sort_ascending', defaultValue: true)
  final bool? sortAscending;
  @JsonKey(name: 'course_id')
  final dynamic courseId;
  @JsonKey(name: 'catalog_status')
  final dynamic catalogStatus;
  @JsonKey(name: 'valid_for_in_days')
  final dynamic validForInDays;
  static const fromJsonFactory = _$CatalogSearchCriteriaModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CatalogSearchCriteriaModel &&
            (identical(other.searchKeyword, searchKeyword) ||
                const DeepCollectionEquality()
                    .equals(other.searchKeyword, searchKeyword)) &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.sortBy, sortBy) ||
                const DeepCollectionEquality().equals(other.sortBy, sortBy)) &&
            (identical(other.sortAscending, sortAscending) ||
                const DeepCollectionEquality()
                    .equals(other.sortAscending, sortAscending)) &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.catalogStatus, catalogStatus) ||
                const DeepCollectionEquality()
                    .equals(other.catalogStatus, catalogStatus)) &&
            (identical(other.validForInDays, validForInDays) ||
                const DeepCollectionEquality()
                    .equals(other.validForInDays, validForInDays)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(searchKeyword) ^
      const DeepCollectionEquality().hash(pageNumber) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(sortBy) ^
      const DeepCollectionEquality().hash(sortAscending) ^
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(catalogStatus) ^
      const DeepCollectionEquality().hash(validForInDays) ^
      runtimeType.hashCode;
}

extension $CatalogSearchCriteriaModelExtension on CatalogSearchCriteriaModel {
  CatalogSearchCriteriaModel copyWith(
      {dynamic searchKeyword,
      int? pageNumber,
      int? pageSize,
      dynamic sortBy,
      bool? sortAscending,
      dynamic courseId,
      dynamic catalogStatus,
      dynamic validForInDays}) {
    return CatalogSearchCriteriaModel(
        searchKeyword: searchKeyword ?? this.searchKeyword,
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize,
        sortBy: sortBy ?? this.sortBy,
        sortAscending: sortAscending ?? this.sortAscending,
        courseId: courseId ?? this.courseId,
        catalogStatus: catalogStatus ?? this.catalogStatus,
        validForInDays: validForInDays ?? this.validForInDays);
  }

  CatalogSearchCriteriaModel copyWithWrapped(
      {Wrapped<dynamic>? searchKeyword,
      Wrapped<int?>? pageNumber,
      Wrapped<int?>? pageSize,
      Wrapped<dynamic>? sortBy,
      Wrapped<bool?>? sortAscending,
      Wrapped<dynamic>? courseId,
      Wrapped<dynamic>? catalogStatus,
      Wrapped<dynamic>? validForInDays}) {
    return CatalogSearchCriteriaModel(
        searchKeyword:
            (searchKeyword != null ? searchKeyword.value : this.searchKeyword),
        pageNumber: (pageNumber != null ? pageNumber.value : this.pageNumber),
        pageSize: (pageSize != null ? pageSize.value : this.pageSize),
        sortBy: (sortBy != null ? sortBy.value : this.sortBy),
        sortAscending:
            (sortAscending != null ? sortAscending.value : this.sortAscending),
        courseId: (courseId != null ? courseId.value : this.courseId),
        catalogStatus:
            (catalogStatus != null ? catalogStatus.value : this.catalogStatus),
        validForInDays: (validForInDays != null
            ? validForInDays.value
            : this.validForInDays));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseOutModel {
  const CourseOutModel({
    required this.name,
    this.description,
    required this.feeType,
    required this.courseImageType,
    this.courseImageTypeHeight,
    this.courseImageTypeWidth,
    this.courseImageTypeBackColor,
    this.courseImageTypeFrontColor,
    this.position,
    required this.courseStatus,
    required this.courseId,
  });

  factory CourseOutModel.fromJson(Map<String, dynamic> json) =>
      _$CourseOutModelFromJson(json);

  static const toJsonFactory = _$CourseOutModelToJson;
  Map<String, dynamic> toJson() => _$CourseOutModelToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final dynamic description;
  @JsonKey(name: 'fee_type')
  final int feeType;
  @JsonKey(name: 'course_image_type')
  final int courseImageType;
  @JsonKey(name: 'course_image_type_height')
  final dynamic courseImageTypeHeight;
  @JsonKey(name: 'course_image_type_width')
  final dynamic courseImageTypeWidth;
  @JsonKey(name: 'course_image_type_back_color')
  final dynamic courseImageTypeBackColor;
  @JsonKey(name: 'course_image_type_front_color')
  final dynamic courseImageTypeFrontColor;
  @JsonKey(name: 'position')
  final dynamic position;
  @JsonKey(name: 'course_status')
  final int courseStatus;
  @JsonKey(name: 'course_id')
  final int courseId;
  static const fromJsonFactory = _$CourseOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseOutModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.feeType, feeType) ||
                const DeepCollectionEquality()
                    .equals(other.feeType, feeType)) &&
            (identical(other.courseImageType, courseImageType) ||
                const DeepCollectionEquality()
                    .equals(other.courseImageType, courseImageType)) &&
            (identical(other.courseImageTypeHeight, courseImageTypeHeight) ||
                const DeepCollectionEquality().equals(
                    other.courseImageTypeHeight, courseImageTypeHeight)) &&
            (identical(other.courseImageTypeWidth, courseImageTypeWidth) ||
                const DeepCollectionEquality().equals(
                    other.courseImageTypeWidth, courseImageTypeWidth)) &&
            (identical(
                    other.courseImageTypeBackColor, courseImageTypeBackColor) ||
                const DeepCollectionEquality().equals(
                    other.courseImageTypeBackColor,
                    courseImageTypeBackColor)) &&
            (identical(other.courseImageTypeFrontColor,
                    courseImageTypeFrontColor) ||
                const DeepCollectionEquality().equals(
                    other.courseImageTypeFrontColor,
                    courseImageTypeFrontColor)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.courseStatus, courseStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseStatus, courseStatus)) &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(feeType) ^
      const DeepCollectionEquality().hash(courseImageType) ^
      const DeepCollectionEquality().hash(courseImageTypeHeight) ^
      const DeepCollectionEquality().hash(courseImageTypeWidth) ^
      const DeepCollectionEquality().hash(courseImageTypeBackColor) ^
      const DeepCollectionEquality().hash(courseImageTypeFrontColor) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(courseStatus) ^
      const DeepCollectionEquality().hash(courseId) ^
      runtimeType.hashCode;
}

extension $CourseOutModelExtension on CourseOutModel {
  CourseOutModel copyWith(
      {String? name,
      dynamic description,
      int? feeType,
      int? courseImageType,
      dynamic courseImageTypeHeight,
      dynamic courseImageTypeWidth,
      dynamic courseImageTypeBackColor,
      dynamic courseImageTypeFrontColor,
      dynamic position,
      int? courseStatus,
      int? courseId}) {
    return CourseOutModel(
        name: name ?? this.name,
        description: description ?? this.description,
        feeType: feeType ?? this.feeType,
        courseImageType: courseImageType ?? this.courseImageType,
        courseImageTypeHeight:
            courseImageTypeHeight ?? this.courseImageTypeHeight,
        courseImageTypeWidth: courseImageTypeWidth ?? this.courseImageTypeWidth,
        courseImageTypeBackColor:
            courseImageTypeBackColor ?? this.courseImageTypeBackColor,
        courseImageTypeFrontColor:
            courseImageTypeFrontColor ?? this.courseImageTypeFrontColor,
        position: position ?? this.position,
        courseStatus: courseStatus ?? this.courseStatus,
        courseId: courseId ?? this.courseId);
  }

  CourseOutModel copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<dynamic>? description,
      Wrapped<int>? feeType,
      Wrapped<int>? courseImageType,
      Wrapped<dynamic>? courseImageTypeHeight,
      Wrapped<dynamic>? courseImageTypeWidth,
      Wrapped<dynamic>? courseImageTypeBackColor,
      Wrapped<dynamic>? courseImageTypeFrontColor,
      Wrapped<dynamic>? position,
      Wrapped<int>? courseStatus,
      Wrapped<int>? courseId}) {
    return CourseOutModel(
        name: (name != null ? name.value : this.name),
        description:
            (description != null ? description.value : this.description),
        feeType: (feeType != null ? feeType.value : this.feeType),
        courseImageType: (courseImageType != null
            ? courseImageType.value
            : this.courseImageType),
        courseImageTypeHeight: (courseImageTypeHeight != null
            ? courseImageTypeHeight.value
            : this.courseImageTypeHeight),
        courseImageTypeWidth: (courseImageTypeWidth != null
            ? courseImageTypeWidth.value
            : this.courseImageTypeWidth),
        courseImageTypeBackColor: (courseImageTypeBackColor != null
            ? courseImageTypeBackColor.value
            : this.courseImageTypeBackColor),
        courseImageTypeFrontColor: (courseImageTypeFrontColor != null
            ? courseImageTypeFrontColor.value
            : this.courseImageTypeFrontColor),
        position: (position != null ? position.value : this.position),
        courseStatus:
            (courseStatus != null ? courseStatus.value : this.courseStatus),
        courseId: (courseId != null ? courseId.value : this.courseId));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModelCourseOutModel {
  const ReturnModelCourseOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModelCourseOutModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelCourseOutModelFromJson(json);

  static const toJsonFactory = _$ReturnModelCourseOutModelToJson;
  Map<String, dynamic> toJson() => _$ReturnModelCourseOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory = _$ReturnModelCourseOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModelCourseOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelCourseOutModelExtension on ReturnModelCourseOutModel {
  ReturnModelCourseOutModel copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModelCourseOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModelCourseOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModelCourseOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseUpdateModel {
  const CourseUpdateModel({
    required this.name,
    this.description,
    required this.feeType,
    required this.courseImageType,
    this.courseImageTypeHeight,
    this.courseImageTypeWidth,
    this.courseImageTypeBackColor,
    this.courseImageTypeFrontColor,
    this.position,
    required this.courseStatus,
  });

  factory CourseUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$CourseUpdateModelFromJson(json);

  static const toJsonFactory = _$CourseUpdateModelToJson;
  Map<String, dynamic> toJson() => _$CourseUpdateModelToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final dynamic description;
  @JsonKey(name: 'fee_type')
  final int feeType;
  @JsonKey(name: 'course_image_type')
  final int courseImageType;
  @JsonKey(name: 'course_image_type_height')
  final dynamic courseImageTypeHeight;
  @JsonKey(name: 'course_image_type_width')
  final dynamic courseImageTypeWidth;
  @JsonKey(name: 'course_image_type_back_color')
  final dynamic courseImageTypeBackColor;
  @JsonKey(name: 'course_image_type_front_color')
  final dynamic courseImageTypeFrontColor;
  @JsonKey(name: 'position')
  final dynamic position;
  @JsonKey(name: 'course_status')
  final int courseStatus;
  static const fromJsonFactory = _$CourseUpdateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseUpdateModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.feeType, feeType) ||
                const DeepCollectionEquality()
                    .equals(other.feeType, feeType)) &&
            (identical(other.courseImageType, courseImageType) ||
                const DeepCollectionEquality()
                    .equals(other.courseImageType, courseImageType)) &&
            (identical(other.courseImageTypeHeight, courseImageTypeHeight) ||
                const DeepCollectionEquality().equals(
                    other.courseImageTypeHeight, courseImageTypeHeight)) &&
            (identical(other.courseImageTypeWidth, courseImageTypeWidth) ||
                const DeepCollectionEquality().equals(
                    other.courseImageTypeWidth, courseImageTypeWidth)) &&
            (identical(
                    other.courseImageTypeBackColor, courseImageTypeBackColor) ||
                const DeepCollectionEquality().equals(
                    other.courseImageTypeBackColor,
                    courseImageTypeBackColor)) &&
            (identical(other.courseImageTypeFrontColor,
                    courseImageTypeFrontColor) ||
                const DeepCollectionEquality().equals(
                    other.courseImageTypeFrontColor,
                    courseImageTypeFrontColor)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.courseStatus, courseStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseStatus, courseStatus)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(feeType) ^
      const DeepCollectionEquality().hash(courseImageType) ^
      const DeepCollectionEquality().hash(courseImageTypeHeight) ^
      const DeepCollectionEquality().hash(courseImageTypeWidth) ^
      const DeepCollectionEquality().hash(courseImageTypeBackColor) ^
      const DeepCollectionEquality().hash(courseImageTypeFrontColor) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(courseStatus) ^
      runtimeType.hashCode;
}

extension $CourseUpdateModelExtension on CourseUpdateModel {
  CourseUpdateModel copyWith(
      {String? name,
      dynamic description,
      int? feeType,
      int? courseImageType,
      dynamic courseImageTypeHeight,
      dynamic courseImageTypeWidth,
      dynamic courseImageTypeBackColor,
      dynamic courseImageTypeFrontColor,
      dynamic position,
      int? courseStatus}) {
    return CourseUpdateModel(
        name: name ?? this.name,
        description: description ?? this.description,
        feeType: feeType ?? this.feeType,
        courseImageType: courseImageType ?? this.courseImageType,
        courseImageTypeHeight:
            courseImageTypeHeight ?? this.courseImageTypeHeight,
        courseImageTypeWidth: courseImageTypeWidth ?? this.courseImageTypeWidth,
        courseImageTypeBackColor:
            courseImageTypeBackColor ?? this.courseImageTypeBackColor,
        courseImageTypeFrontColor:
            courseImageTypeFrontColor ?? this.courseImageTypeFrontColor,
        position: position ?? this.position,
        courseStatus: courseStatus ?? this.courseStatus);
  }

  CourseUpdateModel copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<dynamic>? description,
      Wrapped<int>? feeType,
      Wrapped<int>? courseImageType,
      Wrapped<dynamic>? courseImageTypeHeight,
      Wrapped<dynamic>? courseImageTypeWidth,
      Wrapped<dynamic>? courseImageTypeBackColor,
      Wrapped<dynamic>? courseImageTypeFrontColor,
      Wrapped<dynamic>? position,
      Wrapped<int>? courseStatus}) {
    return CourseUpdateModel(
        name: (name != null ? name.value : this.name),
        description:
            (description != null ? description.value : this.description),
        feeType: (feeType != null ? feeType.value : this.feeType),
        courseImageType: (courseImageType != null
            ? courseImageType.value
            : this.courseImageType),
        courseImageTypeHeight: (courseImageTypeHeight != null
            ? courseImageTypeHeight.value
            : this.courseImageTypeHeight),
        courseImageTypeWidth: (courseImageTypeWidth != null
            ? courseImageTypeWidth.value
            : this.courseImageTypeWidth),
        courseImageTypeBackColor: (courseImageTypeBackColor != null
            ? courseImageTypeBackColor.value
            : this.courseImageTypeBackColor),
        courseImageTypeFrontColor: (courseImageTypeFrontColor != null
            ? courseImageTypeFrontColor.value
            : this.courseImageTypeFrontColor),
        position: (position != null ? position.value : this.position),
        courseStatus:
            (courseStatus != null ? courseStatus.value : this.courseStatus));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnListModelCourseOutModel {
  const ReturnListModelCourseOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
    this.count,
  });

  factory ReturnListModelCourseOutModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnListModelCourseOutModelFromJson(json);

  static const toJsonFactory = _$ReturnListModelCourseOutModelToJson;
  Map<String, dynamic> toJson() => _$ReturnListModelCourseOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  @JsonKey(name: 'count')
  final int? count;
  static const fromJsonFactory = _$ReturnListModelCourseOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnListModelCourseOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      const DeepCollectionEquality().hash(count) ^
      runtimeType.hashCode;
}

extension $ReturnListModelCourseOutModelExtension
    on ReturnListModelCourseOutModel {
  ReturnListModelCourseOutModel copyWith(
      {dynamic data,
      bool? status,
      String? message,
      dynamic errors,
      int? count}) {
    return ReturnListModelCourseOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        count: count ?? this.count);
  }

  ReturnListModelCourseOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors,
      Wrapped<int?>? count}) {
    return ReturnListModelCourseOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors),
        count: (count != null ? count.value : this.count));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseCreateModel {
  const CourseCreateModel({
    required this.name,
    this.description,
    required this.feeType,
    required this.courseImageType,
    this.courseImageTypeHeight,
    this.courseImageTypeWidth,
    this.courseImageTypeBackColor,
    this.courseImageTypeFrontColor,
    this.position,
    required this.courseStatus,
  });

  factory CourseCreateModel.fromJson(Map<String, dynamic> json) =>
      _$CourseCreateModelFromJson(json);

  static const toJsonFactory = _$CourseCreateModelToJson;
  Map<String, dynamic> toJson() => _$CourseCreateModelToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final dynamic description;
  @JsonKey(name: 'fee_type')
  final int feeType;
  @JsonKey(name: 'course_image_type')
  final int courseImageType;
  @JsonKey(name: 'course_image_type_height')
  final dynamic courseImageTypeHeight;
  @JsonKey(name: 'course_image_type_width')
  final dynamic courseImageTypeWidth;
  @JsonKey(name: 'course_image_type_back_color')
  final dynamic courseImageTypeBackColor;
  @JsonKey(name: 'course_image_type_front_color')
  final dynamic courseImageTypeFrontColor;
  @JsonKey(name: 'position')
  final dynamic position;
  @JsonKey(name: 'course_status')
  final int courseStatus;
  static const fromJsonFactory = _$CourseCreateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseCreateModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.feeType, feeType) ||
                const DeepCollectionEquality()
                    .equals(other.feeType, feeType)) &&
            (identical(other.courseImageType, courseImageType) ||
                const DeepCollectionEquality()
                    .equals(other.courseImageType, courseImageType)) &&
            (identical(other.courseImageTypeHeight, courseImageTypeHeight) ||
                const DeepCollectionEquality().equals(
                    other.courseImageTypeHeight, courseImageTypeHeight)) &&
            (identical(other.courseImageTypeWidth, courseImageTypeWidth) ||
                const DeepCollectionEquality().equals(
                    other.courseImageTypeWidth, courseImageTypeWidth)) &&
            (identical(
                    other.courseImageTypeBackColor, courseImageTypeBackColor) ||
                const DeepCollectionEquality().equals(
                    other.courseImageTypeBackColor,
                    courseImageTypeBackColor)) &&
            (identical(other.courseImageTypeFrontColor,
                    courseImageTypeFrontColor) ||
                const DeepCollectionEquality().equals(
                    other.courseImageTypeFrontColor,
                    courseImageTypeFrontColor)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.courseStatus, courseStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseStatus, courseStatus)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(feeType) ^
      const DeepCollectionEquality().hash(courseImageType) ^
      const DeepCollectionEquality().hash(courseImageTypeHeight) ^
      const DeepCollectionEquality().hash(courseImageTypeWidth) ^
      const DeepCollectionEquality().hash(courseImageTypeBackColor) ^
      const DeepCollectionEquality().hash(courseImageTypeFrontColor) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(courseStatus) ^
      runtimeType.hashCode;
}

extension $CourseCreateModelExtension on CourseCreateModel {
  CourseCreateModel copyWith(
      {String? name,
      dynamic description,
      int? feeType,
      int? courseImageType,
      dynamic courseImageTypeHeight,
      dynamic courseImageTypeWidth,
      dynamic courseImageTypeBackColor,
      dynamic courseImageTypeFrontColor,
      dynamic position,
      int? courseStatus}) {
    return CourseCreateModel(
        name: name ?? this.name,
        description: description ?? this.description,
        feeType: feeType ?? this.feeType,
        courseImageType: courseImageType ?? this.courseImageType,
        courseImageTypeHeight:
            courseImageTypeHeight ?? this.courseImageTypeHeight,
        courseImageTypeWidth: courseImageTypeWidth ?? this.courseImageTypeWidth,
        courseImageTypeBackColor:
            courseImageTypeBackColor ?? this.courseImageTypeBackColor,
        courseImageTypeFrontColor:
            courseImageTypeFrontColor ?? this.courseImageTypeFrontColor,
        position: position ?? this.position,
        courseStatus: courseStatus ?? this.courseStatus);
  }

  CourseCreateModel copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<dynamic>? description,
      Wrapped<int>? feeType,
      Wrapped<int>? courseImageType,
      Wrapped<dynamic>? courseImageTypeHeight,
      Wrapped<dynamic>? courseImageTypeWidth,
      Wrapped<dynamic>? courseImageTypeBackColor,
      Wrapped<dynamic>? courseImageTypeFrontColor,
      Wrapped<dynamic>? position,
      Wrapped<int>? courseStatus}) {
    return CourseCreateModel(
        name: (name != null ? name.value : this.name),
        description:
            (description != null ? description.value : this.description),
        feeType: (feeType != null ? feeType.value : this.feeType),
        courseImageType: (courseImageType != null
            ? courseImageType.value
            : this.courseImageType),
        courseImageTypeHeight: (courseImageTypeHeight != null
            ? courseImageTypeHeight.value
            : this.courseImageTypeHeight),
        courseImageTypeWidth: (courseImageTypeWidth != null
            ? courseImageTypeWidth.value
            : this.courseImageTypeWidth),
        courseImageTypeBackColor: (courseImageTypeBackColor != null
            ? courseImageTypeBackColor.value
            : this.courseImageTypeBackColor),
        courseImageTypeFrontColor: (courseImageTypeFrontColor != null
            ? courseImageTypeFrontColor.value
            : this.courseImageTypeFrontColor),
        position: (position != null ? position.value : this.position),
        courseStatus:
            (courseStatus != null ? courseStatus.value : this.courseStatus));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseBatchOutModel {
  const CourseBatchOutModel({
    required this.courseId,
    required this.batchName,
    this.position,
    required this.courseBatchStatus,
    required this.courseBatchId,
  });

  factory CourseBatchOutModel.fromJson(Map<String, dynamic> json) =>
      _$CourseBatchOutModelFromJson(json);

  static const toJsonFactory = _$CourseBatchOutModelToJson;
  Map<String, dynamic> toJson() => _$CourseBatchOutModelToJson(this);

  @JsonKey(name: 'course_id')
  final int courseId;
  @JsonKey(name: 'batch_name')
  final String batchName;
  @JsonKey(name: 'position')
  final dynamic position;
  @JsonKey(name: 'course_batch_status')
  final int courseBatchStatus;
  @JsonKey(name: 'course_batch_id')
  final int courseBatchId;
  static const fromJsonFactory = _$CourseBatchOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseBatchOutModel &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.batchName, batchName) ||
                const DeepCollectionEquality()
                    .equals(other.batchName, batchName)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.courseBatchStatus, courseBatchStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseBatchStatus, courseBatchStatus)) &&
            (identical(other.courseBatchId, courseBatchId) ||
                const DeepCollectionEquality()
                    .equals(other.courseBatchId, courseBatchId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(batchName) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(courseBatchStatus) ^
      const DeepCollectionEquality().hash(courseBatchId) ^
      runtimeType.hashCode;
}

extension $CourseBatchOutModelExtension on CourseBatchOutModel {
  CourseBatchOutModel copyWith(
      {int? courseId,
      String? batchName,
      dynamic position,
      int? courseBatchStatus,
      int? courseBatchId}) {
    return CourseBatchOutModel(
        courseId: courseId ?? this.courseId,
        batchName: batchName ?? this.batchName,
        position: position ?? this.position,
        courseBatchStatus: courseBatchStatus ?? this.courseBatchStatus,
        courseBatchId: courseBatchId ?? this.courseBatchId);
  }

  CourseBatchOutModel copyWithWrapped(
      {Wrapped<int>? courseId,
      Wrapped<String>? batchName,
      Wrapped<dynamic>? position,
      Wrapped<int>? courseBatchStatus,
      Wrapped<int>? courseBatchId}) {
    return CourseBatchOutModel(
        courseId: (courseId != null ? courseId.value : this.courseId),
        batchName: (batchName != null ? batchName.value : this.batchName),
        position: (position != null ? position.value : this.position),
        courseBatchStatus: (courseBatchStatus != null
            ? courseBatchStatus.value
            : this.courseBatchStatus),
        courseBatchId:
            (courseBatchId != null ? courseBatchId.value : this.courseBatchId));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnListModelCourseBatchOutModel {
  const ReturnListModelCourseBatchOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
    this.count,
  });

  factory ReturnListModelCourseBatchOutModel.fromJson(
          Map<String, dynamic> json) =>
      _$ReturnListModelCourseBatchOutModelFromJson(json);

  static const toJsonFactory = _$ReturnListModelCourseBatchOutModelToJson;
  Map<String, dynamic> toJson() =>
      _$ReturnListModelCourseBatchOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  @JsonKey(name: 'count')
  final int? count;
  static const fromJsonFactory = _$ReturnListModelCourseBatchOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnListModelCourseBatchOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      const DeepCollectionEquality().hash(count) ^
      runtimeType.hashCode;
}

extension $ReturnListModelCourseBatchOutModelExtension
    on ReturnListModelCourseBatchOutModel {
  ReturnListModelCourseBatchOutModel copyWith(
      {dynamic data,
      bool? status,
      String? message,
      dynamic errors,
      int? count}) {
    return ReturnListModelCourseBatchOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        count: count ?? this.count);
  }

  ReturnListModelCourseBatchOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors,
      Wrapped<int?>? count}) {
    return ReturnListModelCourseBatchOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors),
        count: (count != null ? count.value : this.count));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseMediaOutModel {
  const CourseMediaOutModel({
    required this.courseId,
    this.courseBatchId,
    this.position,
    required this.title,
    this.description,
    required this.courseMediaStatus,
    required this.courseMediaType,
    required this.courseMediaLocation,
    this.courseMediaSize,
    required this.courseMediaId,
  });

  factory CourseMediaOutModel.fromJson(Map<String, dynamic> json) =>
      _$CourseMediaOutModelFromJson(json);

  static const toJsonFactory = _$CourseMediaOutModelToJson;
  Map<String, dynamic> toJson() => _$CourseMediaOutModelToJson(this);

  @JsonKey(name: 'course_id')
  final int courseId;
  @JsonKey(name: 'course_batch_id')
  final dynamic courseBatchId;
  @JsonKey(name: 'position')
  final dynamic position;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final dynamic description;
  @JsonKey(name: 'course_media_status')
  final int courseMediaStatus;
  @JsonKey(name: 'course_media_type')
  final int courseMediaType;
  @JsonKey(name: 'course_media_location')
  final String courseMediaLocation;
  @JsonKey(name: 'course_media_size')
  final dynamic courseMediaSize;
  @JsonKey(name: 'course_media_id')
  final int courseMediaId;
  static const fromJsonFactory = _$CourseMediaOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseMediaOutModel &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.courseBatchId, courseBatchId) ||
                const DeepCollectionEquality()
                    .equals(other.courseBatchId, courseBatchId)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.courseMediaStatus, courseMediaStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseMediaStatus, courseMediaStatus)) &&
            (identical(other.courseMediaType, courseMediaType) ||
                const DeepCollectionEquality()
                    .equals(other.courseMediaType, courseMediaType)) &&
            (identical(other.courseMediaLocation, courseMediaLocation) ||
                const DeepCollectionEquality()
                    .equals(other.courseMediaLocation, courseMediaLocation)) &&
            (identical(other.courseMediaSize, courseMediaSize) ||
                const DeepCollectionEquality()
                    .equals(other.courseMediaSize, courseMediaSize)) &&
            (identical(other.courseMediaId, courseMediaId) ||
                const DeepCollectionEquality()
                    .equals(other.courseMediaId, courseMediaId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(courseBatchId) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(courseMediaStatus) ^
      const DeepCollectionEquality().hash(courseMediaType) ^
      const DeepCollectionEquality().hash(courseMediaLocation) ^
      const DeepCollectionEquality().hash(courseMediaSize) ^
      const DeepCollectionEquality().hash(courseMediaId) ^
      runtimeType.hashCode;
}

extension $CourseMediaOutModelExtension on CourseMediaOutModel {
  CourseMediaOutModel copyWith(
      {int? courseId,
      dynamic courseBatchId,
      dynamic position,
      String? title,
      dynamic description,
      int? courseMediaStatus,
      int? courseMediaType,
      String? courseMediaLocation,
      dynamic courseMediaSize,
      int? courseMediaId}) {
    return CourseMediaOutModel(
        courseId: courseId ?? this.courseId,
        courseBatchId: courseBatchId ?? this.courseBatchId,
        position: position ?? this.position,
        title: title ?? this.title,
        description: description ?? this.description,
        courseMediaStatus: courseMediaStatus ?? this.courseMediaStatus,
        courseMediaType: courseMediaType ?? this.courseMediaType,
        courseMediaLocation: courseMediaLocation ?? this.courseMediaLocation,
        courseMediaSize: courseMediaSize ?? this.courseMediaSize,
        courseMediaId: courseMediaId ?? this.courseMediaId);
  }

  CourseMediaOutModel copyWithWrapped(
      {Wrapped<int>? courseId,
      Wrapped<dynamic>? courseBatchId,
      Wrapped<dynamic>? position,
      Wrapped<String>? title,
      Wrapped<dynamic>? description,
      Wrapped<int>? courseMediaStatus,
      Wrapped<int>? courseMediaType,
      Wrapped<String>? courseMediaLocation,
      Wrapped<dynamic>? courseMediaSize,
      Wrapped<int>? courseMediaId}) {
    return CourseMediaOutModel(
        courseId: (courseId != null ? courseId.value : this.courseId),
        courseBatchId:
            (courseBatchId != null ? courseBatchId.value : this.courseBatchId),
        position: (position != null ? position.value : this.position),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        courseMediaStatus: (courseMediaStatus != null
            ? courseMediaStatus.value
            : this.courseMediaStatus),
        courseMediaType: (courseMediaType != null
            ? courseMediaType.value
            : this.courseMediaType),
        courseMediaLocation: (courseMediaLocation != null
            ? courseMediaLocation.value
            : this.courseMediaLocation),
        courseMediaSize: (courseMediaSize != null
            ? courseMediaSize.value
            : this.courseMediaSize),
        courseMediaId:
            (courseMediaId != null ? courseMediaId.value : this.courseMediaId));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnListModelCourseMediaOutModel {
  const ReturnListModelCourseMediaOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
    this.count,
  });

  factory ReturnListModelCourseMediaOutModel.fromJson(
          Map<String, dynamic> json) =>
      _$ReturnListModelCourseMediaOutModelFromJson(json);

  static const toJsonFactory = _$ReturnListModelCourseMediaOutModelToJson;
  Map<String, dynamic> toJson() =>
      _$ReturnListModelCourseMediaOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  @JsonKey(name: 'count')
  final int? count;
  static const fromJsonFactory = _$ReturnListModelCourseMediaOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnListModelCourseMediaOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      const DeepCollectionEquality().hash(count) ^
      runtimeType.hashCode;
}

extension $ReturnListModelCourseMediaOutModelExtension
    on ReturnListModelCourseMediaOutModel {
  ReturnListModelCourseMediaOutModel copyWith(
      {dynamic data,
      bool? status,
      String? message,
      dynamic errors,
      int? count}) {
    return ReturnListModelCourseMediaOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        count: count ?? this.count);
  }

  ReturnListModelCourseMediaOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors,
      Wrapped<int?>? count}) {
    return ReturnListModelCourseMediaOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors),
        count: (count != null ? count.value : this.count));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseUserOutModel {
  const CourseUserOutModel({
    required this.courseId,
    this.courseBatchId,
    required this.userId,
    required this.tenantId,
    this.validUntil,
    required this.courseUserStatus,
    required this.courseUserId,
  });

  factory CourseUserOutModel.fromJson(Map<String, dynamic> json) =>
      _$CourseUserOutModelFromJson(json);

  static const toJsonFactory = _$CourseUserOutModelToJson;
  Map<String, dynamic> toJson() => _$CourseUserOutModelToJson(this);

  @JsonKey(name: 'course_id')
  final int courseId;
  @JsonKey(name: 'course_batch_id')
  final dynamic courseBatchId;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'tenant_id')
  final String tenantId;
  @JsonKey(name: 'valid_until')
  final dynamic validUntil;
  @JsonKey(name: 'course_user_status')
  final int courseUserStatus;
  @JsonKey(name: 'course_user_id')
  final int courseUserId;
  static const fromJsonFactory = _$CourseUserOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseUserOutModel &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.courseBatchId, courseBatchId) ||
                const DeepCollectionEquality()
                    .equals(other.courseBatchId, courseBatchId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.tenantId, tenantId) ||
                const DeepCollectionEquality()
                    .equals(other.tenantId, tenantId)) &&
            (identical(other.validUntil, validUntil) ||
                const DeepCollectionEquality()
                    .equals(other.validUntil, validUntil)) &&
            (identical(other.courseUserStatus, courseUserStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseUserStatus, courseUserStatus)) &&
            (identical(other.courseUserId, courseUserId) ||
                const DeepCollectionEquality()
                    .equals(other.courseUserId, courseUserId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(courseBatchId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(tenantId) ^
      const DeepCollectionEquality().hash(validUntil) ^
      const DeepCollectionEquality().hash(courseUserStatus) ^
      const DeepCollectionEquality().hash(courseUserId) ^
      runtimeType.hashCode;
}

extension $CourseUserOutModelExtension on CourseUserOutModel {
  CourseUserOutModel copyWith(
      {int? courseId,
      dynamic courseBatchId,
      int? userId,
      String? tenantId,
      dynamic validUntil,
      int? courseUserStatus,
      int? courseUserId}) {
    return CourseUserOutModel(
        courseId: courseId ?? this.courseId,
        courseBatchId: courseBatchId ?? this.courseBatchId,
        userId: userId ?? this.userId,
        tenantId: tenantId ?? this.tenantId,
        validUntil: validUntil ?? this.validUntil,
        courseUserStatus: courseUserStatus ?? this.courseUserStatus,
        courseUserId: courseUserId ?? this.courseUserId);
  }

  CourseUserOutModel copyWithWrapped(
      {Wrapped<int>? courseId,
      Wrapped<dynamic>? courseBatchId,
      Wrapped<int>? userId,
      Wrapped<String>? tenantId,
      Wrapped<dynamic>? validUntil,
      Wrapped<int>? courseUserStatus,
      Wrapped<int>? courseUserId}) {
    return CourseUserOutModel(
        courseId: (courseId != null ? courseId.value : this.courseId),
        courseBatchId:
            (courseBatchId != null ? courseBatchId.value : this.courseBatchId),
        userId: (userId != null ? userId.value : this.userId),
        tenantId: (tenantId != null ? tenantId.value : this.tenantId),
        validUntil: (validUntil != null ? validUntil.value : this.validUntil),
        courseUserStatus: (courseUserStatus != null
            ? courseUserStatus.value
            : this.courseUserStatus),
        courseUserId:
            (courseUserId != null ? courseUserId.value : this.courseUserId));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnListModelCourseUserOutModel {
  const ReturnListModelCourseUserOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
    this.count,
  });

  factory ReturnListModelCourseUserOutModel.fromJson(
          Map<String, dynamic> json) =>
      _$ReturnListModelCourseUserOutModelFromJson(json);

  static const toJsonFactory = _$ReturnListModelCourseUserOutModelToJson;
  Map<String, dynamic> toJson() =>
      _$ReturnListModelCourseUserOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  @JsonKey(name: 'count')
  final int? count;
  static const fromJsonFactory = _$ReturnListModelCourseUserOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnListModelCourseUserOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      const DeepCollectionEquality().hash(count) ^
      runtimeType.hashCode;
}

extension $ReturnListModelCourseUserOutModelExtension
    on ReturnListModelCourseUserOutModel {
  ReturnListModelCourseUserOutModel copyWith(
      {dynamic data,
      bool? status,
      String? message,
      dynamic errors,
      int? count}) {
    return ReturnListModelCourseUserOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        count: count ?? this.count);
  }

  ReturnListModelCourseUserOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors,
      Wrapped<int?>? count}) {
    return ReturnListModelCourseUserOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors),
        count: (count != null ? count.value : this.count));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModelCourseBatchOutModel {
  const ReturnModelCourseBatchOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModelCourseBatchOutModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelCourseBatchOutModelFromJson(json);

  static const toJsonFactory = _$ReturnModelCourseBatchOutModelToJson;
  Map<String, dynamic> toJson() => _$ReturnModelCourseBatchOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory = _$ReturnModelCourseBatchOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModelCourseBatchOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelCourseBatchOutModelExtension
    on ReturnModelCourseBatchOutModel {
  ReturnModelCourseBatchOutModel copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModelCourseBatchOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModelCourseBatchOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModelCourseBatchOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseBatchUpdateModel {
  const CourseBatchUpdateModel({
    required this.courseId,
    required this.batchName,
    this.position,
    required this.courseBatchStatus,
  });

  factory CourseBatchUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$CourseBatchUpdateModelFromJson(json);

  static const toJsonFactory = _$CourseBatchUpdateModelToJson;
  Map<String, dynamic> toJson() => _$CourseBatchUpdateModelToJson(this);

  @JsonKey(name: 'course_id')
  final int courseId;
  @JsonKey(name: 'batch_name')
  final String batchName;
  @JsonKey(name: 'position')
  final dynamic position;
  @JsonKey(name: 'course_batch_status')
  final int courseBatchStatus;
  static const fromJsonFactory = _$CourseBatchUpdateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseBatchUpdateModel &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.batchName, batchName) ||
                const DeepCollectionEquality()
                    .equals(other.batchName, batchName)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.courseBatchStatus, courseBatchStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseBatchStatus, courseBatchStatus)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(batchName) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(courseBatchStatus) ^
      runtimeType.hashCode;
}

extension $CourseBatchUpdateModelExtension on CourseBatchUpdateModel {
  CourseBatchUpdateModel copyWith(
      {int? courseId,
      String? batchName,
      dynamic position,
      int? courseBatchStatus}) {
    return CourseBatchUpdateModel(
        courseId: courseId ?? this.courseId,
        batchName: batchName ?? this.batchName,
        position: position ?? this.position,
        courseBatchStatus: courseBatchStatus ?? this.courseBatchStatus);
  }

  CourseBatchUpdateModel copyWithWrapped(
      {Wrapped<int>? courseId,
      Wrapped<String>? batchName,
      Wrapped<dynamic>? position,
      Wrapped<int>? courseBatchStatus}) {
    return CourseBatchUpdateModel(
        courseId: (courseId != null ? courseId.value : this.courseId),
        batchName: (batchName != null ? batchName.value : this.batchName),
        position: (position != null ? position.value : this.position),
        courseBatchStatus: (courseBatchStatus != null
            ? courseBatchStatus.value
            : this.courseBatchStatus));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseBatchCreateModel {
  const CourseBatchCreateModel({
    required this.courseId,
    required this.batchName,
    this.position,
    required this.courseBatchStatus,
  });

  factory CourseBatchCreateModel.fromJson(Map<String, dynamic> json) =>
      _$CourseBatchCreateModelFromJson(json);

  static const toJsonFactory = _$CourseBatchCreateModelToJson;
  Map<String, dynamic> toJson() => _$CourseBatchCreateModelToJson(this);

  @JsonKey(name: 'course_id')
  final int courseId;
  @JsonKey(name: 'batch_name')
  final String batchName;
  @JsonKey(name: 'position')
  final dynamic position;
  @JsonKey(name: 'course_batch_status')
  final int courseBatchStatus;
  static const fromJsonFactory = _$CourseBatchCreateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseBatchCreateModel &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.batchName, batchName) ||
                const DeepCollectionEquality()
                    .equals(other.batchName, batchName)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.courseBatchStatus, courseBatchStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseBatchStatus, courseBatchStatus)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(batchName) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(courseBatchStatus) ^
      runtimeType.hashCode;
}

extension $CourseBatchCreateModelExtension on CourseBatchCreateModel {
  CourseBatchCreateModel copyWith(
      {int? courseId,
      String? batchName,
      dynamic position,
      int? courseBatchStatus}) {
    return CourseBatchCreateModel(
        courseId: courseId ?? this.courseId,
        batchName: batchName ?? this.batchName,
        position: position ?? this.position,
        courseBatchStatus: courseBatchStatus ?? this.courseBatchStatus);
  }

  CourseBatchCreateModel copyWithWrapped(
      {Wrapped<int>? courseId,
      Wrapped<String>? batchName,
      Wrapped<dynamic>? position,
      Wrapped<int>? courseBatchStatus}) {
    return CourseBatchCreateModel(
        courseId: (courseId != null ? courseId.value : this.courseId),
        batchName: (batchName != null ? batchName.value : this.batchName),
        position: (position != null ? position.value : this.position),
        courseBatchStatus: (courseBatchStatus != null
            ? courseBatchStatus.value
            : this.courseBatchStatus));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModelCourseMediaOutModel {
  const ReturnModelCourseMediaOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModelCourseMediaOutModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelCourseMediaOutModelFromJson(json);

  static const toJsonFactory = _$ReturnModelCourseMediaOutModelToJson;
  Map<String, dynamic> toJson() => _$ReturnModelCourseMediaOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory = _$ReturnModelCourseMediaOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModelCourseMediaOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelCourseMediaOutModelExtension
    on ReturnModelCourseMediaOutModel {
  ReturnModelCourseMediaOutModel copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModelCourseMediaOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModelCourseMediaOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModelCourseMediaOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseMediaUpdateModel {
  const CourseMediaUpdateModel({
    required this.courseId,
    this.courseBatchId,
    this.position,
    required this.title,
    this.description,
    required this.courseMediaStatus,
    required this.courseMediaType,
    required this.courseMediaLocation,
    this.courseMediaSize,
  });

  factory CourseMediaUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$CourseMediaUpdateModelFromJson(json);

  static const toJsonFactory = _$CourseMediaUpdateModelToJson;
  Map<String, dynamic> toJson() => _$CourseMediaUpdateModelToJson(this);

  @JsonKey(name: 'course_id')
  final int courseId;
  @JsonKey(name: 'course_batch_id')
  final dynamic courseBatchId;
  @JsonKey(name: 'position')
  final dynamic position;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final dynamic description;
  @JsonKey(name: 'course_media_status')
  final int courseMediaStatus;
  @JsonKey(name: 'course_media_type')
  final int courseMediaType;
  @JsonKey(name: 'course_media_location')
  final String courseMediaLocation;
  @JsonKey(name: 'course_media_size')
  final dynamic courseMediaSize;
  static const fromJsonFactory = _$CourseMediaUpdateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseMediaUpdateModel &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.courseBatchId, courseBatchId) ||
                const DeepCollectionEquality()
                    .equals(other.courseBatchId, courseBatchId)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.courseMediaStatus, courseMediaStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseMediaStatus, courseMediaStatus)) &&
            (identical(other.courseMediaType, courseMediaType) ||
                const DeepCollectionEquality()
                    .equals(other.courseMediaType, courseMediaType)) &&
            (identical(other.courseMediaLocation, courseMediaLocation) ||
                const DeepCollectionEquality()
                    .equals(other.courseMediaLocation, courseMediaLocation)) &&
            (identical(other.courseMediaSize, courseMediaSize) ||
                const DeepCollectionEquality()
                    .equals(other.courseMediaSize, courseMediaSize)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(courseBatchId) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(courseMediaStatus) ^
      const DeepCollectionEquality().hash(courseMediaType) ^
      const DeepCollectionEquality().hash(courseMediaLocation) ^
      const DeepCollectionEquality().hash(courseMediaSize) ^
      runtimeType.hashCode;
}

extension $CourseMediaUpdateModelExtension on CourseMediaUpdateModel {
  CourseMediaUpdateModel copyWith(
      {int? courseId,
      dynamic courseBatchId,
      dynamic position,
      String? title,
      dynamic description,
      int? courseMediaStatus,
      int? courseMediaType,
      String? courseMediaLocation,
      dynamic courseMediaSize}) {
    return CourseMediaUpdateModel(
        courseId: courseId ?? this.courseId,
        courseBatchId: courseBatchId ?? this.courseBatchId,
        position: position ?? this.position,
        title: title ?? this.title,
        description: description ?? this.description,
        courseMediaStatus: courseMediaStatus ?? this.courseMediaStatus,
        courseMediaType: courseMediaType ?? this.courseMediaType,
        courseMediaLocation: courseMediaLocation ?? this.courseMediaLocation,
        courseMediaSize: courseMediaSize ?? this.courseMediaSize);
  }

  CourseMediaUpdateModel copyWithWrapped(
      {Wrapped<int>? courseId,
      Wrapped<dynamic>? courseBatchId,
      Wrapped<dynamic>? position,
      Wrapped<String>? title,
      Wrapped<dynamic>? description,
      Wrapped<int>? courseMediaStatus,
      Wrapped<int>? courseMediaType,
      Wrapped<String>? courseMediaLocation,
      Wrapped<dynamic>? courseMediaSize}) {
    return CourseMediaUpdateModel(
        courseId: (courseId != null ? courseId.value : this.courseId),
        courseBatchId:
            (courseBatchId != null ? courseBatchId.value : this.courseBatchId),
        position: (position != null ? position.value : this.position),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        courseMediaStatus: (courseMediaStatus != null
            ? courseMediaStatus.value
            : this.courseMediaStatus),
        courseMediaType: (courseMediaType != null
            ? courseMediaType.value
            : this.courseMediaType),
        courseMediaLocation: (courseMediaLocation != null
            ? courseMediaLocation.value
            : this.courseMediaLocation),
        courseMediaSize: (courseMediaSize != null
            ? courseMediaSize.value
            : this.courseMediaSize));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseMediaCreateModel {
  const CourseMediaCreateModel({
    required this.courseId,
    this.courseBatchId,
    this.position,
    required this.title,
    this.description,
    required this.courseMediaStatus,
    required this.courseMediaType,
    required this.courseMediaLocation,
    this.courseMediaSize,
  });

  factory CourseMediaCreateModel.fromJson(Map<String, dynamic> json) =>
      _$CourseMediaCreateModelFromJson(json);

  static const toJsonFactory = _$CourseMediaCreateModelToJson;
  Map<String, dynamic> toJson() => _$CourseMediaCreateModelToJson(this);

  @JsonKey(name: 'course_id')
  final int courseId;
  @JsonKey(name: 'course_batch_id')
  final dynamic courseBatchId;
  @JsonKey(name: 'position')
  final dynamic position;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final dynamic description;
  @JsonKey(name: 'course_media_status')
  final int courseMediaStatus;
  @JsonKey(name: 'course_media_type')
  final int courseMediaType;
  @JsonKey(name: 'course_media_location')
  final String courseMediaLocation;
  @JsonKey(name: 'course_media_size')
  final dynamic courseMediaSize;
  static const fromJsonFactory = _$CourseMediaCreateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseMediaCreateModel &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.courseBatchId, courseBatchId) ||
                const DeepCollectionEquality()
                    .equals(other.courseBatchId, courseBatchId)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.courseMediaStatus, courseMediaStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseMediaStatus, courseMediaStatus)) &&
            (identical(other.courseMediaType, courseMediaType) ||
                const DeepCollectionEquality()
                    .equals(other.courseMediaType, courseMediaType)) &&
            (identical(other.courseMediaLocation, courseMediaLocation) ||
                const DeepCollectionEquality()
                    .equals(other.courseMediaLocation, courseMediaLocation)) &&
            (identical(other.courseMediaSize, courseMediaSize) ||
                const DeepCollectionEquality()
                    .equals(other.courseMediaSize, courseMediaSize)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(courseBatchId) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(courseMediaStatus) ^
      const DeepCollectionEquality().hash(courseMediaType) ^
      const DeepCollectionEquality().hash(courseMediaLocation) ^
      const DeepCollectionEquality().hash(courseMediaSize) ^
      runtimeType.hashCode;
}

extension $CourseMediaCreateModelExtension on CourseMediaCreateModel {
  CourseMediaCreateModel copyWith(
      {int? courseId,
      dynamic courseBatchId,
      dynamic position,
      String? title,
      dynamic description,
      int? courseMediaStatus,
      int? courseMediaType,
      String? courseMediaLocation,
      dynamic courseMediaSize}) {
    return CourseMediaCreateModel(
        courseId: courseId ?? this.courseId,
        courseBatchId: courseBatchId ?? this.courseBatchId,
        position: position ?? this.position,
        title: title ?? this.title,
        description: description ?? this.description,
        courseMediaStatus: courseMediaStatus ?? this.courseMediaStatus,
        courseMediaType: courseMediaType ?? this.courseMediaType,
        courseMediaLocation: courseMediaLocation ?? this.courseMediaLocation,
        courseMediaSize: courseMediaSize ?? this.courseMediaSize);
  }

  CourseMediaCreateModel copyWithWrapped(
      {Wrapped<int>? courseId,
      Wrapped<dynamic>? courseBatchId,
      Wrapped<dynamic>? position,
      Wrapped<String>? title,
      Wrapped<dynamic>? description,
      Wrapped<int>? courseMediaStatus,
      Wrapped<int>? courseMediaType,
      Wrapped<String>? courseMediaLocation,
      Wrapped<dynamic>? courseMediaSize}) {
    return CourseMediaCreateModel(
        courseId: (courseId != null ? courseId.value : this.courseId),
        courseBatchId:
            (courseBatchId != null ? courseBatchId.value : this.courseBatchId),
        position: (position != null ? position.value : this.position),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        courseMediaStatus: (courseMediaStatus != null
            ? courseMediaStatus.value
            : this.courseMediaStatus),
        courseMediaType: (courseMediaType != null
            ? courseMediaType.value
            : this.courseMediaType),
        courseMediaLocation: (courseMediaLocation != null
            ? courseMediaLocation.value
            : this.courseMediaLocation),
        courseMediaSize: (courseMediaSize != null
            ? courseMediaSize.value
            : this.courseMediaSize));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModelCourseUserOutModel {
  const ReturnModelCourseUserOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModelCourseUserOutModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelCourseUserOutModelFromJson(json);

  static const toJsonFactory = _$ReturnModelCourseUserOutModelToJson;
  Map<String, dynamic> toJson() => _$ReturnModelCourseUserOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory = _$ReturnModelCourseUserOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModelCourseUserOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelCourseUserOutModelExtension
    on ReturnModelCourseUserOutModel {
  ReturnModelCourseUserOutModel copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModelCourseUserOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModelCourseUserOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModelCourseUserOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseUserUpdateModel {
  const CourseUserUpdateModel({
    this.courseId,
    this.courseBatchId,
    this.userId,
    this.tenantId,
    this.validUntil,
    this.courseUserStatus,
  });

  factory CourseUserUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$CourseUserUpdateModelFromJson(json);

  static const toJsonFactory = _$CourseUserUpdateModelToJson;
  Map<String, dynamic> toJson() => _$CourseUserUpdateModelToJson(this);

  @JsonKey(name: 'course_id')
  final dynamic courseId;
  @JsonKey(name: 'course_batch_id')
  final dynamic courseBatchId;
  @JsonKey(name: 'user_id')
  final dynamic userId;
  @JsonKey(name: 'tenant_id')
  final dynamic tenantId;
  @JsonKey(name: 'valid_until')
  final dynamic validUntil;
  @JsonKey(name: 'course_user_status')
  final dynamic courseUserStatus;
  static const fromJsonFactory = _$CourseUserUpdateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseUserUpdateModel &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.courseBatchId, courseBatchId) ||
                const DeepCollectionEquality()
                    .equals(other.courseBatchId, courseBatchId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.tenantId, tenantId) ||
                const DeepCollectionEquality()
                    .equals(other.tenantId, tenantId)) &&
            (identical(other.validUntil, validUntil) ||
                const DeepCollectionEquality()
                    .equals(other.validUntil, validUntil)) &&
            (identical(other.courseUserStatus, courseUserStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseUserStatus, courseUserStatus)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(courseBatchId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(tenantId) ^
      const DeepCollectionEquality().hash(validUntil) ^
      const DeepCollectionEquality().hash(courseUserStatus) ^
      runtimeType.hashCode;
}

extension $CourseUserUpdateModelExtension on CourseUserUpdateModel {
  CourseUserUpdateModel copyWith(
      {dynamic courseId,
      dynamic courseBatchId,
      dynamic userId,
      dynamic tenantId,
      dynamic validUntil,
      dynamic courseUserStatus}) {
    return CourseUserUpdateModel(
        courseId: courseId ?? this.courseId,
        courseBatchId: courseBatchId ?? this.courseBatchId,
        userId: userId ?? this.userId,
        tenantId: tenantId ?? this.tenantId,
        validUntil: validUntil ?? this.validUntil,
        courseUserStatus: courseUserStatus ?? this.courseUserStatus);
  }

  CourseUserUpdateModel copyWithWrapped(
      {Wrapped<dynamic>? courseId,
      Wrapped<dynamic>? courseBatchId,
      Wrapped<dynamic>? userId,
      Wrapped<dynamic>? tenantId,
      Wrapped<dynamic>? validUntil,
      Wrapped<dynamic>? courseUserStatus}) {
    return CourseUserUpdateModel(
        courseId: (courseId != null ? courseId.value : this.courseId),
        courseBatchId:
            (courseBatchId != null ? courseBatchId.value : this.courseBatchId),
        userId: (userId != null ? userId.value : this.userId),
        tenantId: (tenantId != null ? tenantId.value : this.tenantId),
        validUntil: (validUntil != null ? validUntil.value : this.validUntil),
        courseUserStatus: (courseUserStatus != null
            ? courseUserStatus.value
            : this.courseUserStatus));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseUserCreateModel {
  const CourseUserCreateModel({
    required this.courseId,
    this.courseBatchId,
    required this.userId,
    required this.tenantId,
    this.validUntil,
    required this.courseUserStatus,
  });

  factory CourseUserCreateModel.fromJson(Map<String, dynamic> json) =>
      _$CourseUserCreateModelFromJson(json);

  static const toJsonFactory = _$CourseUserCreateModelToJson;
  Map<String, dynamic> toJson() => _$CourseUserCreateModelToJson(this);

  @JsonKey(name: 'course_id')
  final int courseId;
  @JsonKey(name: 'course_batch_id')
  final dynamic courseBatchId;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'tenant_id')
  final String tenantId;
  @JsonKey(name: 'valid_until')
  final dynamic validUntil;
  @JsonKey(name: 'course_user_status')
  final int courseUserStatus;
  static const fromJsonFactory = _$CourseUserCreateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseUserCreateModel &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.courseBatchId, courseBatchId) ||
                const DeepCollectionEquality()
                    .equals(other.courseBatchId, courseBatchId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.tenantId, tenantId) ||
                const DeepCollectionEquality()
                    .equals(other.tenantId, tenantId)) &&
            (identical(other.validUntil, validUntil) ||
                const DeepCollectionEquality()
                    .equals(other.validUntil, validUntil)) &&
            (identical(other.courseUserStatus, courseUserStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseUserStatus, courseUserStatus)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(courseBatchId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(tenantId) ^
      const DeepCollectionEquality().hash(validUntil) ^
      const DeepCollectionEquality().hash(courseUserStatus) ^
      runtimeType.hashCode;
}

extension $CourseUserCreateModelExtension on CourseUserCreateModel {
  CourseUserCreateModel copyWith(
      {int? courseId,
      dynamic courseBatchId,
      int? userId,
      String? tenantId,
      dynamic validUntil,
      int? courseUserStatus}) {
    return CourseUserCreateModel(
        courseId: courseId ?? this.courseId,
        courseBatchId: courseBatchId ?? this.courseBatchId,
        userId: userId ?? this.userId,
        tenantId: tenantId ?? this.tenantId,
        validUntil: validUntil ?? this.validUntil,
        courseUserStatus: courseUserStatus ?? this.courseUserStatus);
  }

  CourseUserCreateModel copyWithWrapped(
      {Wrapped<int>? courseId,
      Wrapped<dynamic>? courseBatchId,
      Wrapped<int>? userId,
      Wrapped<String>? tenantId,
      Wrapped<dynamic>? validUntil,
      Wrapped<int>? courseUserStatus}) {
    return CourseUserCreateModel(
        courseId: (courseId != null ? courseId.value : this.courseId),
        courseBatchId:
            (courseBatchId != null ? courseBatchId.value : this.courseBatchId),
        userId: (userId != null ? userId.value : this.userId),
        tenantId: (tenantId != null ? tenantId.value : this.tenantId),
        validUntil: (validUntil != null ? validUntil.value : this.validUntil),
        courseUserStatus: (courseUserStatus != null
            ? courseUserStatus.value
            : this.courseUserStatus));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseSearchCriteriaModel {
  const CourseSearchCriteriaModel({
    this.searchKeyword,
    this.pageNumber,
    this.pageSize,
    this.sortBy,
    this.sortAscending,
    this.name,
    this.feeType,
    this.courseStatus,
    this.courseImageType,
  });

  factory CourseSearchCriteriaModel.fromJson(Map<String, dynamic> json) =>
      _$CourseSearchCriteriaModelFromJson(json);

  static const toJsonFactory = _$CourseSearchCriteriaModelToJson;
  Map<String, dynamic> toJson() => _$CourseSearchCriteriaModelToJson(this);

  @JsonKey(name: 'search_keyword')
  final dynamic searchKeyword;
  @JsonKey(name: 'page_number')
  final int? pageNumber;
  @JsonKey(name: 'page_size')
  final int? pageSize;
  @JsonKey(name: 'sort_by')
  final dynamic sortBy;
  @JsonKey(name: 'sort_ascending', defaultValue: true)
  final bool? sortAscending;
  @JsonKey(name: 'name')
  final dynamic name;
  @JsonKey(name: 'fee_type')
  final dynamic feeType;
  @JsonKey(name: 'course_status')
  final dynamic courseStatus;
  @JsonKey(name: 'course_image_type')
  final dynamic courseImageType;
  static const fromJsonFactory = _$CourseSearchCriteriaModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseSearchCriteriaModel &&
            (identical(other.searchKeyword, searchKeyword) ||
                const DeepCollectionEquality()
                    .equals(other.searchKeyword, searchKeyword)) &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.sortBy, sortBy) ||
                const DeepCollectionEquality().equals(other.sortBy, sortBy)) &&
            (identical(other.sortAscending, sortAscending) ||
                const DeepCollectionEquality()
                    .equals(other.sortAscending, sortAscending)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.feeType, feeType) ||
                const DeepCollectionEquality()
                    .equals(other.feeType, feeType)) &&
            (identical(other.courseStatus, courseStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseStatus, courseStatus)) &&
            (identical(other.courseImageType, courseImageType) ||
                const DeepCollectionEquality()
                    .equals(other.courseImageType, courseImageType)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(searchKeyword) ^
      const DeepCollectionEquality().hash(pageNumber) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(sortBy) ^
      const DeepCollectionEquality().hash(sortAscending) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(feeType) ^
      const DeepCollectionEquality().hash(courseStatus) ^
      const DeepCollectionEquality().hash(courseImageType) ^
      runtimeType.hashCode;
}

extension $CourseSearchCriteriaModelExtension on CourseSearchCriteriaModel {
  CourseSearchCriteriaModel copyWith(
      {dynamic searchKeyword,
      int? pageNumber,
      int? pageSize,
      dynamic sortBy,
      bool? sortAscending,
      dynamic name,
      dynamic feeType,
      dynamic courseStatus,
      dynamic courseImageType}) {
    return CourseSearchCriteriaModel(
        searchKeyword: searchKeyword ?? this.searchKeyword,
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize,
        sortBy: sortBy ?? this.sortBy,
        sortAscending: sortAscending ?? this.sortAscending,
        name: name ?? this.name,
        feeType: feeType ?? this.feeType,
        courseStatus: courseStatus ?? this.courseStatus,
        courseImageType: courseImageType ?? this.courseImageType);
  }

  CourseSearchCriteriaModel copyWithWrapped(
      {Wrapped<dynamic>? searchKeyword,
      Wrapped<int?>? pageNumber,
      Wrapped<int?>? pageSize,
      Wrapped<dynamic>? sortBy,
      Wrapped<bool?>? sortAscending,
      Wrapped<dynamic>? name,
      Wrapped<dynamic>? feeType,
      Wrapped<dynamic>? courseStatus,
      Wrapped<dynamic>? courseImageType}) {
    return CourseSearchCriteriaModel(
        searchKeyword:
            (searchKeyword != null ? searchKeyword.value : this.searchKeyword),
        pageNumber: (pageNumber != null ? pageNumber.value : this.pageNumber),
        pageSize: (pageSize != null ? pageSize.value : this.pageSize),
        sortBy: (sortBy != null ? sortBy.value : this.sortBy),
        sortAscending:
            (sortAscending != null ? sortAscending.value : this.sortAscending),
        name: (name != null ? name.value : this.name),
        feeType: (feeType != null ? feeType.value : this.feeType),
        courseStatus:
            (courseStatus != null ? courseStatus.value : this.courseStatus),
        courseImageType: (courseImageType != null
            ? courseImageType.value
            : this.courseImageType));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseBatchSearchCriteriaModel {
  const CourseBatchSearchCriteriaModel({
    this.searchKeyword,
    this.pageNumber,
    this.pageSize,
    this.sortBy,
    this.sortAscending,
    this.courseId,
    this.batchStatus,
    this.startDateFrom,
    this.startDateTo,
    this.endDateFrom,
    this.endDateTo,
  });

  factory CourseBatchSearchCriteriaModel.fromJson(Map<String, dynamic> json) =>
      _$CourseBatchSearchCriteriaModelFromJson(json);

  static const toJsonFactory = _$CourseBatchSearchCriteriaModelToJson;
  Map<String, dynamic> toJson() => _$CourseBatchSearchCriteriaModelToJson(this);

  @JsonKey(name: 'search_keyword')
  final dynamic searchKeyword;
  @JsonKey(name: 'page_number')
  final int? pageNumber;
  @JsonKey(name: 'page_size')
  final int? pageSize;
  @JsonKey(name: 'sort_by')
  final dynamic sortBy;
  @JsonKey(name: 'sort_ascending', defaultValue: true)
  final bool? sortAscending;
  @JsonKey(name: 'course_id')
  final dynamic courseId;
  @JsonKey(name: 'batch_status')
  final dynamic batchStatus;
  @JsonKey(name: 'start_date_from')
  final dynamic startDateFrom;
  @JsonKey(name: 'start_date_to')
  final dynamic startDateTo;
  @JsonKey(name: 'end_date_from')
  final dynamic endDateFrom;
  @JsonKey(name: 'end_date_to')
  final dynamic endDateTo;
  static const fromJsonFactory = _$CourseBatchSearchCriteriaModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseBatchSearchCriteriaModel &&
            (identical(other.searchKeyword, searchKeyword) ||
                const DeepCollectionEquality()
                    .equals(other.searchKeyword, searchKeyword)) &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.sortBy, sortBy) ||
                const DeepCollectionEquality().equals(other.sortBy, sortBy)) &&
            (identical(other.sortAscending, sortAscending) ||
                const DeepCollectionEquality()
                    .equals(other.sortAscending, sortAscending)) &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.batchStatus, batchStatus) ||
                const DeepCollectionEquality()
                    .equals(other.batchStatus, batchStatus)) &&
            (identical(other.startDateFrom, startDateFrom) ||
                const DeepCollectionEquality()
                    .equals(other.startDateFrom, startDateFrom)) &&
            (identical(other.startDateTo, startDateTo) ||
                const DeepCollectionEquality()
                    .equals(other.startDateTo, startDateTo)) &&
            (identical(other.endDateFrom, endDateFrom) ||
                const DeepCollectionEquality()
                    .equals(other.endDateFrom, endDateFrom)) &&
            (identical(other.endDateTo, endDateTo) ||
                const DeepCollectionEquality()
                    .equals(other.endDateTo, endDateTo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(searchKeyword) ^
      const DeepCollectionEquality().hash(pageNumber) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(sortBy) ^
      const DeepCollectionEquality().hash(sortAscending) ^
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(batchStatus) ^
      const DeepCollectionEquality().hash(startDateFrom) ^
      const DeepCollectionEquality().hash(startDateTo) ^
      const DeepCollectionEquality().hash(endDateFrom) ^
      const DeepCollectionEquality().hash(endDateTo) ^
      runtimeType.hashCode;
}

extension $CourseBatchSearchCriteriaModelExtension
    on CourseBatchSearchCriteriaModel {
  CourseBatchSearchCriteriaModel copyWith(
      {dynamic searchKeyword,
      int? pageNumber,
      int? pageSize,
      dynamic sortBy,
      bool? sortAscending,
      dynamic courseId,
      dynamic batchStatus,
      dynamic startDateFrom,
      dynamic startDateTo,
      dynamic endDateFrom,
      dynamic endDateTo}) {
    return CourseBatchSearchCriteriaModel(
        searchKeyword: searchKeyword ?? this.searchKeyword,
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize,
        sortBy: sortBy ?? this.sortBy,
        sortAscending: sortAscending ?? this.sortAscending,
        courseId: courseId ?? this.courseId,
        batchStatus: batchStatus ?? this.batchStatus,
        startDateFrom: startDateFrom ?? this.startDateFrom,
        startDateTo: startDateTo ?? this.startDateTo,
        endDateFrom: endDateFrom ?? this.endDateFrom,
        endDateTo: endDateTo ?? this.endDateTo);
  }

  CourseBatchSearchCriteriaModel copyWithWrapped(
      {Wrapped<dynamic>? searchKeyword,
      Wrapped<int?>? pageNumber,
      Wrapped<int?>? pageSize,
      Wrapped<dynamic>? sortBy,
      Wrapped<bool?>? sortAscending,
      Wrapped<dynamic>? courseId,
      Wrapped<dynamic>? batchStatus,
      Wrapped<dynamic>? startDateFrom,
      Wrapped<dynamic>? startDateTo,
      Wrapped<dynamic>? endDateFrom,
      Wrapped<dynamic>? endDateTo}) {
    return CourseBatchSearchCriteriaModel(
        searchKeyword:
            (searchKeyword != null ? searchKeyword.value : this.searchKeyword),
        pageNumber: (pageNumber != null ? pageNumber.value : this.pageNumber),
        pageSize: (pageSize != null ? pageSize.value : this.pageSize),
        sortBy: (sortBy != null ? sortBy.value : this.sortBy),
        sortAscending:
            (sortAscending != null ? sortAscending.value : this.sortAscending),
        courseId: (courseId != null ? courseId.value : this.courseId),
        batchStatus:
            (batchStatus != null ? batchStatus.value : this.batchStatus),
        startDateFrom:
            (startDateFrom != null ? startDateFrom.value : this.startDateFrom),
        startDateTo:
            (startDateTo != null ? startDateTo.value : this.startDateTo),
        endDateFrom:
            (endDateFrom != null ? endDateFrom.value : this.endDateFrom),
        endDateTo: (endDateTo != null ? endDateTo.value : this.endDateTo));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseMediaSearchCriteriaModel {
  const CourseMediaSearchCriteriaModel({
    this.searchKeyword,
    this.pageNumber,
    this.pageSize,
    this.sortBy,
    this.sortAscending,
    this.courseId,
    this.courseBatchId,
    this.mediaType,
    this.mediaStatus,
  });

  factory CourseMediaSearchCriteriaModel.fromJson(Map<String, dynamic> json) =>
      _$CourseMediaSearchCriteriaModelFromJson(json);

  static const toJsonFactory = _$CourseMediaSearchCriteriaModelToJson;
  Map<String, dynamic> toJson() => _$CourseMediaSearchCriteriaModelToJson(this);

  @JsonKey(name: 'search_keyword')
  final dynamic searchKeyword;
  @JsonKey(name: 'page_number')
  final int? pageNumber;
  @JsonKey(name: 'page_size')
  final int? pageSize;
  @JsonKey(name: 'sort_by')
  final dynamic sortBy;
  @JsonKey(name: 'sort_ascending', defaultValue: true)
  final bool? sortAscending;
  @JsonKey(name: 'course_id')
  final dynamic courseId;
  @JsonKey(name: 'course_batch_id')
  final dynamic courseBatchId;
  @JsonKey(name: 'media_type')
  final dynamic mediaType;
  @JsonKey(name: 'media_status')
  final dynamic mediaStatus;
  static const fromJsonFactory = _$CourseMediaSearchCriteriaModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseMediaSearchCriteriaModel &&
            (identical(other.searchKeyword, searchKeyword) ||
                const DeepCollectionEquality()
                    .equals(other.searchKeyword, searchKeyword)) &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.sortBy, sortBy) ||
                const DeepCollectionEquality().equals(other.sortBy, sortBy)) &&
            (identical(other.sortAscending, sortAscending) ||
                const DeepCollectionEquality()
                    .equals(other.sortAscending, sortAscending)) &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.courseBatchId, courseBatchId) ||
                const DeepCollectionEquality()
                    .equals(other.courseBatchId, courseBatchId)) &&
            (identical(other.mediaType, mediaType) ||
                const DeepCollectionEquality()
                    .equals(other.mediaType, mediaType)) &&
            (identical(other.mediaStatus, mediaStatus) ||
                const DeepCollectionEquality()
                    .equals(other.mediaStatus, mediaStatus)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(searchKeyword) ^
      const DeepCollectionEquality().hash(pageNumber) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(sortBy) ^
      const DeepCollectionEquality().hash(sortAscending) ^
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(courseBatchId) ^
      const DeepCollectionEquality().hash(mediaType) ^
      const DeepCollectionEquality().hash(mediaStatus) ^
      runtimeType.hashCode;
}

extension $CourseMediaSearchCriteriaModelExtension
    on CourseMediaSearchCriteriaModel {
  CourseMediaSearchCriteriaModel copyWith(
      {dynamic searchKeyword,
      int? pageNumber,
      int? pageSize,
      dynamic sortBy,
      bool? sortAscending,
      dynamic courseId,
      dynamic courseBatchId,
      dynamic mediaType,
      dynamic mediaStatus}) {
    return CourseMediaSearchCriteriaModel(
        searchKeyword: searchKeyword ?? this.searchKeyword,
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize,
        sortBy: sortBy ?? this.sortBy,
        sortAscending: sortAscending ?? this.sortAscending,
        courseId: courseId ?? this.courseId,
        courseBatchId: courseBatchId ?? this.courseBatchId,
        mediaType: mediaType ?? this.mediaType,
        mediaStatus: mediaStatus ?? this.mediaStatus);
  }

  CourseMediaSearchCriteriaModel copyWithWrapped(
      {Wrapped<dynamic>? searchKeyword,
      Wrapped<int?>? pageNumber,
      Wrapped<int?>? pageSize,
      Wrapped<dynamic>? sortBy,
      Wrapped<bool?>? sortAscending,
      Wrapped<dynamic>? courseId,
      Wrapped<dynamic>? courseBatchId,
      Wrapped<dynamic>? mediaType,
      Wrapped<dynamic>? mediaStatus}) {
    return CourseMediaSearchCriteriaModel(
        searchKeyword:
            (searchKeyword != null ? searchKeyword.value : this.searchKeyword),
        pageNumber: (pageNumber != null ? pageNumber.value : this.pageNumber),
        pageSize: (pageSize != null ? pageSize.value : this.pageSize),
        sortBy: (sortBy != null ? sortBy.value : this.sortBy),
        sortAscending:
            (sortAscending != null ? sortAscending.value : this.sortAscending),
        courseId: (courseId != null ? courseId.value : this.courseId),
        courseBatchId:
            (courseBatchId != null ? courseBatchId.value : this.courseBatchId),
        mediaType: (mediaType != null ? mediaType.value : this.mediaType),
        mediaStatus:
            (mediaStatus != null ? mediaStatus.value : this.mediaStatus));
  }
}

@JsonSerializable(explicitToJson: true)
class CourseUserSearchCriteriaModel {
  const CourseUserSearchCriteriaModel({
    this.searchKeyword,
    this.pageNumber,
    this.pageSize,
    this.sortBy,
    this.sortAscending,
    this.courseId,
    this.userId,
    this.courseUserStatus,
    this.enrollmentDateFrom,
    this.enrollmentDateTo,
  });

  factory CourseUserSearchCriteriaModel.fromJson(Map<String, dynamic> json) =>
      _$CourseUserSearchCriteriaModelFromJson(json);

  static const toJsonFactory = _$CourseUserSearchCriteriaModelToJson;
  Map<String, dynamic> toJson() => _$CourseUserSearchCriteriaModelToJson(this);

  @JsonKey(name: 'search_keyword')
  final dynamic searchKeyword;
  @JsonKey(name: 'page_number')
  final int? pageNumber;
  @JsonKey(name: 'page_size')
  final int? pageSize;
  @JsonKey(name: 'sort_by')
  final dynamic sortBy;
  @JsonKey(name: 'sort_ascending', defaultValue: true)
  final bool? sortAscending;
  @JsonKey(name: 'course_id')
  final dynamic courseId;
  @JsonKey(name: 'user_id')
  final dynamic userId;
  @JsonKey(name: 'course_user_status')
  final dynamic courseUserStatus;
  @JsonKey(name: 'enrollment_date_from')
  final dynamic enrollmentDateFrom;
  @JsonKey(name: 'enrollment_date_to')
  final dynamic enrollmentDateTo;
  static const fromJsonFactory = _$CourseUserSearchCriteriaModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CourseUserSearchCriteriaModel &&
            (identical(other.searchKeyword, searchKeyword) ||
                const DeepCollectionEquality()
                    .equals(other.searchKeyword, searchKeyword)) &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality()
                    .equals(other.pageSize, pageSize)) &&
            (identical(other.sortBy, sortBy) ||
                const DeepCollectionEquality().equals(other.sortBy, sortBy)) &&
            (identical(other.sortAscending, sortAscending) ||
                const DeepCollectionEquality()
                    .equals(other.sortAscending, sortAscending)) &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.courseUserStatus, courseUserStatus) ||
                const DeepCollectionEquality()
                    .equals(other.courseUserStatus, courseUserStatus)) &&
            (identical(other.enrollmentDateFrom, enrollmentDateFrom) ||
                const DeepCollectionEquality()
                    .equals(other.enrollmentDateFrom, enrollmentDateFrom)) &&
            (identical(other.enrollmentDateTo, enrollmentDateTo) ||
                const DeepCollectionEquality()
                    .equals(other.enrollmentDateTo, enrollmentDateTo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(searchKeyword) ^
      const DeepCollectionEquality().hash(pageNumber) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(sortBy) ^
      const DeepCollectionEquality().hash(sortAscending) ^
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(courseUserStatus) ^
      const DeepCollectionEquality().hash(enrollmentDateFrom) ^
      const DeepCollectionEquality().hash(enrollmentDateTo) ^
      runtimeType.hashCode;
}

extension $CourseUserSearchCriteriaModelExtension
    on CourseUserSearchCriteriaModel {
  CourseUserSearchCriteriaModel copyWith(
      {dynamic searchKeyword,
      int? pageNumber,
      int? pageSize,
      dynamic sortBy,
      bool? sortAscending,
      dynamic courseId,
      dynamic userId,
      dynamic courseUserStatus,
      dynamic enrollmentDateFrom,
      dynamic enrollmentDateTo}) {
    return CourseUserSearchCriteriaModel(
        searchKeyword: searchKeyword ?? this.searchKeyword,
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize,
        sortBy: sortBy ?? this.sortBy,
        sortAscending: sortAscending ?? this.sortAscending,
        courseId: courseId ?? this.courseId,
        userId: userId ?? this.userId,
        courseUserStatus: courseUserStatus ?? this.courseUserStatus,
        enrollmentDateFrom: enrollmentDateFrom ?? this.enrollmentDateFrom,
        enrollmentDateTo: enrollmentDateTo ?? this.enrollmentDateTo);
  }

  CourseUserSearchCriteriaModel copyWithWrapped(
      {Wrapped<dynamic>? searchKeyword,
      Wrapped<int?>? pageNumber,
      Wrapped<int?>? pageSize,
      Wrapped<dynamic>? sortBy,
      Wrapped<bool?>? sortAscending,
      Wrapped<dynamic>? courseId,
      Wrapped<dynamic>? userId,
      Wrapped<dynamic>? courseUserStatus,
      Wrapped<dynamic>? enrollmentDateFrom,
      Wrapped<dynamic>? enrollmentDateTo}) {
    return CourseUserSearchCriteriaModel(
        searchKeyword:
            (searchKeyword != null ? searchKeyword.value : this.searchKeyword),
        pageNumber: (pageNumber != null ? pageNumber.value : this.pageNumber),
        pageSize: (pageSize != null ? pageSize.value : this.pageSize),
        sortBy: (sortBy != null ? sortBy.value : this.sortBy),
        sortAscending:
            (sortAscending != null ? sortAscending.value : this.sortAscending),
        courseId: (courseId != null ? courseId.value : this.courseId),
        userId: (userId != null ? userId.value : this.userId),
        courseUserStatus: (courseUserStatus != null
            ? courseUserStatus.value
            : this.courseUserStatus),
        enrollmentDateFrom: (enrollmentDateFrom != null
            ? enrollmentDateFrom.value
            : this.enrollmentDateFrom),
        enrollmentDateTo: (enrollmentDateTo != null
            ? enrollmentDateTo.value
            : this.enrollmentDateTo));
  }
}

@JsonSerializable(explicitToJson: true)
class MessageOutModel {
  const MessageOutModel({
    required this.messageTitle,
    required this.messageDescription,
    required this.messageType,
    required this.userId,
    this.courseId,
    this.courseBatchId,
    required this.messageId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MessageOutModel.fromJson(Map<String, dynamic> json) =>
      _$MessageOutModelFromJson(json);

  static const toJsonFactory = _$MessageOutModelToJson;
  Map<String, dynamic> toJson() => _$MessageOutModelToJson(this);

  @JsonKey(name: 'message_title')
  final String messageTitle;
  @JsonKey(name: 'message_description')
  final String messageDescription;
  @JsonKey(name: 'message_type')
  final int messageType;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'course_id')
  final dynamic courseId;
  @JsonKey(name: 'course_batch_id')
  final dynamic courseBatchId;
  @JsonKey(name: 'message_id')
  final int messageId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  static const fromJsonFactory = _$MessageOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is MessageOutModel &&
            (identical(other.messageTitle, messageTitle) ||
                const DeepCollectionEquality()
                    .equals(other.messageTitle, messageTitle)) &&
            (identical(other.messageDescription, messageDescription) ||
                const DeepCollectionEquality()
                    .equals(other.messageDescription, messageDescription)) &&
            (identical(other.messageType, messageType) ||
                const DeepCollectionEquality()
                    .equals(other.messageType, messageType)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.courseBatchId, courseBatchId) ||
                const DeepCollectionEquality()
                    .equals(other.courseBatchId, courseBatchId)) &&
            (identical(other.messageId, messageId) ||
                const DeepCollectionEquality()
                    .equals(other.messageId, messageId)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messageTitle) ^
      const DeepCollectionEquality().hash(messageDescription) ^
      const DeepCollectionEquality().hash(messageType) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(courseBatchId) ^
      const DeepCollectionEquality().hash(messageId) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      runtimeType.hashCode;
}

extension $MessageOutModelExtension on MessageOutModel {
  MessageOutModel copyWith(
      {String? messageTitle,
      String? messageDescription,
      int? messageType,
      int? userId,
      dynamic courseId,
      dynamic courseBatchId,
      int? messageId,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return MessageOutModel(
        messageTitle: messageTitle ?? this.messageTitle,
        messageDescription: messageDescription ?? this.messageDescription,
        messageType: messageType ?? this.messageType,
        userId: userId ?? this.userId,
        courseId: courseId ?? this.courseId,
        courseBatchId: courseBatchId ?? this.courseBatchId,
        messageId: messageId ?? this.messageId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  MessageOutModel copyWithWrapped(
      {Wrapped<String>? messageTitle,
      Wrapped<String>? messageDescription,
      Wrapped<int>? messageType,
      Wrapped<int>? userId,
      Wrapped<dynamic>? courseId,
      Wrapped<dynamic>? courseBatchId,
      Wrapped<int>? messageId,
      Wrapped<DateTime>? createdAt,
      Wrapped<DateTime>? updatedAt}) {
    return MessageOutModel(
        messageTitle:
            (messageTitle != null ? messageTitle.value : this.messageTitle),
        messageDescription: (messageDescription != null
            ? messageDescription.value
            : this.messageDescription),
        messageType:
            (messageType != null ? messageType.value : this.messageType),
        userId: (userId != null ? userId.value : this.userId),
        courseId: (courseId != null ? courseId.value : this.courseId),
        courseBatchId:
            (courseBatchId != null ? courseBatchId.value : this.courseBatchId),
        messageId: (messageId != null ? messageId.value : this.messageId),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModelMessageOutModel {
  const ReturnModelMessageOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModelMessageOutModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelMessageOutModelFromJson(json);

  static const toJsonFactory = _$ReturnModelMessageOutModelToJson;
  Map<String, dynamic> toJson() => _$ReturnModelMessageOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory = _$ReturnModelMessageOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModelMessageOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelMessageOutModelExtension on ReturnModelMessageOutModel {
  ReturnModelMessageOutModel copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModelMessageOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModelMessageOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModelMessageOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class MessageUpdateModel {
  const MessageUpdateModel({
    this.messageTitle,
    this.messageDescription,
    this.messageType,
  });

  factory MessageUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$MessageUpdateModelFromJson(json);

  static const toJsonFactory = _$MessageUpdateModelToJson;
  Map<String, dynamic> toJson() => _$MessageUpdateModelToJson(this);

  @JsonKey(name: 'message_title')
  final dynamic messageTitle;
  @JsonKey(name: 'message_description')
  final dynamic messageDescription;
  @JsonKey(name: 'message_type')
  final dynamic messageType;
  static const fromJsonFactory = _$MessageUpdateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is MessageUpdateModel &&
            (identical(other.messageTitle, messageTitle) ||
                const DeepCollectionEquality()
                    .equals(other.messageTitle, messageTitle)) &&
            (identical(other.messageDescription, messageDescription) ||
                const DeepCollectionEquality()
                    .equals(other.messageDescription, messageDescription)) &&
            (identical(other.messageType, messageType) ||
                const DeepCollectionEquality()
                    .equals(other.messageType, messageType)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messageTitle) ^
      const DeepCollectionEquality().hash(messageDescription) ^
      const DeepCollectionEquality().hash(messageType) ^
      runtimeType.hashCode;
}

extension $MessageUpdateModelExtension on MessageUpdateModel {
  MessageUpdateModel copyWith(
      {dynamic messageTitle, dynamic messageDescription, dynamic messageType}) {
    return MessageUpdateModel(
        messageTitle: messageTitle ?? this.messageTitle,
        messageDescription: messageDescription ?? this.messageDescription,
        messageType: messageType ?? this.messageType);
  }

  MessageUpdateModel copyWithWrapped(
      {Wrapped<dynamic>? messageTitle,
      Wrapped<dynamic>? messageDescription,
      Wrapped<dynamic>? messageType}) {
    return MessageUpdateModel(
        messageTitle:
            (messageTitle != null ? messageTitle.value : this.messageTitle),
        messageDescription: (messageDescription != null
            ? messageDescription.value
            : this.messageDescription),
        messageType:
            (messageType != null ? messageType.value : this.messageType));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnListModelMessageOutModel {
  const ReturnListModelMessageOutModel({
    this.data,
    this.status,
    this.message,
    this.errors,
    this.count,
  });

  factory ReturnListModelMessageOutModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnListModelMessageOutModelFromJson(json);

  static const toJsonFactory = _$ReturnListModelMessageOutModelToJson;
  Map<String, dynamic> toJson() => _$ReturnListModelMessageOutModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  @JsonKey(name: 'count')
  final int? count;
  static const fromJsonFactory = _$ReturnListModelMessageOutModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnListModelMessageOutModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      const DeepCollectionEquality().hash(count) ^
      runtimeType.hashCode;
}

extension $ReturnListModelMessageOutModelExtension
    on ReturnListModelMessageOutModel {
  ReturnListModelMessageOutModel copyWith(
      {dynamic data,
      bool? status,
      String? message,
      dynamic errors,
      int? count}) {
    return ReturnListModelMessageOutModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        count: count ?? this.count);
  }

  ReturnListModelMessageOutModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors,
      Wrapped<int?>? count}) {
    return ReturnListModelMessageOutModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors),
        count: (count != null ? count.value : this.count));
  }
}

@JsonSerializable(explicitToJson: true)
class MessageCreateModel {
  const MessageCreateModel({
    required this.messageTitle,
    required this.messageDescription,
    required this.messageType,
    required this.userId,
    this.courseId,
    this.courseBatchId,
  });

  factory MessageCreateModel.fromJson(Map<String, dynamic> json) =>
      _$MessageCreateModelFromJson(json);

  static const toJsonFactory = _$MessageCreateModelToJson;
  Map<String, dynamic> toJson() => _$MessageCreateModelToJson(this);

  @JsonKey(name: 'message_title')
  final String messageTitle;
  @JsonKey(name: 'message_description')
  final String messageDescription;
  @JsonKey(name: 'message_type')
  final int messageType;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'course_id')
  final dynamic courseId;
  @JsonKey(name: 'course_batch_id')
  final dynamic courseBatchId;
  static const fromJsonFactory = _$MessageCreateModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is MessageCreateModel &&
            (identical(other.messageTitle, messageTitle) ||
                const DeepCollectionEquality()
                    .equals(other.messageTitle, messageTitle)) &&
            (identical(other.messageDescription, messageDescription) ||
                const DeepCollectionEquality()
                    .equals(other.messageDescription, messageDescription)) &&
            (identical(other.messageType, messageType) ||
                const DeepCollectionEquality()
                    .equals(other.messageType, messageType)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.courseId, courseId) ||
                const DeepCollectionEquality()
                    .equals(other.courseId, courseId)) &&
            (identical(other.courseBatchId, courseBatchId) ||
                const DeepCollectionEquality()
                    .equals(other.courseBatchId, courseBatchId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(messageTitle) ^
      const DeepCollectionEquality().hash(messageDescription) ^
      const DeepCollectionEquality().hash(messageType) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(courseId) ^
      const DeepCollectionEquality().hash(courseBatchId) ^
      runtimeType.hashCode;
}

extension $MessageCreateModelExtension on MessageCreateModel {
  MessageCreateModel copyWith(
      {String? messageTitle,
      String? messageDescription,
      int? messageType,
      int? userId,
      dynamic courseId,
      dynamic courseBatchId}) {
    return MessageCreateModel(
        messageTitle: messageTitle ?? this.messageTitle,
        messageDescription: messageDescription ?? this.messageDescription,
        messageType: messageType ?? this.messageType,
        userId: userId ?? this.userId,
        courseId: courseId ?? this.courseId,
        courseBatchId: courseBatchId ?? this.courseBatchId);
  }

  MessageCreateModel copyWithWrapped(
      {Wrapped<String>? messageTitle,
      Wrapped<String>? messageDescription,
      Wrapped<int>? messageType,
      Wrapped<int>? userId,
      Wrapped<dynamic>? courseId,
      Wrapped<dynamic>? courseBatchId}) {
    return MessageCreateModel(
        messageTitle:
            (messageTitle != null ? messageTitle.value : this.messageTitle),
        messageDescription: (messageDescription != null
            ? messageDescription.value
            : this.messageDescription),
        messageType:
            (messageType != null ? messageType.value : this.messageType),
        userId: (userId != null ? userId.value : this.userId),
        courseId: (courseId != null ? courseId.value : this.courseId),
        courseBatchId:
            (courseBatchId != null ? courseBatchId.value : this.courseBatchId));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModelTokenResponseModel {
  const ReturnModelTokenResponseModel({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModelTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelTokenResponseModelFromJson(json);

  static const toJsonFactory = _$ReturnModelTokenResponseModelToJson;
  Map<String, dynamic> toJson() => _$ReturnModelTokenResponseModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory = _$ReturnModelTokenResponseModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModelTokenResponseModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelTokenResponseModelExtension
    on ReturnModelTokenResponseModel {
  ReturnModelTokenResponseModel copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModelTokenResponseModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModelTokenResponseModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModelTokenResponseModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class TokenResponseModel {
  const TokenResponseModel({
    required this.accessToken,
    this.tokenType,
    required this.expiresIn,
    required this.user,
  });

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);

  static const toJsonFactory = _$TokenResponseModelToJson;
  Map<String, dynamic> toJson() => _$TokenResponseModelToJson(this);

  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @JsonKey(name: 'user')
  final UserOutModel user;
  static const fromJsonFactory = _$TokenResponseModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TokenResponseModel &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.tokenType, tokenType) ||
                const DeepCollectionEquality()
                    .equals(other.tokenType, tokenType)) &&
            (identical(other.expiresIn, expiresIn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresIn, expiresIn)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(tokenType) ^
      const DeepCollectionEquality().hash(expiresIn) ^
      const DeepCollectionEquality().hash(user) ^
      runtimeType.hashCode;
}

extension $TokenResponseModelExtension on TokenResponseModel {
  TokenResponseModel copyWith(
      {String? accessToken,
      String? tokenType,
      int? expiresIn,
      UserOutModel? user}) {
    return TokenResponseModel(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        user: user ?? this.user);
  }

  TokenResponseModel copyWithWrapped(
      {Wrapped<String>? accessToken,
      Wrapped<String?>? tokenType,
      Wrapped<int>? expiresIn,
      Wrapped<UserOutModel>? user}) {
    return TokenResponseModel(
        accessToken:
            (accessToken != null ? accessToken.value : this.accessToken),
        tokenType: (tokenType != null ? tokenType.value : this.tokenType),
        expiresIn: (expiresIn != null ? expiresIn.value : this.expiresIn),
        user: (user != null ? user.value : this.user));
  }
}

@JsonSerializable(explicitToJson: true)
class LoginModel {
  const LoginModel({
    required this.username,
    required this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  static const toJsonFactory = _$LoginModelToJson;
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'password')
  final String password;
  static const fromJsonFactory = _$LoginModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LoginModel &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $LoginModelExtension on LoginModel {
  LoginModel copyWith({String? username, String? password}) {
    return LoginModel(
        username: username ?? this.username,
        password: password ?? this.password);
  }

  LoginModel copyWithWrapped(
      {Wrapped<String>? username, Wrapped<String>? password}) {
    return LoginModel(
        username: (username != null ? username.value : this.username),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModelTokenValidationModel {
  const ReturnModelTokenValidationModel({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModelTokenValidationModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelTokenValidationModelFromJson(json);

  static const toJsonFactory = _$ReturnModelTokenValidationModelToJson;
  Map<String, dynamic> toJson() =>
      _$ReturnModelTokenValidationModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory = _$ReturnModelTokenValidationModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModelTokenValidationModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelTokenValidationModelExtension
    on ReturnModelTokenValidationModel {
  ReturnModelTokenValidationModel copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModelTokenValidationModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModelTokenValidationModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModelTokenValidationModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class TokenValidationModel {
  const TokenValidationModel({
    required this.valid,
    this.userId,
    this.username,
    this.expiresAt,
  });

  factory TokenValidationModel.fromJson(Map<String, dynamic> json) =>
      _$TokenValidationModelFromJson(json);

  static const toJsonFactory = _$TokenValidationModelToJson;
  Map<String, dynamic> toJson() => _$TokenValidationModelToJson(this);

  @JsonKey(name: 'valid')
  final bool valid;
  @JsonKey(name: 'user_id')
  final dynamic userId;
  @JsonKey(name: 'username')
  final dynamic username;
  @JsonKey(name: 'expires_at')
  final dynamic expiresAt;
  static const fromJsonFactory = _$TokenValidationModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TokenValidationModel &&
            (identical(other.valid, valid) ||
                const DeepCollectionEquality().equals(other.valid, valid)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.expiresAt, expiresAt) ||
                const DeepCollectionEquality()
                    .equals(other.expiresAt, expiresAt)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(valid) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(expiresAt) ^
      runtimeType.hashCode;
}

extension $TokenValidationModelExtension on TokenValidationModel {
  TokenValidationModel copyWith(
      {bool? valid, dynamic userId, dynamic username, dynamic expiresAt}) {
    return TokenValidationModel(
        valid: valid ?? this.valid,
        userId: userId ?? this.userId,
        username: username ?? this.username,
        expiresAt: expiresAt ?? this.expiresAt);
  }

  TokenValidationModel copyWithWrapped(
      {Wrapped<bool>? valid,
      Wrapped<dynamic>? userId,
      Wrapped<dynamic>? username,
      Wrapped<dynamic>? expiresAt}) {
    return TokenValidationModel(
        valid: (valid != null ? valid.value : this.valid),
        userId: (userId != null ? userId.value : this.userId),
        username: (username != null ? username.value : this.username),
        expiresAt: (expiresAt != null ? expiresAt.value : this.expiresAt));
  }
}

@JsonSerializable(explicitToJson: true)
class OAuth2AuthUrlResponseModel {
  const OAuth2AuthUrlResponseModel({
    required this.authUrl,
    this.state,
  });

  factory OAuth2AuthUrlResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OAuth2AuthUrlResponseModelFromJson(json);

  static const toJsonFactory = _$OAuth2AuthUrlResponseModelToJson;
  Map<String, dynamic> toJson() => _$OAuth2AuthUrlResponseModelToJson(this);

  @JsonKey(name: 'auth_url')
  final String authUrl;
  @JsonKey(name: 'state')
  final dynamic state;
  static const fromJsonFactory = _$OAuth2AuthUrlResponseModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is OAuth2AuthUrlResponseModel &&
            (identical(other.authUrl, authUrl) ||
                const DeepCollectionEquality()
                    .equals(other.authUrl, authUrl)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(authUrl) ^
      const DeepCollectionEquality().hash(state) ^
      runtimeType.hashCode;
}

extension $OAuth2AuthUrlResponseModelExtension on OAuth2AuthUrlResponseModel {
  OAuth2AuthUrlResponseModel copyWith({String? authUrl, dynamic state}) {
    return OAuth2AuthUrlResponseModel(
        authUrl: authUrl ?? this.authUrl, state: state ?? this.state);
  }

  OAuth2AuthUrlResponseModel copyWithWrapped(
      {Wrapped<String>? authUrl, Wrapped<dynamic>? state}) {
    return OAuth2AuthUrlResponseModel(
        authUrl: (authUrl != null ? authUrl.value : this.authUrl),
        state: (state != null ? state.value : this.state));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModelOAuth2AuthUrlResponseModel {
  const ReturnModelOAuth2AuthUrlResponseModel({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModelOAuth2AuthUrlResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$ReturnModelOAuth2AuthUrlResponseModelFromJson(json);

  static const toJsonFactory = _$ReturnModelOAuth2AuthUrlResponseModelToJson;
  Map<String, dynamic> toJson() =>
      _$ReturnModelOAuth2AuthUrlResponseModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory =
      _$ReturnModelOAuth2AuthUrlResponseModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModelOAuth2AuthUrlResponseModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelOAuth2AuthUrlResponseModelExtension
    on ReturnModelOAuth2AuthUrlResponseModel {
  ReturnModelOAuth2AuthUrlResponseModel copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModelOAuth2AuthUrlResponseModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModelOAuth2AuthUrlResponseModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModelOAuth2AuthUrlResponseModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class OAuth2AuthUrlModel {
  const OAuth2AuthUrlModel({
    required this.redirectUri,
  });

  factory OAuth2AuthUrlModel.fromJson(Map<String, dynamic> json) =>
      _$OAuth2AuthUrlModelFromJson(json);

  static const toJsonFactory = _$OAuth2AuthUrlModelToJson;
  Map<String, dynamic> toJson() => _$OAuth2AuthUrlModelToJson(this);

  @JsonKey(name: 'redirect_uri')
  final String redirectUri;
  static const fromJsonFactory = _$OAuth2AuthUrlModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is OAuth2AuthUrlModel &&
            (identical(other.redirectUri, redirectUri) ||
                const DeepCollectionEquality()
                    .equals(other.redirectUri, redirectUri)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(redirectUri) ^ runtimeType.hashCode;
}

extension $OAuth2AuthUrlModelExtension on OAuth2AuthUrlModel {
  OAuth2AuthUrlModel copyWith({String? redirectUri}) {
    return OAuth2AuthUrlModel(redirectUri: redirectUri ?? this.redirectUri);
  }

  OAuth2AuthUrlModel copyWithWrapped({Wrapped<String>? redirectUri}) {
    return OAuth2AuthUrlModel(
        redirectUri:
            (redirectUri != null ? redirectUri.value : this.redirectUri));
  }
}

@JsonSerializable(explicitToJson: true)
class OAuth2CallbackModel {
  const OAuth2CallbackModel({
    required this.authorizationCode,
    required this.redirectUri,
    this.state,
  });

  factory OAuth2CallbackModel.fromJson(Map<String, dynamic> json) =>
      _$OAuth2CallbackModelFromJson(json);

  static const toJsonFactory = _$OAuth2CallbackModelToJson;
  Map<String, dynamic> toJson() => _$OAuth2CallbackModelToJson(this);

  @JsonKey(name: 'authorization_code')
  final String authorizationCode;
  @JsonKey(name: 'redirect_uri')
  final String redirectUri;
  @JsonKey(name: 'state')
  final dynamic state;
  static const fromJsonFactory = _$OAuth2CallbackModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is OAuth2CallbackModel &&
            (identical(other.authorizationCode, authorizationCode) ||
                const DeepCollectionEquality()
                    .equals(other.authorizationCode, authorizationCode)) &&
            (identical(other.redirectUri, redirectUri) ||
                const DeepCollectionEquality()
                    .equals(other.redirectUri, redirectUri)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(authorizationCode) ^
      const DeepCollectionEquality().hash(redirectUri) ^
      const DeepCollectionEquality().hash(state) ^
      runtimeType.hashCode;
}

extension $OAuth2CallbackModelExtension on OAuth2CallbackModel {
  OAuth2CallbackModel copyWith(
      {String? authorizationCode, String? redirectUri, dynamic state}) {
    return OAuth2CallbackModel(
        authorizationCode: authorizationCode ?? this.authorizationCode,
        redirectUri: redirectUri ?? this.redirectUri,
        state: state ?? this.state);
  }

  OAuth2CallbackModel copyWithWrapped(
      {Wrapped<String>? authorizationCode,
      Wrapped<String>? redirectUri,
      Wrapped<dynamic>? state}) {
    return OAuth2CallbackModel(
        authorizationCode: (authorizationCode != null
            ? authorizationCode.value
            : this.authorizationCode),
        redirectUri:
            (redirectUri != null ? redirectUri.value : this.redirectUri),
        state: (state != null ? state.value : this.state));
  }
}

@JsonSerializable(explicitToJson: true)
class OAuth2ErrorModel {
  const OAuth2ErrorModel({
    required this.error,
    this.errorDescription,
    this.errorUri,
  });

  factory OAuth2ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$OAuth2ErrorModelFromJson(json);

  static const toJsonFactory = _$OAuth2ErrorModelToJson;
  Map<String, dynamic> toJson() => _$OAuth2ErrorModelToJson(this);

  @JsonKey(name: 'error')
  final String error;
  @JsonKey(name: 'error_description')
  final dynamic errorDescription;
  @JsonKey(name: 'error_uri')
  final dynamic errorUri;
  static const fromJsonFactory = _$OAuth2ErrorModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is OAuth2ErrorModel &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.errorDescription, errorDescription) ||
                const DeepCollectionEquality()
                    .equals(other.errorDescription, errorDescription)) &&
            (identical(other.errorUri, errorUri) ||
                const DeepCollectionEquality()
                    .equals(other.errorUri, errorUri)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(errorDescription) ^
      const DeepCollectionEquality().hash(errorUri) ^
      runtimeType.hashCode;
}

extension $OAuth2ErrorModelExtension on OAuth2ErrorModel {
  OAuth2ErrorModel copyWith(
      {String? error, dynamic errorDescription, dynamic errorUri}) {
    return OAuth2ErrorModel(
        error: error ?? this.error,
        errorDescription: errorDescription ?? this.errorDescription,
        errorUri: errorUri ?? this.errorUri);
  }

  OAuth2ErrorModel copyWithWrapped(
      {Wrapped<String>? error,
      Wrapped<dynamic>? errorDescription,
      Wrapped<dynamic>? errorUri}) {
    return OAuth2ErrorModel(
        error: (error != null ? error.value : this.error),
        errorDescription: (errorDescription != null
            ? errorDescription.value
            : this.errorDescription),
        errorUri: (errorUri != null ? errorUri.value : this.errorUri));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModelOAuth2ErrorModel {
  const ReturnModelOAuth2ErrorModel({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModelOAuth2ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelOAuth2ErrorModelFromJson(json);

  static const toJsonFactory = _$ReturnModelOAuth2ErrorModelToJson;
  Map<String, dynamic> toJson() => _$ReturnModelOAuth2ErrorModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory = _$ReturnModelOAuth2ErrorModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModelOAuth2ErrorModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelOAuth2ErrorModelExtension on ReturnModelOAuth2ErrorModel {
  ReturnModelOAuth2ErrorModel copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModelOAuth2ErrorModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModelOAuth2ErrorModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModelOAuth2ErrorModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModelDict {
  const ReturnModelDict({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModelDict.fromJson(Map<String, dynamic> json) =>
      _$ReturnModelDictFromJson(json);

  static const toJsonFactory = _$ReturnModelDictToJson;
  Map<String, dynamic> toJson() => _$ReturnModelDictToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory = _$ReturnModelDictFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModelDict &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelDictExtension on ReturnModelDict {
  ReturnModelDict copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModelDict(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModelDict copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModelDict(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class ForgotPasswordModel {
  const ForgotPasswordModel({
    required this.email,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordModelFromJson(json);

  static const toJsonFactory = _$ForgotPasswordModelToJson;
  Map<String, dynamic> toJson() => _$ForgotPasswordModelToJson(this);

  @JsonKey(name: 'email')
  final String email;
  static const fromJsonFactory = _$ForgotPasswordModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ForgotPasswordModel &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $ForgotPasswordModelExtension on ForgotPasswordModel {
  ForgotPasswordModel copyWith({String? email}) {
    return ForgotPasswordModel(email: email ?? this.email);
  }

  ForgotPasswordModel copyWithWrapped({Wrapped<String>? email}) {
    return ForgotPasswordModel(
        email: (email != null ? email.value : this.email));
  }
}

@JsonSerializable(explicitToJson: true)
class PasswordResetTokenModel {
  const PasswordResetTokenModel({
    required this.token,
    required this.valid,
    this.expiresAt,
    this.userId,
  });

  factory PasswordResetTokenModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetTokenModelFromJson(json);

  static const toJsonFactory = _$PasswordResetTokenModelToJson;
  Map<String, dynamic> toJson() => _$PasswordResetTokenModelToJson(this);

  @JsonKey(name: 'token')
  final String token;
  @JsonKey(name: 'valid')
  final bool valid;
  @JsonKey(name: 'expires_at')
  final dynamic expiresAt;
  @JsonKey(name: 'user_id')
  final dynamic userId;
  static const fromJsonFactory = _$PasswordResetTokenModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PasswordResetTokenModel &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.valid, valid) ||
                const DeepCollectionEquality().equals(other.valid, valid)) &&
            (identical(other.expiresAt, expiresAt) ||
                const DeepCollectionEquality()
                    .equals(other.expiresAt, expiresAt)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(valid) ^
      const DeepCollectionEquality().hash(expiresAt) ^
      const DeepCollectionEquality().hash(userId) ^
      runtimeType.hashCode;
}

extension $PasswordResetTokenModelExtension on PasswordResetTokenModel {
  PasswordResetTokenModel copyWith(
      {String? token, bool? valid, dynamic expiresAt, dynamic userId}) {
    return PasswordResetTokenModel(
        token: token ?? this.token,
        valid: valid ?? this.valid,
        expiresAt: expiresAt ?? this.expiresAt,
        userId: userId ?? this.userId);
  }

  PasswordResetTokenModel copyWithWrapped(
      {Wrapped<String>? token,
      Wrapped<bool>? valid,
      Wrapped<dynamic>? expiresAt,
      Wrapped<dynamic>? userId}) {
    return PasswordResetTokenModel(
        token: (token != null ? token.value : this.token),
        valid: (valid != null ? valid.value : this.valid),
        expiresAt: (expiresAt != null ? expiresAt.value : this.expiresAt),
        userId: (userId != null ? userId.value : this.userId));
  }
}

@JsonSerializable(explicitToJson: true)
class ReturnModelPasswordResetTokenModel {
  const ReturnModelPasswordResetTokenModel({
    this.data,
    this.status,
    this.message,
    this.errors,
  });

  factory ReturnModelPasswordResetTokenModel.fromJson(
          Map<String, dynamic> json) =>
      _$ReturnModelPasswordResetTokenModelFromJson(json);

  static const toJsonFactory = _$ReturnModelPasswordResetTokenModelToJson;
  Map<String, dynamic> toJson() =>
      _$ReturnModelPasswordResetTokenModelToJson(this);

  @JsonKey(name: 'data')
  final dynamic data;
  @JsonKey(name: 'status', defaultValue: true)
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'errors')
  final dynamic errors;
  static const fromJsonFactory = _$ReturnModelPasswordResetTokenModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ReturnModelPasswordResetTokenModel &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.errors, errors) ||
                const DeepCollectionEquality().equals(other.errors, errors)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(errors) ^
      runtimeType.hashCode;
}

extension $ReturnModelPasswordResetTokenModelExtension
    on ReturnModelPasswordResetTokenModel {
  ReturnModelPasswordResetTokenModel copyWith(
      {dynamic data, bool? status, String? message, dynamic errors}) {
    return ReturnModelPasswordResetTokenModel(
        data: data ?? this.data,
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors);
  }

  ReturnModelPasswordResetTokenModel copyWithWrapped(
      {Wrapped<dynamic>? data,
      Wrapped<bool?>? status,
      Wrapped<String?>? message,
      Wrapped<dynamic>? errors}) {
    return ReturnModelPasswordResetTokenModel(
        data: (data != null ? data.value : this.data),
        status: (status != null ? status.value : this.status),
        message: (message != null ? message.value : this.message),
        errors: (errors != null ? errors.value : this.errors));
  }
}

@JsonSerializable(explicitToJson: true)
class ResetPasswordModel {
  const ResetPasswordModel({
    required this.token,
    required this.newPassword,
    required this.confirmPassword,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordModelFromJson(json);

  static const toJsonFactory = _$ResetPasswordModelToJson;
  Map<String, dynamic> toJson() => _$ResetPasswordModelToJson(this);

  @JsonKey(name: 'token')
  final String token;
  @JsonKey(name: 'new_password')
  final String newPassword;
  @JsonKey(name: 'confirm_password')
  final String confirmPassword;
  static const fromJsonFactory = _$ResetPasswordModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ResetPasswordModel &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)) &&
            (identical(other.confirmPassword, confirmPassword) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPassword, confirmPassword)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(newPassword) ^
      const DeepCollectionEquality().hash(confirmPassword) ^
      runtimeType.hashCode;
}

extension $ResetPasswordModelExtension on ResetPasswordModel {
  ResetPasswordModel copyWith(
      {String? token, String? newPassword, String? confirmPassword}) {
    return ResetPasswordModel(
        token: token ?? this.token,
        newPassword: newPassword ?? this.newPassword,
        confirmPassword: confirmPassword ?? this.confirmPassword);
  }

  ResetPasswordModel copyWithWrapped(
      {Wrapped<String>? token,
      Wrapped<String>? newPassword,
      Wrapped<String>? confirmPassword}) {
    return ResetPasswordModel(
        token: (token != null ? token.value : this.token),
        newPassword:
            (newPassword != null ? newPassword.value : this.newPassword),
        confirmPassword: (confirmPassword != null
            ? confirmPassword.value
            : this.confirmPassword));
  }
}

@JsonSerializable(explicitToJson: true)
class ChangePasswordModel {
  const ChangePasswordModel({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);

  static const toJsonFactory = _$ChangePasswordModelToJson;
  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);

  @JsonKey(name: 'current_password')
  final String currentPassword;
  @JsonKey(name: 'new_password')
  final String newPassword;
  @JsonKey(name: 'confirm_password')
  final String confirmPassword;
  static const fromJsonFactory = _$ChangePasswordModelFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ChangePasswordModel &&
            (identical(other.currentPassword, currentPassword) ||
                const DeepCollectionEquality()
                    .equals(other.currentPassword, currentPassword)) &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)) &&
            (identical(other.confirmPassword, confirmPassword) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPassword, confirmPassword)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(currentPassword) ^
      const DeepCollectionEquality().hash(newPassword) ^
      const DeepCollectionEquality().hash(confirmPassword) ^
      runtimeType.hashCode;
}

extension $ChangePasswordModelExtension on ChangePasswordModel {
  ChangePasswordModel copyWith(
      {String? currentPassword, String? newPassword, String? confirmPassword}) {
    return ChangePasswordModel(
        currentPassword: currentPassword ?? this.currentPassword,
        newPassword: newPassword ?? this.newPassword,
        confirmPassword: confirmPassword ?? this.confirmPassword);
  }

  ChangePasswordModel copyWithWrapped(
      {Wrapped<String>? currentPassword,
      Wrapped<String>? newPassword,
      Wrapped<String>? confirmPassword}) {
    return ChangePasswordModel(
        currentPassword: (currentPassword != null
            ? currentPassword.value
            : this.currentPassword),
        newPassword:
            (newPassword != null ? newPassword.value : this.newPassword),
        confirmPassword: (confirmPassword != null
            ? confirmPassword.value
            : this.confirmPassword));
  }
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
