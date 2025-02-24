import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newart/src/core/error/failures.dart';
import 'package:newart/src/features/auth/data/models/login_model.dart';
import 'package:newart/src/features/auth/data/models/user_model.dart';

class FirebseDataSource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String?> getIdToken() async {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      return await user.getIdToken();
    } else {
      return null;
    }
  }

  Future<void> login(LoginModel loginModel) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Future<void> recoverPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Future<void> register(UserModel user) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password ?? '00',
      );

      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        throw FirebaseAuthException(code: 'User creation failed');
      }

      await firebaseUser.updateDisplayName(user.firstName);

      await _saveUserDetailsToFirestore(
        userId: firebaseUser.uid,
        name: user.firstName,
        email: user.email,
        phone: user.mobile,
      );
    } catch (e) {
      throw FirebaseAuthException(code: e.toString());
    }
  }

  Future<void> _saveUserDetailsToFirestore({
    required String userId,
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      await firestore.collection('users').doc(userId).set({
        'name': name,
        'email': email,
        'phone': phone,
        'imageURL': null,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to save user details');
    }
  }

  Future<UserModel> getUserDetails(String userId) async {
    final doc = await firestore.collection('users').doc(userId).get();

    if (doc.exists) {
      final data = doc.data()!;
      return UserModel(
        firstName: data['name'] ?? 'لايوجد',
        email: data['email'] ?? 'لايوجد',
        mobile: data['phone'] ?? 'لايوجد',
        imageURL: data['imageURL'],
      );
    } else {
      throw throw FirebaseException(plugin: 'fire-store', code: 'no data');
    }
  }

  Future<bool> isEmailVerified() async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user == null) {
        throw Exception('no user');
      }
      await user.reload();
      var isVerified = user.emailVerified;
      return isVerified;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Stream<User?> get currentUser => firebaseAuth.authStateChanges();

  Future<Either<Failure, void>> sendVerificationEmail() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        await user.sendEmailVerification();
        return const Right(null);
      } else {
        throw FirebaseAuthException(code: "No user found.");
      }
    } catch (e) {
      throw FirebaseAuthException(
          code: "Failed to send verification email: $e");
    }
  }

  Future<void> reloadUser() async {
    try {
      await firebaseAuth.currentUser?.reload();
    } catch (e) {
      throw Exception([e.toString()]);
    }
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception([e.toString()]);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) {
        throw Exception('Google sign-in canceled or failed');
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCredential.user;

      if (user == null) {
        throw Exception('Google sign-in canceled or failed');
      }

      await firestore.collection('users').doc(user.uid).set({
        'name': user.displayName,
        'email': user.email,
        'phone': user.phoneNumber,
        'createdAt': FieldValue.serverTimestamp(),
        'imageURL': user.photoURL
      });
    } catch (e) {
      throw Exception('Google sign-in canceled or failed');
    }
  }

  // Example of calling a Firebase Function
}
