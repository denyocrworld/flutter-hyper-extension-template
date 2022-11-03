# Fireverse

[![pub package](https://img.shields.io/pub/v/firedart.svg)](https://pub.dartlang.org/packages/fireverse)

This package is made to use firebase for all Platforms.

As we know, currently the official packages for firebase do not yet support the windows-desktop version.

That's the reason, I made this package.

Basically, this package is a combination of FireDart and the official Firebase library.

### TODO
#### Firebase Auth
- [x] Email Sign In
- [x] Anonymous Sign In
- [ ] Google Login
- [x] Register 
- [x] Reset Password

#### Firestore
- [x] .snapshot
- [x] .get
- [x] .get (where) (windows)
- [x] .get (where) (android/ios)
- [x] .get (orderBy) (windows)
- [x] .get (orderBy) (android/ios)
- [x] .add
- [x] .update 
- [x] .delete
- [x] .deleteAll

#### Utility
- [ ] Timestamp

#### Firebase Messaging
- [ ] ---


### Documentation
---

#### Initialize

```
await Fire.initialize(
  apiKey: apiKey,
  projectId: projectId,
  appId: appId,
  messagingSenderId: messagingSenderId,
);
```

#### Sign In
```
Fire.signIn(
  email: "demo@codekaze.com",
  password: "123456",
);
```

#### Sign Out
```
await Fire.signOut();
```


#### Firestore Add
```
await Fire.add(
  collectionName: "product",
  value: {
    "product_name": "GTX Mouse",
    "price": 12500,
  },
);
```

#### Firestore Update
```
await Fire.update(
  collectionName: "product",
  docId: "B7NUBHGZJd7xNlxoYtsa",
  value: {
    "product_name": "GTX Mouse",
    "price": 12500,
  },
);
```

#### Firestore Delete
```
await Fire.delete(
  collectionName: "product",
  docId: "B7NUBHGZJd7xNlxoYtsa",
);
```

#### Firestore Delete All
```
await Fire.deleteAll(
  collectionName: "product",
);
```

#### Firestore Snapshot
```
await Fire.snapshot(
  collectionName: "product",
);
```

#### Firestore Get
```
await Fire.get(
  collectionName: "product",
);
```

#### Firestore Get - Order By
```
await Fire.get(
  collectionName: "product",
  orderBy: FireOrder(
    field: "created_at",
  ),
);
```

#### Firestore Get - Where & Order By
```
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
```

#### Firestore Get Document
```
var getRes = await Fire.get(
  collectionName: "product/tD1Znfqjwvf8HwciFhY0v1NS87F3",
);
```

