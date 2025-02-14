import 'dart:convert';
import 'package:crafty_bay/features/auth/data/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{

  final String _accessTokenKey = 'access-token';
  final String _profileDataKey = 'profile_model';

  String? accessToken;
  ProfileModel? profileModel;

  Future<void> saveUserData(String accessToken, ProfileModel model) async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString(_accessTokenKey, accessToken);
    await sharedPreferences.setString(_profileDataKey, jsonEncode(model.toJson()));
  }

  Future<void> getUserData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    accessToken = sharedPreferences.getString(_accessTokenKey);
    profileModel = ProfileModel.fromJson(jsonDecode(sharedPreferences.getString(_profileDataKey)!));
  }

  Future<bool> isUserLoggedIn()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);

    if(token != null){
      await getUserData();
      return true;
    }
    return false;

  }

  Future<void> clearData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     await sharedPreferences.clear();
  }

}