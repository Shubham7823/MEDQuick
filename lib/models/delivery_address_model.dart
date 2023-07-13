class DeliveryAddressModel {
  String firstName;
  String lastName;
  String mobileNo;
  String alternateMobileNo;
  String landMark;

  String pinCode;
  String addressType;

  DeliveryAddressModel({
    required this.addressType,
    required this.alternateMobileNo,
    required this.firstName,
    required this.landMark,
    required this.lastName,
    required this.mobileNo,
    required this.pinCode,
  });
}
