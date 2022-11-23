class ClientSearch{
  static String category = '';
  static String city = '';
  static String specialty = '';

  static void setCategory(String categories){
    category = categories;
  }

  static void setCity(String cities){
    city = cities;
  }

  static void setSpecialty(String specialties){
    specialty = specialties;
  }

  static String get getCategory => category;

  static String get getCity => city;

  static String get getSpecialty => specialty;
}