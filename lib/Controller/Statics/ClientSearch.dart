class ClientSearch{
  static String category = '';
  static String city = '';

  static void setCategory(String categories){
    category = categories;
  }

  static void setCity(String cities){
    city = cities;
  }

  static String get getCategory => category;

  static String get getCity => city;
}