// GENERATED CODE - DO NOT MODIFY BY HAND

part of jaguar_http.example;

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$ApiInterfaceClient implements ApiClient {
  final String basePath = "";
  Future<UserLoginDetailsModel> loginUserDetails(String header,
      PostUserDetailsModel model, String tenant, String grantType) async {
    var req = base.post
        .path(basePath)
        .path("/auth/v0/:tenant/login")
        .pathParams("tenant", tenant)
        .query("grant_type", grantType)
        .header("Authorization", header)
        .json(jsonConverter.to(model));
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<GetEventDetailsModel> getEventDetails(
      String header, String internetContentCode) async {
    var req = base.get
        .path(basePath)
        .path("/api/v0/SISTIC/icc/")
        .query("internetContentCode", internetContentCode)
        .header("Authorization", header);
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
