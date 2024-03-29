import 'package:dio/dio.dart';
import 'package:medfarm/Model/ClientModel.dart';
import 'package:medfarm/Model/DoctorModel.dart';
import 'package:medfarm/Model/DrugstoreModel.dart';
import 'package:medfarm/Model/Responses/MessageModel.dart';
import 'package:medfarm/Model/Responses/UserLoginModel.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class AuthController {
  static String _url = "https://medfarmapi.azurewebsites.net/";
  var MedFarmWidgetsAPI = new MedFarmWidgets();
  static String _tokenJWT = "";
  static int _userId = 0;

  Future<void> getHomeTestAPI() async {
    try {
      var response = await Dio().get(_url);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> createClient(ClientModel Client) async {
    try{
      var url = _url + '/v1/auth/create/client';

      var response = await Dio().post(
          url,
          data: Client.toJson()
      );
      if (response.statusCode == 201) {
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
    }catch(e){
      MedFarmWidgetsAPI.AlertDialogMedFarm("Falha de Criação de Usuário", e.toString());
      return false;
    }
  }

  Future<bool> createDoctor(DoctorModel Doctor) async {
    try{
      var url = _url + '/v1/auth/create/doctor';

      var response = await Dio().post(
          url,
          data: Doctor.toJson()
      );

      if (response.statusCode == 201) {
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
    }catch(e){
      MedFarmWidgetsAPI.AlertDialogMedFarm("Falha de Criação de Usuário", e.toString());
      return false;
    }
  }

  Future<bool> createDrugstore(DrugstoreModel Drugstore) async {
    try{
      var url = _url + '/v1/auth/create/drugstore';

      var response = await Dio().post(
          url,
          data: Drugstore.toJson()
      );

      if (response.statusCode == 201) {
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
    }catch(e){
      MedFarmWidgetsAPI.AlertDialogMedFarm("Falha de Criação de Usuário", e.toString());
      return false;
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
      print(password);
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

  static String get tokenJWT => _tokenJWT;

  static int get userId => _userId;

  static String get url => _url;
}
