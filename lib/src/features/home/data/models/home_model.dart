import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:newart/src/features/exclusive/data/models/exclusive_model.dart';
import 'package:newart/src/features/product/data/models/product_model.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel extends Equatable {
  final String status;
  final String message;
  final List<Link> links;
  @JsonKey(name: 'new')
  final List<NewsItem> news;
  final List<SliderItem> slider;
  final List<ProductModel> product;
  final Map<String, Currency> currency;
  final List<ExclusiveModel> exclusive;

  const HomeModel({
    required this.status,
    required this.message,
    required this.links,
    required this.news,
    required this.slider,
    required this.product,
    required this.currency,
    required this.exclusive,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);

  @override
  List<Object?> get props =>
      [status, message, links, news, slider, product, currency, exclusive];
}

@JsonSerializable()
class Link extends Equatable {
  final int id;
  @JsonKey(name: 'main_link')
  final String mainLink;
  @JsonKey(name: 'api_link')
  final String apiLink;
  @JsonKey(name: 'image_link')
  final String imageLink;
  @JsonKey(name: 'request_audio_link')
  final String requestAudioLink;
  @JsonKey(name: 'audio_edits_link')
  final String audioEditsLink;
  @JsonKey(name: 'business_audio_links')
  final String businessAudioLinks;
  final String? link6;
  final String? link7;
  final String? link8;
  final String? link9;
  final String? link10;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const Link({
    required this.id,
    required this.mainLink,
    required this.apiLink,
    required this.imageLink,
    required this.requestAudioLink,
    required this.audioEditsLink,
    required this.businessAudioLinks,
    this.link6,
    this.link7,
    this.link8,
    this.link9,
    this.link10,
    this.createdAt,
    this.updatedAt,
  });

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);

  @override
  List<Object?> get props => [
        id,
        mainLink,
        apiLink,
        imageLink,
        requestAudioLink,
        audioEditsLink,
        businessAudioLinks,
        link6,
        link7,
        link8,
        link9,
        link10,
        createdAt,
        updatedAt,
      ];
}

@JsonSerializable()
class NewsItem extends Equatable {
  final int id;
  final String name;
  final String more;
  final String startdate;
  final String enddate;
  final int status;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const NewsItem({
    required this.id,
    required this.name,
    required this.more,
    required this.startdate,
    required this.enddate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) =>
      _$NewsItemFromJson(json);

  Map<String, dynamic> toJson() => _$NewsItemToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        more,
        startdate,
        enddate,
        status,
        createdAt,
        updatedAt,
      ];
}

@JsonSerializable()
class SliderItem extends Equatable {
  final int id;
  final String name;
  final String img;
  final String startdate;
  final String enddate;
  final int status;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const SliderItem({
    required this.id,
    required this.name,
    required this.img,
    required this.startdate,
    required this.enddate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  String get image => "sliders/$img";
  factory SliderItem.fromJson(Map<String, dynamic> json) =>
      _$SliderItemFromJson(json);

  Map<String, dynamic> toJson() => _$SliderItemToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        img,
        startdate,
        enddate,
        status,
        createdAt,
        updatedAt,
      ];
}

@JsonSerializable()
class Currency extends Equatable {
  @JsonKey(name: 'debit_amount')
  final int debitAmount;
  @JsonKey(name: 'credit_amount')
  final int creditAmount;
  @JsonKey(name: 'ldebit_amount')
  final int ldebitAmount;
  @JsonKey(name: 'lcredit_amount')
  final int lcreditAmount;
  @JsonKey(name: 'net_amount')
  final int netAmount;
  @JsonKey(name: 'foreign_net_amount')
  final int foreignNetAmount;

  const Currency({
    required this.debitAmount,
    required this.creditAmount,
    required this.ldebitAmount,
    required this.lcreditAmount,
    required this.netAmount,
    required this.foreignNetAmount,
  });

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);

  @override
  List<Object?> get props => [
        debitAmount,
        creditAmount,
        ldebitAmount,
        lcreditAmount,
        netAmount,
        foreignNetAmount,
      ];
}
