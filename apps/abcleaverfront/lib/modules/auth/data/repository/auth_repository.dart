import 'package:firebase_auth/firebase_auth.dart';

import '../providers/firebase_auth_provider.dart';

class AuthRepository {
  final FirebaseAuthProvider _firebaseAuth = FirebaseAuthProvider();


  login(String email, String password) async {
    await _firebaseAuth.signIn(email, password);
  }

  register({required String email, required String password}) async {
    await _firebaseAuth.signUp(email: email, password: password);
  }

  disconnect() async {
    await _firebaseAuth.signOut();
  }

  User? getCurrentUser() {
    return _firebaseAuth.getCurrentUser();
  }

  resetPassword({required String email}) {
    return _firebaseAuth.resetPassword(email);
  }
}
