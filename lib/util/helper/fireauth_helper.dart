import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuthHelper {
  static FireAuthHelper fireAuthHelper = FireAuthHelper._();

  FireAuthHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  // SignUp
  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return "Failed";
    }
  }

  //SignIn
  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return "Failed";
    }
  }

  bool checkUser(){
    user = auth.currentUser;
    return user != null;
  }

  //SignOut
  Future<void> signOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }

  //GoogleSignIn
  Future<String> googleSignIn() async {
    GoogleSignInAccount? account = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? gAuth = await account?.authentication;

    var crd = GoogleAuthProvider.credential(accessToken: gAuth?.accessToken,idToken: gAuth?.idToken);

    try{
      await auth.signInWithCredential(crd);
      return "success";
    } catch(e){
      return e.toString();
    }
  }
  Future<void> userAccountDelete() async {
    await user?.delete();
  }

  //userLogIn
  Future<void> guestLogin() async {
    try {
      final userCredential =
      await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }
}
