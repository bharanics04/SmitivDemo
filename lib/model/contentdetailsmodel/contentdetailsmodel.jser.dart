// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contentdetailsmodel.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$ContentDetailsModelSerializer
    implements Serializer<ContentDetailsModel> {
  @override
  Map<String, dynamic> toMap(ContentDetailsModel model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'internetContentCode', model.internetContentCode);
    setMapValue(ret, 'title', model.title);
    setMapValue(ret, 'promoters',
        codeIterable(model.promoters, (val) => val as String));
    setMapValue(
        ret, 'genre', codeIterable(model.genre, (val) => val as String));
    setMapValue(ret, 'startDate', model.startDate);
    setMapValue(ret, 'endDate', model.endDate);
    setMapValue(ret, 'venue', model.venue);
    setMapValue(ret, 'language', model.language);
    return ret;
  }

  @override
  ContentDetailsModel fromMap(Map map) {
    if (map == null) return null;
    final obj = ContentDetailsModel();
    obj.internetContentCode = map['internetContentCode'] as String;
    obj.title = map['title'] as String;
    obj.promoters = codeIterable<String>(
        map['promoters'] as Iterable, (val) => val as String);
    obj.genre =
        codeIterable<String>(map['genre'] as Iterable, (val) => val as String);
    obj.startDate = map['startDate'] as String;
    obj.endDate = map['endDate'] as String;
    obj.venue = map['venue'] as String;
    obj.language = map['language'] as String;
    return obj;
  }
}
