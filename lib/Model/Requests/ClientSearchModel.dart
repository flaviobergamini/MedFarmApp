class ClientSearchModel{
  final String category;
  final String specialty;
  final String city;

  ClientSearchModel(this.category, this.specialty, this.city);

  ClientSearchModel.fromJson(Map<String, dynamic> json)
      : category = json['category'],
        specialty = json['specialty'],
        city = json['city'];

  Map<String, dynamic> toJson() => {
    'category': category,
    'specialty': specialty,
    'city': city
  };
}