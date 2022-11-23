import 'package:dio/dio.dart';
import 'package:medfarm/Controller/AuthController.dart';
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

      print('-------------------------------------------------------------');
      print(Search.category);
      print(Search.city);
      print(Search.specialty);
      print('-------------------------------------------------------------');

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

      List<dynamic> Appointment = response.data['appointments'];

      if (response.statusCode == 200) {
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
      List<dynamic> Order = response.data['orders'];
      if (response.statusCode == 200) {
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
}