import '../../domain/models/models.dart';
import '../response/respon.dart';
import 'package:future_bride/app/extensions.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(this?.id.orEmpty() ?? "", this?.name.orEmpty() ?? "",
        this?.numOfNotifications.orZero() ?? 0);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(this?.phone.orEmpty() ?? "", this?.email.orEmpty() ?? "",
        this?.link.orEmpty() ?? "");
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.customer.toDomain(), this?.contacts.toDomain());
  }
}
