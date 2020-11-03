import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findev/model/Dev.dart';

class DevDao {
  final databaseReference = FirebaseFirestore.instance;
  final String COLECAO = "dev";

  Future<String> insert(Dev dev) async {
    try {
      DocumentReference ref =
          await databaseReference.collection(COLECAO).add(dev.toMap());
      return ref.id;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> update(Dev dev) async {
    try {
      await databaseReference
          .collection(COLECAO)
          .doc(dev.id)
          .update(dev.toMap());
      return "Registro atualizado";
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<Dev>> findAll() async {
    QuerySnapshot devs = await databaseReference.collection(COLECAO).get();
    List<Dev> listDevs = List();

    devs.docs.forEach((element) {
      listDevs.add(Dev.fromJson(element.data(), element.id));
    });
    return listDevs;
  }
}
