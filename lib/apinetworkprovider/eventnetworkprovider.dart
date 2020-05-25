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


class EventNetworkProvider{
  ApiInterface mApiInterface;

  Future<GetEventDetailsModel> getEvents() async{
    try{
      var globalClient = IOClient();
      mApiInterface=ApiInterface(resty.Route("https://api.stixcloudtest.com/"));
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

      GetEventDetailsModel model=await mApiInterface.getEventDetails(BaseConstants.eventToken,"patrick1220");
      return model;
    }catch(e){
      print(e.toString());
      print("error");
    }
    return null;
  }


}