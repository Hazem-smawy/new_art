// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      status: json['status'] as String,
      message: json['message'] as String,
      links: (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      news: (json['new'] as List<dynamic>)
          .map((e) => NewsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      slider: (json['slider'] as List<dynamic>)
          .map((e) => SliderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      product: (json['product'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currency: (json['currency'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Currency.fromJson(e as Map<String, dynamic>)),
      ),
      exclusive: (json['exclusive'] as List<dynamic>)
          .map((e) => ExclusiveModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'links': instance.links,
      'new': instance.news,
      'slider': instance.slider,
      'product': instance.product,
      'currency': instance.currency,
      'exclusive': instance.exclusive,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      id: (json['id'] as num).toInt(),
      mainLink: json['main_link'] as String,
      apiLink: json['api_link'] as String,
      imageLink: json['image_link'] as String,
      requestAudioLink: json['request_audio_link'] as String,
      audioEditsLink: json['audio_edits_link'] as String,
      businessAudioLinks: json['business_audio_links'] as String,
      link6: json['link6'] as String?,
      link7: json['link7'] as String?,
      link8: json['link8'] as String?,
      link9: json['link9'] as String?,
      link10: json['link10'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'id': instance.id,
      'main_link': instance.mainLink,
      'api_link': instance.apiLink,
      'image_link': instance.imageLink,
      'request_audio_link': instance.requestAudioLink,
      'audio_edits_link': instance.audioEditsLink,
      'business_audio_links': instance.businessAudioLinks,
      'link6': instance.link6,
      'link7': instance.link7,
      'link8': instance.link8,
      'link9': instance.link9,
      'link10': instance.link10,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

NewsItem _$NewsItemFromJson(Map<String, dynamic> json) => NewsItem(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      more: json['more'] as String,
      startdate: json['startdate'] as String,
      enddate: json['enddate'] as String,
      status: (json['status'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$NewsItemToJson(NewsItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'more': instance.more,
      'startdate': instance.startdate,
      'enddate': instance.enddate,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

SliderItem _$SliderItemFromJson(Map<String, dynamic> json) => SliderItem(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      img: json['img'] as String,
      startdate: json['startdate'] as String,
      enddate: json['enddate'] as String,
      status: (json['status'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$SliderItemToJson(SliderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img': instance.img,
      'startdate': instance.startdate,
      'enddate': instance.enddate,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      debitAmount: (json['debit_amount'] as num).toInt(),
      creditAmount: (json['credit_amount'] as num).toInt(),
      ldebitAmount: (json['ldebit_amount'] as num).toInt(),
      lcreditAmount: (json['lcredit_amount'] as num).toInt(),
      netAmount: (json['net_amount'] as num).toInt(),
      foreignNetAmount: (json['foreign_net_amount'] as num).toInt(),
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'debit_amount': instance.debitAmount,
      'credit_amount': instance.creditAmount,
      'ldebit_amount': instance.ldebitAmount,
      'lcredit_amount': instance.lcreditAmount,
      'net_amount': instance.netAmount,
      'foreign_net_amount': instance.foreignNetAmount,
    };
