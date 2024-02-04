class ChatUser {
  final String userId;
  final String profileUrl;
  final bool requireAuthForProfileImage;
  final String nickname;
  final Map<String, dynamic> metadata;
  final String role;
  final bool isActive;

  ChatUser({
    required this.userId,
    required this.profileUrl,
    required this.requireAuthForProfileImage,
    required this.nickname,
    required this.metadata,
    required this.role,
    required this.isActive,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      userId: json['user_id'] ?? '',
      profileUrl: json['profile_url'] ?? '',
      requireAuthForProfileImage: json['require_auth_for_profile_image'] ?? false,
      nickname: json['nickname'] ?? '',
      metadata: json['metadata'] ?? {},
      role: json['role'] ?? '',
      isActive: json['is_active'] ?? false,
    );
  }
}

class ChatMessage {
  final String type;
  final String messageId;
  final String message;
  final String data;
  final String customType;
  final ChatUser user;
  final String channelUrl;
  final int createdAt;
  final int updatedAt;
  final bool isRemoved;

  ChatMessage({
    required this.type,
    required this.messageId,
    required this.message,
    required this.data,
    required this.customType,
    required this.user,
    required this.channelUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.isRemoved,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      type: json['type'] ?? '',
      messageId: json['message_id'].toString(),
      message: json['message'] ?? '',
      data: json['data'] ?? '',
      customType: json['custom_type'] ?? '',
      user: ChatUser.fromJson(json['user'] ?? {}),
      channelUrl: json['channel_url'] ?? '',
      createdAt: json['created_at'] ?? 0,
      updatedAt: json['updated_at'] ?? 0,
      isRemoved: json['is_removed'] ?? false,
    );
  }
}
