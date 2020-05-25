import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'patronlogindetailsmodel.jser.dart';

class PatronLoginDetailsModel {
  @Alias("patronId")
  int patronId;
  @Alias("email")
  String email;
  @Alias("firstName")
  String firstName;
  @Alias("lastName")
  String lastName;
  @Alias("accountNo")
  int accountNo;
  @Alias("hasMembership")
  bool hasMembership;
  @Alias("accountType")
  String accountType;

}

@GenSerializer()
class PatronLoginDetailsModelSerializer extends Serializer<PatronLoginDetailsModel> with _$PatronLoginDetailsModelSerializer{}
