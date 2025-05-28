import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:chopper/chopper.dart';
import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/framework/services/app_session_service.dart';
import 'package:get_it/get_it.dart';

class AuthInterceptor implements Interceptor {
  late String token;

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    final GetIt getIt = GetIt.instance;
    late LoggedInUserModel? currentUser;
    final sessionService = getIt<AppSessionService>();
    await sessionService.getUserLoggedInModel()?.then((value) {
      currentUser = value;
      token = currentUser?.token ?? "";
    });

    if (token.isEmpty || token.trim().isEmpty) {
      return chain.proceed(chain.request);
    }

    chain.request.headers.remove('Authorization');
    chain.request.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    return chain.proceed(chain.request);
  }
}
