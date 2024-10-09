import 'package:kebormed/domain/entities/home_entity.dart';

class UserListModel extends UserDataEntity {
  const UserListModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.address,
    required super.website,
    required super.company,
  });

  factory UserListModel.fromJson(Map<String, dynamic> json) {
    return UserListModel(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: AddressModel.fromJson(json['address']),
        website: json['website'],
        company: CompanyModel.fromJson(json['company']));
  }
}

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: GeoModel.fromJson(json['geo']),
    );
  }
}

class GeoModel extends GeoEntity {
  const GeoModel({
    required super.lat,
    required super.lng,
  });

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(lat: json['lat'], lng: json['lng']);
  }
}

class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required super.name,
    required super.catchPhrase,
    required super.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
        name: json['name'], catchPhrase: json['catchPhrase'], bs: json['bs']);
  }
}
