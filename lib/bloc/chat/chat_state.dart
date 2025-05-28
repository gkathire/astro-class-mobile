
import 'package:flutter/foundation.dart';

@immutable
class ChatState {
 bool isLoading;
 String? loadingText;
 ChatState({required this.isLoading, this.loadingText});
}

class ChatStateInitialized extends ChatState {
   ChatStateInitialized({required super.isLoading, super.loadingText});
}