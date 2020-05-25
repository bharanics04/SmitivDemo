import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:smitivdemo/model/contentdetailsmodel/contentdetailsmodel.dart';
part 'geteventdetailsmodel.jser.dart';

class GetEventDetailsModel {
  @Alias("content")
  List<ContentDetailsModel> contentDetails;

}

@GenSerializer()
class GetEventDetailsModelSerializer extends Serializer<GetEventDetailsModel> with _$GetEventDetailsModelSerializer{}
