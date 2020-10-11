import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_pass_package/ticket_pass.dart';

import 'package:doremi/app_properties.dart';
import 'package:doremi/router.gr.dart';
import 'package:doremi/tabs/category/models/listKonser.dart';
import 'package:doremi/view/transaction.dart';

class TransactionUserInput extends StatefulWidget {
  final String keySudahBeli;
  TransactionUserInput({
    Key key,
    @required this.keySudahBeli,
  }) : super(key: key);

  @override
  _TransactionUserInputState createState() => _TransactionUserInputState();
}

Widget getTicketInfoView() {
  return Center(
      child: TicketPass(
          alignment: Alignment.center,
          separatorHeight: 2.0,
          color: ticketColor,
          curve: Curves.easeOut,
          titleColor: Colors.blue,
          titleHeight: 0,
          width: 350,
          height: 160,
          shadowColor: Colors.blue.withOpacity(0.5),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
            child: Container(
              height: 140,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Waktu',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                  Text(
                                    '10.00',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  Text(
                                    'Movie name',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Tanggal',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                Text(
                                  '4 November 2020',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Harga',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                Text(
                                  '\Rp. 50.000,- ',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )));
}

class _TransactionUserInputState extends State<TransactionUserInput> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool isMerch = false;
  DateTime selectedDate;

  void submitData() {
    // String inputString = titleController.text;
    // double inputDouble = double.parse(amountController.text);

    // if (inputString.isEmpty || inputDouble < 0 || selectedDate == null) {
    //   return;
    // } else {
    //   widget.addTransaction(Transaction(
    //     title: inputString,
    //     amount: inputDouble,
    //     id: 1,
    //     date: selectedDate,
    //   ));
    // }

    Navigator.of(context).pop(); // removes showModalBottomSheet
  }

  @override
  void initState() {
    super.initState();
    print(isMerch);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 0,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            // getTicketInfoView(),
            FormBuilder(
              key: _fbKey,
              initialValue: {
                'date': DateTime.now(),
                'accept_terms': false,
              },
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        padding: const EdgeInsets.only(
                          left: 0,
                          top: 10,
                        ),
                        child: Text("Harga Tiket : Rp. 50.000,-",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black))),
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                        left: 0,
                        top: 10,
                      ),
                      child: Text(
                          "Kamu memiliki satu pertanyaan ke musisi yang kamu mau ketika membeli tiket, dan akan dijawab ketika live concert. Pertanyaan akan dipilih secara acak.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0,
                              color: Colors.black))),
                  FormBuilderTextField(
                    style: TextStyle(color: Colors.black),
                    attribute: "pertanyaan",
                    maxLength: 100,
                    decoration: InputDecoration(
                        labelText: "Masukkan Pertanyaan",
                        fillColor: Colors.black,
                        focusColor: Colors.black,
                        hoverColor: Colors.black),
                    cursorColor: Colors.black,
                    validators: [
                      // FormBuilderValidators.required(),
                    ],
                  ),
                  FormBuilderChoiceChip(
                    attribute: "jenisTiket",
                    selectedColor: lightAqua,
                    selectedShadowColor: Colors.black,
                    disabledColor: Colors.black,
                    decoration: InputDecoration(
                        labelText: "Jenis Tiket",
                        fillColor: Colors.black,
                        focusColor: Colors.black,
                        hoverColor: Colors.black),
                    validators: [
                      FormBuilderValidators.required(),
                    ],
                    onChanged: (value) {
                      print(value);
                      if (value == 'TicketMerch') {
                        setState(() {
                          isMerch = true;
                        });
                      } else {
                        setState(() {
                          isMerch = false;
                        });
                      }
                    },
                    options: [
                      FormBuilderFieldOption(
                          child: Text("Ticket Only"), value: "ticket"),
                      FormBuilderFieldOption(
                        child: Text(
                          "Ticket & Merch",
                        ),
                        value: "TicketMerch",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  isMerch
                      ? FormBuilderChoiceChip(
                          decoration: InputDecoration(
                              labelText: "Ukuran T-shirt",
                              fillColor: Colors.black,
                              focusColor: Colors.black,
                              hoverColor: Colors.black),
                          attribute: "ukuranTshirt",
                          selectedColor: lightAqua,
                          selectedShadowColor: Colors.black,
                          disabledColor: Colors.black,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                          options: [
                            FormBuilderFieldOption(
                                child: Text("S"), value: "s"),
                            FormBuilderFieldOption(
                                child: Text("M"), value: "m"),
                            FormBuilderFieldOption(
                                child: Text("L"), value: "l"),
                            FormBuilderFieldOption(
                                child: Text("XL"), value: "xl"),
                          ],
                        )
                      : Container(),
                  isMerch
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FormBuilderTextField(
                            attribute: "Alamat Lengkap",
                            decoration: InputDecoration(
                                labelText: "Alamat Pengiriman Merch",
                                fillColor: Colors.black,
                                focusColor: Colors.black,
                                hoverColor: Colors.black),
                            maxLines: 4,
                            maxLength: 2000,
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.maxLength(120),
                            ],
                          ),
                        )
                      : Container(),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(34),
                      ),
                      onPressed: () async {
                        if (_fbKey.currentState.saveAndValidate()) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          int jum = prefs.getInt(Teks.jumTiket);
                          if (jum == null) {
                            await prefs.setInt(Teks.jumTiket, 1);
                          } else {
                            if (jum <= listKonser.length) {
                              await prefs.setInt(Teks.jumTiket, jum + 1);
                            } else {
                              await prefs.setInt(Teks.jumTiket, jum);
                            }
                          }
                          print(_fbKey.currentState.value);
                          await prefs.setBool(widget.keySudahBeli, true);

                          ExtendedNavigator.of(context).push(
                            Routes.checkOutPage,
                          );
                        }
                      },
                      padding: EdgeInsets.all(15),
                      color: darkGrey,
                      child: Text('Beli Tiket',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    // padding: EdgeInsets.only(top: 20, left: 50, right: 50),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(34),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      padding: EdgeInsets.only(
                          bottom: 15.0, left: 15.0, top: 15.0, right: 15.0),
                      color: Colors.white,
                      child:
                          Text('Kembali', style: TextStyle(color: darkBlack)),
                    ),
                  ),
                  SizedBox(
                    height: 130.0,
                  )
                ],
              ),
            ),
            // Container(
            //   alignment: Alignment.bottomRight,
            //   padding: EdgeInsets.symmetric(horizontal: 2),
            //   child: RaisedButton(
            //     child: Text('Submit'),
            //     elevation: 5,
            //     color: Theme.of(context).primaryColor,
            //     textColor: Theme.of(context).textTheme.button.color,
            //     onPressed: submitData,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
