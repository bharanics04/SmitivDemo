import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smitivdemo/helper/customprogress.dart';
import 'package:smitivdemo/helper/customtextformfield.dart';
import 'package:smitivdemo/helper/customtoast.dart';
import 'package:smitivdemo/model/postuserdetailsmodel/postuserdetailsmodel.dart';
import 'package:smitivdemo/utility/utitlity.dart';
import 'package:flutter/widgets.dart';
import 'package:smitivdemo/view/eventlistview/eventlistview.dart';
import 'package:smitivdemo/view/userloginview/userloginbloc.dart';

class UserLoginView extends StatefulWidget {
  @override
  UserLoginViewState createState() => UserLoginViewState();
}

class UserLoginViewState extends State<UserLoginView> {
  TextEditingController tecUserName=TextEditingController();
  TextEditingController tecPassword=TextEditingController();
  UserLoginBloc mBloc;
  var mProgressBar = BehaviorSubject<bool>();
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    mBloc=UserLoginBloc();
    mBloc.setView(this);
    init();
    super.initState();
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
          appBar: AppBar(title: Text("User Login"),),
          body: Form(key: formKey,child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              tffUserName(),
              tffPassword(),
              rbSubmit(),
              SizedBox(height: 100.0),
            ],
          ))
        );
      else
        return CustomProgress();
    });
  }

  Widget tffUserName() {
    return CustomTextFormField(
        hint: 'Enter UserName',
        inputType: TextInputType.text,
        title: 'UserName',
        isTitleRequired: true,
        controller: tecUserName,
        onValidate: (val) {
          return Utility.isEmpty(val)
              ? 'Please enter user name'
              : null;
        });
  }

  Widget tffPassword() {
    return CustomTextFormField(
        hint: 'Enter Password',
        inputType: TextInputType.text,
        title: 'Password',
        isTitleRequired: true,
        controller: tecPassword,
        onValidate: (val) {
          return Utility.isEmpty(val)
              ? 'Please enter password'
              : null;
        });
  }

  Widget rbSubmit(){
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onPressed: () {
        if (this.formKey.currentState.validate()) {
          formKey.currentState.save();
          submit();
        } else {
          return null;
        }
      },
      padding: EdgeInsets.all(12.0),
      elevation: 5.0,
      color: Colors.blue[700],
      child: Text('Login', style: TextStyle(color: Colors.white)),
    );
  }


  void submit() async{
    await mBloc.onSubmit(PostUserDetailsModel(username: tecUserName.text,password: tecPassword.text));
  }


  showToast(message){
    CustomToast.showToast(message);
  }

  void onNavigateToEvents() async{
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => EventListView()),
    );
  }

  void init() async{
    if(await Utility.onCheckNetworkConnection()){
    if(await mBloc.isUserLogged())
      onNavigateToEvents();
    else
     mBloc.hideProgress();
    }else
      mBloc.hideProgress();

  }

}

