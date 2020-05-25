// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patronlogindetailsmodel.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PatronLoginDetailsModelSerializer
    implements Serializer<PatronLoginDetailsModel> {
  @override
  Map<String, dynamic> toMap(PatronLoginDetailsModel model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'patronId', model.patronId);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'firstName', model.firstName);
    setMapValue(ret, 'lastName', model.lastName);
    setMapValue(ret, 'accountNo', model.accountNo);
    setMapValue(ret, 'hasMembership', model.hasMembership);
    setMapValue(ret, 'accountType', model.accountType);
    return ret;
  }

  @override
  PatronLoginDetailsModel fromMap(Map map) {
    if (map == null) return null;
    final obj = PatronLoginDetailsModel();
    obj.patronId = map['patronId'] as int;
    obj.email = map['email'] as String;
    obj.firstName = map['firstName'] as String;
    obj.lastName = map['lastName'] as String;
    obj.accountNo = map['accountNo'] as int;
    obj.hasMembership = map['hasMembership'] as bool;
    obj.accountType = map['accountType'] as String;
    return obj;
  }
}
