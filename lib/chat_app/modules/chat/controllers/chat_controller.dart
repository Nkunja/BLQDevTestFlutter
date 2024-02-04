import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';
import 'package:sendbird_sdk/events/poll_vote_event.dart';
import 'package:sendbird_sdk/events/poll_update_event.dart';

class ChatController extends GetxController implements ChannelEventHandler {
  RxBool loading = true.obs;
  RxBool showSendButton = false.obs;
  List<BaseMessage> allMessages = [];
  final ScrollController scrollController = ScrollController();
  TextEditingController messageTextController = TextEditingController();

  // String userId = 'C823ADfsasdsdajddsad';
  String userId = '5fbb8f12dc0df3ccD9D2';

  String apiToken = 'f93b05ff359245af400aa805bafd2a091a173064';
  String appId = 'BC823AD1-FBEA-4F08-8F41-CF0D9D280FBF';
  String channelUrl =
      'sendbird_open_channel_14092_bf4075fbb8f12dc0df3ccc5c653f027186ac9211';

  OpenChannel? channel;

  @override
  void onInit() async {
    connect();
    super.onInit();
  }

  @override
  void onClose() async {
    SendbirdSdk().removeChannelEventHandler(channelUrl);
    super.onInit();
  }

  Future<void> connect() async {
    try {
      final sendbird = SendbirdSdk(
        appId: appId,
        apiToken: apiToken,
      );

      await sendbird.connect(userId);

      channel = await OpenChannel.getChannel(channelUrl);
      await channel?.enter();
      getMessages(channel!);
      SendbirdSdk().addChannelEventHandler(channelUrl, this);
    } catch (e) {
      print('connect: ERROR: $e');
      throw e;
    }
  }

