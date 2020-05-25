import 'package:smitivdemo/apinetworkprovider/eventnetworkprovider.dart';
import 'package:smitivdemo/model/geteventdetailsmodel/geteventdetailsmodel.dart';

class EventApiRepository{
  EventNetworkProvider mNetworkProvider=EventNetworkProvider();

  Future<GetEventDetailsModel> getEvents() async=>await mNetworkProvider.getEvents();

}