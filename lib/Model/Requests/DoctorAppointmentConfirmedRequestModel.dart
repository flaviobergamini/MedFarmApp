class DoctorAppointmentConfirmedRequestModel{
  final int id;
  final String date;

  DoctorAppointmentConfirmedRequestModel(this.id, this.date);

  DoctorAppointmentConfirmedRequestModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        date = json['date'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date,
  };
}