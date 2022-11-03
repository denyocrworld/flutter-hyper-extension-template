import 'package:fireverse/fireglobal.dart';

void main() async {
  // Fire.initialize(
  //   apiKey: apiKey,
  //   projectId: projectId,
  //   appId: appId,
  //   messagingSenderId: messagingSenderId,
  // );

  Fire.signIn(
    email: "demo@codekaze.com",
    password: "123456",
  );

  await Fire.signOut();

  await Fire.add(
    collectionName: "product",
    value: {
      "product_name": "GTX Mouse",
      "price": 12500,
    },
  );

  await Fire.update(
    collectionName: "product/B7NUBHGZJd7xNlxoYtsa",
    value: {
      "product_name": "GTX Mouse",
      "price": 12500,
    },
  );

  await Fire.delete(
    collectionName: "product/B7NUBHGZJd7xNlxoYtsa",
  );

  await Fire.snapshot(
    collectionName: "product",
  );

  await Fire.get(
    collectionName: "product",
  );

  await Fire.get(
    collectionName: "product",
    orderBy: FireOrder(
      field: "created_at",
    ),
  );

  await Fire.get(
    collectionName: "product",
    where: [
      FireWhereField(
        field: "product_name",
        isEqualTo: "GTX Mouse",
      ),
    ],
    orderBy: FireOrder(
      field: "created_at",
    ),
  );
}
