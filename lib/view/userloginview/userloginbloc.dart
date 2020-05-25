import 'package:smitivdemo/apirepository/userloginapirepository.dart';
import 'package:smitivdemo/helper/customtoast.dart';
import 'package:smitivdemo/localdataprovider/customsharedpreferences.dart';
import 'package:smitivdemo/model/postuserdetailsmodel/postuserdetailsmodel.dart';
import 'package:smitivdemo/model/userlogindetailsmodel/userlogindetailsmodel.dart';
import 'package:smitivdemo/utility/utitlity.dart';
import 'package:smitivdemo/view/userloginview/userloginview.dart';

class UserLoginBloc{
  UserLoginApiRepository mRepository=UserLoginApiRepository();
  CustomSharedPreferences mSharedPrefs=CustomSharedPreferences();
  UserLoginViewState mView;

  onSubmit(PostUserDetailsModel model) async{
    if(await Utility.onCheckNetworkConnection()) {
      showProgress();
      UserLoginDetailsModel userLoginDetailsModel = await mRepository.loginUser(
          model);
      if (userLoginDetailsModel != null) {
        await createUserLogged();
        mView.onNavigateToEvents();
      } else {
        hideProgress();
        mView.showToast("Unauthorised user!");
      }
    }else{
      CustomToast.showToast("Please connect to internet");
    }
  }

  void setView(var view) {
    mView=view;
  }

  showProgress(){
    mView.mProgressBar.add(true);
  }

  hideProgress(){
    mView.mProgressBar.add(false);
  }

  isUserLogged() async{
    return await mSharedPrefs.isUserLogged();
  }

  createUserLogged() async{
    await mSharedPrefs.userLogged();
  }

}