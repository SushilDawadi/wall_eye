import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future addWallPaper(
      Map<String, dynamic> wallPaperInfoMap, String id, String category) async {
    return await FirebaseFirestore.instance
        .collection(category)
        .doc(id)
        .set(wallPaperInfoMap);
  }
}
