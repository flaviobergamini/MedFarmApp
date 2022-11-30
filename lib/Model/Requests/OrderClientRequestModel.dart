class OrderClientResquestModel{
  final String state;
  final String city;
  final String complement;
  final String district;
  final String cep;
  final String street;
  final int streetNumber;
  final int clientId;
  final int drugstoresId;
  final String dateTimeOrder;
  final String payment;


  OrderClientResquestModel(
      this.state,
      this.city,
      this.complement,
      this.district,
      this.cep,
      this.street,
      this.streetNumber,
      this.clientId,
      this.drugstoresId,
      this.dateTimeOrder,
      this.payment);

  OrderClientResquestModel.fromJson(Map<String, dynamic> json)
      : state = json['state'],
        city = json['city'],
        complement = json['complement'],
        district = json['district'],
        cep = json['cep'],
        street = json['street'],
        streetNumber = json['streetNumber'],
        clientId = json['clientId'],
        drugstoresId = json['drugstoresId'],
        dateTimeOrder = json['dateTimeOrder'],
        payment = json['payment'];

  Map<String, dynamic> toJson() => {
    'state': state,
    'city': city,
    'complement': complement,
    'district': district,
    'cep': cep,
    'street': street,
    'streetNumber': streetNumber,
    'clientId': clientId,
    'drugstoresId': drugstoresId,
    'dateTimeOrder': dateTimeOrder,
    'payment': payment
  };
}