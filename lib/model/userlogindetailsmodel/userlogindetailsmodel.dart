import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:smitivdemo/model/patronlogindetailsmodel/patronlogindetailsmodel.dart';
part 'userlogindetailsmodel.jser.dart';

class UserLoginDetailsModel {
  @Alias("access_token")
  String accessToken;
  @Alias("token_type")
  String tokenType;
  @Alias("patronLogin")
  PatronLoginDetailsModel patronLogin;

}

@GenSerializer()
class UserLoginDetailsModelSerializer extends Serializer<UserLoginDetailsModel> with _$UserLoginDetailsModelSerializer{}