  Future<void> getMessages(OpenChannel channel) async {
    loading.value = true;
    update();
    try {
      List<BaseMessage> messages = await channel.getMessagesByTimestamp(
          DateTime.now().millisecondsSinceEpoch * 1000, MessageListParams());
      allMessages = messages;
      loading.value = false;
      update();

      Future.delayed(const Duration(milliseconds: 100), () {
        if (allMessages.isNotEmpty && scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            curve: Curves.linear,
            duration: const Duration(milliseconds: 50),
          );
        }
      });
    } catch (e) {
      loading.value = false;
      update();
      print('group_channel_view.dart: getMessages: ERROR: $e');
    }
  }

  @override
  void onMessageReceived(BaseChannel channel, BaseMessage message) {
    print(channel.channelUrl);
    allMessages.add(message);
    update();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (allMessages.isNotEmpty && scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 50),
        );
      }
    });
    if (message is UserMessage) {
    } else if (message is FileMessage) {
    } else if (message is AdminMessage) {}
  }

  Future<void> sendMessage() async {
    final messageText = messageTextController.text;
    hideKeyboard();
    messageTextController.clear();
    onChangeMessage(messageTextController.text);

    if (messageText.isNotEmpty) {
      try {
        final sentMessage = channel?.sendUserMessageWithText(messageText);

        if (sentMessage != null) {
          allMessages.add(sentMessage);
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            curve: Curves.linear,
            duration: const Duration(milliseconds: 10),
          );
        }

        messageTextController.clear();
        update();
      } catch (e) {
        print('sendMessage: ERROR: $e');
      }
    }
  }

  void scrollListview() {
    Future.delayed(const Duration(milliseconds: 600), () {
      if (allMessages.isNotEmpty && scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 50),
        );
      }
    });
  }

  // Future<void> sendMessageTest() async {
  //   const apiToken = 'f93b05ff359245af400aa805bafd2a091a173064';
  //   const appId = 'BC823AD1-FBEA-4F08-8F41-CF0D9D280FBF';
  //   const channelUrl =
  //       'sendbird_open_channel_14092_bf4075fbb8f12dc0df3ccc5c653f027186ac9211';
  //   const baseUrl = 'https://api-$appId.sendbird.com/v3';
  //
  //   final url = Uri.parse('$baseUrl/open_channels/$channelUrl/messages');
  //
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Api-Token': apiToken,
  //       },
  //       body: jsonEncode({
  //         'message_type': 'MESG',
  //         'user_id': userId,
  //         'message': 'hi test 5',
  //       }),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       print('Text message sent successfully');
  //       if (allMessages.isNotEmpty) {
  //         scrollController.animateTo(
  //           scrollController.position.maxScrollExtent,
  //           curve: Curves.linear,
  //           duration: const Duration(milliseconds: 500),
  //         );
  //       }
  //     } else {
  //       print('Failed to send text message: ${response.statusCode}');
  //       print('Response body: ${response.body}');
  //     }
  //   } catch (e) {
  //     print('Error sending text message: $e');
  //   }
  // }

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void onChangeMessage(String text) {
    if (text.isNotEmpty) {
      showSendButton.value = true;
    } else {
      showSendButton.value = false;
    }
  }

  @override
  void onChannelChanged(BaseChannel channel) {
    // TODO: implement onChannelChanged
  }

  @override
  void onChannelDeleted(String channelUrl, ChannelType channelType) {
    // TODO: implement onChannelDeleted
  }

  @override
  void onChannelFrozen(BaseChannel channel) {
    // TODO: implement onChannelFrozen
  }

  @override
  void onChannelHidden(BaseChannel channel) {
    // TODO: implement onChannelHidden
  }

  @override
  void onChannelMemberCountChanged(List<GroupChannel> channels) {
    // TODO: implement onChannelMemberCountChanged
  }

  @override
  void onChannelOperatorsUpdated(BaseChannel channel) {
    // TODO: implement onChannelOperatorsUpdated
  }

  @override
  void onChannelParticipantCountChanged(List<OpenChannel> channels) {
    // TODO: implement onChannelParticipantCountChanged
  }

  @override
  void onChannelUnfrozen(BaseChannel channel) {
    // TODO: implement onChannelUnfrozen
  }

  @override
  void onDeliveryReceiptUpdated(GroupChannel channel) {
    // TODO: implement onDeliveryReceiptUpdated
  }

  @override
  void onMentionReceived(BaseChannel channel, BaseMessage message) {
    // TODO: implement onMentionReceived
  }

  @override
  void onMessageDeleted(BaseChannel channel, int messageId) {
    // TODO: implement onMessageDeleted
  }

  @override
  void onMessageUpdated(BaseChannel channel, BaseMessage message) {
    // TODO: implement onMessageUpdated
  }

  @override
  void onMetaCountersCreated(
      BaseChannel channel, Map<String, int> metaCounters) {
    // TODO: implement onMetaCountersCreated
  }

  @override
  void onMetaCountersDeleted(
      BaseChannel channel, List<String> metaCounterKeys) {
    // TODO: implement onMetaCountersDeleted
  }

  @override
  void onMetaCountersUpdated(
      BaseChannel channel, Map<String, int> metaCounters) {
    // TODO: implement onMetaCountersUpdated
  }

  @override
  void onMetaDataCreated(BaseChannel channel, Map<String, String> metaData) {
    // TODO: implement onMetaDataCreated
  }

  @override
  void onMetaDataDeleted(BaseChannel channel, List<String> metaDataKeys) {
    // TODO: implement onMetaDataDeleted
  }

  @override
  void onMetaDataUpdated(BaseChannel channel, Map<String, String> metaData) {
    // TODO: implement onMetaDataUpdated
  }

  @override
  void onPinUpdated(BaseChannel channel) {
    // TODO: implement onPinUpdated
  }

  @override
  void onPollDeleted(int pollId) {
    // TODO: implement onPollDeleted
  }

  @override
  void onPollUpdated(PollUpdateEvent event) {
    // TODO: implement onPollUpdated
  }

  @override
  void onPollVoted(PollVoteEvent event) {
    // TODO: implement onPollVoted
  }

  @override
  void onReactionUpdated(BaseChannel channel, ReactionEvent event) {
    // TODO: implement onReactionUpdated
  }

  @override
  void onReadReceiptUpdated(GroupChannel channel) {
    // TODO: implement onReadReceiptUpdated
  }

  @override
  void onThreadInfoUpdated(BaseChannel channel, ThreadInfoUpdateEvent event) {
    // TODO: implement onThreadInfoUpdated
  }

  @override
  void onTypingStatusUpdated(GroupChannel channel) {
    // TODO: implement onTypingStatusUpdated
  }

  @override
  void onUserBanned(BaseChannel channel, User user) {
    // TODO: implement onUserBanned
  }

  @override
  void onUserDeclinedInvitation(
      GroupChannel channel, User invitee, User? inviter) {
    // TODO: implement onUserDeclinedInvitation
  }

  @override
  void onUserEntered(OpenChannel channel, User user) {
    // TODO: implement onUserEntered
  }

  @override
  void onUserExited(OpenChannel channel, User user) {
    // TODO: implement onUserExited
  }

  @override
  void onUserJoined(GroupChannel channel, User user) {
    // TODO: implement onUserJoined
  }

  @override
  void onUserLeaved(GroupChannel channel, User user) {
    // TODO: implement onUserLeaved
  }

  @override
  void onUserMuted(BaseChannel channel, User user) {
    // TODO: implement onUserMuted
  }

  @override
  void onUserReceivedInvitation(
      GroupChannel channel, List<User> invitees, User? inviter) {
    // TODO: implement onUserReceivedInvitation
  }

  @override
  void onUserUnbanned(BaseChannel channel, User user) {
    // TODO: implement onUserUnbanned
  }

  @override
  void onUserUnmuted(BaseChannel channel, User user) {
    // TODO: implement onUserUnmuted
  }
}
