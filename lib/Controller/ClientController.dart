import 'package:dio/dio.dart';
import 'package:medfarm/Controller/AuthController.dart';
import 'package:medfarm/Model/Requests/ClientSearchModel.dart';
import 'package:medfarm/Model/Responses/MessageModel.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class ClientController {
  var token = AuthController.tokenJWT;
  var MedFarmWidgetsAPI = new MedFarmWidgets();
  var userId = AuthController.userId;

  Future<bool> postSearch(ClientSearchModel Search, String category) async {
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
      MedFarmWidgetsAPI.AlertDialogMedFarm("Falha no envio da solicitação", e.toString());
      return false;
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