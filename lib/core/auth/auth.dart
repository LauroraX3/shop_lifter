import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_lifter/core/auth/auth_error.dart';
import 'package:shop_lifter/models/app_error/app_error.dart';

class Auth with AuthError {
  Auth._internal();
  static final Auth _singleton = Auth._internal();
  factory Auth() => _singleton;
  Future<Either<AppError, UserCredential>> emailAndPasswordSignUp(
      String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return Right(userCredential);
    } catch (e) {
      final error = e as FirebaseAuthException;

      return Left(
        AppError(
          errorBody: error,
          message: mapErrorCodeToMessage(error.code),
        ),
      );
    }
  }

  Future<void> anonymousSignIn() async {
    await FirebaseAuth.instance.signInAnonymously();
  }

  Future<String?> emailAndPasswordSignIn(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
