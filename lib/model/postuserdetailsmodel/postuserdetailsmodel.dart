import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'postuserdetailsmodel.jser.dart';

class PostUserDetailsModel {
  @Alias("username")
  String username;
  @Alias('password')
  String password;

  PostUserDetailsModel({this.username, this.password});


}

@GenSerializer()
class PostUserDetailsModelSerializer extends Serializer<PostUserDetailsModel> with _$PostUserDetailsModelSerializer{}
