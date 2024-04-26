// To parse this JSON data, do
//
//     final playlistModel = playlistModelFromJson(jsonString);

import 'dart:convert';

PlaylistModel playlistModelFromJson(String str) => PlaylistModel.fromJson(json.decode(str));

String playlistModelToJson(PlaylistModel data) => json.encode(data.toJson());

class PlaylistModel {
    String? href;
    int? limit;
    dynamic next;
    int? offset;
    dynamic previous;
    int? total;
    List<PlaylistItemModel>? items;

    PlaylistModel({
        this.href,
        this.limit,
        this.next,
        this.offset,
        this.previous,
        this.total,
        this.items,
    });

    PlaylistModel copyWith({
        String? href,
        int? limit,
        dynamic next,
        int? offset,
        dynamic previous,
        int? total,
        List<PlaylistItemModel>? items,
    }) => 
        PlaylistModel(
            href: href ?? this.href,
            limit: limit ?? this.limit,
            next: next ?? this.next,
            offset: offset ?? this.offset,
            previous: previous ?? this.previous,
            total: total ?? this.total,
            items: items ?? this.items,
        );

    factory PlaylistModel.fromJson(Map<String, dynamic> json) => PlaylistModel(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: json["items"] == null ? [] : List<PlaylistItemModel>.from(json["items"]!.map((x) => PlaylistItemModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class PlaylistItemModel {
    bool? collaborative;
    String? description;
    ExternalUrls? externalUrls;
    Followers? followers;
    String? href;
    String? id;
    dynamic images;
    String? name;
    Owner? owner;
    dynamic primaryColor;
    bool? public;
    String? snapshotId;
    Tracks? tracks;
    String? type;
    String? uri;

    PlaylistItemModel({
        this.collaborative,
        this.description,
        this.externalUrls,
        this.followers,
        this.href,
        this.id,
        this.images,
        this.name,
        this.owner,
        this.primaryColor,
        this.public,
        this.snapshotId,
        this.tracks,
        this.type,
        this.uri,
    });

    PlaylistItemModel copyWith({
        bool? collaborative,
        String? description,
        ExternalUrls? externalUrls,
        Followers? followers,
        String? href,
        String? id,
        dynamic images,
        String? name,
        Owner? owner,
        dynamic primaryColor,
        bool? public,
        String? snapshotId,
        Tracks? tracks,
        String? type,
        String? uri,
    }) => 
        PlaylistItemModel(
            collaborative: collaborative ?? this.collaborative,
            description: description ?? this.description,
            externalUrls: externalUrls ?? this.externalUrls,
            followers: followers ?? this.followers,
            href: href ?? this.href,
            id: id ?? this.id,
            images: images ?? this.images,
            name: name ?? this.name,
            owner: owner ?? this.owner,
            primaryColor: primaryColor ?? this.primaryColor,
            public: public ?? this.public,
            snapshotId: snapshotId ?? this.snapshotId,
            tracks: tracks ?? this.tracks,
            type: type ?? this.type,
            uri: uri ?? this.uri,
        );

    factory PlaylistItemModel.fromJson(Map<String, dynamic> json) => PlaylistItemModel(
        collaborative: json["collaborative"],
        description: json["description"],
        externalUrls: json["external_urls"] == null ? null : ExternalUrls.fromJson(json["external_urls"]),
        followers: json["followers"] == null ? null : Followers.fromJson(json["followers"]),
        href: json["href"],
        id: json["id"],
        images: json["images"],
        name: json["name"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        primaryColor: json["primary_color"],
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks: json["tracks"] == null ? null : Tracks.fromJson(json["tracks"]),
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "collaborative": collaborative,
        "description": description,
        "external_urls": externalUrls?.toJson(),
        "followers": followers?.toJson(),
        "href": href,
        "id": id,
        "images": images,
        "name": name,
        "owner": owner?.toJson(),
        "primary_color": primaryColor,
        "public": public,
        "snapshot_id": snapshotId,
        "tracks": tracks?.toJson(),
        "type": type,
        "uri": uri,
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

class Owner {
    String? displayName;
    ExternalUrls? externalUrls;
    String? href;
    String? id;
    String? type;
    String? uri;

    Owner({
        this.displayName,
        this.externalUrls,
        this.href,
        this.id,
        this.type,
        this.uri,
    });

    Owner copyWith({
        String? displayName,
        ExternalUrls? externalUrls,
        String? href,
        String? id,
        String? type,
        String? uri,
    }) => 
        Owner(
            displayName: displayName ?? this.displayName,
            externalUrls: externalUrls ?? this.externalUrls,
            href: href ?? this.href,
            id: id ?? this.id,
            type: type ?? this.type,
            uri: uri ?? this.uri,
        );

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        displayName: json["display_name"],
        externalUrls: json["external_urls"] == null ? null : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "display_name": displayName,
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "type": type,
        "uri": uri,
    };
}

class Tracks {
    String? href;
    List<dynamic>? items;
    int? limit;
    dynamic next;
    int? offset;
    dynamic previous;
    int? total;

    Tracks({
        this.href,
        this.items,
        this.limit,
        this.next,
        this.offset,
        this.previous,
        this.total,
    });

    Tracks copyWith({
        String? href,
        List<dynamic>? items,
        int? limit,
        dynamic next,
        int? offset,
        dynamic previous,
        int? total,
    }) => 
        Tracks(
            href: href ?? this.href,
            items: items ?? this.items,
            limit: limit ?? this.limit,
            next: next ?? this.next,
            offset: offset ?? this.offset,
            previous: previous ?? this.previous,
            total: total ?? this.total,
        );

    factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        items: json["items"] == null ? [] : List<dynamic>.from(json["items"]!.map((x) => x)),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x)),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
    };
}