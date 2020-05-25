// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userlogindetailsmodel.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserLoginDetailsModelSerializer
    implements Serializer<UserLoginDetailsModel> {
  Serializer<PatronLoginDetailsModel> __patronLoginDetailsModelSerializer;
  Serializer<PatronLoginDetailsModel> get _patronLoginDetailsModelSerializer =>
      __patronLoginDetailsModelSerializer ??=
          PatronLoginDetailsModelSerializer();
  @override
  Map<String, dynamic> toMap(UserLoginDetailsModel model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'access_token', model.accessToken);
    setMapValue(ret, 'token_type', model.tokenType);
    setMapValue(ret, 'patronLogin',
        _patronLoginDetailsModelSerializer.toMap(model.patronLogin));
    return ret;
  }

  @override
  UserLoginDetailsModel fromMap(Map map) {
    if (map == null) return null;
    final obj = UserLoginDetailsModel();
    obj.accessToken = map['access_token'] as String;
    obj.tokenType = map['token_type'] as String;
    obj.patronLogin =
        _patronLoginDetailsModelSerializer.fromMap(map['patronLogin'] as Map);
    return obj;
  }
}
