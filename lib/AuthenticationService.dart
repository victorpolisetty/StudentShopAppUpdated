import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:student_shopping/ProductFile/addListing.save';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges() as Stream<User>;

  //sign out
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

  //sign in
  Future<String?> signIn({String email = "", String password = ""}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";

    } on FirebaseAuthException catch (e){
      return e.message;
    }
  }

  //sign up
  Future<String?> signUp({String email = "", String password = ""}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      Map<String,dynamic> demoData = {"UserName" : email};
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
      _firestore.collection('user').doc(email).set(demoData);
      return "Signed up";
    } on FirebaseAuthException catch (e){
      return e.message;
    }
  }
}