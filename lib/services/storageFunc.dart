import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreFunc {
  ///[FUNGSI-FUNGSI FIREBASE STORAGE]

  CollectionReference concertCollection =
      FirebaseFirestore.instance.collection('listConcert');

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  ///[FUNGSI-FUNGSI ROLE MUSISI]
  Future<void> addPosterConcert(File filePoster, String musisi) async {
    //implementai upload to firebase storage
    print("MULAI UPLOAD FOTO POSTER");
    final StorageReference storageReference =
        FirebaseStorage(storageBucket: 'gs://hackaton-9ce8c.appspot.com')
            .ref()
            .child(musisi)
            .child("poster");

    final StorageUploadTask uploadTaskPoster =
        storageReference.putData(filePoster.readAsBytesSync());

    final StreamSubscription<StorageTaskEvent> streamSubscriptionPoster =
        uploadTaskPoster.events.listen((event) {
      print('EVENT ${event.type}');
    });

    // Cancel your subscription when done.
    await uploadTaskPoster.onComplete;
    print("AKHIR UPLOAD POSTER");
    streamSubscriptionPoster.cancel();
  }

  Future<void> addMerchConcert(File fileMerch, String musisi) async {
    //implementai upload to firebase storage
    print("MULAI UPLOAD FOTO MERCH");
    final StorageReference storageReference =
        FirebaseStorage(storageBucket: 'gs://hackaton-9ce8c.appspot.com')
            .ref()
            .child(musisi)
            .child("merch");

    final StorageUploadTask uploadTaskPoster =
        storageReference.putData(fileMerch.readAsBytesSync());

    final StreamSubscription<StorageTaskEvent> streamSubscriptionPoster =
        uploadTaskPoster.events.listen((event) {
      print('EVENT ${event.type}');
    });

    // Cancel your subscription when done.
    await uploadTaskPoster.onComplete;
    print("AKHIR UPLOAD MERCH");
    streamSubscriptionPoster.cancel();
  }

  Future<void> addSizeMerch(File fileSizeMerch, String musisi) async {
    //implementai upload to firebase storage
    print("MULAI UPLOAD FOTO SIZE MERCH");
    final StorageReference storageReference =
        FirebaseStorage(storageBucket: 'gs://hackaton-9ce8c.appspot.com')
            .ref()
            .child(musisi)
            .child("Size Merch");

    final StorageUploadTask uploadTaskPoster =
        storageReference.putData(fileSizeMerch.readAsBytesSync());

    final StreamSubscription<StorageTaskEvent> streamSubscriptionPoster =
        uploadTaskPoster.events.listen((event) {
      print('EVENT ${event.type}');
    });

    // Cancel your subscription when done.
    await uploadTaskPoster.onComplete;
    print("AKHIR UPLOAD SZE POSTER");
    streamSubscriptionPoster.cancel();
  }

  Future<String> getURLPoster(String musisi) async {
    ///[getURL Foto Poster]
    print("=========Get URL FOTO Poster=========");
    final StorageReference storageReference =
        FirebaseStorage(storageBucket: 'gs://hackaton-9ce8c.appspot.com')
            .ref()
            .child(musisi)
            .child("poster");
    return await storageReference.getDownloadURL();
  }

  Future<String> getURLMerch(String musisi) async {
    ///[getURL Foto Poster]
    print("=========Get URL FOTO Merch=========");
    final StorageReference storageReference =
        FirebaseStorage(storageBucket: 'gs://hackaton-9ce8c.appspot.com')
            .ref()
            .child(musisi)
            .child("merch");
    return await storageReference.getDownloadURL();
  }

  Future<String> getURLSizeMerch(String musisi) async {
    ///[getURL Foto Poster]
    print("=========Get URL FOTO Size Merch=========");
    final StorageReference storageReference =
        FirebaseStorage(storageBucket: 'gs://hackaton-9ce8c.appspot.com')
            .ref()
            .child(musisi)
            .child("Size Merch");
    return await storageReference.getDownloadURL();
  }
}
