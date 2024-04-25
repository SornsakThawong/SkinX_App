// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String? displayName;
    ExternalUrls? externalUrls;
    String? href;
    String? id;
    List<dynamic>? images;
    String? type;
    String? uri;
    Followers? followers;
    String? country;
    String? product;
    ExplicitContent? explicitContent;
    String? email;

    UserModel({
        this.displayName,
        this.externalUrls,
        this.href,
        this.id,
        this.images,
        this.type,
        this.uri,
        this.followers,
        this.country,
        this.product,
        this.explicitContent,
        this.email,
    });

    UserModel copyWith({
        String? displayName,
        ExternalUrls? externalUrls,
        String? href,
        String? id,
        List<dynamic>? images,
        String? type,
        String? uri,
        Followers? followers,
        String? country,
        String? product,
        ExplicitContent? explicitContent,
        String? email,
    }) => 
        UserModel(
            displayName: displayName ?? this.displayName,
            externalUrls: externalUrls ?? this.externalUrls,
            href: href ?? this.href,
            id: id ?? this.id,
            images: images ?? this.images,
            type: type ?? this.type,
            uri: uri ?? this.uri,
            followers: followers ?? this.followers,
            country: country ?? this.country,
            product: product ?? this.product,
            explicitContent: explicitContent ?? this.explicitContent,
            email: email ?? this.email,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        displayName: json["display_name"],
        externalUrls: json["external_urls"] == null ? null : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
        type: json["type"],
        uri: json["uri"],
        followers: json["followers"] == null ? null : Followers.fromJson(json["followers"]),
        country: json["country"],
        product: json["product"],
        explicitContent: json["explicit_content"] == null ? null : ExplicitContent.fromJson(json["explicit_content"]),
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "display_name": displayName,
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "type": type,
        "uri": uri,
        "followers": followers?.toJson(),
        "country": country,
        "product": product,
        "explicit_content": explicitContent?.toJson(),
        "email": email,
    };
}

class ExplicitContent {
    bool? filterEnabled;
    bool? filterLocked;

    ExplicitContent({
        this.filterEnabled,
        this.filterLocked,
    });

    ExplicitContent copyWith({
        bool? filterEnabled,
        bool? filterLocked,
    }) => 
        ExplicitContent(
            filterEnabled: filterEnabled ?? this.filterEnabled,
            filterLocked: filterLocked ?? this.filterLocked,
        );

    factory ExplicitContent.fromJson(Map<String, dynamic> json) => ExplicitContent(
        filterEnabled: json["filter_enabled"],
        filterLocked: json["filter_locked"],
    );

    Map<String, dynamic> toJson() => {
        "filter_enabled": filterEnabled,
        "filter_locked": filterLocked,
    };
}

class ExternalUrls {
    String? spotify;

    ExternalUrls({
        this.spotify,
    });

    ExternalUrls copyWith({
        String? spotify,
    }) => 
        ExternalUrls(
            spotify: spotify ?? this.spotify,
        );

    factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
    );

    Map<String, dynamic> toJson() => {
        "spotify": spotify,
    };
}

class Followers {
    dynamic href;
    int? total;

    Followers({
        this.href,
        this.total,
    });

    Followers copyWith({
        dynamic href,
        int? total,
    }) => 
        Followers(
            href: href ?? this.href,
            total: total ?? this.total,
        );

    factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
    };
}
