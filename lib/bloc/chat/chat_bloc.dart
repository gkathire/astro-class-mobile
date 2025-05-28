import 'package:bloc/bloc.dart';
import 'package:flutter_app/framework/infrastructure/log/logger_service.dart';
import 'package:flutter_app/framework/services/api_service.dart';
import 'package:flutter_app/framework/services/app_session_service.dart';

import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(ApiService apiService, LoggerService loggerService,
      AppSessionService sessionService)
      : super(ChatStateInitialized(isLoading: true)) {
    on<ChatEventInitialized>((event, emit) async {
      final userModel = await sessionService.getUserLoggedInModel();
    });
  }
}
