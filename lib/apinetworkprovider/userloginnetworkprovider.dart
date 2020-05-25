library jaguar_http.example;
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:smitivdemo/apiinterface/apiinterface.dart';
import 'package:smitivdemo/constants/baseconstants.dart';
import 'package:smitivdemo/helper/customtoast.dart';
import 'package:smitivdemo/model/geteventdetailsmodel/geteventdetailsmodel.dart';
import 'package:smitivdemo/model/postuserdetailsmodel/postuserdetailsmodel.dart';
import 'package:smitivdemo/model/userlogindetailsmodel/userlogindetailsmodel.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:http/io_client.dart';
import 'package:jaguar_resty/jaguar_resty.dart' as resty;


class UserLoginNetworkProvider{
  ApiInterface mApiInterface;

  Future<UserLoginDetailsModel> onLogin(PostUserDetailsModel model) async{
    try{
      var globalClient = IOClient();
      mApiInterface=ApiInterface(resty.Route("https://auth.stixcloudtest.com/"));
      mApiInterface.mBase..before((req) async {
        print(req.getUrl);
        print(req.getHeaders);

        if (req is RouteWithBody) {
          print(req.getBody());
        }
      })
        ..after((res) {
          print(res.request.url);
          print(res.statusCode);

          if (Platform.isAndroid)
            Print.LogPrint(res.body);
          else
            debugPrint(res.body);
        })
            .getClient = globalClient;
      mApiInterface.jsonConverter=JsonRepo()
        ..add(UserLoginDetailsModelSerializer())
        ..add(GetEventDetailsModelSerializer())
        ..add(PostUserDetailsModelSerializer());

      UserLoginDetailsModel wrapper=await mApiInterface.loginUserDetails(BaseConstants.loginToken,model,"SISTIC","password");
      return wrapper;
    }catch(e){
      print(e.toString());
      print("error");
    }
    return null;
  }
}
