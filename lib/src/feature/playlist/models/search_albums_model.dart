// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchAlbumsModel searchModelFromJson(String str) => SearchAlbumsModel.fromJson(json.decode(str));

String searchModelToJson(SearchAlbumsModel data) => json.encode(data.toJson());

class SearchAlbumsModel {
    Albums? albums;

    SearchAlbumsModel({
        this.albums,
    });

    SearchAlbumsModel copyWith({
        Albums? albums,
    }) => 
        SearchAlbumsModel(
            albums: albums ?? this.albums,
        );

    factory SearchAlbumsModel.fromJson(Map<String, dynamic> json) => SearchAlbumsModel(
        albums: json["albums"] == null ? null : Albums.fromJson(json["albums"]),
    );

    Map<String, dynamic> toJson() => {
        "albums": albums?.toJson(),
    };
}

class Albums {
    String? href;
    List<Item>? items;
    int? limit;
    String? next;
    int? offset;
    dynamic previous;
    int? total;

    Albums({
        this.href,
        this.items,
        this.limit,
        this.next,
        this.offset,
        this.previous,
        this.total,
    });

    Albums copyWith({
        String? href,
        List<Item>? items,
        int? limit,
        String? next,
        int? offset,
        dynamic previous,
        int? total,
    }) => 
        Albums(
            href: href ?? this.href,
            items: items ?? this.items,
            limit: limit ?? this.limit,
            next: next ?? this.next,
            offset: offset ?? this.offset,
            previous: previous ?? this.previous,
            total: total ?? this.total,
        );

    factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        href: json["href"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
    };
}

class Item {
    AlbumTypeEnum? albumType;
    List<Artist>? artists;
    List<String>? availableMarkets;
    ExternalUrls? externalUrls;
    String? href;
    String? id;
    List<Image>? images;
    String? name;
    DateTime? releaseDate;
    ReleaseDatePrecision? releaseDatePrecision;
    int? totalTracks;
    AlbumTypeEnum? type;
    String? uri;

    Item({
        this.albumType,
        this.artists,
        this.availableMarkets,
        this.externalUrls,
        this.href,
        this.id,
        this.images,
        this.name,
        this.releaseDate,
        this.releaseDatePrecision,
        this.totalTracks,
        this.type,
        this.uri,
    });

    Item copyWith({
        AlbumTypeEnum? albumType,
        List<Artist>? artists,
        List<String>? availableMarkets,
        ExternalUrls? externalUrls,
        String? href,
        String? id,
        List<Image>? images,
        String? name,
        DateTime? releaseDate,
        ReleaseDatePrecision? releaseDatePrecision,
        int? totalTracks,
        AlbumTypeEnum? type,
        String? uri,
    }) => 
        Item(
            albumType: albumType ?? this.albumType,
            artists: artists ?? this.artists,
            availableMarkets: availableMarkets ?? this.availableMarkets,
            externalUrls: externalUrls ?? this.externalUrls,
            href: href ?? this.href,
            id: id ?? this.id,
            images: images ?? this.images,
            name: name ?? this.name,
            releaseDate: releaseDate ?? this.releaseDate,
            releaseDatePrecision: releaseDatePrecision ?? this.releaseDatePrecision,
            totalTracks: totalTracks ?? this.totalTracks,
            type: type ?? this.type,
            uri: uri ?? this.uri,
        );

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        albumType: albumTypeEnumValues.map[json["album_type"]]!,
        artists: json["artists"] == null ? [] : List<Artist>.from(json["artists"]!.map((x) => Artist.fromJson(x))),
        availableMarkets: json["available_markets"] == null ? [] : List<String>.from(json["available_markets"]!.map((x) => x)),
        externalUrls: json["external_urls"] == null ? null : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        name: json["name"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        releaseDatePrecision: releaseDatePrecisionValues.map[json["release_date_precision"]]!,
        totalTracks: json["total_tracks"],
        type: albumTypeEnumValues.map[json["type"]]!,
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "album_type": albumTypeEnumValues.reverse[albumType],
        "artists": artists == null ? [] : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "available_markets": availableMarkets == null ? [] : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name,
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecisionValues.reverse[releaseDatePrecision],
        "total_tracks": totalTracks,
        "type": albumTypeEnumValues.reverse[type],
        "uri": uri,
    };
}

enum AlbumTypeEnum {
    ALBUM,
    SINGLE
}

final albumTypeEnumValues = EnumValues({
    "album": AlbumTypeEnum.ALBUM,
    "single": AlbumTypeEnum.SINGLE
});

class Artist {
    ExternalUrls? externalUrls;
    String? href;
    String? id;
    String? name;
    ArtistType? type;
    String? uri;

    Artist({
        this.externalUrls,
        this.href,
        this.id,
        this.name,
        this.type,
        this.uri,
    });

    Artist copyWith({
        ExternalUrls? externalUrls,
        String? href,
        String? id,
        String? name,
        ArtistType? type,
        String? uri,
    }) => 
        Artist(
            externalUrls: externalUrls ?? this.externalUrls,
            href: href ?? this.href,
            id: id ?? this.id,
            name: name ?? this.name,
            type: type ?? this.type,
            uri: uri ?? this.uri,
        );

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: json["external_urls"] == null ? null : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: artistTypeValues.map[json["type"]]!,
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": artistTypeValues.reverse[type],
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

enum ArtistType {
    ARTIST
}

final artistTypeValues = EnumValues({
    "artist": ArtistType.ARTIST
});

class Image {
    int? height;
    String? url;
    int? width;

    Image({
        this.height,
        this.url,
        this.width,
    });

    Image copyWith({
        int? height,
        String? url,
        int? width,
    }) => 
        Image(
            height: height ?? this.height,
            url: url ?? this.url,
            width: width ?? this.width,
        );

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
    };
}

enum ReleaseDatePrecision {
    DAY
}

final releaseDatePrecisionValues = EnumValues({
    "day": ReleaseDatePrecision.DAY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
