import 'package:dio/dio.dart';
import 'package:medfarm/Model/MessageModel.dart';
import 'package:medfarm/Model/UserLoginModel.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';
import 'dart:convert';

class MedFarmAPI {
  String _url = "https://medfarmapi.azurewebsites.net/";
  var MedFarmWidgetsAPI = new MedFarmWidgets();
  String _tokenJWT = "";
  int _userId = 0;

  Future<void> getHomeTestAPI() async {
    try {
      var response = await Dio().get(_url);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> _loginClient(String email, String password) async {
    try{
      var url = _url + '/v1/auth/login/client';

      var response = await Dio().post(
          url,
          data: {
            "email": email,
            "password": password,
            "roles": "Client"
          }
      );

      if (response.statusCode == 200) {
        var UserLogin = new UserLoginModel.fromJson(response.data);
        _tokenJWT = UserLogin.accessToken;
        _userId = UserLogin.id;
        return true;
      }
      else if (response.statusCode == 401 ||response.statusCode == 404||response.statusCode == 500){
        var Message = new MessageModel.fromJson(response.data);
        MedFarmWidgetsAPI.AlertDialogMedFarm(Message.code, Message.message);
        return false;
      }
      else {
        return false;
      }
    }
    catch(e){
      MedFarmWidgetsAPI.AlertDialogMedFarm("Falha de Login", e.toString());
      return false;
    }
  }

  Future<bool> _loginDoctor(String email, String password) async {
    try{
      var url = _url + '/v1/auth/login/doctor';

      var response = await Dio().post(
          url,
          data: {
            "email": email,
            "password": password,
            "roles": "Doctor"
          }
      );

      if (response.statusCode == 200) {
        var UserLogin = new UserLoginModel.fromJson(response.data);
        _tokenJWT = UserLogin.accessToken;
        _userId = UserLogin.id;
        return true;
      }
      else if (response.statusCode == 401 ||response.statusCode == 404||response.statusCode == 500){
        var Message = new MessageModel.fromJson(response.data);
        MedFarmWidgetsAPI.AlertDialogMedFarm(Message.code, Message.message);
        return false;
      }
      else{
        return false;
      }
    }
    catch(e){
      MedFarmWidgetsAPI.AlertDialogMedFarm("Falha de Login", e.toString());
      return false;
    }
  }

  Future<bool> _loginDrugstore(String email, String password) async {
    try{
      var url = _url + '/v1/auth/login/drugstore';

      var response = await Dio().post(
          url,
          data: {
            "email": email,
            "password": password,
            "roles": "Drugstore"
          }
      );

      if (response.statusCode == 200) {
        var UserLogin = new UserLoginModel.fromJson(response.data);
        _tokenJWT = UserLogin.accessToken;
        _userId = UserLogin.id;
        return true;
      }
      else if (response.statusCode == 401 ||response.statusCode == 404||response.statusCode == 500){
        var Message = new MessageModel.fromJson(response.data);
        MedFarmWidgetsAPI.AlertDialogMedFarm(Message.code, Message.message);
        return false;
      }
      else{
        return false;
      }
    }
    catch(e){
      MedFarmWidgetsAPI.AlertDialogMedFarm("Falha de Login", e.toString());
      return false;
    }
  }

  Future<bool> login(String email, String password, String users) async {
    switch(users){
      case 'Client':
        return await _loginClient(email, password);

      case 'Doctor':
        return await _loginDoctor(email, password);

      case 'Drugstore':
         return await _loginDrugstore(email, password);
    }
    return false;
  }

  Future<bool> sendEmailForgotPassword(String email) async {
    var url = _url + '/v1/password/reset/forgot';

    var response = await Dio().post(
        url,
        data: {
          "email": email,
        }
    );

    if (response.statusCode == 200) {
      var Message = new MessageModel.fromJson(response.data);
      MedFarmWidgetsAPI.AlertDialogMedFarm(Message.code, Message.message);
      return true;
    }
    else if (response.statusCode == 401 ||response.statusCode == 404||response.statusCode == 500){
      var Message = new MessageModel.fromJson(response.data);
      MedFarmWidgetsAPI.AlertDialogMedFarm(Message.code, Message.message);
      return false;
    }
    else{
      return false;
    }
  }

  String getOrderImage() {
    String url =
        "https://firebasestorage.googleapis.com/v0/b/medfarmstorage.appspot.com/o/dataOrdersClient%2F0370c51a-98f0-4337-872b-4ab011efbe60.png?alt=media&token=5227be29-149d-421f-8227-7ef9348a4ef4";
    return url;
  }
}
