enum ChatOverallMenuOptions {
  createNewChatGroup(1);

  const ChatOverallMenuOptions(this.value);
  final int value;
}

enum ChatMenuOptions {
  addChatUser(1),
  muteChatGroup(2),
  clearAllMessage(3);

  const ChatMenuOptions(this.value);
  final int value;
}

enum ChatGroupItemMenuOptions {
  addChatUser(1),
  removeGroup(2),
  updateGroupName(3);

  const ChatGroupItemMenuOptions(this.value);
  final int value;
}
