class AuthResponseModel {
  final String userId, accessToken, refreshToken;
  final String? displayName;

  AuthResponseModel({
    required this.userId,
    this.displayName,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      userId: json['_id'],
      displayName: json['displayName'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = userId;
    map['displayName'] = displayName;
    map['access_token'] = accessToken;
    map['refresh_token'] = refreshToken;
    return map;
  }
}
