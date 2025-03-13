import 'package:cloud_firestore/cloud_firestore.dart';

Future<FirebaseFirestore> getDatabase() async {
  return FirebaseFirestore.instance;
}
