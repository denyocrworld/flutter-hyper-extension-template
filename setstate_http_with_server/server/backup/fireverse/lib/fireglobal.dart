import 'dart:developer';
import 'package:fireverse/fireverse.dart';

class FireOrder {
  final String field;
  final bool descending;

  FireOrder({
    required this.field,
    this.descending = false,
  });
}

class FireWhereField {
  final String field;
  final String? isEqualTo;
  final String? isGreaterThan;
  final String? isGreaterThanOrEqualTo;
  final String? isLessThan;
  final String? isLessThanOrEqualTo;

  FireWhereField({
    required this.field,
    this.isEqualTo,
    this.isGreaterThan,
    this.isGreaterThanOrEqualTo,
    this.isLessThan,
    this.isLessThanOrEqualTo,
  });
}

class Fire {
  static Future initialize({
    required String apiKey,
    required String projectId,
    required String appId,
    required String messagingSenderId,
    bool useGoogleServicesJson = false,
  }) async {
    FireDartFirebaseAuth.initialize(apiKey, FireDartVolatileStore());
    FireDartFirestore.initialize(projectId);
  }

  static Future signOut() async {
    FireDartFirebaseAuth.instance.signOut();
  }

  static Future<bool> signInAnonymously() async {
    try {
      var auth = FireDartFirebaseAuth.instance;
      await auth.signInAnonymously();
      if (auth.isSignedIn) {
        var user = await auth.getUser();
        currentUser = GlobalUser(
          uid: user.id,
          displayName: user.displayName,
          email: user.email,
          phoneNumber: null,
          photoURL: user.photoUrl,
        );
        return true;
      }

      return true;
    } on Exception catch (_) {
      print("Failed to signInAnonymously!");
      return false;
    }
  }

  static Future<bool> signInByGoogle() async {
    log("Login by Google is not supported in Desktop Version");
    return false;
  }

  static Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    var auth = FireDartFirebaseAuth.instance;
    await auth.signIn(email, password);

    if (auth.isSignedIn) {
      var user = await auth.getUser();
      currentUser = GlobalUser(
        uid: user.id,
        displayName: user.displayName,
        email: user.email,
        phoneNumber: null,
        photoURL: user.photoUrl,
      );
      return true;
    }
    return false;
  }

  static Future resetPassword({
    required String email,
  }) async {
    try {
      return await FireDartFirebaseAuth.instance.resetPassword(email);
    } on Exception catch (_) {
      //
    }
  }

  static Future<bool> register({
    required String email,
    required String password,
  }) async {
    var auth = FireDartFirebaseAuth.instance;
    try {
      await auth.signUp(email, password);
      await auth.signIn(email, password);

      if (auth.isSignedIn) {
        var user = await auth.getUser();
        currentUser = GlobalUser(
          uid: user.id,
          displayName: user.displayName,
          email: user.email,
          phoneNumber: null,
          photoURL: user.photoUrl,
        );
        return true;
      }
    } on Exception catch (_) {
      return false;
    }
    return false;
  }

  static GlobalUser? currentUser;

  static getRef({
    required String collectionName,
    List<FireWhereField>? where,
    FireOrder? orderBy,
  }) {
    log("####################");
    log("PATH: $collectionName");
    log("####################");
    var refs = [];
    var ref;
    var type = FireCollectionType.collection;

    //---- Add Sub Collection Features --//
    if (collectionName.contains("/")) {
      var paths = collectionName.split("/");

      if (paths.length == 2) {
        ref = FireDartFirestore.instance.collection(paths[0]).doc(paths[1]);
        type = FireCollectionType.document;
      } else {
        ref = FireDartFirestore.instance.collection(paths[0]);
        type = FireCollectionType.collection;
      }

      //---
    } else {
      ref = FireDartFirestore.instance.collection(collectionName);
    }
    //---- End --//
    refs.add(ref);

    if (type == FireCollectionType.collection) {
      if (where != null) {
        for (var i = 0; i < where.length; i++) {
          if (where[i].isEqualTo != null) {
            var newref = ref.where(
              where[i].field,
              isEqualTo: where[i].isEqualTo,
            );
            refs.add(newref);
          } else if (where[i].isGreaterThan != null) {
            var newref = ref.where(
              where[i].field,
              isGreaterThan: where[i].isGreaterThan,
            );
            refs.add(newref);
          } else if (where[i].isGreaterThanOrEqualTo != null) {
            var newref = ref.where(
              where[i].field,
              isGreaterThanOrEqualTo: where[i].isGreaterThanOrEqualTo,
            );
            refs.add(newref);
          } else if (where[i].isLessThan != null) {
            var newref = ref.where(
              where[i].field,
              isLessThan: where[i].isLessThan,
            );
            refs.add(newref);
          } else if (where[i].isLessThanOrEqualTo != null) {
            var newref = ref.where(
              where[i].field,
              isLessThanOrEqualTo: where[i].isLessThanOrEqualTo,
            );
            refs.add(newref);
          }
        }
      }

      if (orderBy != null) {
        var newref = ref.orderBy(
          orderBy.field,
          descending: orderBy.descending,
        );
        refs.add(newref);
      }
    }

    var finalRef = refs.last;
    return finalRef;
  }

  static snapshot({
    required String collectionName,
    List<FireWhereField>? where,
    FireOrder? orderBy,
  }) {
    var ref = getRef(
      collectionName: collectionName,
      where: where,
      orderBy: orderBy,
    );

    try {
      return (ref as FireDartCollectionReference).stream;
    } on Exception catch (_) {
      print(_);
    }
  }

  static Future<List> get({
    required String collectionName,
    List<FireWhereField>? where,
    FireOrder? orderBy,
  }) async {
    var ref = getRef(
      collectionName: collectionName,
      where: where,
      orderBy: orderBy,
    );
    try {
      return await ref.get();
    } on Exception catch (_) {
      print(_);
      print("Exception?");
      return [];
    }
  }

  static Future<String?> add({
    required String collectionName,
    required Map<String, dynamic> value,
  }) async {
    var ref = getRef(
      collectionName: collectionName,
    );

    try {
      var res = await ref.add(value);
      return res.id;
    } on Exception catch (_) {
      print(_);
      return null;
    }
  }

  static update({
    required String collectionName,
    required Map<String, dynamic> value,
  }) async {
    var ref = getRef(
      collectionName: collectionName,
    );

    try {
      return await ref.update(value);
    } on Exception catch (_) {
      print(_);
    }
  }

  static set({
    required String collectionName,
    required Map<String, dynamic> value,
  }) async {
    var ref = getRef(
      collectionName: collectionName,
    );

    try {
      return await ref.set(value);
    } on Exception catch (_) {
      print(_);
    }
  }

  static delete({
    required String collectionName,
  }) async {
    var ref = getRef(
      collectionName: collectionName,
    );

    try {
      return await ref.delete();
    } on Exception catch (_) {
      print(_);
    }
  }

  static deleteAll({
    required String collectionName,
  }) async {
    var items = await Fire.get(
      collectionName: "$collectionName",
    );
    print(items.length);
    for (var item in items) {
      await Fire.delete(
        collectionName: "$collectionName/${item.id}",
      );
    }
  }

  static timestamp() {
    return DateTime.now();
  }
}

class GlobalUser {
  final String uid;
  final String? displayName;
  final String? photoURL;
  final String? phoneNumber;
  final String? email;

  GlobalUser({
    required this.uid,
    this.displayName,
    this.photoURL,
    this.phoneNumber,
    this.email,
  });
}

enum FireCollectionType {
  collection,
  document,
}
