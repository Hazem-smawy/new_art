// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dartz/dartz.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import 'package:newart/src/core/error/failures.dart';

// import 'package:newart/src/features/auth/data/models/login_model.dart';

// import 'package:newart/src/features/auth/data/models/user_model.dart';

// import '../sources/sources.dart';
// import '../../domain/repositories/repositories.dart';

// class AuthRepositoryImp implements AuthRepository {
//   final AuthRemoteSource remoteDataSource;
//   AuthRepositoryImp({required this.remoteDataSource});
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<String?> getIdToken() async {
//     User? user = _firebaseAuth.currentUser;
//     if (user != null) {
//       print(await user.getIdToken());
//       return await user.getIdToken();
//     } else {
//       return null;
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> login(LoginModel loginModel) async {
//     try {
//       // Attempt to sign in with Firebase
//       await _firebaseAuth.signInWithEmailAndPassword(
//         email: loginModel.email,
//         password: loginModel.password,
//       );

//       // Return success
//       return Right(true);
//     } on FirebaseAuthException catch (e) {
//       // Handle Firebase-specific errors

//       // Map Firebase errors to your custom Failure type
//       if (e.code == 'invalid-credential') {
//         return Left(FirebaseFailures(message: 'Invalid email or password.'));
//       } else if (e.code == 'user-not-found') {
//         return Left(
//             FirebaseFailures(message: 'No user found with this email.'));
//       } else if (e.code == 'wrong-password') {
//         return Left(FirebaseFailures(message: 'Incorrect password.'));
//       } else if (e.code == 'too-many-requests') {
//         return Left(FirebaseFailures(
//             message: 'Too many attempts. Please try again later.'));
//       } else {
//         // Handle other Firebase errors
//         return Left(ServerFailures(message: 'Login failed: ${e.message}'));
//       }
//     } catch (e) {
//       // Handle generic errors
//       return Left(ServerFailures(message: 'An unexpected error occurred.'));
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> recoverPassword(String email) async {
//     //firebase
//     try {
//       await _firebaseAuth.sendPasswordResetEmail(email: email);
//       return Right(true);
//     } catch (e) {
//       return Left(FirebaseFailures(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> register(UserModel user) async {
//     try {
//       // Step 1: Create User with Email and Password
//       final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: user.email,
//         password: user.password ?? '00',
//       );

//       final firebaseUser = userCredential.user;
//       if (firebaseUser == null) {
//         return Left(FirebaseFailures(message: 'User creation failed'));
//       }

//       // Step 2: Update Display Name
//       await firebaseUser.updateDisplayName(user.firstName);

//       // Step 3: Save Additional Info (Phone Number) to Firestore
//       await _saveUserDetailsToFirestore(
//         userId: firebaseUser.uid,
//         name: user.firstName,
//         email: user.email,
//         phone: user.mobile,
//       );

//       return Right(true);
//     } catch (e) {
//       return Left(FirebaseFailures(message: e.toString()));
//     }
//   }

//   Future<void> _saveUserDetailsToFirestore({
//     required String userId,
//     required String name,
//     required String email,
//     required String phone,
//   }) async {
//     try {
//       // Save user details to the 'users' collection
//       await _firestore.collection('users').doc(userId).set({
//         'name': name,
//         'email': email,
//         'phone': phone,
//         'imageURL': null,
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       print('Error saving user details to Firestore: $e');
//       throw Exception('Failed to save user details');
//     }
//   }

//   @override
//   Future<Either<Failure, UserModel>> getUserDetails(String userId) async {
//     final doc = await _firestore.collection('users').doc(userId).get();

//     if (doc.exists) {
//       final data = doc.data()!;
//       return Right(
//         UserModel(
//           firstName: data['name'] ?? 'لايوجد',
//           email: data['email'] ?? 'لايوجد',
//           mobile: data['phone'] ?? 'لايوجد',
//           imageURL: data['imageURL'],
//         ),
//       );
//     } else {
//       return Left(OfflineFailures(message: 'no user'));
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> isEmailVerified() async {
//     try {
//       User? user = _firebaseAuth.currentUser;
//       if (user == null) {
//         return Left(ServerFailures(message: "No user is currently signed in."));
//       }
//       await user.reload(); // Ensure user state is refreshed
//       var isVerified = user.emailVerified;
//       return Right(isVerified);
//     } on FirebaseAuthException catch (e) {
//       return Left(FirebaseFailures(message: "Firebase error: ${e.message}"));
//     } catch (e) {
//       return Left(ServerFailures(message: "Unexpected error: ${e.toString()}"));
//     }
//   }

//   @override
//   Stream<User?> get currentUser => _firebaseAuth.authStateChanges();

//   @override
//   Future<Either<Failure, void>> sendVerificationEmail() async {
//     try {
//       final user = _firebaseAuth.currentUser;
//       if (user != null) {
//         await user.sendEmailVerification();
//         return const Right(null);
//       } else {
//         return Left(FirebaseFailures(message: "No user found."));
//       }
//     } catch (e) {
//       return Left(
//           FirebaseFailures(message: "Failed to send verification email: $e"));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> reloadUser() async {
//     try {
//       await _firebaseAuth.currentUser?.reload();
//       return const Right(null);
//     } catch (e) {
//       return Left(FirebaseFailures(message: "Failed to reload user: $e"));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> signOut() async {
//     try {
//       await _firebaseAuth.signOut();
//       return const Right(null);
//     } catch (e) {
//       return Left(FirebaseFailures(message: "Failed to sign out: $e"));
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> signInWithGoogle() async {
//     try {
//       // Step 1: Initiate Google Sign-In
//       final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
//       if (gUser == null) {
//         return Left(
//             GoogleAuthFailures(message: 'Google sign-in canceled or failed'));
//       }

//       // Step 2: Authenticate with Google
//       final GoogleSignInAuthentication gAuth = await gUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: gAuth.accessToken,
//         idToken: gAuth.idToken,
//       );

//       // Step 3: Sign-In to Firebase
//       final userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);
//       final user = userCredential.user;

//       if (user == null) {
//         return Left(
//             GoogleAuthFailures(message: 'Google sign-in error: No user found'));
//       }

//       // Step 4: Extract User Information

//       await _firestore.collection('users').doc(user.uid).set({
//         'name': user.displayName,
//         'email': user.email,
//         'phone': user.phoneNumber,
//         'createdAt': FieldValue.serverTimestamp(),
//         'imageURL': user.photoURL
//       });
//       // Step 5: Send User Information to Your Server
//       // final serverResponse = await _sendUserInfoToServer(userInfo);
//       // if (!serverResponse) {
//       //   return Left(GoogleAuthFailures(message: 'Failed to store user info on server'));
//       // }

//       return Right(true);
//     } catch (e) {
//       return Left(
//           GoogleAuthFailures(message: 'Google sign-in error: ${e.toString()}'));
//     }
//   }
// }
