import 'package:careyaya/constants/firestore.dart';
import 'package:careyaya/controllers/auth.controller.dart';
import 'package:careyaya/models/chats/chat.model.dart';
import 'package:careyaya/models/chats/chat_message.model.dart';
import 'package:careyaya/models/user.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreController {
  static FirestoreController to = Get.find();
  // AppLocalizations_Labels labels;

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // FirestoreController({@required this.uid})
  //     : assert(uid != null, 'Cannot create FirestoreDatabase with null uid');
  // final String uid;

  Future<UserModel> getFirestoreUser(String uid) async {
    final user = await _db.collection(USERS_COLLECTION).doc(uid).get();
    return UserModel.fromMap(user.data(), uid);
  }

  Future<void> sendChatMessage(String chatId, ChatMessageModel message) async {
    return await _db.collection(CHATS_COLLECTION).doc(chatId).update({
      'lastUpdated': FieldValue.serverTimestamp(),
      'messages': FieldValue.arrayUnion([message.toMap()]),
    });
  }

  Stream<ChatModel> chatStream({@required String chatId}) {
    final chatStream = _db
        .collection(CHATS_COLLECTION)
        .doc(chatId)
        .snapshots()
        .map((snapshot) => snapshot != null
            ? ChatModel.fromMap(snapshot.data(), snapshot.reference)
            : null);
    return chatStream;
  }

  Future<Stream<List<ChatModel>>> myChatsStream() async {
    final currentUser = AuthController.to.user;
    final uid = currentUser.uid;
    final chatsStream = _db
        .collection(CHATS_COLLECTION)
        .where('participantIds', arrayContains: uid)
        .snapshots();
    return chatsStream.map((querySnapshot) {
      List<ChatModel> chatList = List();
      querySnapshot.docs.forEach((docSnapshot) {
        chatList
            .add(ChatModel.fromMap(docSnapshot.data(), docSnapshot.reference));
      });
      return chatList;
    });


  }

  //
  Future<void> setCaregiverApplication(value) async{
    print(value);
    int applicationFinished = 0;
    try{
      value.forEach((k,v) {
        print(k + ' ' + v.toString());
        if (v == null) {
          applicationFinished = 1;
        }
      });


        if(applicationFinished==0){
          return await _db.collection(CAREGIVER_APPLICATIONS_COLLECTION).doc('pricelev@gmail.com').set(value, SetOptions(merge: true));
        }
        else{
          print('application is not filled');
        }



    }
    catch(error){
      print(error);
    }
    return null;
  }

  // static Future<void> updateLocation(BackgroundLocation locationDto) async {
  //   try {
  //     final millisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
  //     final timestampString = millisecondsSinceEpoch.toString();
  //     final timestamp =
  //         Timestamp.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  //     await Firebase.initializeApp();
  //     final String uid = FirebaseAuth?.instance?.currentUser?.uid;
  //     if (uid != null) {
  //       final dbObject = {
  //         ...locationDto.toJson(),
  //         'createdAt': timestamp,
  //       };
  //       await FirebaseFirestore.instance
  //           .collection(CAREGIVER_LOCATIONS_COLLECTION)
  //           .doc(uid)
  //           .collection(CAREGIVER_LOCATIONS_COLLECTION)
  //           .doc(timestampString)
  //           .set(dbObject);
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }
}
