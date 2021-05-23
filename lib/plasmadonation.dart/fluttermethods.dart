import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

setSearchParam(String caseNumber) {
  List<String> caseSearchList = List();
  String temp = "";
  for (int i = 0; i < caseNumber.length; i++) {
    temp = temp + caseNumber[i];
    caseSearchList.add(temp);
  }
  return caseSearchList;
}

Future<bool> mydata(
  String name,
  String blood,
  String gender,
  String phoneNumber,
  String dateofBirth,
  String address,
  String city,
  String type,
) async {
  final db = FirebaseFirestore.instance;
  db.collection('tasks').add({
    'name': name,
    'bloodgroup': blood,
    'bloodgroup search': setSearchParam(blood),
    "gender": gender,
    'gender search': setSearchParam(gender),
    'phoneNumber': phoneNumber,
    'dateofBirth': dateofBirth,
    'address': address,
    'city': city,
    'city search': setSearchParam(city),
    'type': type
  });
  return true;
}

Future<bool> addData(String id, String name) async {
  try {
    String uid = FirebaseAuth.instance.currentUser.uid;
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Coins')
        .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({"username": name, 'bloodgroup': id});
        return true;
      }
      String newname = snapshot.data()['username'] + name;
      String newblood = snapshot.data()['bloodgroup'] + id;

      transaction.update(
          documentReference, {'username': newname, 'bloodgroup': newblood});
      return true;
    });
  } catch (e) {
    return false;
  }
}
