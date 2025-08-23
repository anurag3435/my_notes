class FirestoreCloudStorage {
  static final FirestoreCloudStorage _shared =
      FirestoreCloudStorage._sharedInstance();

  FirestoreCloudStorage._sharedInstance();
  factory FirestoreCloudStorage() => _shared;
}
