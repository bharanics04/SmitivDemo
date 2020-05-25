import 'package:smitivdemo/apinetworkprovider/userloginnetworkprovider.dart';
import 'package:smitivdemo/model/postuserdetailsmodel/postuserdetailsmodel.dart';
import 'package:smitivdemo/model/userlogindetailsmodel/userlogindetailsmodel.dart';

class UserLoginApiRepository{
  UserLoginNetworkProvider mNetworkProvider=UserLoginNetworkProvider();

  Future<UserLoginDetailsModel> loginUser(PostUserDetailsModel model) async=>await mNetworkProvider.onLogin(model);

}