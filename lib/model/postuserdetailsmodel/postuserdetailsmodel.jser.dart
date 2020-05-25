// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postuserdetailsmodel.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PostUserDetailsModelSerializer
    implements Serializer<PostUserDetailsModel> {
  @override
  Map<String, dynamic> toMap(PostUserDetailsModel model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'username', model.username);
    setMapValue(ret, 'password', model.password);
    return ret;
  }

  @override
  PostUserDetailsModel fromMap(Map map) {
    if (map == null) return null;
    final obj = PostUserDetailsModel();
    obj.username = map['username'] as String;
    obj.password = map['password'] as String;
    return obj;
  }
}
