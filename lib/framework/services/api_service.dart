import 'package:astro_mobile/api/generated/code/astro_class.swagger.dart';
import 'package:astro_mobile/framework/infrastructure/interceptor/authinterceptor.dart';
import 'package:astro_mobile/framework/model/result_model.dart';
import 'package:astro_mobile/framework/services/configuration_service.dart';

class ApiService {
  var yearago = DateTime.now().subtract(const Duration(days: 365));
  var api = AstroClass.create(
      baseUrl: Uri.parse(ConfigurationService.serverUrl),
      interceptors: [AuthInterceptor()]);

  Future<ResultModel<ReturnModelTokenResponseModel>> doLogin(
      {required String email, required String password}) async {
    var result = await api.apiAuthLoginPost(
        body: LoginModel(username: email.trim(), password: password.trim()));
    if (result.body == null) {
      return ResultModel.error<ReturnModelTokenResponseModel>(
          'Unable to log in. Please try again later or contact support for further information.');
    } else {
      if (!result.body!.status!) {
        return ResultModel.error<ReturnModelTokenResponseModel>(
            result.body!.errors);
      }
      return ResultModel.ok<ReturnModelTokenResponseModel>(result.body!);
    }
  }

  Future<ResultModel<ReturnModelUserOutModel>>? createUser(
      {required UserCreateModel body}) async {
    var result = await api.apiUsersPost(body: body);
    if (result.body == null) {
      return ResultModel.error<ReturnModelUserOutModel>(
          'Unable to Create User');
    } else {
      if (!result.body!.status!) {
        return ResultModel.error<ReturnModelUserOutModel>(result.body!.errors);
      }
      return ResultModel.ok<ReturnModelUserOutModel>(result.body!);
    }
  }

  Future<ResultModel<ReturnModelUserOutModel>>? updateUser({
    required int? userId,
    required UserUpdateModel? body,
  }) async {
    var result = await api.apiUsersUserIdPut(body: body, userId: userId);
    if (result.body == null) {
      return ResultModel.error<ReturnModelUserOutModel>(
          'Unable to Create User');
    } else {
      if (!result.body!.status!) {
        return ResultModel.error<ReturnModelUserOutModel>(result.body!.errors);
      }
      return ResultModel.ok<ReturnModelUserOutModel>(result.body!);
    }
  }

  Future<ResultModel<ReturnListModelUserOutModel>>? getCompany(
      {required UserSearchCriteriaModel? body}) async {
    var result = await api.apiUsersSearchPost(body: body);
    if (result.body == null) {
      return ResultModel.error<ReturnListModelUserOutModel>(
          'Unable to Get Company information');
    } else {
      if (!result.body!.status!) {
        return ResultModel.error<ReturnListModelUserOutModel>(
            result.body!.errors);
      }
      return ResultModel.ok<ReturnListModelUserOutModel>(result.body!);
    }
  }

  Future<ResultModel<dynamic>>? getUserPicture({int? userId}) async {
    // var result = await api.pick(userId: userId);
    // if (result.body == null) {
    //   return ResultModel.error<dynamic>('Unable to get user profile picture');
    // } else {
    //   return ResultModel.ok<dynamic>(result.body!);
    // }
    return Future.delayed(Duration(seconds: 4));
  }
}
