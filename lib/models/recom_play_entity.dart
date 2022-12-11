class RecomPlayListEntity {
  late int id;
  late String name;
  late String picUrl;
  late int playCount;
  late RecomPlayCreatorEntity creator;

  RecomPlayListEntity({
    required this.id,
    required this.name,
    required this.picUrl,
    required this.playCount,
    required this.creator,
  });

  RecomPlayListEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    playCount = json['playcount'];
    creator = RecomPlayCreatorEntity.fromJson(json['creator']);
  }
}

class RecomPlayCreatorEntity {
  late int userId;
  late String nickname;
  late String avatarUrl;

  RecomPlayCreatorEntity({
    required this.userId,
    required this.nickname,
    required this.avatarUrl,
  });

  RecomPlayCreatorEntity.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nickname = json['nickname'];
    avatarUrl = json['avatarUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['nickname'] = nickname;
    data['avatarUrl'] = avatarUrl;
    return data;
  }
}
