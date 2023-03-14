class ClientAppointmentRequestModel {
  final String dateTimeAppointment;
  final bool remote;
  final String videoCallUrl;
  final String payment;
  final int clientId;
  final int doctorId;

  ClientAppointmentRequestModel(
      this.dateTimeAppointment, this.remote, this.videoCallUrl, this.payment, this.clientId, this.doctorId);

  ClientAppointmentRequestModel.fromJson(Map<String, dynamic> json)
      : dateTimeAppointment = json['dateTimeAppointment'],
        remote = json['remote'],
        videoCallUrl = json['videoCallUrl'],
        payment = json['payment'],
        clientId = json['clientId'],
        doctorId = json['doctorId'];

  Map<String, dynamic> toJson() => {
    'dateTimeAppointment': dateTimeAppointment,
    'remote': remote,
    'videoCallUrl': videoCallUrl,
    'payment': payment,
    'clientId': clientId,
    'doctorId': doctorId,
  };
}