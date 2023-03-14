class ClientModel {
  final String state;
  final String city;
  final String complement;
  final String district;
  final String cep;
  final String street;
  final int streetNumber;
  final String name;
  final String email;
  final String phone;
  final String cpf;
  final String password;
  final String roles;

  ClientModel(
      this.state,
      this.city,
      this.complement,
      this.district,
      this.cep,
      this.street,
      this.streetNumber,
      this.name,
      this.email,
      this.phone,
      this.cpf,
      this.password,
      this.roles);

  ClientModel.fromJson(Map<String, dynamic> json)
      : state = json['state'],
        city = json['city'],
        complement = json['complement'],
        district = json['district'],
        cep = json['cep'],
        street = json['street'],
        streetNumber = json['streetNumber'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        cpf = json['cpf'],
        password = json['password'],
        roles = json['roles'];

  Map<String, dynamic> toJson() => {
        'state': state,
        'city': city,
        'complement': complement,
        'district': district,
        'cep': cep,
        'street': street,
        'streetNumber': streetNumber,
        'name': name,
        'email': email,
        'phone': phone,
        'cpf': cpf,
        'password': password,
        'roles': roles
      };
}
