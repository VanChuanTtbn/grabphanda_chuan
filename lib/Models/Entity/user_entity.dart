import 'package:hive/hive.dart';

import '../_hype_type_id.dart';

part 'user_entity.g.dart';

@HiveType(typeId: HiveTypeId.user)
class UserEntity extends HiveObject {
  @HiveField(0)
  String? email;
  @HiveField(1)
  String? password;
  @HiveField(2)
  String? phoneNumber;
  @HiveField(3)
  String? location;
  @HiveField(4)
  String? name;

  UserEntity({
    this.password,
    this.email,
    this.phoneNumber,
    this.name,
    this.location,
});
}
