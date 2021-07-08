import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_shopping/AuthenticationService.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_shopping/LoginPage.dart';
import 'package:student_shopping/home.dart';
import 'package:student_shopping/models/recentItemModel.dart';
import 'models/favoriteModel.dart';
//import 'package:firebase_auth_ui/firebase_auth_ui.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance)
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecentItemModel(),
        ),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthenticationWrapper(),
      )
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key? key,
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<AuthenticationService>().authStateChanges;

    if(firebaseUser != null){
      return HomePage("Student Shop");
    }
    return LoginPage();
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   FirebaseUser _user;
//   String _error = '';
//
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Firebase Auth UI Demo'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               _getMessage(),
//               Container(
//                 margin: EdgeInsets.only(top: 10, bottom: 10),
//                 child: RaisedButton(
//                   child: Text(_user != null ? 'Logout' : 'Login'),
//                   onPressed: _onActionTapped,
//                 ),
//               ),
//               _getErrorText(),
//               _user != null
//                   ? FlatButton(
//                 child: Text('Delete'),
//                 textColor: Colors.red,
//                 onPressed: () => _deleteUser(),
//               )
//                   : Container()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _getMessage() {
//     if (_user != null) {
//       return Text(
//         'Logged in user is: ${_user.displayName ?? ''}',
//         style: TextStyle(
//           fontSize: 16,
//         ),
//       );
//     } else {
//       return Text(
//         'Tap the below button to Login',
//         style: TextStyle(
//           fontSize: 16,
//         ),
//       );
//     }
//   }
//
//   Widget _getErrorText() {
//     if (_error?.isNotEmpty == true) {
//       return Text(
//         _error,
//         style: TextStyle(
//           color: Colors.redAccent,
//           fontSize: 16,
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }
//
//   void _deleteUser() async {
//     final result = await FirebaseAuthUi.instance().delete();
//     if (result) {
//       setState(() {
//         _user = null;
//       });
//     }
//   }
//
//   void _onActionTapped() {
//     if (_user == null) {
//       // User is null, initiate auth
//       FirebaseAuthUi.instance().launchAuth([
//         AuthProvider.email(),
//         // Google ,facebook, twitter and phone auth providers are commented because this example
//         // isn't configured to enable them. Please follow the README and uncomment
//         // them if you want to integrate them in your project.
//
//         // AuthProvider.google(),
//         // AuthProvider.facebook(),
//         // AuthProvider.twitter(),
//         // AuthProvider.phone(),
//       ]).then((firebaseUser) {
//         setState(() {
//           _error = "";
//           _user = firebaseUser;
//         });
//       }).catchError((error) {
//         if (error is PlatformException) {
//           setState(() {
//             if (error.code == FirebaseAuthUi.kUserCancelledError) {
//               _error = "User cancelled login";
//             } else {
//               _error = error.message ?? "Unknown error!";
//             }
//           });
//         }
//       });
//     } else {
//       // User is already logged in, logout!
//       _logout();
//     }
//   }
//
//   void _logout() async {
//     await FirebaseAuthUi.instance().logout();
//     setState(() {
//       _user = null;
//     });
//   }
// }