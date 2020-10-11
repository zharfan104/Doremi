import 'package:doremi/services/firestoreFunc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthFunc {
  ///[FUNGSI-FUNGSI FIREBASE AUTH]

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  FirestoreFunc _firestoreFunc = FirestoreFunc();

  ///[ROLE USER]
  //Fungsi validasi apakah sudah login atau belum
  //Input : -
  //Output : -
  void isUserSignInStream() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print("Tidak ada login");
      } else {
        print("Ada login");
      }
    });
  }

  //Fungsi mendaftarkan user
  //Input : email, password
  //Output : -
  Future<void> registrationUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final String uid = userCredential.user.uid;
      final String namaUser = userCredential.user.displayName;
      final String emailUser = userCredential.user.email;

      //Create data in firestore
      _firestoreFunc.addUser(uid, namaUser, emailUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('Email tersebut telah terdaftar');
      }
    } catch (e) {
      print("[ERROR] : $e");
    }
  }

  //Fungsi login akun user
  //Input : email, password
  //Output : -
  Future<void> loginUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Email tidak ditemukan');
      } else if (e.code == 'wrong-password') {
        print('Password salah');
      }
    }
  }

  //Fungsi log out akun user
  //Input : -
  //Output : -
  Future<void> logOutUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.disconnect();
    } else {
      print("User tidak ada user login");
    }
  }

  //Fungsi mendapatkan pengguna saat ini
  //input : -
  //Output : -
  void getCurrentUserID() {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print("ID USER : ${auth.currentUser.uid}");
    } else {
      print("User tidak ada user login");
    }
  }

  //Fungsi update password akun
  //input : -
  //Output : -
  Future<void> updatePasswordUser(String newPassword) async {
    try {
      await FirebaseAuth.instance.currentUser.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print('User harus re-autentikasi untuk mengupdate password');
      }
    }
  }

  //Fungsi menghapus akun
  //input : -
  //Output : -
  Future<void> deleteAccountUser() async {
    try {
      await FirebaseAuth.instance.currentUser.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print('User harus re-autentikasi untuk menghapus akun');
      }
    }
  }

  //Fungsi reautentikasi user
  //pastikan anda gunakan fitur ini saat ingin menghapus akun user
  //input : email, password
  //Output : -
  Future<void> reauthenticateUser(String email, String password) async {
    EmailAuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    // Reauthenticate
    await FirebaseAuth.instance.currentUser
        .reauthenticateWithCredential(credential);
  }

  //Fungsi login dengan google sign in
  //input : -
  //Output : -
  Future<void> logInWithGoogleUser() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final String uid = userCredential.user.uid;
    final String namaUser = userCredential.user.displayName;
    final String emailUser = userCredential.user.email;

    //Create data in firestore
    _firestoreFunc.addUser(uid, namaUser, emailUser);
  }

  ///[ROLE MUSISI]
  //Fungsi validasi apakah sudah login atau belum
  //Input : -
  //Output : -
  void isMusisiSignInStream() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print("Tidak ada login");
      } else {
        print("Ada login");
      }
    });
  }

  //Fungsi mendaftarkan user
  //Input : email, password
  //Output : -
  Future<void> registrationMusisi(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final String uid = userCredential.user.uid;
      final String namaMusisi = userCredential.user.displayName;
      final String emailMusisi = userCredential.user.email;

      //Create data in firestore

    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('Email tersebut telah terdaftar');
      }
    } catch (e) {
      print("[ERROR] : $e");
    }
  }

  //Fungsi login akun user
  //Input : email, password
  //Output : -
  Future<void> loginMusisi(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Email tidak ditemukan');
      } else if (e.code == 'wrong-password') {
        print('Password salah');
      }
    }
  }

  //Fungsi log out akun user
  //Input : -
  //Output : -
  Future<void> logOutMusisi() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.disconnect();
    } else {
      print("User tidak ada user login");
    }
  }

  //Fungsi mendapatkan pengguna saat ini
  //input : -
  //Output : -
  void getCurrentMusisiID() {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print("ID USER : ${auth.currentUser.uid}");
    } else {
      print("User tidak ada user login");
    }
  }

  //Fungsi update password akun
  //input : -
  //Output : -
  Future<void> updatePasswordMusisi(String newPassword) async {
    try {
      await FirebaseAuth.instance.currentUser.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print('User harus re-autentikasi untuk mengupdate password');
      }
    }
  }

  //Fungsi menghapus akun
  //input : -
  //Output : -
  Future<void> deleteAccountMusisi() async {
    try {
      await FirebaseAuth.instance.currentUser.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print('User harus re-autentikasi untuk menghapus akun');
      }
    }
  }

  //Fungsi reautentikasi user
  //pastikan anda gunakan fitur ini saat ingin menghapus akun user
  //input : email, password
  //Output : -
  Future<void> reauthenticateMusisi(String email, String password) async {
    EmailAuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    // Reauthenticate
    await FirebaseAuth.instance.currentUser
        .reauthenticateWithCredential(credential);
  }

  //Fungsi login dengan google sign in
  //input : -
  //Output : -
  Future<void> logInWithGoogleMusisi() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final String uid = userCredential.user.uid;
    final String namaUser = userCredential.user.displayName;
    final String emailUser = userCredential.user.email;

    //Create data in firestore
    _firestoreFunc.addUser(uid, namaUser, emailUser);
  }
}
