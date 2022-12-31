import 'package:player_ns_shaft/app/app.dart';
import 'package:player_ns_shaft/bootstrap.dart';

void main() {
  print("${Uri.base.queryParameters["m"]}");
  bootstrap(() => const App());
}
