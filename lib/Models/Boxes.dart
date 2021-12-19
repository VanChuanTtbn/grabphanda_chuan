import 'package:grabpanda/Models/Entity/user_entity.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<UserEntity> getUserEntity() => Hive.box<UserEntity>('userEntity');
}
