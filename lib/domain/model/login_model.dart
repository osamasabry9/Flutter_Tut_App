class CustomerModel {
  String id;
  String name;
  int numOfNotifications;

  CustomerModel(this.id, this.name, this.numOfNotifications);
}

class ContactsModel {
  String phone;
  String email;
  String link;
  ContactsModel(this.phone, this.email, this.link);
}

class AuthenticationModel {
  CustomerModel? customer;
  ContactsModel? contacts;
  AuthenticationModel(this.customer, this.contacts);
}
