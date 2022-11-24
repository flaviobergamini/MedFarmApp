import 'package:medfarm/Controller/AuthController.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';
import 'package:dio/dio.dart';

class DrugstoreController{
  var token = AuthController.tokenJWT;
  var MedFarmWidgetsAPI = new MedFarmWidgets();
  var userId = AuthController.userId;

  Future<List<dynamic>> getOrderPending() async {
    try{
      var url = AuthController.url + '/v1/order/drugstore/$userId';

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

  Future<Map> getOrderConfirmedClientById(int id) async {
    try{
      var url = AuthController.url + '/v1/order/drugstore/order/$id';

      var response = await Dio().get(
          url,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
            "Bearer $token",
          })
      );
      if (response.statusCode == 200) {

        return response.data['appointments'];
      }
      else{
        return response.data;
      }

    }catch(e){
      return {'Error': 'Falha no envio da solicitação'};
    }
  }

  Future<bool> patchConfirmed(int clientId) async {
    try {
      var url = AuthController.url + '/v1/order/drugstore/order/$clientId';

      var response = await Dio().patch(
          url,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
            "Bearer $token",
          })
      );

      if (response.statusCode == 200) {
        return true;
      }
      else {
        return false;
      }
    }catch(e){
      return false;
    }
  }
}