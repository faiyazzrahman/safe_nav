import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Register user with additional fields and store them in Firestore
  Future<User?> registerUser({
    required String email,
    required String password,
    required String username,
    required String firstName,
    required String lastName,
    required String nid,
  }) async {
    try {
      // Create user with email and password
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      // Store extra details in Firestore
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': email,
          'username': username,
          'firstName': firstName,
          'lastName': lastName,
          'nid': nid,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      return user;
    } catch (e) {
      rethrow;
    }
  }

  /// Check if a username is available
  Future<bool> checkUsernameAvailable(String username) async {
    final result =
        await _firestore
            .collection('users')
            .where('username', isEqualTo: username)
            .limit(1)
            .get();

    return result.docs.isEmpty;
  }

  /// Sign in with email or username and password
  Future<User?> signIn({
    required String identifier, // can be email or username
    required String password,
  }) async {
    try {
      String email = identifier;

      // If identifier is not an email, look it up by username
      if (!identifier.contains('@')) {
        final result =
            await _firestore
                .collection('users')
                .where('username', isEqualTo: identifier)
                .limit(1)
                .get();

        if (result.docs.isEmpty) {
          throw FirebaseAuthException(
            code: 'user-not-found',
            message: 'No user found for that username.',
          );
        }

        email = result.docs.first['email'];
      }

      // Sign in with resolved email
      UserCredential userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCred.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Stream<User?> get userStream => _auth.authStateChanges();
}
