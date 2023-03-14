class Utils {
  static int doctorsId = 0;
  static int clientIdAppointment = 0;
  static int appointmentPending = 0;
  static int orderPendingId = 0;
  static String imageOrder = '';
  static int drugstoresId = 0;

  static void setDoctorId(int doctorId){
    doctorsId = doctorId;
  }

  static void setClientIdAppointment(int clientId){
    clientIdAppointment = clientId;
  }

  static void setAppointmentPending(int appointmentId){
    appointmentPending = appointmentId;
  }

  static void setOrderPending(int orderId){
    orderPendingId = orderId;
  }

  static void setImageOrder(String image){
    imageOrder = image;
  }

  static void setDrugstoreId(int drugstoreId){
    drugstoresId = drugstoreId;
  }

  static int get getDoctorId => doctorsId;

  static int get getClientIdAppointment => clientIdAppointment;

  static int get getAppointmentPending => appointmentPending;

  static int get getOrderPending => orderPendingId;

  static String get getImageOrder => imageOrder;

  static int get getDrugstoreId => drugstoresId;
}