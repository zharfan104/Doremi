import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreFunc {
  ///[FUNGSI-FUNGSI FIREBASE FIRESTORE]

  CollectionReference concertCollection =
      FirebaseFirestore.instance.collection('listConcert');

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  ///[ROLE USER]
  Future<void> addUser(String uid, String nama, String email) async {
    await userCollection
        .doc(uid)
        .set({
          'nama': nama,
          'email': email,
        })
        .then((value) => print("User ditambahkan"))
        .catchError((error) => print("Gagal menambahkan user : $error"));
  }

  Future<void> addTicket(
      String uid,
      String idTicket,
      String musisi,
      String genre,
      String tglTayang,
      String jamTayang,
      String linkPoster,
      int kapasitas,
      String harga) async {
    DocumentReference userDocs =
        FirebaseFirestore.instance.collection('concerts').doc(musisi);

    //proses transaction stream jml Pembelian
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot txSnapshot = await transaction.get(userDocs);

      if (!txSnapshot.exists) {
        throw Exception("Document tidak ada!");
      }

      int tambahPernjualan = (txSnapshot.data()['jmlPembeli'] ?? 0) + 1;
      transaction.update(userDocs, {'jmlPembeli': tambahPernjualan});
    });

    //get informasi ticket
    await userCollection
        .doc(uid)
        .collection("MyTickets")
        .doc(musisi)
        .set({
          'idTicket': idTicket,
          'musisi': musisi,
          'genre': genre,
          'tglTayang': tglTayang,
          'jamTayang': jamTayang,
          'linkPoster': linkPoster,
          'kapasitas': kapasitas,
          'harga': harga,
        })
        .then((value) => print("Concert ditambahkan"))
        .catchError((error) => print("Gagal menambahkan concert : $error"));
  }

  ///[ROLE MUSISI]
  Future<void> addMusisi(String uid, String nama, String email) async {
    await userCollection
        .doc(uid)
        .set({
          'nama': nama,
          'email': email,
        })
        .then((value) => print("Musisi ditambahkan"))
        .catchError((error) => print("Gagal menambahkan user : $error"));
  }

  Future<void> addConcert(
      String idTicket,
      String musisi,
      String genre,
      String tglTayang,
      String jamTayang,
      String linkPoster,
      String linkMerch,
      String linkSizeMErch,
      int kapasitas,
      String harga) async {
    await concertCollection
        .doc(musisi)
        .set({
          'idTicket': idTicket,
          'musisi': musisi,
          'genre': genre,
          'tglTayang': tglTayang,
          'jamTayang': jamTayang,
          'linkPoster': linkPoster,
          'linkMerch': linkMerch,
          'linkSizeMerch': linkSizeMErch,
          'kapasitas': kapasitas,
          'jmlPembeli': 0,
          'harga': harga,
        })
        .then((value) => print("Concert ditambahkan"))
        .catchError((error) => print("Gagal menambahkan concert : $error"));
  }
}

// nanti edit disini aja desainya fan
// image poster
class ImagePosterURl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference concerts =
        FirebaseFirestore.instance.collection('concerts');

    return StreamBuilder<QuerySnapshot>(
      stream: concerts.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                document.data()["linkPoster"],
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        value: (loadingProgress.expectedTotalBytes != null)
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

// image merch
class MerchURl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference concerts =
        FirebaseFirestore.instance.collection('concerts');

    return StreamBuilder<QuerySnapshot>(
      stream: concerts.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                document.data()["linkMerch"],
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        value: (loadingProgress.expectedTotalBytes != null)
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

// image size merch
class MerchPosterURl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference concerts =
        FirebaseFirestore.instance.collection('concerts');

    return StreamBuilder<QuerySnapshot>(
      stream: concerts.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                document.data()["linkSizeMerch"],
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        value: (loadingProgress.expectedTotalBytes != null)
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

//Output widget text stream
class TicketTerjual extends StatelessWidget {
  final String musisi;

  const TicketTerjual({Key key, this.musisi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DocumentReference concerts =
        FirebaseFirestore.instance.collection('concerts').doc(musisi);

    return StreamBuilder<DocumentSnapshot>(
      stream: concerts.snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new Text(snapshot.data.data()["jmlPembeli"]);
      },
    );
  }
}
