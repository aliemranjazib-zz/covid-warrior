import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> mydata(
  String name,
  String blood,
  String gender,
  String phoneNumber,
  String dateofBirth,
  String address,
) async {
  final db = FirebaseFirestore.instance;
  db.collection('tasks').add({
    'name': name,
    'bloodgroup': blood,
    "gender": gender,
    'phoneNumber': phoneNumber,
    'dateofBirth': dateofBirth,
    'address': address,
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
