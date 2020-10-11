import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/router.gr.dart';
import 'package:doremi/view/transaction.dart';
import 'package:ticket_pass_package/ticket_pass.dart';

class TransactionUserInput extends StatefulWidget {
  final Function addTransaction;

  TransactionUserInput(this.addTransaction);

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

  DateTime selectedDate;
  List<String> sample = <String>[
    'Sample data 1',
    'Sample data 2',
    'Sample data 3',
    'Sample data 4',
    'Sample data 5',
    'Sample data 6',
    'Sample data 7',
    'Sample data 8'
  ];

  void submitData() {
    String inputString = titleController.text;
    double inputDouble = double.parse(amountController.text);

    if (inputString.isEmpty || inputDouble < 0 || selectedDate == null) {
      return;
    } else {
      widget.addTransaction(Transaction(
        title: inputString,
        amount: inputDouble,
        id: 1,
        date: selectedDate,
      ));
    }

    Navigator.of(context).pop(); // removes showModalBottomSheet
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
                  Container(
                      padding: const EdgeInsets.only(
                        left: 0,
                        top: 10,
                      ),
                      child: Text(
                          "Kamu memiliki satu permintaan ke musisi yang kamu mau ketika membeli tiket, dan akan dijawab ketika live concert. Pertanyaan akan dipilih secara acak.",
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
                    validators: [
                      FormBuilderValidators.required(),
                    ],
                    options: [
                      FormBuilderFieldOption(
                          child: Text("Ticket Only"), value: "ticket"),
                      FormBuilderFieldOption(
                        child: Text(
                          "Ticket & Merch",
                        ),
                        value: "ticketMerch",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(34),
                      ),
                      onPressed: () async {
                        if (_fbKey.currentState.saveAndValidate()) {
                          print(_fbKey.currentState.value);
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
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      padding: EdgeInsets.all(15),
                      color: Colors.white,
                      child:
                          Text('Kembali', style: TextStyle(color: darkBlack)),
                    ),
                  ),
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
