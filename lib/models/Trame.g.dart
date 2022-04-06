// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Trame.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class TrameCollectionReference
    implements TrameQuery, FirestoreCollectionReference<TrameQuerySnapshot> {
  factory TrameCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$TrameCollectionReference;

  static Trame fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Trame.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Trame value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  TrameDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TrameDocumentReference> add(Trame value);
}

class _$TrameCollectionReference extends _$TrameQuery
    implements TrameCollectionReference {
  factory _$TrameCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$TrameCollectionReference._(
      firestore.collection('/Trame/').withConverter(
            fromFirestore: TrameCollectionReference.fromFirestore,
            toFirestore: TrameCollectionReference.toFirestore,
          ),
    );
  }

  _$TrameCollectionReference._(
    CollectionReference<Trame> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Trame> get reference =>
      super.reference as CollectionReference<Trame>;

  @override
  TrameDocumentReference doc([String? id]) {
    return TrameDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<TrameDocumentReference> add(Trame value) {
    return reference.add(value).then((ref) => TrameDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$TrameCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class TrameDocumentReference
    extends FirestoreDocumentReference<TrameDocumentSnapshot> {
  factory TrameDocumentReference(DocumentReference<Trame> reference) =
      _$TrameDocumentReference;

  DocumentReference<Trame> get reference;

  /// A reference to the [TrameCollectionReference] containing this document.
  TrameCollectionReference get parent {
    return _$TrameCollectionReference(reference.firestore);
  }

  @override
  Stream<TrameDocumentSnapshot> snapshots();

  @override
  Future<TrameDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
  });

  Future<void> set(Trame value);
}

class _$TrameDocumentReference
    extends FirestoreDocumentReference<TrameDocumentSnapshot>
    implements TrameDocumentReference {
  _$TrameDocumentReference(this.reference);

  @override
  final DocumentReference<Trame> reference;

  /// A reference to the [TrameCollectionReference] containing this document.
  TrameCollectionReference get parent {
    return _$TrameCollectionReference(reference.firestore);
  }

  @override
  Stream<TrameDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return TrameDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<TrameDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return TrameDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? name = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
    };

    return reference.update(json);
  }

  Future<void> set(Trame value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is TrameDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class TrameDocumentSnapshot extends FirestoreDocumentSnapshot {
  TrameDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Trame> snapshot;

  @override
  TrameDocumentReference get reference {
    return TrameDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Trame? data;
}

abstract class TrameQuery implements QueryReference<TrameQuerySnapshot> {
  @override
  TrameQuery limit(int limit);

  @override
  TrameQuery limitToLast(int limit);

  TrameQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  TrameQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TrameDocumentSnapshot? startAtDocument,
    TrameDocumentSnapshot? endAtDocument,
    TrameDocumentSnapshot? endBeforeDocument,
    TrameDocumentSnapshot? startAfterDocument,
  });
}

class _$TrameQuery extends QueryReference<TrameQuerySnapshot>
    implements TrameQuery {
  _$TrameQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Trame> reference;

  TrameQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Trame> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return TrameQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<TrameDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: TrameDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return TrameQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<TrameQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<TrameQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  TrameQuery limit(int limit) {
    return _$TrameQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  TrameQuery limitToLast(int limit) {
    return _$TrameQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  TrameQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$TrameQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  TrameQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrameDocumentSnapshot? startAtDocument,
    TrameDocumentSnapshot? endAtDocument,
    TrameDocumentSnapshot? endBeforeDocument,
    TrameDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$TrameQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$TrameQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class TrameQuerySnapshot
    extends FirestoreQuerySnapshot<TrameQueryDocumentSnapshot> {
  TrameQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Trame> snapshot;

  @override
  final List<TrameQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<TrameDocumentSnapshot>> docChanges;
}

class TrameQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements TrameDocumentSnapshot {
  TrameQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Trame> snapshot;

  @override
  TrameDocumentReference get reference {
    return TrameDocumentReference(snapshot.reference);
  }

  @override
  final Trame data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trame _$TrameFromJson(Map<String, dynamic> json) => Trame(
      name: json['name'] as String,
    );

Map<String, dynamic> _$TrameToJson(Trame instance) => <String, dynamic>{
      'name': instance.name,
    };
