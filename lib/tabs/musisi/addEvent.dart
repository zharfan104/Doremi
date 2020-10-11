import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'data.dart';

class AddEvent extends StatefulWidget {
  @override
  AddEventState createState() {
    return AddEventState();
  }
}

class AddEventState extends State<AddEvent> {
  var data;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool isMerch = false;
  final ValueChanged _onChanged = (val) => print(val);
  var genderOptions = ['Male', 'Female', 'Other'];
  final _hargaController = TextEditingController(text: '500000');
  final _hargaMerchController = TextEditingController(text: '500000');

  bool _ageHasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Konser'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            FormBuilder(
              // context,
              key: _fbKey,
              initialValue: {
                'movie_rating': 3,
                'date': DateTime.now(),
                'pilihanTiket': ['Ticket'],
              },
              readOnly: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FormBuilderTextField(
                        attribute: "Nama Konser",
                        decoration: InputDecoration(
                            labelText: "Nama Konser",
                            fillColor: Colors.black,
                            focusColor: Colors.black,
                            hoverColor: Colors.black),
                        validators: [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.maxLength(120),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FormBuilderTextField(
                        attribute: "Deskripsi Konser",
                        decoration: InputDecoration(
                            labelText: "Deskripsi Konser",
                            fillColor: Colors.black,
                            focusColor: Colors.black,
                            hoverColor: Colors.black),
                        maxLines: 8,
                        maxLength: 2000,
                        validators: [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.maxLength(120),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    FormBuilderFilterChip(
                      attribute: 'pilihanTiket',
                      decoration:
                          const InputDecoration(labelText: 'Pilihan Tiket'),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Ticket', child: Text('Ticket Only')),
                        FormBuilderFieldOption(
                            value: 'TicketMerch',
                            child: Text('Ticket & Merch')),
                      ],
                      onChanged: (value) {
                        if (value.contains('TicketMerch')) {
                          setState(() {
                            isMerch = true;
                          });
                        } else {
                          setState(() {
                            isMerch = false;
                          });
                        }
                      },
                      validators: [
                        FormBuilderValidators.required(),
                      ],
                    ),
                    SizedBox(height: 15),
                    FormBuilderDateTimePicker(
                      attribute: 'date',
                      onChanged: _onChanged,
                      inputType: InputType.both,
                      decoration: const InputDecoration(
                        labelText: 'Jadwal Konser',
                      ),
                      validator: (val) => null,
                      // locale: Locale('ru'),
                      initialTime: TimeOfDay(hour: 8, minute: 0),
                      // initialValue: DateTime.now(),
                      // readonly: true,
                    ),
                    SizedBox(height: 15),
                    FormBuilderTextField(
                      attribute: 'harga',
                      controller: _hargaController,
                      decoration: InputDecoration(
                        labelText: 'Harga',
                        suffixIcon: _ageHasError
                            ? Icon(Icons.error, color: Colors.red)
                            : Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        print(val);
                        setState(() {
                          _ageHasError = !_fbKey
                              .currentState.fields['harga'].currentState
                              .validate();
                        });
                      },
                      valueTransformer: (text) {
                        return text == null ? null : num.tryParse(text);
                      },
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ],
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 15),
                    isMerch
                        ? FormBuilderTextField(
                            enabled: isMerch,
                            attribute: 'hargaMerch',
                            controller: _hargaMerchController,
                            decoration: InputDecoration(
                              labelText: 'Harga Dengan Merch',
                              suffixIcon: _ageHasError
                                  ? Icon(Icons.error, color: Colors.red)
                                  : Icon(Icons.check, color: Colors.green),
                            ),
                            onChanged: (val) {
                              print(val);
                              setState(() {
                                _ageHasError = !_fbKey
                                    .currentState.fields['harga'].currentState
                                    .validate();
                              });
                            },
                            valueTransformer: (text) {
                              return text == null ? null : num.tryParse(text);
                            },
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.numeric(),
                            ],
                            keyboardType: TextInputType.number,
                          )
                        : Container(),
                    SizedBox(height: 15),
                    FormBuilderImagePicker(
                      attribute: 'Poster',
                      decoration: const InputDecoration(
                        labelText: 'Upload Poster',
                      ),
                      iconColor: Colors.red,
                      // readOnly: true,
                      validators: [
                        FormBuilderValidators.required(),
                        (images) {
                          if (images.length < 2) {
                            return 'Two or more images required.';
                          }
                          return null;
                        }
                      ],
                      onChanged: _onChanged,
                    ),
                    SizedBox(height: 15),
                    FormBuilderCheckbox(
                      attribute: 'accept_terms',
                      initialValue: false,
                      onChanged: _onChanged,
                      leadingInput: true,
                      label: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Saya sudah membaca seluruh ',
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Fluttertoast.showToast(
                                      msg: 'Terms and Conditions');
                                },
                            ),
                          ],
                        ),
                      ),
                      validators: [
                        FormBuilderValidators.requiredTrue(
                          errorText:
                              'You must accept terms and conditions to continue',
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      print(_fbKey.currentState.value['pilihanTiket']
                          .contains('TicketMerch'));
                      if (_fbKey.currentState.saveAndValidate()) {
                        print(_fbKey.currentState.value);
                      } else {
                        print(_fbKey.currentState.value);
                        print('validation failed');
                      }
                    },
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
