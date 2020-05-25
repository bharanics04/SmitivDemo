import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smitivdemo/helper/customprogress.dart';
import 'package:smitivdemo/helper/customtextfield.dart';
import 'package:smitivdemo/model/contentdetailsmodel/contentdetailsmodel.dart';
import 'package:smitivdemo/utility/utitlity.dart';

import 'eventlistbloc.dart';

class EventListView extends StatefulWidget {
  @override
  EventListViewState createState() => EventListViewState();
}

class EventListViewState extends State<EventListView> {
  var mProgressBar = BehaviorSubject<bool>();
  EventListBloc mBloc;
  List<ContentDetailsModel> mContentDetailsModel=[];

  @override
  void initState() {
    mBloc=EventListBloc();
    mBloc.setView(this);
    init();
    super.initState();
  }

  init() async{
    await mBloc.getEventList();
  }

  @override
  void dispose() {
    mProgressBar.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(initialData: true,stream: mProgressBar.stream,builder: (BuildContext context,AsyncSnapshot<bool> snapshot){
      if(snapshot.hasData && !snapshot.data)
        return Scaffold(backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text("Events"),),
            body: mContentDetailsModel?.length!=null?ListView.builder(itemCount: mContentDetailsModel.length,itemBuilder: (BuildContext context,int index){
              return Container(margin: EdgeInsets.all(10),child: Card(child: Column(
                children: [
                  CustomTextField(title: "Title", subTitle: mContentDetailsModel[index].title),
                  CustomTextField(title: "Venue", subTitle: mContentDetailsModel[index].venue),
                  CustomTextField(title: "Genre", subTitle: mContentDetailsModel[index]?.genre[0]??"-"),
                  CustomTextField(title: "Start Date", subTitle: Utility.isEmpty(mContentDetailsModel[index].startDate)?"-":mContentDetailsModel[index].startDate?.split("T")[0]),
                  CustomTextField(title: "End Date", subTitle: Utility.isEmpty(mContentDetailsModel[index].endDate)?"-":mContentDetailsModel[index].endDate?.split("T")[0]),
                ],
              ),),);
            }):Center(child: Text("No events available!"),)
        );
      else
        return CustomProgress();
    });
  }
}
