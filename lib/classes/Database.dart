import 'package:firebase_auth/firebase_auth.dart';

class Database {
  Future<String?> getUser() async {
    String? retVal;

    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      retVal = currentUser?.email;
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
