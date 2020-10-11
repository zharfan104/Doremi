import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:doremi/router.gr.dart';
import 'package:doremi/tabs/accountPage/payment/unpaid_page.dart';
import 'package:doremi/tabs/address/add_address_page.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/tabs/category/models/product.dart';
import 'package:doremi/view/transaction_user_input.dart';

import 'components/credit_card.dart';
import 'components/shop_item_list.dart';

//TODO: NOT DONE. WHEEL SCROLL QUANTITY
class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final List<Map> listMediaPembayaran = [
    {
      "id": "ee2debbdb34411e7975628c2dd4c1f47",
      "created_at": "2017-10-17 21:10:29",
      "created_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "updated_at": "2017-12-04 12:20:13",
      "updated_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "title": "ATM Mandiri",
      "description":
          "<p><strong>CARA BAYAR ANGSURAN MELALUI ATM MANDIRI (Admin Rp 5.000)</strong></p>\r\n<ul>\r\n<li>Masukkan kartu ATM, kemudian masukkan PIN</li>\r\n<li>Masuk ke menu \"Bayar / Beli\"</li>\r\n<li>Pilih \"Transaksi Lainnya / Lainnya\"</li>\r\n<li>Pilih \"Angsuran\"</li>\r\n<li>Masukkan kode Mandiri Tunas Finance (21002)</li>\r\n<li>Masukkan nomor kontrak</li>\r\n<li>Pilih item pembayaran nomor \"1\", kemudian pilih \"Ya\"</li>\r\n</ul>",
      "share_text": "",
      "file_name": "mandiri_atm.png",
      "location_file":
          "http://mcalc.mtf.co.id:8988/mtf-go/web/uploads/pembayaran/f703512b75255313676f8d7b404faf1c.png"
    },
    {
      "id": "fa051304d8a811e787e4005056bf4694",
      "created_at": "2017-12-04 11:11:40",
      "created_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "updated_at": "2017-12-06 12:26:54",
      "updated_by": "6e3bcd737c0611e78d9028c2dd4c1f47",
      "title": "GoPay",
      "description":
          "<p><strong>CARA BAYAR ANGSURAN MELALUI SMS BANKING MANDIRI (Admin Rp 5.000)</strong></p>\r\n<ul>\r\n<li>Hubungi Mandiri Call (14000 atau 021 - 52997777)</li>\r\n<li>Ketik SMS dengan format: BYR&nbsp;&lt;spasi&gt;21002&lt;spasi&gt;nomor index rekening Mandiri&lt;spasi&gt;nomor kontrak&lt;spasi&gt;jumlah angsuran</li>\r\n<li>Kirim ke 3355</li>\r\n</ul>",
      "share_text":
          "CARA BAYAR ANGSURAN MELALUI SMS BANKING MANDIRI\r\n- Hubungi Mandiri Call (14000 atau 021 - 52997777)\r\n- Ketik SMS dengan format: BYR <spasi>21002<spasi>nomor index rekening Mandiri<spasi>nomor kontrak<spasi>jumlah angsuran\r\n- Kirim ke 3355",
      "file_name": "mandiri_sms.png",
      "location_file":
          "https://asset.kompas.com/crops/DAPlq4jQK0wFUY84bwiwcnX27kU=/0x0:780x390/780x390/data/photo/2017/01/11/1631493logo-black780x390.jpg"
    },
    {
      "id": "3fb6411fd8b411e787e4005056bf4694",
      "created_at": "2017-12-04 12:32:21",
      "created_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "updated_at": "2017-12-06 12:17:42",
      "updated_by": "6e3bcd737c0611e78d9028c2dd4c1f47",
      "title": "PDC (Giro dan Cek)",
      "description":
          "<p><strong>CARA BAYAR ANGSURAN MELALUI PDC (GIRO DAN CEK)</strong></p>\r\n<ul>\r\n<li>Pastikan rekening Anda tersedia saldo sesuai angsuran (tidak dormant)</li>\r\n<li>Siapkan giro/cek yang akan diserahkan</li>\r\n<li>Tulislah tanggal, bulan, dan tahun, jumlah nominal yang akan dibayarkan dan terbilang dengan benar dan jelas sesuai angsuran. Jika terdapat coretan, pastikan Anda memberikan tanda tangan sesuai KTP</li>\r\n<li>Pada tanggal diisi dengan tanggal H+3 dari tanggal angsuran. Tanda tangani giro yang diserahkan sesuai dengan KTP dan spesimen TTD yang terdafar di Bank</li>\r\n</ul>",
      "share_text":
          "CARA BAYAR ANGSURAN MELALUI GIRO DAN CEK\r\n- Pastikan rekening Anda tersedia saldo sesuai angsuran (tidak dormant)\r\n- Siapkan giro/cek yang akan diserahkan\r\n- Tulislah tanggal, bulan, dan tahun, jumlah nominal yang akan dibayarkan dan terbilang dengan benar dan jelas sesuai angsuran. Jika terdapat coretan, pastikan Anda memberikan tanda tangan sesuai KTP\r\n- Pada tanggal diisi dengan tanggal H+3 dari tanggal angsuran. Tanda tangani giro yang diserahkan sesuai dengan KTP",
      "file_name": "giro_cek.png",
      "location_file":
          "http://mcalc.mtf.co.id:8988/mtf-go/web/uploads/pembayaran/67554f8273731edef9845109096fe4ad.png"
    },
    {
      "id": "cdd0940dd8b011e787e4005056bf4694",
      "created_at": "2017-12-04 12:07:42",
      "created_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "updated_at": "2017-12-06 12:24:52",
      "updated_by": "6e3bcd737c0611e78d9028c2dd4c1f47",
      "title": "Mandiri Online",
      "description":
          "<p><strong>CARA BAYAR ANGSURAN MELALUI MANDIRI ONLINE (Admin Rp 5.000)</strong></p>\r\n<ul>\r\n<li>Masuk ke aplikasi Mandiri Mobile (Android, Ios, BlackberryOS)</li>\r\n<li>Pilih \"Bayar\"</li>\r\n<li>Pilih \"Angsuran\"</li>\r\n<li>Pada \"Penyedia Jasa\", pilih \"Mandiri Tunas Finance\", kemudian masukkan nomor kontrak</li>\r\n<li>Masukkan PIN, lalu \"OK\"</li>\r\n</ul>",
      "share_text":
          "CARA BAYAR ANGSURAN MELALUI MANDIRI MOBILE\r\n- Masuk ke aplikasi Mandiri Mobile (Android, Ios, BlackberryOS)\r\n- Pilih \"Bayar\"\r\n- Pilih \"Angsuran\"\r\n- Pada \"Penyedia Jasa\", pilih \"Mandiri Tunas Finance\", kemudian masukkan nomor kontrak\r\n- Masukkan PIN, lalu \"OK\"",
      "file_name": "mandiri_mobile.png",
      "location_file":
          "http://kompaskerja.com/wp-content/uploads/2018/07/logo-bank-mandiri.png"
    },
    {
      "id": "dd243e5fd8b411e787e4005056bf4694",
      "created_at": "2017-12-04 12:36:45",
      "created_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "updated_at": "2017-12-06 12:25:30",
      "updated_by": "6e3bcd737c0611e78d9028c2dd4c1f47",
      "title": "Indomaret",
      "description":
          "<p><strong>CARA BAYAR ANGSURAN MELALUI INDOMARET (Admin Rp 10.000)</strong></p>\r\n<ul>\r\n<li>Datang ke loket Indomaret terdekat</li>\r\n<li>Sampaikan ke petugas loket untuk melakukan pembayaran angsuran Mandiri Tunas Finance</li>\r\n<li>Sebutkan nomor kontrak</li>\r\n<li>Bayar sejumlah tagihan, selesai</li>\r\n</ul>",
      "share_text":
          "CARA BAYAR ANGSURAN MELALUI INDOMARET\r\n- Datang ke loket Indomaret terdekat\r\n- Sampaikan ke petugas loket untuk melakukan pembayaran angsuran Mandiri Tunas Finance\r\n- Sebutkan nomor kontrak\r\n- Bayar sejumlah tagihan, selesai",
      "file_name": "indomaret.png",
      "location_file":
          "http://mcalc.mtf.co.id:8988/mtf-go/web/uploads/pembayaran/d01cee6f10711646faf450ed674f70f4.png"
    },
    {
      "id": "78e09c29d8b411e787e4005056bf4694",
      "created_at": "2017-12-04 12:33:57",
      "created_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "updated_at": "2017-12-06 12:19:00",
      "updated_by": "6e3bcd737c0611e78d9028c2dd4c1f47",
      "title": "Alfamart/Alfamidi/Lawson/\nDanDan",
      "description":
          "<p><strong>CARA BAYAR ANGSURAN MELALUI ALFAMART / ALFAMIDI / LAWSON / DANDAN (Admin Rp 10.000)</strong></p>\r\n<ul>\r\n<li>Datang ke loket terdekat</li>\r\n<li>Sampaikan ke petugas loket untuk melakukan pembayaran angsuran Mandiri Tunas Finance</li>\r\n<li>Sebutkan nomor kontrak</li>\r\n<li>Bayar sejumlah tagihan, selesai</li>\r\n</ul>",
      "share_text":
          "<p><strong>CARA BAYAR ANGSURAN MELALUI ALFAMART / ALFAMIDI / LAWSON / DANDAN (Admin Rp 10.000)</strong></p>\r\n<ul>\r\n<li>Datang ke loket terdekat</li>\r\n<li>Sampaikan ke petugas loket untuk melakukan pembayaran angsuran Mandiri Tunas Finance</li>\r\n<li>Sebutkan nomor kontrak</li>\r\n<li>Bayar sejumlah tagihan, selesai</li>\r\n</ul>",
      "file_name": "alfa_mart.png",
      "location_file":
          "http://mcalc.mtf.co.id:8988/mtf-go/web/uploads/pembayaran/3e82a22cad2c0c276b726a55f92daf7d.png"
    },
    {
      "id": "a0ac7693d8b511e787e4005056bf4694",
      "created_at": "2017-12-04 12:42:13",
      "created_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "updated_at": "2017-12-06 12:20:28",
      "updated_by": "6e3bcd737c0611e78d9028c2dd4c1f47",
      "title": "KANTOR POS",
      "description":
          "<p><strong>CARA BAYAR ANGSURAN MELALUI KANTOR POS (Admin Rp 10.000)<br /></strong></p>\r\n<ul>\r\n<li>Datang ke loket Kantor Pos terdekat</li>\r\n<li>Sampaikan ke petugas loket untuk melakukan pembayaran angsuran Mandiri Tunas Finance</li>\r\n<li>Sebutkan nomor kontrak</li>\r\n<li>Bayar sejumlah tagihan, selesai</li>\r\n</ul>",
      "share_text":
          "CARA BAYAR ANGSURAN MELALUI PT POS\r\n- Datang ke loket Kantor Pos terdekat\r\n- Sampaikan ke petugas loket untuk melakukan pembayaran angsuran Mandiri Tunas Finance\r\n- Sebutkan nomor kontrak\r\n- Bayar sejumlah tagihan, selesai",
      "file_name": "pos.png",
      "location_file":
          "http://mcalc.mtf.co.id:8988/mtf-go/web/uploads/pembayaran/7bb54f466a1c2a02cf53452957c70cc4.png"
    },
    {
      "id": "3e260432d8b511e787e4005056bf4694",
      "created_at": "2017-12-04 12:39:28",
      "created_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "updated_at": "2017-12-19 17:10:05",
      "updated_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "title": "Tokopedia",
      "description":
          "<p><strong>CARA BAYAR ANGSURAN MELALUI TOKOPEDIA (Admin Rp 10.000)</strong></p>\r\n<ul>\r\n<li>Masuk ke halaman <a href=\"www.tokopedia.com\">www.tokopedia.com</a> atau Aplikasi Tokopedia</li>\r\n<li>Masuk / daftar akun Tokopedia Anda</li>\r\n<li>Pilih \"Top-Up & Tagihan\", klik \"Angsuran Kredit\"</li>\r\n<li>Pilih \"Mandiri Tunas Finance\" masukkan Nomor Kontrak, klik \"Pilih Produk\" yang akan dibayar</li>\r\n<li>Jika data sesuai klik \"Cek Tagihan\”, jika sudah sesuai klik \“Bayar\”</li>\r\n<li>Pilih metode pembayaran yang diinginkan</li>\r\n<li>Klik \"Bayar\" dan Anda akan mendapatkan kode pembayaran</li>\r\n<li>Lakukan pembayaran sesuai dengan metode pembayaran yang dipilih dengan menggunakan kode pembayaran yang diperoleh</li>\r\n</ul>",
      "share_text":
          "CARA BAYAR ANGSURAN MELALUI TOKOPEDIA\r\n- Masuk ke halaman www.tkp.me/0OHl\r\n- Masuk / daftar akun Tokopedia Anda\r\n- Pilih \"Kategori\", klik \"Angsuran Kredit\"\r\n- Pilih \"Mandiri Tunas Finance\" masukkan Nomor Kontrak, klik \"Beli\"\r\n- Jika data sesuai klik \"Lanjut\"\r\n- Pilih metode pembayaran yang diinginkan\r\n- Klik \"Bayar Sekarang\" dan Anda akan mendapatkan kode pembayaran\r\n- Lakukan pembayaran sesuai dengan metode pembayaran yang dipilih dengan menggunakan kode pembayaran yang diperoleh",
      "file_name": "tokopedia.png",
      "location_file":
          "http://mcalc.mtf.co.id:8988/mtf-go/web/uploads/pembayaran/aeffc49c84d9ab42179a8b92033ec0fc.png"
    },
    {
      "id": "fb64a511d8b511e787e4005056bf4694",
      "created_at": "2017-12-04 12:44:46",
      "created_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "updated_at": "2017-12-06 12:28:06",
      "updated_by": "6e3bcd737c0611e78d9028c2dd4c1f47",
      "title": "ATM Bersama",
      "description":
          "<p><strong>CARA BAYAR ANGSURAN MELALUI ATM BERSAMA (Admin *Biaya Transfer Rp 5.000)</strong></p>\r\n<ul>\r\n<li>Masuk ke menu \"Transfer\"</li>\r\n<li>Pilih menu \"Transfer ke Bank Lain\"</li>\r\n<li>Pilih \"Rekening Tabungan\"</li>\r\n<li>Masukkan nomor rekening tujuan transfer dengan kombinasi sebagai berikut: \"688 + 1001 + 10 digit nomor kontrak\"</li>\r\n<li>Masukkan nilai nominal Angsuran Customer</li>\r\n<li>Pastikan Bank Penerima adalah BPR-KS, nama dan nominal transfer sesuai dengan nama customer dan jumlah tagihannya</li>\r\n<li>Bila data sudah benar, pilih \"Ya\"</li>\r\n</ul>",
      "share_text":
          "CARA BAYAR ANGSURAN MELALUI ATM BERSAMA\r\n- Masuk ke menu \"Transfer\"\r\n- Pilih menu \"Transfer ke Bank Lain\"\r\n- Pilih \"Rekening Tabungan\"\r\n- Masukkan nomor rekening tujuan transfer dengan kombinasi sebagai berikut: \"688 + 1001 + 10 digit nomor kontrak\"\r\n- Masukkan nilai nominal Angsuran Customer\r\n- Nominal transfer sesuai asi akhir, pastikan Bank Penerima adalah BPR-KS, nama dan nominal transfer sesuai dengan nama customer dan jumlah tagihannya.\r\n- Bila data sudah benar, pilih \"Ya\"",
      "file_name": "atm_bersama.png",
      "location_file":
          "http://mcalc.mtf.co.id:8988/mtf-go/web/uploads/pembayaran/f1f4b3a25e4a9b94d1f69fcc951ed3db.png"
    },
    {
      "id": "3773ded5d8b811e787e4005056bf4694",
      "created_at": "2017-12-04 13:00:45",
      "created_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "updated_at": "2017-12-06 12:15:51",
      "updated_by": "6e3bcd737c0611e78d9028c2dd4c1f47",
      "title": "Pegadaian",
      "description":
          "<p><strong>CARA BAYAR ANGSURAN MELALUI PEGADAIAN<br /></strong></p>\r\n<ul>\r\n<li>Datang ke outlet Pegadaian terdekat</li>\r\n<li>Sampaikan ke petugas outlet untuk melakukan pembayaran angsuran Mandiri Tunas Finance</li>\r\n<li>Sebutkan nomor kontrak</li>\r\n<li>Bayar sejumlah tagihan, selesai</li>\r\n</ul>",
      "share_text":
          "CARA BAYAR ANGSURAN MELALUI PEGADAIAN\r\n- Datang ke loket Pegadaian terdekat\r\n- Sampaikan ke petugas loket untuk melakukan pembayaran angsuran Mandiri Tunas Finance\r\n- Sebutkan nomor kontrak\r\n- Bayar sejumlah tagihan, selesai",
      "file_name": "pegadaian.png",
      "location_file":
          "http://mcalc.mtf.co.id:8988/mtf-go/web/uploads/pembayaran/d6b11c8521b5711943d87b539989bb5e.png"
    },
    {
      "id": "3e260432d8b511e787e4005056bf4694",
      "created_at": "2017-12-04 12:39:28",
      "created_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "updated_at": "2017-12-19 17:10:05",
      "updated_by": "ff55636e4ff211e7813d28c2dd4c1f47",
      "title": "LinkAja",
      "description":
          "<p><strong>CARA BAYAR ANGSURAN MELALUI LINKAJA</strong></p>\r\n<ul>\r\n<li>Masuk ke Aplikasi LinkAja</li>\r\n<li>Masuk / daftar akun LinkAja Anda</li>\r\n<li>Klik “Lainnya”</li>\r\n<li>Scroll dan pilih \"Keuangan\", klik \“Multi Finance\”</li>\r\n<li>Klik \“Bayar Tagihan\”</li>\r\n<li>Pilih “Mandiri Tunas Finance” masukkan ID Pelanggan / Nomor Kontrak, klik \"Lanjutkan\"</li>\r\n<li>Pilih metode pembayaran yang diinginkan</li>\r\n<li>Jika data sesuai, klik “Konfirmasi”</li>\r\n<li>Lakukan pembayaran sesuai dengan metode pembayaran yang dipilih</li>\r\n<li>Selesai</li></ul>",
      "location_file":
          "http://vectorlogo4u.com/wp-content/uploads/2019/03/link-aja-logo-vector-720x340.png"
    }
  ];

  SwiperController swiperController = SwiperController();

  List<Product> products = [
    Product('assets/headphones.png',
        'Boat roackerz 400 On-Ear Bluetooth Headphones', 'description', 45.3),
    Product('assets/headphones_2.png',
        'Boat roackerz 100 On-Ear Bluetooth Headphones', 'description', 22.3),
    Product('assets/headphones_3.png',
        'Boat roackerz 300 On-Ear Bluetooth Headphones', 'description', 58.3)
  ];

  @override
  Widget build(BuildContext context) {
    Widget checkOutButton = InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => AddAddressPage())),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Check Out",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: darkGrey),
        title: Text(
          'Checkout',
          style: TextStyle(
              color: darkGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) => SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                getTicketInfoView(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Pilih Pembayaran',
                    style: TextStyle(
                        fontSize: 20,
                        color: darkGrey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 600.0,
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: listMediaPembayaran.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        elevation: 3,
                        child: InkWell(
                          child: Row(
                            children: <Widget>[
                              Container(
                                // width: 100,
                                height: 80,
                                child: Center(
                                  child: Image.network(
                                    listMediaPembayaran[index]['location_file'],
                                    width: 100.0,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: Container(
                                          height: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    new AlwaysStoppedAnimation<
                                                        Color>(Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                listMediaPembayaran[index]['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                          focusColor: Colors.grey.shade100,
                          onTap: () {
                            ExtendedNavigator.of(context)
                                .push(Routes.orderBerhasil);
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Scroll extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    LinearGradient grT = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    LinearGradient grB = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter);

    canvas.drawRect(
        Rect.fromLTRB(0, 0, size.width, 30),
        Paint()
          ..shader = grT.createShader(Rect.fromLTRB(0, 0, size.width, 30)));

    canvas.drawRect(Rect.fromLTRB(0, 30, size.width, size.height - 40),
        Paint()..color = Color.fromRGBO(50, 50, 50, 0.4));

    canvas.drawRect(
        Rect.fromLTRB(0, size.height - 40, size.width, size.height),
        Paint()
          ..shader = grB.createShader(
              Rect.fromLTRB(0, size.height - 40, size.width, size.height)));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
