import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'contentdetailsmodel.jser.dart';

class ContentDetailsModel {
  @Alias("internetContentCode")
  String internetContentCode;
  @Alias("title")
  String title;
  @Alias("promoters")
  List<String> promoters;
  @Alias("genre")
  List<String> genre;
  @Alias("startDate")
  String startDate;
  @Alias("endDate")
  String endDate;
  @Alias("venue")
  String venue;
  @Alias("language")
  String language;

}

@GenSerializer()
class ContentDetailsModelSerializer extends Serializer<ContentDetailsModel> with _$ContentDetailsModelSerializer{}
