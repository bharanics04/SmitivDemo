// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geteventdetailsmodel.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$GetEventDetailsModelSerializer
    implements Serializer<GetEventDetailsModel> {
  Serializer<ContentDetailsModel> __contentDetailsModelSerializer;
  Serializer<ContentDetailsModel> get _contentDetailsModelSerializer =>
      __contentDetailsModelSerializer ??= ContentDetailsModelSerializer();
  @override
  Map<String, dynamic> toMap(GetEventDetailsModel model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(
        ret,
        'content',
        codeIterable(
            model.contentDetails,
            (val) => _contentDetailsModelSerializer
                .toMap(val as ContentDetailsModel)));
    return ret;
  }

  @override
  GetEventDetailsModel fromMap(Map map) {
    if (map == null) return null;
    final obj = GetEventDetailsModel();
    obj.contentDetails = codeIterable<ContentDetailsModel>(
        map['content'] as Iterable,
        (val) => _contentDetailsModelSerializer.fromMap(val as Map));
    return obj;
  }
}
