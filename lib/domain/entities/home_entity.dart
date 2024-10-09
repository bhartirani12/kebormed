import 'package:equatable/equatable.dart';

class UserDataEntity extends Equatable {
  final String name;
  final String email;
  final String phone;
  final AddressEntity address;
  final String website;
  final CompanyEntity company;

  const UserDataEntity(
      {required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.website,
      required this.company});

  @override
  List<Object> get props => [name, email, phone, address, website, company];
}

class AddressEntity extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity geo;

  const AddressEntity(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  @override
  List<Object> get props => [street, suite, city, zipcode, geo];
}

class GeoEntity extends Equatable {
  final String lat;
  final String lng;

  const GeoEntity({
    required this.lat,
    required this.lng,
  });

  @override
  List<Object> get props => [lat, lng];
}

class CompanyEntity extends Equatable {
  final String name;
  final String catchPhrase;
  final String bs;

  const CompanyEntity(
      {required this.name, required this.catchPhrase, required this.bs});

  @override
  List<Object> get props => [name, catchPhrase, bs];
}
