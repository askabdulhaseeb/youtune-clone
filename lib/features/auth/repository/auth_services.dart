import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../cores/enums/user/user_type.dart';
import '../model/user_model.dart';
import 'user_data_services.dart';

final Provider<AuthServices> authServiceProvider =
    Provider<AuthServices>((ProviderRef<Object?> ref) => AuthServices(
          auth: FirebaseAuth.instance,
          googleSignIn: GoogleSignIn(),
        ));

class AuthServices {
  const AuthServices({required this.auth, required this.googleSignIn});

  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  Future<UserCredential?> signInWithGoogle(WidgetRef ref) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount == null) return null;
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user == null) return null;
      final UserModel userModel = UserModel(
        uid: user.uid,
        username: user.email!.split('@').first,
        displayName: user.displayName ?? '',
        email: user.email!,
        photoURL: user.photoURL ?? '',
        phoneNumber: user.phoneNumber ?? '',
        description: '',
        subscriptions: <String>[],
        videos: 0,
        type: UserType.user,
      );
      await ref.read(userDataServiceProvider).createUser(userModel);
      return userCredential;
    } catch (e) {
      debugPrint('Error in signInWithGoogle: $e');
      return null;
    }
  }

  Stream<User?> authStateChanges() {
    return auth.authStateChanges();
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
