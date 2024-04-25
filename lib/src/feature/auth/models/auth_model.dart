// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
    String? accessToken;
    String? tokenType;
    int? expiresIn;
    String? refreshToken;
    String? scope;

    AuthModel({
        this.accessToken,
        this.tokenType,
        this.expiresIn,
        this.refreshToken,
        this.scope,
    });

    AuthModel copyWith({
        String? accessToken,
        String? tokenType,
        int? expiresIn,
        String? refreshToken,
        String? scope,
    }) => 
        AuthModel(
            accessToken: accessToken ?? this.accessToken,
            tokenType: tokenType ?? this.tokenType,
            expiresIn: expiresIn ?? this.expiresIn,
            refreshToken: refreshToken ?? this.refreshToken,
            scope: scope ?? this.scope,
        );

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        accessToken: json["access_token"] ?? "",
        tokenType: json["token_type"] ?? "",
        expiresIn: json["expires_in"] ?? 0,
        refreshToken: json["refresh_token"] ?? "",
        scope: json["scope"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
        "scope": scope,
    };
}
