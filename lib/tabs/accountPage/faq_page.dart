import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doremi/app_properties.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<Panel> panels = [
    Panel(
        'Apa itu Doremi?',
        'Doremi adalah layanan streaming konser musik dan pembelian tiket dalam satu aplikasi.',
        false),
    Panel(
        'Bagaimana cara membeli tiket?',
        'Beli tiket melalui Doremi dapat dilakukan dengan menuju halaman tiket > pilih konser yang ingin kamu tonton > pilih opsi pembayaran > selesai.',
        false),
    Panel(
        'Bagaimana cara menonton konser?',
        'Pilih konser yang ingin kamu tonton, jika kamu sudah memiliki tiket maka otomatis aplikasi akan memberikan notifikasi apabila konser akan dimulai.',
        false),
    Panel(
        'Bagaimana cara menggunakan fitur tonton ulang konser?',
        'Pilih konser yang ingin kamu tonton, pastikan kamu sudah memiliki tiket untuk konser tersebut. Jika belum, maka kamu akan dialihkan menuju halaman tiket. Setelah kamu membeli tiket konser yang diinginkan, maka fitur tonton ulang konser dapat kamu nikmati.',
        false),
    Panel(
        'Bagaimana cara membeli merchandise?',
        'Pembelian merchandise dapat kamu lakukan pada saat pembelian tiket, pada saat membeli tiket kamu akan diberikan opsi untuk ticket only atau ticket+merchandise. Pilih ticket+merchandise untuk membeli merchandise yang kamu inginkan.',
        false),
    Panel(
        'Bagaimana cara mengikuti fitur QnA dengan artis?',
        'Setiap pembeli tiket akan mendaptkan kesempatan untuk QnA dengan artis dengan cara undian yang dilakukan oleh sistem.',
        false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          'FAQ',
          style: TextStyle(color: darkGrey),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24.0, bottom: 16.0),
                child: Text(
                  'Frequently Asked Question',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              ...panels
                  .map((panel) => ExpansionTile(
                          title: Text(
                            panel.title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          ),
                          children: [
                            Container(
                                padding: EdgeInsets.all(16.0),
                                color: Color(0xffFAF1E2),
                                child: Text(panel.content,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12)))
                          ]))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class Panel {
  String title;
  String content;
  bool expanded;

  Panel(this.title, this.content, this.expanded);
}
