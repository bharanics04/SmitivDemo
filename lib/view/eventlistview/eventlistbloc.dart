import 'package:smitivdemo/apirepository/eventapirepository.dart';
import 'package:smitivdemo/model/geteventdetailsmodel/geteventdetailsmodel.dart';
import 'package:smitivdemo/view/eventlistview/eventlistview.dart';

class EventListBloc{
  EventListViewState mView;
  EventApiRepository mRepository=EventApiRepository();

  void setView(var view) {
    mView=view;
  }

  getEventList() async{
    GetEventDetailsModel model= await mRepository.getEvents();
    mView.mContentDetailsModel=model?.contentDetails!=null?model.contentDetails:[];
    hideProgress();
  }

  showProgress(){
    mView.mProgressBar.add(true);
  }

  hideProgress(){
    mView.mProgressBar.add(false);
  }


}