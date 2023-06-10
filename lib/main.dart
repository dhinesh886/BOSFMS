import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'app.dart';
import 'common/model/user_info.dart';
import 'utils/constant_values.dart';

// void main() {
//   runApp(const App());
// }
// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const App(), // Wrap your app
//       ),
//     );

late Box box;
late Box loginBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(UserInfoAdapter());
  box = await Hive.openBox(USER_INFO_BOX);
  loginBox = await Hive.openBox(LOGIN_BOX);
  runApp(const App());
}
