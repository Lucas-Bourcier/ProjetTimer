// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Timer.dart';

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
abstract class TimerCollectionReference
    implements TimerQuery, FirestoreCollectionReference<TimerQuerySnapshot> {
  factory TimerCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$TimerCollectionReference;

  static Timer fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Timer.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Timer value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  TimerDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TimerDocumentReference> add(Timer value);
}

class _$TimerCollectionReference extends _$TimerQuery
    implements TimerCollectionReference {
  factory _$TimerCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$TimerCollectionReference._(
      firestore.collection('/Timer/').withConverter(
            fromFirestore: TimerCollectionReference.fromFirestore,
            toFirestore: TimerCollectionReference.toFirestore,
          ),
    );
  }

  _$TimerCollectionReference._(
    CollectionReference<Timer> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Timer> get reference =>
      super.reference as CollectionReference<Timer>;

  @override
  TimerDocumentReference doc([String? id]) {
    return TimerDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<TimerDocumentReference> add(Timer value) {
    return reference.add(value).then((ref) => TimerDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$TimerCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class TimerDocumentReference
    extends FirestoreDocumentReference<TimerDocumentSnapshot> {
  factory TimerDocumentReference(DocumentReference<Timer> reference) =
      _$TimerDocumentReference;

  DocumentReference<Timer> get reference;

  /// A reference to the [TimerCollectionReference] containing this document.
  TimerCollectionReference get parent {
    return _$TimerCollectionReference(reference.firestore);
  }

  @override
  Stream<TimerDocumentSnapshot> snapshots();

  @override
  Future<TimerDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    String description,
    int duree,
    bool statut,
    bool visible,
    int ordre,
  });

  Future<void> set(Timer value);
}

class _$TimerDocumentReference
    extends FirestoreDocumentReference<TimerDocumentSnapshot>
    implements TimerDocumentReference {
  _$TimerDocumentReference(this.reference);

  @override
  final DocumentReference<Timer> reference;

  /// A reference to the [TimerCollectionReference] containing this document.
  TimerCollectionReference get parent {
    return _$TimerCollectionReference(reference.firestore);
  }

  @override
  Stream<TimerDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return TimerDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<TimerDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return TimerDocumentSnapshot._(
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
    Object? description = _sentinel,
    Object? duree = _sentinel,
    Object? statut = _sentinel,
    Object? visible = _sentinel,
    Object? ordre = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (description != _sentinel) "description": description as String,
      if (duree != _sentinel) "duree": duree as int,
      if (statut != _sentinel) "statut": statut as bool,
      if (visible != _sentinel) "visible": visible as bool,
      if (ordre != _sentinel) "ordre": ordre as int,
    };

    return reference.update(json);
  }

  Future<void> set(Timer value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is TimerDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class TimerDocumentSnapshot extends FirestoreDocumentSnapshot {
  TimerDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Timer> snapshot;

  @override
  TimerDocumentReference get reference {
    return TimerDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Timer? data;
}

abstract class TimerQuery implements QueryReference<TimerQuerySnapshot> {
  @override
  TimerQuery limit(int limit);

  @override
  TimerQuery limitToLast(int limit);

  TimerQuery whereName({
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
  TimerQuery whereDescription({
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
  TimerQuery whereDuree({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  TimerQuery whereStatut({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  TimerQuery whereVisible({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  TimerQuery whereOrdre({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });

  TimerQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TimerDocumentSnapshot? startAtDocument,
    TimerDocumentSnapshot? endAtDocument,
    TimerDocumentSnapshot? endBeforeDocument,
    TimerDocumentSnapshot? startAfterDocument,
  });

  TimerQuery orderByDescription({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TimerDocumentSnapshot? startAtDocument,
    TimerDocumentSnapshot? endAtDocument,
    TimerDocumentSnapshot? endBeforeDocument,
    TimerDocumentSnapshot? startAfterDocument,
  });

  TimerQuery orderByDuree({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    TimerDocumentSnapshot? startAtDocument,
    TimerDocumentSnapshot? endAtDocument,
    TimerDocumentSnapshot? endBeforeDocument,
    TimerDocumentSnapshot? startAfterDocument,
  });

  TimerQuery orderByStatut({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    TimerDocumentSnapshot? startAtDocument,
    TimerDocumentSnapshot? endAtDocument,
    TimerDocumentSnapshot? endBeforeDocument,
    TimerDocumentSnapshot? startAfterDocument,
  });

  TimerQuery orderByVisible({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    TimerDocumentSnapshot? startAtDocument,
    TimerDocumentSnapshot? endAtDocument,
    TimerDocumentSnapshot? endBeforeDocument,
    TimerDocumentSnapshot? startAfterDocument,
  });

  TimerQuery orderByOrdre({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    TimerDocumentSnapshot? startAtDocument,
    TimerDocumentSnapshot? endAtDocument,
    TimerDocumentSnapshot? endBeforeDocument,
    TimerDocumentSnapshot? startAfterDocument,
  });
}

class _$TimerQuery extends QueryReference<TimerQuerySnapshot>
    implements TimerQuery {
  _$TimerQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Timer> reference;

  TimerQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Timer> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return TimerQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<TimerDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: TimerDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return TimerQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<TimerQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<TimerQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  TimerQuery limit(int limit) {
    return _$TimerQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  TimerQuery limitToLast(int limit) {
    return _$TimerQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  TimerQuery whereName({
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
    return _$TimerQuery(
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

  TimerQuery whereDescription({
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
    return _$TimerQuery(
      reference.where(
        'description',
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

  TimerQuery whereDuree({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$TimerQuery(
      reference.where(
        'duree',
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

  TimerQuery whereStatut({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$TimerQuery(
      reference.where(
        'statut',
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

  TimerQuery whereVisible({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$TimerQuery(
      reference.where(
        'visible',
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

  TimerQuery whereOrdre({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$TimerQuery(
      reference.where(
        'ordre',
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

  TimerQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TimerDocumentSnapshot? startAtDocument,
    TimerDocumentSnapshot? endAtDocument,
    TimerDocumentSnapshot? endBeforeDocument,
    TimerDocumentSnapshot? startAfterDocument,
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

    return _$TimerQuery(query, _collection);
  }

  TimerQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TimerDocumentSnapshot? startAtDocument,
    TimerDocumentSnapshot? endAtDocument,
    TimerDocumentSnapshot? endBeforeDocument,
    TimerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('description', descending: descending);

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

    return _$TimerQuery(query, _collection);
  }

  TimerQuery orderByDuree({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TimerDocumentSnapshot? startAtDocument,
    TimerDocumentSnapshot? endAtDocument,
    TimerDocumentSnapshot? endBeforeDocument,
    TimerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('duree', descending: descending);

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

    return _$TimerQuery(query, _collection);
  }

  TimerQuery orderByStatut({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TimerDocumentSnapshot? startAtDocument,
    TimerDocumentSnapshot? endAtDocument,
    TimerDocumentSnapshot? endBeforeDocument,
    TimerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('statut', descending: descending);

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

    return _$TimerQuery(query, _collection);
  }

  TimerQuery orderByVisible({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TimerDocumentSnapshot? startAtDocument,
    TimerDocumentSnapshot? endAtDocument,
    TimerDocumentSnapshot? endBeforeDocument,
    TimerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('visible', descending: descending);

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

    return _$TimerQuery(query, _collection);
  }

  TimerQuery orderByOrdre({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TimerDocumentSnapshot? startAtDocument,
    TimerDocumentSnapshot? endAtDocument,
    TimerDocumentSnapshot? endBeforeDocument,
    TimerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('ordre', descending: descending);

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

    return _$TimerQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$TimerQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class TimerQuerySnapshot
    extends FirestoreQuerySnapshot<TimerQueryDocumentSnapshot> {
  TimerQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Timer> snapshot;

  @override
  final List<TimerQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<TimerDocumentSnapshot>> docChanges;
}

class TimerQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements TimerDocumentSnapshot {
  TimerQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Timer> snapshot;

  @override
  TimerDocumentReference get reference {
    return TimerDocumentReference(snapshot.reference);
  }

  @override
  final Timer data;
}
