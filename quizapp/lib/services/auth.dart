import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService{
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> anonLogin() async{
    try{
      FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e){
      print(e);
    }

  }

  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }

  Future<void> googleSignIn() async{
    try{
      final googleuser = await GoogleSignIn().signIn();

      if(googleuser == null){
        return;
      }

      final googleAuth = await googleuser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(authCredential);
    }
    on FirebaseAuthException catch(e){
      print(e);
    }
  }
}