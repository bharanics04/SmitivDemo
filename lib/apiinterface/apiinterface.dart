library jaguar_http.example;

import 'package:jaguar_resty/jaguar_resty.dart' as resty;
import 'package:jaguar_resty/jaguar_resty.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:smitivdemo/model/geteventdetailsmodel/geteventdetailsmodel.dart';
import 'package:smitivdemo/model/postuserdetailsmodel/postuserdetailsmodel.dart';
import 'package:smitivdemo/model/userlogindetailsmodel/userlogindetailsmodel.dart';

part 'apiinterface.jretro.dart';

@GenApiClient()
class ApiInterface extends ApiClient with _$ApiInterfaceClient {
  final resty.Route mBase;

  ApiInterface(this.mBase);

  @override
  Route get base => mBase;

  @PostReq(path: "/auth/v0/:tenant/login")
  Future<UserLoginDetailsModel> loginUserDetails(@Header('Authorization') String header,@AsJson() PostUserDetailsModel model,@PathParam('tenant') String tenant,@QueryParam('grant_type') String grantType);

  @GetReq(path: "/api/v0/SISTIC/icc/")
  Future<GetEventDetailsModel> getEventDetails(@Header('Authorization') String header,@QueryParam() String internetContentCode);

}