import 'package:hive/hive.dart';
part 'user_info.g.dart';

@HiveType(typeId: 1)
class UserInfo {
  @HiveField(0)
  String userToken;
  UserInfo({
    required this.userToken,
  });
}
