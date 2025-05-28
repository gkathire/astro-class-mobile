import 'dart:math' as Math;

import 'package:flutter_app/api/generated/code/filmicall.swagger.dart';
import 'package:flutter_app/framework/services/app_session_service.dart';
import 'package:flutter_app/framework/services/configuration_service.dart';
import 'package:signalr_netcore/hub_connection.dart' as signalR;
import 'package:signalr_netcore/signalr_client.dart';

class RealTimeCommunicationService {
  List<ChatMessageModel> messageNotifications = [];
  late signalR.HubConnection _hubConnection;
  int maxRetryAttempts = 1201; // Keep trying for 1 hour
  int initialRetryDelay = 1000; // Start with 1 second delay
  int maxRetryDelay = 3000; // Max 5 second delay
  int retryCount = 0;
  AppSessionService sessionService;
  RealTimeCommunicationService({
    required this.sessionService,
  }) {
    initializeSignalRConnection();
  }

  Future<void> initializeSignalRConnection() async {
    try {
      var delay = Math.min(
          initialRetryDelay * Math.pow(1.5, retryCount++), maxRetryDelay);

      delay = delay * (0.9 + (Math.Random().nextInt(100)) * 0.2);

      _hubConnection = HubConnectionBuilder()
          .withUrl("${ConfigurationService.serverUrl}/realtime-messages",
              options: HttpConnectionOptions(
                skipNegotiation: true,
                transport: HttpTransportType.WebSockets,
                accessTokenFactory: () => sessionService.getCurrentToken(),
              ))
          .withAutomaticReconnect(retryDelays: [delay.toInt()]).build();

      await _hubConnection.start(); // initialize the connection

      print('Connection established with SignalR hub');

      print('Connection state: ${_hubConnection.state}');

      _hubConnection.onreconnected(
        ({connectionId}) {
          print('Connection Re-established with SignalR hub');
        },
      );

      _hubConnection.onreconnecting(
        ({error}) {
          print('Connection Failed due to $error');
        },
      );

      _hubConnection.onclose(
        ({error}) {
          print('Connection Closed due to $error');
          Future.delayed(Duration(seconds: 2), () {
            startConnection();
          });
        },
      );
    } catch (error, stackTrace) {
      print('Error connecting to SignalR hub: $error');
      reconnectWithRetry();
    }
  }

  void reconnectWithRetry() {
    if (retryCount < maxRetryAttempts) {
      var delay = Math.min(
          initialRetryDelay * Math.pow(1.5, retryCount++), maxRetryDelay);

      delay = delay * (0.9 + (Math.Random().nextInt(100)) * 0.2);
      print('Attempting reconnect in ${delay}ms');
      Future.delayed(Duration(milliseconds: delay.toInt()), () {
        startConnection();
      });
    }
  }

  Future<void> startConnection() async {
    try {} catch (error) {
      print('Error connecting to SignalR hub: $error');
      reconnectWithRetry();
    }
  }

  void receiveNotificationMessage(
      Function(RealtimeMessageModel message) onReceivedNotification) {
    _hubConnection.on('ReceiveNotificationMessage', (message) {
      onReceivedNotification(message as RealtimeMessageModel);
    });
  }

  void receiveChatNotificationMessage(
      Function(ChatMessageModel message) onReceivedChatNotification) {
    _hubConnection.on('ReceiveMessageAsync', (message) {
      onReceivedChatNotification(message as ChatMessageModel);
    });
  }

  void receiveMessage(Function(ChatMessageModel message) onReceivedMessage) {
    _hubConnection.on('ReceiveMessageAsync', (message) {
      onReceivedMessage(message as ChatMessageModel);
    });
  }

  void receiveChatMessageDeleted(
      Function(ChatMessageModel message)
          onReceivedChatMessageDeleteNotification) {
    _hubConnection.on('ReceiveChatMessageDeletedAsync', (message) {
      onReceivedChatMessageDeleteNotification(message as ChatMessageModel);
    });
  }

  void receiveNewChatUsersAdded(Function() onReceivedNewChat) {
    _hubConnection.on(
        'ReceiveNewChatUsersAddedAsync',
        () {
          onReceivedNewChat();
        } as signalR.MethodInvocationFunc);
  }

  receiveGroupNameChanged(Function(ChatModel chat) onReceivedNewChatGroup) {
    _hubConnection.on('ReceiveGroupNameChangedAsync', (chat) {
      onReceivedNewChatGroup(chat as ChatModel);
    });
  }

  receiveChatDeleted(Function() onReceivedChatDelete) {
    _hubConnection.on(
        'ReceiveChatDeletedAsync',
        () {
          onReceivedChatDelete();
        } as signalR.MethodInvocationFunc);
  }

  receiveChatUserDeleted(Function() onReceivedChatDelete) {
    _hubConnection.on(
        'ReceiveChatUserDeletedAsync',
        () {
          onReceivedChatDelete();
        } as signalR.MethodInvocationFunc);
  }

  receiveChatAdded(Function() onReceivedChatAdded) {
    _hubConnection.on(
        'ReceiveChatAddedAsync',
        () {
          onReceivedChatAdded();
        } as signalR.MethodInvocationFunc);
  }

  userTyping(Function() onUserTyping) {
    _hubConnection.on('UserTypingAsync', (userModel) {
      onUserTyping();
    });
  }

  Future<void> sendTypingIndicator(int chatId) async {
    try {
      await _hubConnection.invoke('SendTypingIndicatorAsync', args: [chatId]);
    } catch (error) {
      throw error;
    }
  }

  void filesFolderDelete(FileAttachmentFolderModel model) {
    _hubConnection.invoke('FilesFolderDeletedAsync', args: [model]);
  }

  void chatMessageDeleted(ChatMessageModel model) {
    _hubConnection.invoke('ChatMessageDeletedAsync', args: [model]);
  }

  void sendChatDeleted(int model) {
    _hubConnection.invoke('SendChatDeletedAsync', args: [model]);
  }

  void sendChatAdded(int model) {
    _hubConnection.invoke('SendChatAddedAsync', args: [model]);
  }

  void sendChatUserDeleted(int model, int deletedChatUserId) {
    _hubConnection
        .invoke('SendChatUserDeletedAsync', args: [model, deletedChatUserId]);
  }

  void chatUserAdded(int model) {
    _hubConnection.invoke('ChatUserAddedAsync', args: [model]);
  }

  void sendChatNameChange(ChatModel model) {
    _hubConnection.invoke('SendChatNameChangeAsync', args: [model]);
  }

  void sendMessage({required int chatMessageId}) {
    _hubConnection.invoke('SendMessageAsync', args: [chatMessageId]);
  }

  void stopConnection() {
    _hubConnection.stop();
  }

  Future<void> joinChat(ChatUserCreateModel model) async {
    try {
      await _hubConnection.invoke('JoinChatAsync', args: [model]);
    } catch (error) {
      throw error;
    }
  }
}
