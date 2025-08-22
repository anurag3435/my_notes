import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_notes/services/cloud/firestore_constants.dart';

class CloudNote {
  final String documentId;
  final String userID;
  final String text;

  CloudNote({
    required this.documentId,
    required this.userID,
    required this.text,
  });
  CloudNote.fromsnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
    : documentId = snapshot.id,
      userID = snapshot.data()[userIDField],
      text = snapshot.data()[textField];
}
