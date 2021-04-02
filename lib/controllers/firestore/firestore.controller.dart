import 'package:careyaya/constants/firestore.dart';
import 'package:careyaya/controllers/auth.controller.dart';
import 'package:careyaya/models/firestore/advocates/advocate_profile.model.dart';
import 'package:careyaya/models/firestore/chats/chat.model.dart';
import 'package:careyaya/models/firestore/chats/chat_message.model.dart';
import 'package:careyaya/models/firestore/loved_ones/loved_one_profile.model.dart';
import 'package:careyaya/models/firestore/sessions/session.model.dart';
import 'package:careyaya/models/firestore/users/user.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flamingo/flamingo.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreController {
  static FirestoreController to = Get.find();
  // AppLocalizations_Labels labels;

  final FirebaseFirestore _db = Flamingo.instance.firestore;
  final DocumentAccessor _da = DocumentAccessor();

  Future<UserModel> getFirestoreUser(String uid) async {
    final user = await _db.collection(USERS_COLLECTION).doc(uid).get();
    return UserModel(id: uid, values: user.data());
  }

  Future<UserModel> getAdvocateProfile(String uid) async {
    final advocate = await _db.collection(ADVOCATES_COLLECTION).doc(uid).get();
    return UserModel(
      id: uid,
      values: advocate.data(),
    );
  }

  Future<void> sendChatMessage(String chatId, ChatMessageModel message) async {
    return await _db.collection(CHATS_COLLECTION).doc(chatId).update({
      'lastUpdated': FieldValue.serverTimestamp(),
      'messages': FieldValue.arrayUnion([message.toData()]),
    });
  }

  Stream<ChatModel> chatStream({@required String chatId}) {
    final chatStream = _db
        .collection(CHATS_COLLECTION)
        .doc(chatId)
        .snapshots()
        .map((snapshot) => snapshot != null
            ? ChatModel(id: snapshot.id, values: snapshot.data())
            : null);
    return chatStream;
  }

  Stream<List<ChatModel>> myChatsStream() {
    final currentUser = AuthController.to.user;
    final uid = currentUser.uid;
    final chatsStream = _db
        .collection(CHATS_COLLECTION)
        .where('participantIds', arrayContains: uid)
        .snapshots();
    return chatsStream.map((querySnapshot) {
      List<ChatModel> chatList = List();
      querySnapshot.docs.forEach((snap) {
        chatList.add(ChatModel(id: snap.id, values: snap.data()));
      });
      return chatList;
    });
  }

  Future<SessionModel> getSession({@required String sessionId}) async {
    final session = SessionModel(id: sessionId);
    final sessionData = await _da.load<SessionModel>(session);
    return sessionData;
  }

  Stream<SessionModel> sessionStream({@required String sessionId}) {
    final session = SessionModel(id: sessionId);
    final Stream<SessionModel> sessionStream = session.reference
        .snapshots()
        .map((snap) => SessionModel(id: snap.id, values: snap.data()));
    return sessionStream;
  }

  Stream<List<SessionModel>> mySessionsStream() {
    final currentUser = AuthController.to.user;
    final uid = currentUser.uid;
    final sessionsStream = _db
        .collection(SESSIONS_COLLECTION)
        .where('joygiverId', isEqualTo: uid)
        .snapshots();
    return sessionsStream.map((querySnapshot) {
      List<SessionModel> sessionList = List<SessionModel>();
      querySnapshot.docs.forEach((snap) {
        sessionList.add(SessionModel(id: snap.id, values: snap.data()));
      });
      return sessionList;
    });
  }

  Stream<AdvocateProfileModel> advocateProfileStream(
      {@required String advocateId}) {
    final advocateProfile = AdvocateProfileModel(id: advocateId);
    final Stream<AdvocateProfileModel> advocateProfileStream = advocateProfile
        .reference
        .snapshots()
        .map((snap) => AdvocateProfileModel(id: snap.id, values: snap.data()));
    return advocateProfileStream;
  }

  Stream<LovedOneProfileModel> lovedOneProfileStream(
      {@required String lovedOneId}) {
    final lovedOneProfile = LovedOneProfileModel(id: lovedOneId);
    final Stream<LovedOneProfileModel> lovedOneProfileStream = lovedOneProfile
        .reference
        .snapshots()
        .map((snap) => LovedOneProfileModel(id: snap.id, values: snap.data()));
    return lovedOneProfileStream;
  }

  Future<void> setCaregiverApplication(joygiverApplication) async {
    final updateObject = {};
    int applicationFinished = 0;
    try {
      joygiverApplication.forEach((k, v) {
        if (v != null && v != '') {
          updateObject[k] = v;
        }
      });
    } catch (error) {
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
