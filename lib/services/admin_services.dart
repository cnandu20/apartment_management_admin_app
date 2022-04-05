import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_management/modules/apartment_model.dart';
import 'package:hotel_management/modules/block_model.dart';
import 'package:hotel_management/modules/resident_model.dart';

class AdminService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Block>>? getBlocks() {
    try {
      return _firestore.collection('blocks').snapshots().map((snapshot) =>
          snapshot.docs
              .map((doc) => Block.fromJson(doc.data(), doc.id))
              .toList());
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<List<Apartment>>? apartmentStream(String blockid) {
    try {
      return _firestore
          .collection('apartments')
          .where("bid", isEqualTo: blockid)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Apartment.fromJson(doc.data(), doc.id))
              .toList());
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future createBlock(Block block) async {
    try {
      _firestore.collection("blocks").add(block.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  Future createApartment(Apartment apartment) async {
    try {
      _firestore.collection("apartments").add(apartment.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  Future createresident(Resident resident) async {
    try {
      DocumentReference docRef =
          await _firestore.collection("residents").add(resident.toJson());
      await updatevacancy(resident.bid!);
      await alocateResident(resident.aid!, docRef.id);
    } catch (e) {
      print(e.toString());
    }
  }

  Future updatevacancy(String bid) async {
    try {
      _firestore
          .collection('blocks')
          .doc(bid)
          .update({"vacancy": FieldValue.increment(-1)});
    } catch (e) {
      print(e.toString());
    }
  }

  Future alocateResident(String aid, String rid) async {
    try {
      _firestore
          .collection('apartments')
          .doc(aid)
          .update({"isvaccant": false, "rid": rid});
    } catch (e) {
      print(e.toString());
    }
  }

  // Future<Resident?> orderItems(String rid) async {
  //   try {
  //     DocumentSnapshot documentSnapshot =
  //     await _firestore.collection('register').doc(rid).get();
  //     if (documentSnapshot.exists) {
  //
  //       var data =documentSnapshot.data();
  //       Resident resident =
  //       Resident.fromJson(,documentSnapshot.id);
  //       return registerModel;
  //
  //
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
