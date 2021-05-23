import 'package:covidpk/drawer/adddrawer.dart';
import 'package:covidpk/plasmadonation.dart/AllPlasma.dart';
import 'package:covidpk/plasmadonation.dart/fluttermethods.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class BloodForm extends StatefulWidget {
  @override
  _BloodFormState createState() => _BloodFormState();
}

class _BloodFormState extends State<BloodForm> {
  String name;
  String data = "save address";
  String initValue = "Select your Birth Date";
  bool isDateSelected = false;
  String birthDateInString;

  TextEditingController _dateC = TextEditingController();
  // StreamSubscription<Position> _positionStreamSubscription;
  // Position _currentposition;
  // Address _address;

  DateTime datePick = DateTime(1900);

  @override
  void initState() {
    super.initState();
    //getCoordinate();
  }

  // getCoordinate() {
  //   _positionStreamSubscription = Geolocator.getPositionStream(
  //           desiredAccuracy: LocationAccuracy.high, distanceFilter: 10)
  //       .listen((Position position) {
  //     setState(() {
  //       print(position);
  //       _currentposition = position;

  //       final co = Coordinates(position.latitude, position.longitude);
  //       toadress(co).then((value) {
  //         return _address = value;
  //       });
  //     });
  //   });
  // }

  // Future<Address> toadress(Coordinates co) async {
  //   var address = await Geocoder.local.findAddressesFromCoordinates(co);
  //   print(address.first.addressLine);
  //   print(address.first.countryName);

  //   return address.first;
  // }

  final _key = GlobalKey<FormState>();

  trySubmit() {
    final isValid = _key.currentState.validate();
    if (isValid) {
      _key.currentState.save();

      print(usernameC.text);
      print(_dateC.text);
      print(bloodGroup);
      print(phoneNumberC.text);
      mydata(usernameC.text, bloodGroup, genderC.text, phoneNumberC.text,
          _dateC.text, addressC.text, cityC.text, typeC.text);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => PlasmaUi()));
    }
  }

  String bloodGroup;
  String phoneNumber;
  DateTime birthDate;

  TextEditingController genderC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  TextEditingController phoneNumberC = TextEditingController();
  TextEditingController bloodGroupC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController typeC = TextEditingController();

  List<String> blood = ['A+', 'B+', 'A-', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  String bloodValue = 'A+';
  List<String> choices = ['donour', 'receiver'];
  String defaultValue = 'donour';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Register as a Plasma Donor',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.green),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _key,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      controller: usernameC,
                      onSaved: (value) {
                        usernameC.text = value;
                      },
                      decoration: InputDecoration(
                        labelText: "enter name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) {
                        if (v.isEmpty || v.length < 5) {
                          return "can't be empty and length should be greater than 4";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField(
                      onSaved: (value) {
                        typeC.text = value;
                      },
                      decoration: InputDecoration(
                        labelText: "Select Type",
                        border: OutlineInputBorder(),
                      ),
                      hint: Text("sasas"),
                      value: 'Donor',
                      elevation: 16,
                      icon: Icon(Icons.arrow_drop_down_circle),
                      isExpanded: true,
                      items: ['Donor', 'Receiver']
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        typeC.text = value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField(
                      onSaved: (value) {
                        genderC.text = value;
                      },
                      decoration: InputDecoration(
                        labelText: "Select Gender",
                        border: OutlineInputBorder(),
                      ),
                      hint: Text("sasas"),
                      value: 'Male',
                      elevation: 16,
                      icon: Icon(Icons.arrow_drop_down_circle),
                      isExpanded: true,
                      items: ['Male', 'Female']
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        genderC.text = value;
                      },
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField(
                      onSaved: (value) {
                        bloodGroup = value;
                      },
                      decoration: InputDecoration(
                        labelText: "Select Blood Group",
                        hintText: 'Please select expense',
                        border: OutlineInputBorder(),
                      ),
                      value: bloodValue,
                      elevation: 16,
                      icon: Icon(Icons.arrow_drop_down_circle),
                      isExpanded: true,
                      items: blood
                          .map((e) => DropdownMenuItem(
                              value: e, child: Text(e.toString())))
                          .toList(),
                      hint: Text('Rating'),
                      onChanged: (value) {
                        setState(() {
                          bloodGroupC.text = value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      autofocus: true,
                      onSaved: (value) {
                        phoneNumberC.text = value;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter your phone number",
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) {
                        if (v.isEmpty || v.length < 11) {
                          return "enter valid phone number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (v) {
                        if (v.isEmpty) {
                          return 'date of birth should not empty';
                        }
                        return null;
                      },
                      onFieldSubmitted: (v) {
                        _dateC.text = v;
                      },
                      controller: _dateC,
                      readOnly: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'enter your date of birth'),
                      onTap: () async {
                        datePick = DateTime(1900);
                        FocusScope.of(context).requestFocus(FocusNode());
                        datePick = await showDatePicker(
                            errorFormatText: 'Enter valid date',
                            errorInvalidText: 'Enter date in valid range',
                            initialEntryMode: DatePickerEntryMode.input,
                            context: context,
                            initialDate: new DateTime(2003, 1),
                            firstDate: new DateTime(1950),
                            lastDate: new DateTime(2003));
                        if (datePick != null && datePick != birthDate) {
                          setState(() {
                            birthDate = datePick;
                            isDateSelected = true;
                            birthDateInString =
                                "${birthDate.month}/${birthDate.day}/${birthDate.year}";
                            _dateC.text = DateFormat.yMMMd().format(birthDate);
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLines: 2,
                      autofocus: true,
                      onSaved: (value) {
                        addressC.text = value;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter your Address",
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) {
                        if (v.isEmpty) {
                          return "not be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      autofocus: true,
                      onSaved: (value) {
                        cityC.text = value;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter your City",
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) {
                        if (v.isEmpty) {
                          return "not be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        color: Colors.green,
                        onPressed: () {
                          trySubmit();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "submit form",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
