// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Groupe.dart';

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
abstract class GroupeCollectionReference
    implements GroupeQuery, FirestoreCollectionReference<GroupeQuerySnapshot> {
  factory GroupeCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$GroupeCollectionReference;

  static Groupe fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Groupe.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Groupe value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  GroupeDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<GroupeDocumentReference> add(Groupe value);
}

class _$GroupeCollectionReference extends _$GroupeQuery
    implements GroupeCollectionReference {
  factory _$GroupeCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$GroupeCollectionReference._(
      firestore.collection('/Groupe/').withConverter(
            fromFirestore: GroupeCollectionReference.fromFirestore,
            toFirestore: GroupeCollectionReference.toFirestore,
          ),
    );
  }

  _$GroupeCollectionReference._(
    CollectionReference<Groupe> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Groupe> get reference =>
      super.reference as CollectionReference<Groupe>;

  @override
  GroupeDocumentReference doc([String? id]) {
    return GroupeDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<GroupeDocumentReference> add(Groupe value) {
    return reference.add(value).then((ref) => GroupeDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$GroupeCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class GroupeDocumentReference
    extends FirestoreDocumentReference<GroupeDocumentSnapshot> {
  factory GroupeDocumentReference(DocumentReference<Groupe> reference) =
      _$GroupeDocumentReference;

  DocumentReference<Groupe> get reference;

  /// A reference to the [GroupeCollectionReference] containing this document.
  GroupeCollectionReference get parent {
    return _$GroupeCollectionReference(reference.firestore);
  }

  @override
  Stream<GroupeDocumentSnapshot> snapshots();

  @override
  Future<GroupeDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String libelle,
  });

  Future<void> set(Groupe value);
}

class _$GroupeDocumentReference
    extends FirestoreDocumentReference<GroupeDocumentSnapshot>
    implements GroupeDocumentReference {
  _$GroupeDocumentReference(this.reference);

  @override
  final DocumentReference<Groupe> reference;

  /// A reference to the [GroupeCollectionReference] containing this document.
  GroupeCollectionReference get parent {
    return _$GroupeCollectionReference(reference.firestore);
  }

  @override
  Stream<GroupeDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return GroupeDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<GroupeDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return GroupeDocumentSnapshot._(
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
    Object? libelle = _sentinel,
  }) async {
    final json = {
      if (libelle != _sentinel) "libelle": libelle as String,
    };

    return reference.update(json);
  }

  Future<void> set(Groupe value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupeDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class GroupeDocumentSnapshot extends FirestoreDocumentSnapshot {
  GroupeDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Groupe> snapshot;

  @override
  GroupeDocumentReference get reference {
    return GroupeDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Groupe? data;
}

abstract class GroupeQuery implements QueryReference<GroupeQuerySnapshot> {
  @override
  GroupeQuery limit(int limit);

  @override
  GroupeQuery limitToLast(int limit);

  GroupeQuery whereLibelle({
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

  GroupeQuery orderByLibelle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GroupeDocumentSnapshot? startAtDocument,
    GroupeDocumentSnapshot? endAtDocument,
    GroupeDocumentSnapshot? endBeforeDocument,
    GroupeDocumentSnapshot? startAfterDocument,
  });
}

class _$GroupeQuery extends QueryReference<GroupeQuerySnapshot>
    implements GroupeQuery {
  _$GroupeQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Groupe> reference;

  GroupeQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Groupe> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return GroupeQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<GroupeDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: GroupeDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return GroupeQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<GroupeQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<GroupeQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  GroupeQuery limit(int limit) {
    return _$GroupeQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  GroupeQuery limitToLast(int limit) {
    return _$GroupeQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  GroupeQuery whereLibelle({
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
    return _$GroupeQuery(
      reference.where(
        'libelle',
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

  GroupeQuery orderByLibelle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GroupeDocumentSnapshot? startAtDocument,
    GroupeDocumentSnapshot? endAtDocument,
    GroupeDocumentSnapshot? endBeforeDocument,
    GroupeDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('libelle', descending: descending);

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

    return _$GroupeQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$GroupeQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class GroupeQuerySnapshot
    extends FirestoreQuerySnapshot<GroupeQueryDocumentSnapshot> {
  GroupeQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Groupe> snapshot;

  @override
  final List<GroupeQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<GroupeDocumentSnapshot>> docChanges;
}

class GroupeQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements GroupeDocumentSnapshot {
  GroupeQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Groupe> snapshot;

  @override
  GroupeDocumentReference get reference {
    return GroupeDocumentReference(snapshot.reference);
  }

  @override
  final Groupe data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Groupe _$GroupeFromJson(Map<String, dynamic> json) => Groupe(
      libelle: json['libelle'] as String,
    );

Map<String, dynamic> _$GroupeToJson(Groupe instance) => <String, dynamic>{
      'libelle': instance.libelle,
    };
