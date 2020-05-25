import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferences{

  Future<bool> userLogged() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.setBool("userLogged", true)??false;
  }

  Future<bool> isUserLogged() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getBool("userLogged")??false;
  }


}