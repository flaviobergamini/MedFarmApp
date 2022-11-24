class Utils {
  static int doctorsId = 0;
  static int clientIdAppointment = 0;
  static int appointmentPending = 0;

  static void setDoctorId(int doctorId){
    doctorsId = doctorId;
  }

  static void setClientIdAppointment(int clientId){
    clientIdAppointment = clientId;
  }

  static void setAppointmentPending(int appointmentId){
    appointmentPending = appointmentId;
  }

  static int get getDoctorId => doctorsId;

  static int get getClientIdAppointment => clientIdAppointment;

  static int get getAppointmentPending => appointmentPending;
}