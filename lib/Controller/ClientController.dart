import 'package:dio/dio.dart';
import 'package:medfarm/Controller/AuthController.dart';
import 'package:medfarm/Model/Requests/ClientAppointmentRequestModel.dart';
import 'package:medfarm/Model/Requests/ClientSearchModel.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class ClientController {
  var token = AuthController.tokenJWT;
  var MedFarmWidgetsAPI = new MedFarmWidgets();
  var userId = AuthController.userId;

  Future<List<dynamic>> postSearch(ClientSearchModel Search, String category) async {
    try{
      var url = AuthController.url + '/v1/client/search';

      var response = await Dio().post(
          url,
          data: Search.toJson(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization":
          "Bearer $token",
        })
      );

      if (response.statusCode == 200) {
        switch(category){
          case 'Drugstore':
            return response.data['drugstores'];

          case 'Doctor':
            return response.data['doctors'];

          default:
            List<dynamic> Error = [response.statusCode];
            return Error;
        }
      }
      else{
        List<dynamic> Error = [response.statusCode];
        return Error;
      }

    }catch(e){
      List<dynamic> Error = ["Falha no envio da solicitação"];
      return Error;
    }
  }

  Future<List<dynamic>> getAppointment() async {
    try{
      var url = AuthController.url + '/v1/client/$userId/Appointments';

      var response = await Dio().get(
          url,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
            "Bearer $token",
          })
      );

      if (response.statusCode == 200) {
        List<dynamic> Appointment = response.data['appointments'];
        return Appointment;
      }
      else{
        List<dynamic> Error = [response.statusCode];
        return Error;
      }

    }catch(e){
      List<dynamic> Error = ["Falha no envio da solicitação"];
      return Error;
    }
  }

  Future<List<dynamic>> getOrder() async {
    try{
      var url = AuthController.url + '/v1/client/$userId/Orders';

      var response = await Dio().get(
          url,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
            "Bearer $token",
          })
      );

      if (response.statusCode == 200) {
        List<dynamic> Order = response.data['orders'];
        return Order;
      }
      else{
        List<dynamic> Error = [response.statusCode];
        return Error;
      }

    }catch(e){
      List<dynamic> Error = ["Falha no envio da solicitação"];
      return Error;
    }
  }

  Future<Map> getDoctorById(int id) async {
    try{
      var url = AuthController.url + '/v1/client/doctor/$id';

      var response = await Dio().get(
          url,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
            "Bearer $token",
          })
      );

      if (response.statusCode == 200) {
        return response.data['doctor'];
      }
      else{
        return response.data;
      }

    }catch(e){
      return {'Error': 'Falha no envio da solicitação'};
    }
  }

  Future<Map> getAppointmentFreeDateTimeByDoctorId(int id) async {
    try{
      var url = AuthController.url + '/v1/appointment/client/doctor/datetime/$id';

      var response = await Dio().get(
          url,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
            "Bearer $token",
          })
      );

      if (response.statusCode == 200) {
        return response.data;
      }
      else{
        return response.data;
      }

    }catch(e){
      return {'Error': 'Falha no envio da solicitação'};
    }
  }

  Future<bool> postAppointmentClient(ClientAppointmentRequestModel ClientAppointmentRequest) async {
    try{
      var url = AuthController.url + '/v1/appointment/client';

      var response = await Dio().post(
          url,
          data: ClientAppointmentRequest.toJson(),
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
            "Bearer $token",
          })
      );

      if (response.statusCode == 201) {
            return true;

      }
      else{
        return false;
      }

    }catch(e){
      return false;
    }
  }

  Future<Map> getDrugstoreById(int id) async {
    try{
      var url = AuthController.url + '/v1/client/drugstore/$id';

      var response = await Dio().get(
          url,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
            "Bearer $token",
          })
      );

      if (response.statusCode == 200) {
        return response.data['drugstore'];
      }
      else{
        return response.data;
      }

    }catch(e){
      return {'Error': 'Falha no envio da solicitação'};
    }
  }
}