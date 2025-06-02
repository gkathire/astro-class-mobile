import 'package:astro_mobile/api/services/enum_badge_service.dart';
import 'package:astro_mobile/api/services/enum_text_color_service.dart';
import 'package:astro_mobile/api/services/select-service.dart';
import 'package:astro_mobile/bloc/navigation/navigation_bloc.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/services/app_session_service.dart';
import 'package:astro_mobile/framework/services/real_time_communication/real_time_communication_service.dart';
import 'package:get_it/get_it.dart';

import '../framework/services/api_service.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Register a singleton instance
  getIt.registerSingleton<ApiService>(ApiService());

  // Register LoggerService as a singleton
  getIt.registerSingleton<LoggerService>(LoggerService());

  // Register AppSelectService
  getIt.registerSingleton<SelectService>(SelectService());

  // Register EnumBadgeService
  getIt.registerSingleton<EnumBadgeService>(EnumBadgeService());

  // Register EnumTextColorService
  getIt.registerSingleton<EnumTextColorService>(EnumTextColorService());

  // Register AppSessionService with a dependency on LoggerService
  getIt.registerSingleton<AppSessionService>(
      AppSessionService(loggerService: getIt<LoggerService>()));

  // NavigationBloc
  getIt.registerSingleton<NavigationBloc>(NavigationBloc());

  // Register RealTimeCommunicationService
  getIt.registerSingleton<RealTimeCommunicationService>(
      RealTimeCommunicationService(sessionService: getIt<AppSessionService>()));
}
