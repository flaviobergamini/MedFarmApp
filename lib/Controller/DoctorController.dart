import 'package:dio/dio.dart';
import 'package:medfarm/Controller/AuthController.dart';
import 'package:medfarm/Model/Requests/DoctorAppointmentConfirmedRequestModel.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class DoctorController{
  var token = AuthController.tokenJWT;
  var MedFarmWidgetsAPI = new MedFarmWidgets();
  var userId = AuthController.userId;

  Future<List<dynamic>> getAppointmentPending() async {
    try{
      var url = AuthController.url + '/v1/appointment/doctor/pending/$userId';

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

  Future<List<dynamic>> getAppointmentConfirmed(DoctorAppointmentConfirmedRequestModel appointmentsConfirmed) async {
    try {
      var url = AuthController.url + '/v1/appointment/doctor/confirmed';

      var response = await Dio().post(
          url,
          data: appointmentsConfirmed.toJson(),
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
            "Bearer $token",
          })
      );

      if (response.statusCode == 200) {
        return response.data['appointments'];
      }
      else {
        List<dynamic> Error = [response.statusCode];
        return Error;
      }
    }catch(e){
      List<dynamic> Error = ["Falha no envio da solicitação"];
      return Error;
    }
  }
}