// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AyatTable extends Ayat with TableInfo<$AyatTable, Ayah> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AyatTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _jozzMeta = const VerificationMeta('jozz');
  @override
  late final GeneratedColumn<int> jozz = GeneratedColumn<int>(
      'jozz', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int> page = GeneratedColumn<int>(
      'page', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _surah_numberMeta =
      const VerificationMeta('surah_number');
  @override
  late final GeneratedColumn<int> surah_number = GeneratedColumn<int>(
      'surah_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _surah_name_enMeta =
      const VerificationMeta('surah_name_en');
  @override
  late final GeneratedColumn<String> surah_name_en = GeneratedColumn<String>(
      'surah_name_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _surah_name_arMeta =
      const VerificationMeta('surah_name_ar');
  @override
  late final GeneratedColumn<String> surah_name_ar = GeneratedColumn<String>(
      'surah_name_ar', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ayah_numberMeta =
      const VerificationMeta('ayah_number');
  @override
  late final GeneratedColumn<int> ayah_number = GeneratedColumn<int>(
      'ayah_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ayah_textMeta =
      const VerificationMeta('ayah_text');
  @override
  late final GeneratedColumn<String> ayah_text = GeneratedColumn<String>(
      'ayah_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ayah_search_textMeta =
      const VerificationMeta('ayah_search_text');
  @override
  late final GeneratedColumn<String> ayah_search_text = GeneratedColumn<String>(
      'ayah_search_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        jozz,
        page,
        surah_number,
        surah_name_en,
        surah_name_ar,
        ayah_number,
        ayah_text,
        ayah_search_text
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ayat';
  @override
  VerificationContext validateIntegrity(Insertable<Ayah> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('jozz')) {
      context.handle(
          _jozzMeta, jozz.isAcceptableOrUnknown(data['jozz']!, _jozzMeta));
    } else if (isInserting) {
      context.missing(_jozzMeta);
    }
    if (data.containsKey('page')) {
      context.handle(
          _pageMeta, page.isAcceptableOrUnknown(data['page']!, _pageMeta));
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('surah_number')) {
      context.handle(
          _surah_numberMeta,
          surah_number.isAcceptableOrUnknown(
              data['surah_number']!, _surah_numberMeta));
    } else if (isInserting) {
      context.missing(_surah_numberMeta);
    }
    if (data.containsKey('surah_name_en')) {
      context.handle(
          _surah_name_enMeta,
          surah_name_en.isAcceptableOrUnknown(
              data['surah_name_en']!, _surah_name_enMeta));
    } else if (isInserting) {
      context.missing(_surah_name_enMeta);
    }
    if (data.containsKey('surah_name_ar')) {
      context.handle(
          _surah_name_arMeta,
          surah_name_ar.isAcceptableOrUnknown(
              data['surah_name_ar']!, _surah_name_arMeta));
    } else if (isInserting) {
      context.missing(_surah_name_arMeta);
    }
    if (data.containsKey('ayah_number')) {
      context.handle(
          _ayah_numberMeta,
          ayah_number.isAcceptableOrUnknown(
              data['ayah_number']!, _ayah_numberMeta));
    } else if (isInserting) {
      context.missing(_ayah_numberMeta);
    }
    if (data.containsKey('ayah_text')) {
      context.handle(_ayah_textMeta,
          ayah_text.isAcceptableOrUnknown(data['ayah_text']!, _ayah_textMeta));
    } else if (isInserting) {
      context.missing(_ayah_textMeta);
    }
    if (data.containsKey('ayah_search_text')) {
      context.handle(
          _ayah_search_textMeta,
          ayah_search_text.isAcceptableOrUnknown(
              data['ayah_search_text']!, _ayah_search_textMeta));
    } else if (isInserting) {
      context.missing(_ayah_search_textMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ayah map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ayah(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      jozz: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}jozz'])!,
      page: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}page'])!,
      surah_number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}surah_number'])!,
      surah_name_en: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}surah_name_en'])!,
      surah_name_ar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}surah_name_ar'])!,
      ayah_number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_number'])!,
      ayah_text: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ayah_text'])!,
      ayah_search_text: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ayah_search_text'])!,
    );
  }

  @override
  $AyatTable createAlias(String alias) {
    return $AyatTable(attachedDatabase, alias);
  }
}

class Ayah extends DataClass implements Insertable<Ayah> {
  final int id;
  final int jozz;
  final int page;
  final int surah_number;
  final String surah_name_en;
  final String surah_name_ar;
  final int ayah_number;
  final String ayah_text;
  final String ayah_search_text;
  const Ayah(
      {required this.id,
      required this.jozz,
      required this.page,
      required this.surah_number,
      required this.surah_name_en,
      required this.surah_name_ar,
      required this.ayah_number,
      required this.ayah_text,
      required this.ayah_search_text});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['jozz'] = Variable<int>(jozz);
    map['page'] = Variable<int>(page);
    map['surah_number'] = Variable<int>(surah_number);
    map['surah_name_en'] = Variable<String>(surah_name_en);
    map['surah_name_ar'] = Variable<String>(surah_name_ar);
    map['ayah_number'] = Variable<int>(ayah_number);
    map['ayah_text'] = Variable<String>(ayah_text);
    map['ayah_search_text'] = Variable<String>(ayah_search_text);
    return map;
  }

  AyatCompanion toCompanion(bool nullToAbsent) {
    return AyatCompanion(
      id: Value(id),
      jozz: Value(jozz),
      page: Value(page),
      surah_number: Value(surah_number),
      surah_name_en: Value(surah_name_en),
      surah_name_ar: Value(surah_name_ar),
      ayah_number: Value(ayah_number),
      ayah_text: Value(ayah_text),
      ayah_search_text: Value(ayah_search_text),
    );
  }

  factory Ayah.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ayah(
      id: serializer.fromJson<int>(json['id']),
      jozz: serializer.fromJson<int>(json['jozz']),
      page: serializer.fromJson<int>(json['page']),
      surah_number: serializer.fromJson<int>(json['surah_number']),
      surah_name_en: serializer.fromJson<String>(json['surah_name_en']),
      surah_name_ar: serializer.fromJson<String>(json['surah_name_ar']),
      ayah_number: serializer.fromJson<int>(json['ayah_number']),
      ayah_text: serializer.fromJson<String>(json['ayah_text']),
      ayah_search_text: serializer.fromJson<String>(json['ayah_search_text']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'jozz': serializer.toJson<int>(jozz),
      'page': serializer.toJson<int>(page),
      'surah_number': serializer.toJson<int>(surah_number),
      'surah_name_en': serializer.toJson<String>(surah_name_en),
      'surah_name_ar': serializer.toJson<String>(surah_name_ar),
      'ayah_number': serializer.toJson<int>(ayah_number),
      'ayah_text': serializer.toJson<String>(ayah_text),
      'ayah_search_text': serializer.toJson<String>(ayah_search_text),
    };
  }

  Ayah copyWith(
          {int? id,
          int? jozz,
          int? page,
          int? surah_number,
          String? surah_name_en,
          String? surah_name_ar,
          int? ayah_number,
          String? ayah_text,
          String? ayah_search_text}) =>
      Ayah(
        id: id ?? this.id,
        jozz: jozz ?? this.jozz,
        page: page ?? this.page,
        surah_number: surah_number ?? this.surah_number,
        surah_name_en: surah_name_en ?? this.surah_name_en,
        surah_name_ar: surah_name_ar ?? this.surah_name_ar,
        ayah_number: ayah_number ?? this.ayah_number,
        ayah_text: ayah_text ?? this.ayah_text,
        ayah_search_text: ayah_search_text ?? this.ayah_search_text,
      );
  Ayah copyWithCompanion(AyatCompanion data) {
    return Ayah(
      id: data.id.present ? data.id.value : this.id,
      jozz: data.jozz.present ? data.jozz.value : this.jozz,
      page: data.page.present ? data.page.value : this.page,
      surah_number: data.surah_number.present
          ? data.surah_number.value
          : this.surah_number,
      surah_name_en: data.surah_name_en.present
          ? data.surah_name_en.value
          : this.surah_name_en,
      surah_name_ar: data.surah_name_ar.present
          ? data.surah_name_ar.value
          : this.surah_name_ar,
      ayah_number:
          data.ayah_number.present ? data.ayah_number.value : this.ayah_number,
      ayah_text: data.ayah_text.present ? data.ayah_text.value : this.ayah_text,
      ayah_search_text: data.ayah_search_text.present
          ? data.ayah_search_text.value
          : this.ayah_search_text,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ayah(')
          ..write('id: $id, ')
          ..write('jozz: $jozz, ')
          ..write('page: $page, ')
          ..write('surah_number: $surah_number, ')
          ..write('surah_name_en: $surah_name_en, ')
          ..write('surah_name_ar: $surah_name_ar, ')
          ..write('ayah_number: $ayah_number, ')
          ..write('ayah_text: $ayah_text, ')
          ..write('ayah_search_text: $ayah_search_text')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, jozz, page, surah_number, surah_name_en,
      surah_name_ar, ayah_number, ayah_text, ayah_search_text);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ayah &&
          other.id == this.id &&
          other.jozz == this.jozz &&
          other.page == this.page &&
          other.surah_number == this.surah_number &&
          other.surah_name_en == this.surah_name_en &&
          other.surah_name_ar == this.surah_name_ar &&
          other.ayah_number == this.ayah_number &&
          other.ayah_text == this.ayah_text &&
          other.ayah_search_text == this.ayah_search_text);
}

class AyatCompanion extends UpdateCompanion<Ayah> {
  final Value<int> id;
  final Value<int> jozz;
  final Value<int> page;
  final Value<int> surah_number;
  final Value<String> surah_name_en;
  final Value<String> surah_name_ar;
  final Value<int> ayah_number;
  final Value<String> ayah_text;
  final Value<String> ayah_search_text;
  const AyatCompanion({
    this.id = const Value.absent(),
    this.jozz = const Value.absent(),
    this.page = const Value.absent(),
    this.surah_number = const Value.absent(),
    this.surah_name_en = const Value.absent(),
    this.surah_name_ar = const Value.absent(),
    this.ayah_number = const Value.absent(),
    this.ayah_text = const Value.absent(),
    this.ayah_search_text = const Value.absent(),
  });
  AyatCompanion.insert({
    this.id = const Value.absent(),
    required int jozz,
    required int page,
    required int surah_number,
    required String surah_name_en,
    required String surah_name_ar,
    required int ayah_number,
    required String ayah_text,
    required String ayah_search_text,
  })  : jozz = Value(jozz),
        page = Value(page),
        surah_number = Value(surah_number),
        surah_name_en = Value(surah_name_en),
        surah_name_ar = Value(surah_name_ar),
        ayah_number = Value(ayah_number),
        ayah_text = Value(ayah_text),
        ayah_search_text = Value(ayah_search_text);
  static Insertable<Ayah> custom({
    Expression<int>? id,
    Expression<int>? jozz,
    Expression<int>? page,
    Expression<int>? surah_number,
    Expression<String>? surah_name_en,
    Expression<String>? surah_name_ar,
    Expression<int>? ayah_number,
    Expression<String>? ayah_text,
    Expression<String>? ayah_search_text,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jozz != null) 'jozz': jozz,
      if (page != null) 'page': page,
      if (surah_number != null) 'surah_number': surah_number,
      if (surah_name_en != null) 'surah_name_en': surah_name_en,
      if (surah_name_ar != null) 'surah_name_ar': surah_name_ar,
      if (ayah_number != null) 'ayah_number': ayah_number,
      if (ayah_text != null) 'ayah_text': ayah_text,
      if (ayah_search_text != null) 'ayah_search_text': ayah_search_text,
    });
  }

  AyatCompanion copyWith(
      {Value<int>? id,
      Value<int>? jozz,
      Value<int>? page,
      Value<int>? surah_number,
      Value<String>? surah_name_en,
      Value<String>? surah_name_ar,
      Value<int>? ayah_number,
      Value<String>? ayah_text,
      Value<String>? ayah_search_text}) {
    return AyatCompanion(
      id: id ?? this.id,
      jozz: jozz ?? this.jozz,
      page: page ?? this.page,
      surah_number: surah_number ?? this.surah_number,
      surah_name_en: surah_name_en ?? this.surah_name_en,
      surah_name_ar: surah_name_ar ?? this.surah_name_ar,
      ayah_number: ayah_number ?? this.ayah_number,
      ayah_text: ayah_text ?? this.ayah_text,
      ayah_search_text: ayah_search_text ?? this.ayah_search_text,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jozz.present) {
      map['jozz'] = Variable<int>(jozz.value);
    }
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (surah_number.present) {
      map['surah_number'] = Variable<int>(surah_number.value);
    }
    if (surah_name_en.present) {
      map['surah_name_en'] = Variable<String>(surah_name_en.value);
    }
    if (surah_name_ar.present) {
      map['surah_name_ar'] = Variable<String>(surah_name_ar.value);
    }
    if (ayah_number.present) {
      map['ayah_number'] = Variable<int>(ayah_number.value);
    }
    if (ayah_text.present) {
      map['ayah_text'] = Variable<String>(ayah_text.value);
    }
    if (ayah_search_text.present) {
      map['ayah_search_text'] = Variable<String>(ayah_search_text.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AyatCompanion(')
          ..write('id: $id, ')
          ..write('jozz: $jozz, ')
          ..write('page: $page, ')
          ..write('surah_number: $surah_number, ')
          ..write('surah_name_en: $surah_name_en, ')
          ..write('surah_name_ar: $surah_name_ar, ')
          ..write('ayah_number: $ayah_number, ')
          ..write('ayah_text: $ayah_text, ')
          ..write('ayah_search_text: $ayah_search_text')
          ..write(')'))
        .toString();
  }
}

class $TemplatesTable extends Templates
    with TableInfo<$TemplatesTable, Template> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'templates';
  @override
  VerificationContext validateIntegrity(Insertable<Template> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Template map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Template(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $TemplatesTable createAlias(String alias) {
    return $TemplatesTable(attachedDatabase, alias);
  }
}

class Template extends DataClass implements Insertable<Template> {
  final int id;
  final String name;
  const Template({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TemplatesCompanion toCompanion(bool nullToAbsent) {
    return TemplatesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Template.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Template(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Template copyWith({int? id, String? name}) => Template(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Template copyWithCompanion(TemplatesCompanion data) {
    return Template(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Template(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Template && other.id == this.id && other.name == this.name);
}

class TemplatesCompanion extends UpdateCompanion<Template> {
  final Value<int> id;
  final Value<String> name;
  const TemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Template> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TemplatesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return TemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TemplateSegmentsTable extends TemplateSegments
    with TableInfo<$TemplateSegmentsTable, TemplateSegment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplateSegmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fromAyahMeta =
      const VerificationMeta('fromAyah');
  @override
  late final GeneratedColumn<int> fromAyah = GeneratedColumn<int>(
      'from_ayah', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES ayat (id) ON DELETE CASCADE'));
  static const VerificationMeta _toAyahMeta = const VerificationMeta('toAyah');
  @override
  late final GeneratedColumn<int> toAyah = GeneratedColumn<int>(
      'to_ayah', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES ayat (id) ON DELETE CASCADE'));
  static const VerificationMeta _templateIdMeta =
      const VerificationMeta('templateId');
  @override
  late final GeneratedColumn<int> templateId = GeneratedColumn<int>(
      'template_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES templates (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [id, fromAyah, toAyah, templateId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'template_segments';
  @override
  VerificationContext validateIntegrity(Insertable<TemplateSegment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('from_ayah')) {
      context.handle(_fromAyahMeta,
          fromAyah.isAcceptableOrUnknown(data['from_ayah']!, _fromAyahMeta));
    } else if (isInserting) {
      context.missing(_fromAyahMeta);
    }
    if (data.containsKey('to_ayah')) {
      context.handle(_toAyahMeta,
          toAyah.isAcceptableOrUnknown(data['to_ayah']!, _toAyahMeta));
    } else if (isInserting) {
      context.missing(_toAyahMeta);
    }
    if (data.containsKey('template_id')) {
      context.handle(
          _templateIdMeta,
          templateId.isAcceptableOrUnknown(
              data['template_id']!, _templateIdMeta));
    } else if (isInserting) {
      context.missing(_templateIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TemplateSegment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TemplateSegment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fromAyah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}from_ayah'])!,
      toAyah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}to_ayah'])!,
      templateId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}template_id'])!,
    );
  }

  @override
  $TemplateSegmentsTable createAlias(String alias) {
    return $TemplateSegmentsTable(attachedDatabase, alias);
  }
}

class TemplateSegment extends DataClass implements Insertable<TemplateSegment> {
  final int id;
  final int fromAyah;
  final int toAyah;
  final int templateId;
  const TemplateSegment(
      {required this.id,
      required this.fromAyah,
      required this.toAyah,
      required this.templateId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['from_ayah'] = Variable<int>(fromAyah);
    map['to_ayah'] = Variable<int>(toAyah);
    map['template_id'] = Variable<int>(templateId);
    return map;
  }

  TemplateSegmentsCompanion toCompanion(bool nullToAbsent) {
    return TemplateSegmentsCompanion(
      id: Value(id),
      fromAyah: Value(fromAyah),
      toAyah: Value(toAyah),
      templateId: Value(templateId),
    );
  }

  factory TemplateSegment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TemplateSegment(
      id: serializer.fromJson<int>(json['id']),
      fromAyah: serializer.fromJson<int>(json['fromAyah']),
      toAyah: serializer.fromJson<int>(json['toAyah']),
      templateId: serializer.fromJson<int>(json['templateId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fromAyah': serializer.toJson<int>(fromAyah),
      'toAyah': serializer.toJson<int>(toAyah),
      'templateId': serializer.toJson<int>(templateId),
    };
  }

  TemplateSegment copyWith(
          {int? id, int? fromAyah, int? toAyah, int? templateId}) =>
      TemplateSegment(
        id: id ?? this.id,
        fromAyah: fromAyah ?? this.fromAyah,
        toAyah: toAyah ?? this.toAyah,
        templateId: templateId ?? this.templateId,
      );
  TemplateSegment copyWithCompanion(TemplateSegmentsCompanion data) {
    return TemplateSegment(
      id: data.id.present ? data.id.value : this.id,
      fromAyah: data.fromAyah.present ? data.fromAyah.value : this.fromAyah,
      toAyah: data.toAyah.present ? data.toAyah.value : this.toAyah,
      templateId:
          data.templateId.present ? data.templateId.value : this.templateId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TemplateSegment(')
          ..write('id: $id, ')
          ..write('fromAyah: $fromAyah, ')
          ..write('toAyah: $toAyah, ')
          ..write('templateId: $templateId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fromAyah, toAyah, templateId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TemplateSegment &&
          other.id == this.id &&
          other.fromAyah == this.fromAyah &&
          other.toAyah == this.toAyah &&
          other.templateId == this.templateId);
}

class TemplateSegmentsCompanion extends UpdateCompanion<TemplateSegment> {
  final Value<int> id;
  final Value<int> fromAyah;
  final Value<int> toAyah;
  final Value<int> templateId;
  const TemplateSegmentsCompanion({
    this.id = const Value.absent(),
    this.fromAyah = const Value.absent(),
    this.toAyah = const Value.absent(),
    this.templateId = const Value.absent(),
  });
  TemplateSegmentsCompanion.insert({
    this.id = const Value.absent(),
    required int fromAyah,
    required int toAyah,
    required int templateId,
  })  : fromAyah = Value(fromAyah),
        toAyah = Value(toAyah),
        templateId = Value(templateId);
  static Insertable<TemplateSegment> custom({
    Expression<int>? id,
    Expression<int>? fromAyah,
    Expression<int>? toAyah,
    Expression<int>? templateId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fromAyah != null) 'from_ayah': fromAyah,
      if (toAyah != null) 'to_ayah': toAyah,
      if (templateId != null) 'template_id': templateId,
    });
  }

  TemplateSegmentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? fromAyah,
      Value<int>? toAyah,
      Value<int>? templateId}) {
    return TemplateSegmentsCompanion(
      id: id ?? this.id,
      fromAyah: fromAyah ?? this.fromAyah,
      toAyah: toAyah ?? this.toAyah,
      templateId: templateId ?? this.templateId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fromAyah.present) {
      map['from_ayah'] = Variable<int>(fromAyah.value);
    }
    if (toAyah.present) {
      map['to_ayah'] = Variable<int>(toAyah.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<int>(templateId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplateSegmentsCompanion(')
          ..write('id: $id, ')
          ..write('fromAyah: $fromAyah, ')
          ..write('toAyah: $toAyah, ')
          ..write('templateId: $templateId')
          ..write(')'))
        .toString();
  }
}

class $ResultsTable extends Results with TableInfo<$ResultsTable, Result> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _templateIdMeta =
      const VerificationMeta('templateId');
  @override
  late final GeneratedColumn<int> templateId = GeneratedColumn<int>(
      'template_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES templates (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns => [id, date, templateId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'results';
  @override
  VerificationContext validateIntegrity(Insertable<Result> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('template_id')) {
      context.handle(
          _templateIdMeta,
          templateId.isAcceptableOrUnknown(
              data['template_id']!, _templateIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Result map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Result(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      templateId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}template_id']),
    );
  }

  @override
  $ResultsTable createAlias(String alias) {
    return $ResultsTable(attachedDatabase, alias);
  }
}

class Result extends DataClass implements Insertable<Result> {
  final int id;
  final DateTime date;
  final int? templateId;
  const Result({required this.id, required this.date, this.templateId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || templateId != null) {
      map['template_id'] = Variable<int>(templateId);
    }
    return map;
  }

  ResultsCompanion toCompanion(bool nullToAbsent) {
    return ResultsCompanion(
      id: Value(id),
      date: Value(date),
      templateId: templateId == null && nullToAbsent
          ? const Value.absent()
          : Value(templateId),
    );
  }

  factory Result.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Result(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      templateId: serializer.fromJson<int?>(json['templateId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'templateId': serializer.toJson<int?>(templateId),
    };
  }

  Result copyWith(
          {int? id,
          DateTime? date,
          Value<int?> templateId = const Value.absent()}) =>
      Result(
        id: id ?? this.id,
        date: date ?? this.date,
        templateId: templateId.present ? templateId.value : this.templateId,
      );
  Result copyWithCompanion(ResultsCompanion data) {
    return Result(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      templateId:
          data.templateId.present ? data.templateId.value : this.templateId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Result(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('templateId: $templateId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, templateId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Result &&
          other.id == this.id &&
          other.date == this.date &&
          other.templateId == this.templateId);
}

class ResultsCompanion extends UpdateCompanion<Result> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int?> templateId;
  const ResultsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.templateId = const Value.absent(),
  });
  ResultsCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.templateId = const Value.absent(),
  });
  static Insertable<Result> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? templateId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (templateId != null) 'template_id': templateId,
    });
  }

  ResultsCompanion copyWith(
      {Value<int>? id, Value<DateTime>? date, Value<int?>? templateId}) {
    return ResultsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      templateId: templateId ?? this.templateId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<int>(templateId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResultsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('templateId: $templateId')
          ..write(')'))
        .toString();
  }
}

class $AnswersTable extends Answers with TableInfo<$AnswersTable, Answer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnswersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isCorrectMeta =
      const VerificationMeta('isCorrect');
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
      'is_correct', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_correct" IN (0, 1))'));
  static const VerificationMeta _fromAyahMeta =
      const VerificationMeta('fromAyah');
  @override
  late final GeneratedColumn<int> fromAyah = GeneratedColumn<int>(
      'from_ayah', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES ayat (id) ON DELETE CASCADE'));
  static const VerificationMeta _toAyahMeta = const VerificationMeta('toAyah');
  @override
  late final GeneratedColumn<int> toAyah = GeneratedColumn<int>(
      'to_ayah', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES ayat (id) ON DELETE CASCADE'));
  static const VerificationMeta _resultIdMeta =
      const VerificationMeta('resultId');
  @override
  late final GeneratedColumn<int> resultId = GeneratedColumn<int>(
      'result_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES results (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, isCorrect, fromAyah, toAyah, resultId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'answers';
  @override
  VerificationContext validateIntegrity(Insertable<Answer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_correct')) {
      context.handle(_isCorrectMeta,
          isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta));
    } else if (isInserting) {
      context.missing(_isCorrectMeta);
    }
    if (data.containsKey('from_ayah')) {
      context.handle(_fromAyahMeta,
          fromAyah.isAcceptableOrUnknown(data['from_ayah']!, _fromAyahMeta));
    } else if (isInserting) {
      context.missing(_fromAyahMeta);
    }
    if (data.containsKey('to_ayah')) {
      context.handle(_toAyahMeta,
          toAyah.isAcceptableOrUnknown(data['to_ayah']!, _toAyahMeta));
    } else if (isInserting) {
      context.missing(_toAyahMeta);
    }
    if (data.containsKey('result_id')) {
      context.handle(_resultIdMeta,
          resultId.isAcceptableOrUnknown(data['result_id']!, _resultIdMeta));
    } else if (isInserting) {
      context.missing(_resultIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Answer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Answer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isCorrect: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_correct'])!,
      fromAyah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}from_ayah'])!,
      toAyah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}to_ayah'])!,
      resultId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}result_id'])!,
    );
  }

  @override
  $AnswersTable createAlias(String alias) {
    return $AnswersTable(attachedDatabase, alias);
  }
}

class Answer extends DataClass implements Insertable<Answer> {
  final int id;
  final bool isCorrect;
  final int fromAyah;
  final int toAyah;
  final int resultId;
  const Answer(
      {required this.id,
      required this.isCorrect,
      required this.fromAyah,
      required this.toAyah,
      required this.resultId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_correct'] = Variable<bool>(isCorrect);
    map['from_ayah'] = Variable<int>(fromAyah);
    map['to_ayah'] = Variable<int>(toAyah);
    map['result_id'] = Variable<int>(resultId);
    return map;
  }

  AnswersCompanion toCompanion(bool nullToAbsent) {
    return AnswersCompanion(
      id: Value(id),
      isCorrect: Value(isCorrect),
      fromAyah: Value(fromAyah),
      toAyah: Value(toAyah),
      resultId: Value(resultId),
    );
  }

  factory Answer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Answer(
      id: serializer.fromJson<int>(json['id']),
      isCorrect: serializer.fromJson<bool>(json['isCorrect']),
      fromAyah: serializer.fromJson<int>(json['fromAyah']),
      toAyah: serializer.fromJson<int>(json['toAyah']),
      resultId: serializer.fromJson<int>(json['resultId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isCorrect': serializer.toJson<bool>(isCorrect),
      'fromAyah': serializer.toJson<int>(fromAyah),
      'toAyah': serializer.toJson<int>(toAyah),
      'resultId': serializer.toJson<int>(resultId),
    };
  }

  Answer copyWith(
          {int? id,
          bool? isCorrect,
          int? fromAyah,
          int? toAyah,
          int? resultId}) =>
      Answer(
        id: id ?? this.id,
        isCorrect: isCorrect ?? this.isCorrect,
        fromAyah: fromAyah ?? this.fromAyah,
        toAyah: toAyah ?? this.toAyah,
        resultId: resultId ?? this.resultId,
      );
  Answer copyWithCompanion(AnswersCompanion data) {
    return Answer(
      id: data.id.present ? data.id.value : this.id,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
      fromAyah: data.fromAyah.present ? data.fromAyah.value : this.fromAyah,
      toAyah: data.toAyah.present ? data.toAyah.value : this.toAyah,
      resultId: data.resultId.present ? data.resultId.value : this.resultId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Answer(')
          ..write('id: $id, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('fromAyah: $fromAyah, ')
          ..write('toAyah: $toAyah, ')
          ..write('resultId: $resultId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isCorrect, fromAyah, toAyah, resultId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Answer &&
          other.id == this.id &&
          other.isCorrect == this.isCorrect &&
          other.fromAyah == this.fromAyah &&
          other.toAyah == this.toAyah &&
          other.resultId == this.resultId);
}

class AnswersCompanion extends UpdateCompanion<Answer> {
  final Value<int> id;
  final Value<bool> isCorrect;
  final Value<int> fromAyah;
  final Value<int> toAyah;
  final Value<int> resultId;
  const AnswersCompanion({
    this.id = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.fromAyah = const Value.absent(),
    this.toAyah = const Value.absent(),
    this.resultId = const Value.absent(),
  });
  AnswersCompanion.insert({
    this.id = const Value.absent(),
    required bool isCorrect,
    required int fromAyah,
    required int toAyah,
    required int resultId,
  })  : isCorrect = Value(isCorrect),
        fromAyah = Value(fromAyah),
        toAyah = Value(toAyah),
        resultId = Value(resultId);
  static Insertable<Answer> custom({
    Expression<int>? id,
    Expression<bool>? isCorrect,
    Expression<int>? fromAyah,
    Expression<int>? toAyah,
    Expression<int>? resultId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (fromAyah != null) 'from_ayah': fromAyah,
      if (toAyah != null) 'to_ayah': toAyah,
      if (resultId != null) 'result_id': resultId,
    });
  }

  AnswersCompanion copyWith(
      {Value<int>? id,
      Value<bool>? isCorrect,
      Value<int>? fromAyah,
      Value<int>? toAyah,
      Value<int>? resultId}) {
    return AnswersCompanion(
      id: id ?? this.id,
      isCorrect: isCorrect ?? this.isCorrect,
      fromAyah: fromAyah ?? this.fromAyah,
      toAyah: toAyah ?? this.toAyah,
      resultId: resultId ?? this.resultId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (fromAyah.present) {
      map['from_ayah'] = Variable<int>(fromAyah.value);
    }
    if (toAyah.present) {
      map['to_ayah'] = Variable<int>(toAyah.value);
    }
    if (resultId.present) {
      map['result_id'] = Variable<int>(resultId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnswersCompanion(')
          ..write('id: $id, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('fromAyah: $fromAyah, ')
          ..write('toAyah: $toAyah, ')
          ..write('resultId: $resultId')
          ..write(')'))
        .toString();
  }
}

class $ActivitiesTable extends Activities
    with TableInfo<$ActivitiesTable, Activity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, order];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activities';
  @override
  VerificationContext validateIntegrity(Insertable<Activity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Activity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Activity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
    );
  }

  @override
  $ActivitiesTable createAlias(String alias) {
    return $ActivitiesTable(attachedDatabase, alias);
  }
}

class Activity extends DataClass implements Insertable<Activity> {
  final int id;
  final String name;
  final int order;
  const Activity({required this.id, required this.name, required this.order});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['order'] = Variable<int>(order);
    return map;
  }

  ActivitiesCompanion toCompanion(bool nullToAbsent) {
    return ActivitiesCompanion(
      id: Value(id),
      name: Value(name),
      order: Value(order),
    );
  }

  factory Activity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Activity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'order': serializer.toJson<int>(order),
    };
  }

  Activity copyWith({int? id, String? name, int? order}) => Activity(
        id: id ?? this.id,
        name: name ?? this.name,
        order: order ?? this.order,
      );
  Activity copyWithCompanion(ActivitiesCompanion data) {
    return Activity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      order: data.order.present ? data.order.value : this.order,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Activity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, order);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Activity &&
          other.id == this.id &&
          other.name == this.name &&
          other.order == this.order);
}

class ActivitiesCompanion extends UpdateCompanion<Activity> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> order;
  const ActivitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.order = const Value.absent(),
  });
  ActivitiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int order,
  })  : name = Value(name),
        order = Value(order);
  static Insertable<Activity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (order != null) 'order': order,
    });
  }

  ActivitiesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? order}) {
    return ActivitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $ActivitySchedulesTable extends ActivitySchedules
    with TableInfo<$ActivitySchedulesTable, ActivitySchedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivitySchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _activityIdMeta =
      const VerificationMeta('activityId');
  @override
  late final GeneratedColumn<int> activityId = GeneratedColumn<int>(
      'activity_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES activities (id) ON DELETE CASCADE'));
  static const VerificationMeta _scheduledDaysMeta =
      const VerificationMeta('scheduledDays');
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String> scheduledDays =
      GeneratedColumn<String>('scheduled_days', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<int>>(
              $ActivitySchedulesTable.$converterscheduledDays);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day)));
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, activityId, scheduledDays, startDate, endDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_schedules';
  @override
  VerificationContext validateIntegrity(Insertable<ActivitySchedule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('activity_id')) {
      context.handle(
          _activityIdMeta,
          activityId.isAcceptableOrUnknown(
              data['activity_id']!, _activityIdMeta));
    } else if (isInserting) {
      context.missing(_activityIdMeta);
    }
    context.handle(_scheduledDaysMeta, const VerificationResult.success());
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivitySchedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivitySchedule(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      activityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}activity_id'])!,
      scheduledDays: $ActivitySchedulesTable.$converterscheduledDays.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}scheduled_days'])!),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
    );
  }

  @override
  $ActivitySchedulesTable createAlias(String alias) {
    return $ActivitySchedulesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<int>, String> $converterscheduledDays =
      const WeekdayListConverter();
}

class ActivitySchedule extends DataClass
    implements Insertable<ActivitySchedule> {
  final int id;
  final int activityId;
  final List<int> scheduledDays;
  final DateTime startDate;
  final DateTime? endDate;
  const ActivitySchedule(
      {required this.id,
      required this.activityId,
      required this.scheduledDays,
      required this.startDate,
      this.endDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['activity_id'] = Variable<int>(activityId);
    {
      map['scheduled_days'] = Variable<String>(
          $ActivitySchedulesTable.$converterscheduledDays.toSql(scheduledDays));
    }
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    return map;
  }

  ActivitySchedulesCompanion toCompanion(bool nullToAbsent) {
    return ActivitySchedulesCompanion(
      id: Value(id),
      activityId: Value(activityId),
      scheduledDays: Value(scheduledDays),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
    );
  }

  factory ActivitySchedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivitySchedule(
      id: serializer.fromJson<int>(json['id']),
      activityId: serializer.fromJson<int>(json['activityId']),
      scheduledDays: serializer.fromJson<List<int>>(json['scheduledDays']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activityId': serializer.toJson<int>(activityId),
      'scheduledDays': serializer.toJson<List<int>>(scheduledDays),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
    };
  }

  ActivitySchedule copyWith(
          {int? id,
          int? activityId,
          List<int>? scheduledDays,
          DateTime? startDate,
          Value<DateTime?> endDate = const Value.absent()}) =>
      ActivitySchedule(
        id: id ?? this.id,
        activityId: activityId ?? this.activityId,
        scheduledDays: scheduledDays ?? this.scheduledDays,
        startDate: startDate ?? this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
      );
  ActivitySchedule copyWithCompanion(ActivitySchedulesCompanion data) {
    return ActivitySchedule(
      id: data.id.present ? data.id.value : this.id,
      activityId:
          data.activityId.present ? data.activityId.value : this.activityId,
      scheduledDays: data.scheduledDays.present
          ? data.scheduledDays.value
          : this.scheduledDays,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivitySchedule(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('scheduledDays: $scheduledDays, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, activityId, scheduledDays, startDate, endDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivitySchedule &&
          other.id == this.id &&
          other.activityId == this.activityId &&
          other.scheduledDays == this.scheduledDays &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class ActivitySchedulesCompanion extends UpdateCompanion<ActivitySchedule> {
  final Value<int> id;
  final Value<int> activityId;
  final Value<List<int>> scheduledDays;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  const ActivitySchedulesCompanion({
    this.id = const Value.absent(),
    this.activityId = const Value.absent(),
    this.scheduledDays = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  ActivitySchedulesCompanion.insert({
    this.id = const Value.absent(),
    required int activityId,
    required List<int> scheduledDays,
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  })  : activityId = Value(activityId),
        scheduledDays = Value(scheduledDays);
  static Insertable<ActivitySchedule> custom({
    Expression<int>? id,
    Expression<int>? activityId,
    Expression<String>? scheduledDays,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activityId != null) 'activity_id': activityId,
      if (scheduledDays != null) 'scheduled_days': scheduledDays,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  ActivitySchedulesCompanion copyWith(
      {Value<int>? id,
      Value<int>? activityId,
      Value<List<int>>? scheduledDays,
      Value<DateTime>? startDate,
      Value<DateTime?>? endDate}) {
    return ActivitySchedulesCompanion(
      id: id ?? this.id,
      activityId: activityId ?? this.activityId,
      scheduledDays: scheduledDays ?? this.scheduledDays,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (activityId.present) {
      map['activity_id'] = Variable<int>(activityId.value);
    }
    if (scheduledDays.present) {
      map['scheduled_days'] = Variable<String>($ActivitySchedulesTable
          .$converterscheduledDays
          .toSql(scheduledDays.value));
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivitySchedulesCompanion(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('scheduledDays: $scheduledDays, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

class $EntriesTable extends Entries with TableInfo<$EntriesTable, Entry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _fromAyahMeta =
      const VerificationMeta('fromAyah');
  @override
  late final GeneratedColumn<int> fromAyah = GeneratedColumn<int>(
      'from_ayah', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES ayat (id) ON DELETE CASCADE'));
  static const VerificationMeta _toAyahMeta = const VerificationMeta('toAyah');
  @override
  late final GeneratedColumn<int> toAyah = GeneratedColumn<int>(
      'to_ayah', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES ayat (id) ON DELETE CASCADE'));
  static const VerificationMeta _activityIdMeta =
      const VerificationMeta('activityId');
  @override
  late final GeneratedColumn<int> activityId = GeneratedColumn<int>(
      'activity_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES activities (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, body, date, fromAyah, toAyah, activityId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'entries';
  @override
  VerificationContext validateIntegrity(Insertable<Entry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('from_ayah')) {
      context.handle(_fromAyahMeta,
          fromAyah.isAcceptableOrUnknown(data['from_ayah']!, _fromAyahMeta));
    } else if (isInserting) {
      context.missing(_fromAyahMeta);
    }
    if (data.containsKey('to_ayah')) {
      context.handle(_toAyahMeta,
          toAyah.isAcceptableOrUnknown(data['to_ayah']!, _toAyahMeta));
    } else if (isInserting) {
      context.missing(_toAyahMeta);
    }
    if (data.containsKey('activity_id')) {
      context.handle(
          _activityIdMeta,
          activityId.isAcceptableOrUnknown(
              data['activity_id']!, _activityIdMeta));
    } else if (isInserting) {
      context.missing(_activityIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Entry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Entry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      fromAyah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}from_ayah'])!,
      toAyah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}to_ayah'])!,
      activityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}activity_id'])!,
    );
  }

  @override
  $EntriesTable createAlias(String alias) {
    return $EntriesTable(attachedDatabase, alias);
  }
}

class Entry extends DataClass implements Insertable<Entry> {
  final int id;
  final String body;
  final DateTime date;
  final int fromAyah;
  final int toAyah;
  final int activityId;
  const Entry(
      {required this.id,
      required this.body,
      required this.date,
      required this.fromAyah,
      required this.toAyah,
      required this.activityId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['body'] = Variable<String>(body);
    map['date'] = Variable<DateTime>(date);
    map['from_ayah'] = Variable<int>(fromAyah);
    map['to_ayah'] = Variable<int>(toAyah);
    map['activity_id'] = Variable<int>(activityId);
    return map;
  }

  EntriesCompanion toCompanion(bool nullToAbsent) {
    return EntriesCompanion(
      id: Value(id),
      body: Value(body),
      date: Value(date),
      fromAyah: Value(fromAyah),
      toAyah: Value(toAyah),
      activityId: Value(activityId),
    );
  }

  factory Entry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Entry(
      id: serializer.fromJson<int>(json['id']),
      body: serializer.fromJson<String>(json['body']),
      date: serializer.fromJson<DateTime>(json['date']),
      fromAyah: serializer.fromJson<int>(json['fromAyah']),
      toAyah: serializer.fromJson<int>(json['toAyah']),
      activityId: serializer.fromJson<int>(json['activityId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'body': serializer.toJson<String>(body),
      'date': serializer.toJson<DateTime>(date),
      'fromAyah': serializer.toJson<int>(fromAyah),
      'toAyah': serializer.toJson<int>(toAyah),
      'activityId': serializer.toJson<int>(activityId),
    };
  }

  Entry copyWith(
          {int? id,
          String? body,
          DateTime? date,
          int? fromAyah,
          int? toAyah,
          int? activityId}) =>
      Entry(
        id: id ?? this.id,
        body: body ?? this.body,
        date: date ?? this.date,
        fromAyah: fromAyah ?? this.fromAyah,
        toAyah: toAyah ?? this.toAyah,
        activityId: activityId ?? this.activityId,
      );
  Entry copyWithCompanion(EntriesCompanion data) {
    return Entry(
      id: data.id.present ? data.id.value : this.id,
      body: data.body.present ? data.body.value : this.body,
      date: data.date.present ? data.date.value : this.date,
      fromAyah: data.fromAyah.present ? data.fromAyah.value : this.fromAyah,
      toAyah: data.toAyah.present ? data.toAyah.value : this.toAyah,
      activityId:
          data.activityId.present ? data.activityId.value : this.activityId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Entry(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('date: $date, ')
          ..write('fromAyah: $fromAyah, ')
          ..write('toAyah: $toAyah, ')
          ..write('activityId: $activityId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, body, date, fromAyah, toAyah, activityId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Entry &&
          other.id == this.id &&
          other.body == this.body &&
          other.date == this.date &&
          other.fromAyah == this.fromAyah &&
          other.toAyah == this.toAyah &&
          other.activityId == this.activityId);
}

class EntriesCompanion extends UpdateCompanion<Entry> {
  final Value<int> id;
  final Value<String> body;
  final Value<DateTime> date;
  final Value<int> fromAyah;
  final Value<int> toAyah;
  final Value<int> activityId;
  const EntriesCompanion({
    this.id = const Value.absent(),
    this.body = const Value.absent(),
    this.date = const Value.absent(),
    this.fromAyah = const Value.absent(),
    this.toAyah = const Value.absent(),
    this.activityId = const Value.absent(),
  });
  EntriesCompanion.insert({
    this.id = const Value.absent(),
    required String body,
    required DateTime date,
    required int fromAyah,
    required int toAyah,
    required int activityId,
  })  : body = Value(body),
        date = Value(date),
        fromAyah = Value(fromAyah),
        toAyah = Value(toAyah),
        activityId = Value(activityId);
  static Insertable<Entry> custom({
    Expression<int>? id,
    Expression<String>? body,
    Expression<DateTime>? date,
    Expression<int>? fromAyah,
    Expression<int>? toAyah,
    Expression<int>? activityId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (body != null) 'body': body,
      if (date != null) 'date': date,
      if (fromAyah != null) 'from_ayah': fromAyah,
      if (toAyah != null) 'to_ayah': toAyah,
      if (activityId != null) 'activity_id': activityId,
    });
  }

  EntriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? body,
      Value<DateTime>? date,
      Value<int>? fromAyah,
      Value<int>? toAyah,
      Value<int>? activityId}) {
    return EntriesCompanion(
      id: id ?? this.id,
      body: body ?? this.body,
      date: date ?? this.date,
      fromAyah: fromAyah ?? this.fromAyah,
      toAyah: toAyah ?? this.toAyah,
      activityId: activityId ?? this.activityId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (fromAyah.present) {
      map['from_ayah'] = Variable<int>(fromAyah.value);
    }
    if (toAyah.present) {
      map['to_ayah'] = Variable<int>(toAyah.value);
    }
    if (activityId.present) {
      map['activity_id'] = Variable<int>(activityId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntriesCompanion(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('date: $date, ')
          ..write('fromAyah: $fromAyah, ')
          ..write('toAyah: $toAyah, ')
          ..write('activityId: $activityId')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $AyatTable ayat = $AyatTable(this);
  late final $TemplatesTable templates = $TemplatesTable(this);
  late final $TemplateSegmentsTable templateSegments =
      $TemplateSegmentsTable(this);
  late final $ResultsTable results = $ResultsTable(this);
  late final $AnswersTable answers = $AnswersTable(this);
  late final $ActivitiesTable activities = $ActivitiesTable(this);
  late final $ActivitySchedulesTable activitySchedules =
      $ActivitySchedulesTable(this);
  late final $EntriesTable entries = $EntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        ayat,
        templates,
        templateSegments,
        results,
        answers,
        activities,
        activitySchedules,
        entries
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('ayat',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('template_segments', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('ayat',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('template_segments', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('templates',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('template_segments', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('templates',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('results', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('ayat',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('answers', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('ayat',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('answers', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('results',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('answers', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('activities',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('activity_schedules', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('ayat',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('entries', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('ayat',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('entries', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('activities',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('entries', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$AyatTableCreateCompanionBuilder = AyatCompanion Function({
  Value<int> id,
  required int jozz,
  required int page,
  required int surah_number,
  required String surah_name_en,
  required String surah_name_ar,
  required int ayah_number,
  required String ayah_text,
  required String ayah_search_text,
});
typedef $$AyatTableUpdateCompanionBuilder = AyatCompanion Function({
  Value<int> id,
  Value<int> jozz,
  Value<int> page,
  Value<int> surah_number,
  Value<String> surah_name_en,
  Value<String> surah_name_ar,
  Value<int> ayah_number,
  Value<String> ayah_text,
  Value<String> ayah_search_text,
});

class $$AyatTableFilterComposer extends Composer<_$Database, $AyatTable> {
  $$AyatTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get jozz => $composableBuilder(
      column: $table.jozz, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get page => $composableBuilder(
      column: $table.page, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get surah_number => $composableBuilder(
      column: $table.surah_number, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get surah_name_en => $composableBuilder(
      column: $table.surah_name_en, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get surah_name_ar => $composableBuilder(
      column: $table.surah_name_ar, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get ayah_number => $composableBuilder(
      column: $table.ayah_number, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ayah_text => $composableBuilder(
      column: $table.ayah_text, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ayah_search_text => $composableBuilder(
      column: $table.ayah_search_text,
      builder: (column) => ColumnFilters(column));
}

class $$AyatTableOrderingComposer extends Composer<_$Database, $AyatTable> {
  $$AyatTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get jozz => $composableBuilder(
      column: $table.jozz, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get page => $composableBuilder(
      column: $table.page, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get surah_number => $composableBuilder(
      column: $table.surah_number,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get surah_name_en => $composableBuilder(
      column: $table.surah_name_en,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get surah_name_ar => $composableBuilder(
      column: $table.surah_name_ar,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get ayah_number => $composableBuilder(
      column: $table.ayah_number, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ayah_text => $composableBuilder(
      column: $table.ayah_text, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ayah_search_text => $composableBuilder(
      column: $table.ayah_search_text,
      builder: (column) => ColumnOrderings(column));
}

class $$AyatTableAnnotationComposer extends Composer<_$Database, $AyatTable> {
  $$AyatTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get jozz =>
      $composableBuilder(column: $table.jozz, builder: (column) => column);

  GeneratedColumn<int> get page =>
      $composableBuilder(column: $table.page, builder: (column) => column);

  GeneratedColumn<int> get surah_number => $composableBuilder(
      column: $table.surah_number, builder: (column) => column);

  GeneratedColumn<String> get surah_name_en => $composableBuilder(
      column: $table.surah_name_en, builder: (column) => column);

  GeneratedColumn<String> get surah_name_ar => $composableBuilder(
      column: $table.surah_name_ar, builder: (column) => column);

  GeneratedColumn<int> get ayah_number => $composableBuilder(
      column: $table.ayah_number, builder: (column) => column);

  GeneratedColumn<String> get ayah_text =>
      $composableBuilder(column: $table.ayah_text, builder: (column) => column);

  GeneratedColumn<String> get ayah_search_text => $composableBuilder(
      column: $table.ayah_search_text, builder: (column) => column);
}

class $$AyatTableTableManager extends RootTableManager<
    _$Database,
    $AyatTable,
    Ayah,
    $$AyatTableFilterComposer,
    $$AyatTableOrderingComposer,
    $$AyatTableAnnotationComposer,
    $$AyatTableCreateCompanionBuilder,
    $$AyatTableUpdateCompanionBuilder,
    (Ayah, BaseReferences<_$Database, $AyatTable, Ayah>),
    Ayah,
    PrefetchHooks Function()> {
  $$AyatTableTableManager(_$Database db, $AyatTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AyatTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AyatTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AyatTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> jozz = const Value.absent(),
            Value<int> page = const Value.absent(),
            Value<int> surah_number = const Value.absent(),
            Value<String> surah_name_en = const Value.absent(),
            Value<String> surah_name_ar = const Value.absent(),
            Value<int> ayah_number = const Value.absent(),
            Value<String> ayah_text = const Value.absent(),
            Value<String> ayah_search_text = const Value.absent(),
          }) =>
              AyatCompanion(
            id: id,
            jozz: jozz,
            page: page,
            surah_number: surah_number,
            surah_name_en: surah_name_en,
            surah_name_ar: surah_name_ar,
            ayah_number: ayah_number,
            ayah_text: ayah_text,
            ayah_search_text: ayah_search_text,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int jozz,
            required int page,
            required int surah_number,
            required String surah_name_en,
            required String surah_name_ar,
            required int ayah_number,
            required String ayah_text,
            required String ayah_search_text,
          }) =>
              AyatCompanion.insert(
            id: id,
            jozz: jozz,
            page: page,
            surah_number: surah_number,
            surah_name_en: surah_name_en,
            surah_name_ar: surah_name_ar,
            ayah_number: ayah_number,
            ayah_text: ayah_text,
            ayah_search_text: ayah_search_text,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AyatTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $AyatTable,
    Ayah,
    $$AyatTableFilterComposer,
    $$AyatTableOrderingComposer,
    $$AyatTableAnnotationComposer,
    $$AyatTableCreateCompanionBuilder,
    $$AyatTableUpdateCompanionBuilder,
    (Ayah, BaseReferences<_$Database, $AyatTable, Ayah>),
    Ayah,
    PrefetchHooks Function()>;
typedef $$TemplatesTableCreateCompanionBuilder = TemplatesCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$TemplatesTableUpdateCompanionBuilder = TemplatesCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$TemplatesTableReferences
    extends BaseReferences<_$Database, $TemplatesTable, Template> {
  $$TemplatesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TemplateSegmentsTable, List<TemplateSegment>>
      _templateSegmentsRefsTable(_$Database db) =>
          MultiTypedResultKey.fromTable(db.templateSegments,
              aliasName: $_aliasNameGenerator(
                  db.templates.id, db.templateSegments.templateId));

  $$TemplateSegmentsTableProcessedTableManager get templateSegmentsRefs {
    final manager =
        $$TemplateSegmentsTableTableManager($_db, $_db.templateSegments)
            .filter((f) => f.templateId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_templateSegmentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ResultsTable, List<Result>> _resultsRefsTable(
          _$Database db) =>
      MultiTypedResultKey.fromTable(db.results,
          aliasName:
              $_aliasNameGenerator(db.templates.id, db.results.templateId));

  $$ResultsTableProcessedTableManager get resultsRefs {
    final manager = $$ResultsTableTableManager($_db, $_db.results)
        .filter((f) => f.templateId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_resultsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TemplatesTableFilterComposer
    extends Composer<_$Database, $TemplatesTable> {
  $$TemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> templateSegmentsRefs(
      Expression<bool> Function($$TemplateSegmentsTableFilterComposer f) f) {
    final $$TemplateSegmentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.templateSegments,
        getReferencedColumn: (t) => t.templateId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TemplateSegmentsTableFilterComposer(
              $db: $db,
              $table: $db.templateSegments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> resultsRefs(
      Expression<bool> Function($$ResultsTableFilterComposer f) f) {
    final $$ResultsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.results,
        getReferencedColumn: (t) => t.templateId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ResultsTableFilterComposer(
              $db: $db,
              $table: $db.results,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TemplatesTableOrderingComposer
    extends Composer<_$Database, $TemplatesTable> {
  $$TemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$TemplatesTableAnnotationComposer
    extends Composer<_$Database, $TemplatesTable> {
  $$TemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> templateSegmentsRefs<T extends Object>(
      Expression<T> Function($$TemplateSegmentsTableAnnotationComposer a) f) {
    final $$TemplateSegmentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.templateSegments,
        getReferencedColumn: (t) => t.templateId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TemplateSegmentsTableAnnotationComposer(
              $db: $db,
              $table: $db.templateSegments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> resultsRefs<T extends Object>(
      Expression<T> Function($$ResultsTableAnnotationComposer a) f) {
    final $$ResultsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.results,
        getReferencedColumn: (t) => t.templateId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ResultsTableAnnotationComposer(
              $db: $db,
              $table: $db.results,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TemplatesTableTableManager extends RootTableManager<
    _$Database,
    $TemplatesTable,
    Template,
    $$TemplatesTableFilterComposer,
    $$TemplatesTableOrderingComposer,
    $$TemplatesTableAnnotationComposer,
    $$TemplatesTableCreateCompanionBuilder,
    $$TemplatesTableUpdateCompanionBuilder,
    (Template, $$TemplatesTableReferences),
    Template,
    PrefetchHooks Function({bool templateSegmentsRefs, bool resultsRefs})> {
  $$TemplatesTableTableManager(_$Database db, $TemplatesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              TemplatesCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              TemplatesCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TemplatesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {templateSegmentsRefs = false, resultsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (templateSegmentsRefs) db.templateSegments,
                if (resultsRefs) db.results
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (templateSegmentsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$TemplatesTableReferences
                            ._templateSegmentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TemplatesTableReferences(db, table, p0)
                                .templateSegmentsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.templateId == item.id),
                        typedResults: items),
                  if (resultsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TemplatesTableReferences._resultsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TemplatesTableReferences(db, table, p0)
                                .resultsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.templateId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TemplatesTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $TemplatesTable,
    Template,
    $$TemplatesTableFilterComposer,
    $$TemplatesTableOrderingComposer,
    $$TemplatesTableAnnotationComposer,
    $$TemplatesTableCreateCompanionBuilder,
    $$TemplatesTableUpdateCompanionBuilder,
    (Template, $$TemplatesTableReferences),
    Template,
    PrefetchHooks Function({bool templateSegmentsRefs, bool resultsRefs})>;
typedef $$TemplateSegmentsTableCreateCompanionBuilder
    = TemplateSegmentsCompanion Function({
  Value<int> id,
  required int fromAyah,
  required int toAyah,
  required int templateId,
});
typedef $$TemplateSegmentsTableUpdateCompanionBuilder
    = TemplateSegmentsCompanion Function({
  Value<int> id,
  Value<int> fromAyah,
  Value<int> toAyah,
  Value<int> templateId,
});

final class $$TemplateSegmentsTableReferences extends BaseReferences<_$Database,
    $TemplateSegmentsTable, TemplateSegment> {
  $$TemplateSegmentsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $AyatTable _fromAyahTable(_$Database db) => db.ayat.createAlias(
      $_aliasNameGenerator(db.templateSegments.fromAyah, db.ayat.id));

  $$AyatTableProcessedTableManager? get fromAyah {
    if ($_item.fromAyah == null) return null;
    final manager = $$AyatTableTableManager($_db, $_db.ayat)
        .filter((f) => f.id($_item.fromAyah!));
    final item = $_typedResult.readTableOrNull(_fromAyahTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $AyatTable _toAyahTable(_$Database db) => db.ayat.createAlias(
      $_aliasNameGenerator(db.templateSegments.toAyah, db.ayat.id));

  $$AyatTableProcessedTableManager? get toAyah {
    if ($_item.toAyah == null) return null;
    final manager = $$AyatTableTableManager($_db, $_db.ayat)
        .filter((f) => f.id($_item.toAyah!));
    final item = $_typedResult.readTableOrNull(_toAyahTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TemplatesTable _templateIdTable(_$Database db) =>
      db.templates.createAlias($_aliasNameGenerator(
          db.templateSegments.templateId, db.templates.id));

  $$TemplatesTableProcessedTableManager? get templateId {
    if ($_item.templateId == null) return null;
    final manager = $$TemplatesTableTableManager($_db, $_db.templates)
        .filter((f) => f.id($_item.templateId!));
    final item = $_typedResult.readTableOrNull(_templateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TemplateSegmentsTableFilterComposer
    extends Composer<_$Database, $TemplateSegmentsTable> {
  $$TemplateSegmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  $$AyatTableFilterComposer get fromAyah {
    final $$AyatTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableFilterComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AyatTableFilterComposer get toAyah {
    final $$AyatTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableFilterComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TemplatesTableFilterComposer get templateId {
    final $$TemplatesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.templateId,
        referencedTable: $db.templates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TemplatesTableFilterComposer(
              $db: $db,
              $table: $db.templates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TemplateSegmentsTableOrderingComposer
    extends Composer<_$Database, $TemplateSegmentsTable> {
  $$TemplateSegmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  $$AyatTableOrderingComposer get fromAyah {
    final $$AyatTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableOrderingComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AyatTableOrderingComposer get toAyah {
    final $$AyatTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableOrderingComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TemplatesTableOrderingComposer get templateId {
    final $$TemplatesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.templateId,
        referencedTable: $db.templates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TemplatesTableOrderingComposer(
              $db: $db,
              $table: $db.templates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TemplateSegmentsTableAnnotationComposer
    extends Composer<_$Database, $TemplateSegmentsTable> {
  $$TemplateSegmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$AyatTableAnnotationComposer get fromAyah {
    final $$AyatTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableAnnotationComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AyatTableAnnotationComposer get toAyah {
    final $$AyatTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableAnnotationComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TemplatesTableAnnotationComposer get templateId {
    final $$TemplatesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.templateId,
        referencedTable: $db.templates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TemplatesTableAnnotationComposer(
              $db: $db,
              $table: $db.templates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TemplateSegmentsTableTableManager extends RootTableManager<
    _$Database,
    $TemplateSegmentsTable,
    TemplateSegment,
    $$TemplateSegmentsTableFilterComposer,
    $$TemplateSegmentsTableOrderingComposer,
    $$TemplateSegmentsTableAnnotationComposer,
    $$TemplateSegmentsTableCreateCompanionBuilder,
    $$TemplateSegmentsTableUpdateCompanionBuilder,
    (TemplateSegment, $$TemplateSegmentsTableReferences),
    TemplateSegment,
    PrefetchHooks Function({bool fromAyah, bool toAyah, bool templateId})> {
  $$TemplateSegmentsTableTableManager(
      _$Database db, $TemplateSegmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TemplateSegmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TemplateSegmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TemplateSegmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> fromAyah = const Value.absent(),
            Value<int> toAyah = const Value.absent(),
            Value<int> templateId = const Value.absent(),
          }) =>
              TemplateSegmentsCompanion(
            id: id,
            fromAyah: fromAyah,
            toAyah: toAyah,
            templateId: templateId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int fromAyah,
            required int toAyah,
            required int templateId,
          }) =>
              TemplateSegmentsCompanion.insert(
            id: id,
            fromAyah: fromAyah,
            toAyah: toAyah,
            templateId: templateId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TemplateSegmentsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {fromAyah = false, toAyah = false, templateId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (fromAyah) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.fromAyah,
                    referencedTable:
                        $$TemplateSegmentsTableReferences._fromAyahTable(db),
                    referencedColumn:
                        $$TemplateSegmentsTableReferences._fromAyahTable(db).id,
                  ) as T;
                }
                if (toAyah) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.toAyah,
                    referencedTable:
                        $$TemplateSegmentsTableReferences._toAyahTable(db),
                    referencedColumn:
                        $$TemplateSegmentsTableReferences._toAyahTable(db).id,
                  ) as T;
                }
                if (templateId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.templateId,
                    referencedTable:
                        $$TemplateSegmentsTableReferences._templateIdTable(db),
                    referencedColumn: $$TemplateSegmentsTableReferences
                        ._templateIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TemplateSegmentsTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $TemplateSegmentsTable,
    TemplateSegment,
    $$TemplateSegmentsTableFilterComposer,
    $$TemplateSegmentsTableOrderingComposer,
    $$TemplateSegmentsTableAnnotationComposer,
    $$TemplateSegmentsTableCreateCompanionBuilder,
    $$TemplateSegmentsTableUpdateCompanionBuilder,
    (TemplateSegment, $$TemplateSegmentsTableReferences),
    TemplateSegment,
    PrefetchHooks Function({bool fromAyah, bool toAyah, bool templateId})>;
typedef $$ResultsTableCreateCompanionBuilder = ResultsCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  Value<int?> templateId,
});
typedef $$ResultsTableUpdateCompanionBuilder = ResultsCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  Value<int?> templateId,
});

final class $$ResultsTableReferences
    extends BaseReferences<_$Database, $ResultsTable, Result> {
  $$ResultsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TemplatesTable _templateIdTable(_$Database db) =>
      db.templates.createAlias(
          $_aliasNameGenerator(db.results.templateId, db.templates.id));

  $$TemplatesTableProcessedTableManager? get templateId {
    if ($_item.templateId == null) return null;
    final manager = $$TemplatesTableTableManager($_db, $_db.templates)
        .filter((f) => f.id($_item.templateId!));
    final item = $_typedResult.readTableOrNull(_templateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$AnswersTable, List<Answer>> _answersRefsTable(
          _$Database db) =>
      MultiTypedResultKey.fromTable(db.answers,
          aliasName: $_aliasNameGenerator(db.results.id, db.answers.resultId));

  $$AnswersTableProcessedTableManager get answersRefs {
    final manager = $$AnswersTableTableManager($_db, $_db.answers)
        .filter((f) => f.resultId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_answersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ResultsTableFilterComposer extends Composer<_$Database, $ResultsTable> {
  $$ResultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  $$TemplatesTableFilterComposer get templateId {
    final $$TemplatesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.templateId,
        referencedTable: $db.templates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TemplatesTableFilterComposer(
              $db: $db,
              $table: $db.templates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> answersRefs(
      Expression<bool> Function($$AnswersTableFilterComposer f) f) {
    final $$AnswersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.answers,
        getReferencedColumn: (t) => t.resultId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AnswersTableFilterComposer(
              $db: $db,
              $table: $db.answers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ResultsTableOrderingComposer
    extends Composer<_$Database, $ResultsTable> {
  $$ResultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  $$TemplatesTableOrderingComposer get templateId {
    final $$TemplatesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.templateId,
        referencedTable: $db.templates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TemplatesTableOrderingComposer(
              $db: $db,
              $table: $db.templates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ResultsTableAnnotationComposer
    extends Composer<_$Database, $ResultsTable> {
  $$ResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$TemplatesTableAnnotationComposer get templateId {
    final $$TemplatesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.templateId,
        referencedTable: $db.templates,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TemplatesTableAnnotationComposer(
              $db: $db,
              $table: $db.templates,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> answersRefs<T extends Object>(
      Expression<T> Function($$AnswersTableAnnotationComposer a) f) {
    final $$AnswersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.answers,
        getReferencedColumn: (t) => t.resultId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AnswersTableAnnotationComposer(
              $db: $db,
              $table: $db.answers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ResultsTableTableManager extends RootTableManager<
    _$Database,
    $ResultsTable,
    Result,
    $$ResultsTableFilterComposer,
    $$ResultsTableOrderingComposer,
    $$ResultsTableAnnotationComposer,
    $$ResultsTableCreateCompanionBuilder,
    $$ResultsTableUpdateCompanionBuilder,
    (Result, $$ResultsTableReferences),
    Result,
    PrefetchHooks Function({bool templateId, bool answersRefs})> {
  $$ResultsTableTableManager(_$Database db, $ResultsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int?> templateId = const Value.absent(),
          }) =>
              ResultsCompanion(
            id: id,
            date: date,
            templateId: templateId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int?> templateId = const Value.absent(),
          }) =>
              ResultsCompanion.insert(
            id: id,
            date: date,
            templateId: templateId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ResultsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({templateId = false, answersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (answersRefs) db.answers],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (templateId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.templateId,
                    referencedTable:
                        $$ResultsTableReferences._templateIdTable(db),
                    referencedColumn:
                        $$ResultsTableReferences._templateIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (answersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ResultsTableReferences._answersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ResultsTableReferences(db, table, p0).answersRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.resultId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ResultsTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $ResultsTable,
    Result,
    $$ResultsTableFilterComposer,
    $$ResultsTableOrderingComposer,
    $$ResultsTableAnnotationComposer,
    $$ResultsTableCreateCompanionBuilder,
    $$ResultsTableUpdateCompanionBuilder,
    (Result, $$ResultsTableReferences),
    Result,
    PrefetchHooks Function({bool templateId, bool answersRefs})>;
typedef $$AnswersTableCreateCompanionBuilder = AnswersCompanion Function({
  Value<int> id,
  required bool isCorrect,
  required int fromAyah,
  required int toAyah,
  required int resultId,
});
typedef $$AnswersTableUpdateCompanionBuilder = AnswersCompanion Function({
  Value<int> id,
  Value<bool> isCorrect,
  Value<int> fromAyah,
  Value<int> toAyah,
  Value<int> resultId,
});

final class $$AnswersTableReferences
    extends BaseReferences<_$Database, $AnswersTable, Answer> {
  $$AnswersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AyatTable _fromAyahTable(_$Database db) => db.ayat
      .createAlias($_aliasNameGenerator(db.answers.fromAyah, db.ayat.id));

  $$AyatTableProcessedTableManager? get fromAyah {
    if ($_item.fromAyah == null) return null;
    final manager = $$AyatTableTableManager($_db, $_db.ayat)
        .filter((f) => f.id($_item.fromAyah!));
    final item = $_typedResult.readTableOrNull(_fromAyahTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $AyatTable _toAyahTable(_$Database db) =>
      db.ayat.createAlias($_aliasNameGenerator(db.answers.toAyah, db.ayat.id));

  $$AyatTableProcessedTableManager? get toAyah {
    if ($_item.toAyah == null) return null;
    final manager = $$AyatTableTableManager($_db, $_db.ayat)
        .filter((f) => f.id($_item.toAyah!));
    final item = $_typedResult.readTableOrNull(_toAyahTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ResultsTable _resultIdTable(_$Database db) => db.results
      .createAlias($_aliasNameGenerator(db.answers.resultId, db.results.id));

  $$ResultsTableProcessedTableManager? get resultId {
    if ($_item.resultId == null) return null;
    final manager = $$ResultsTableTableManager($_db, $_db.results)
        .filter((f) => f.id($_item.resultId!));
    final item = $_typedResult.readTableOrNull(_resultIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AnswersTableFilterComposer extends Composer<_$Database, $AnswersTable> {
  $$AnswersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnFilters(column));

  $$AyatTableFilterComposer get fromAyah {
    final $$AyatTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableFilterComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AyatTableFilterComposer get toAyah {
    final $$AyatTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableFilterComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ResultsTableFilterComposer get resultId {
    final $$ResultsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.resultId,
        referencedTable: $db.results,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ResultsTableFilterComposer(
              $db: $db,
              $table: $db.results,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AnswersTableOrderingComposer
    extends Composer<_$Database, $AnswersTable> {
  $$AnswersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnOrderings(column));

  $$AyatTableOrderingComposer get fromAyah {
    final $$AyatTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableOrderingComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AyatTableOrderingComposer get toAyah {
    final $$AyatTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableOrderingComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ResultsTableOrderingComposer get resultId {
    final $$ResultsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.resultId,
        referencedTable: $db.results,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ResultsTableOrderingComposer(
              $db: $db,
              $table: $db.results,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AnswersTableAnnotationComposer
    extends Composer<_$Database, $AnswersTable> {
  $$AnswersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  $$AyatTableAnnotationComposer get fromAyah {
    final $$AyatTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableAnnotationComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AyatTableAnnotationComposer get toAyah {
    final $$AyatTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableAnnotationComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ResultsTableAnnotationComposer get resultId {
    final $$ResultsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.resultId,
        referencedTable: $db.results,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ResultsTableAnnotationComposer(
              $db: $db,
              $table: $db.results,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AnswersTableTableManager extends RootTableManager<
    _$Database,
    $AnswersTable,
    Answer,
    $$AnswersTableFilterComposer,
    $$AnswersTableOrderingComposer,
    $$AnswersTableAnnotationComposer,
    $$AnswersTableCreateCompanionBuilder,
    $$AnswersTableUpdateCompanionBuilder,
    (Answer, $$AnswersTableReferences),
    Answer,
    PrefetchHooks Function({bool fromAyah, bool toAyah, bool resultId})> {
  $$AnswersTableTableManager(_$Database db, $AnswersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnswersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> isCorrect = const Value.absent(),
            Value<int> fromAyah = const Value.absent(),
            Value<int> toAyah = const Value.absent(),
            Value<int> resultId = const Value.absent(),
          }) =>
              AnswersCompanion(
            id: id,
            isCorrect: isCorrect,
            fromAyah: fromAyah,
            toAyah: toAyah,
            resultId: resultId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required bool isCorrect,
            required int fromAyah,
            required int toAyah,
            required int resultId,
          }) =>
              AnswersCompanion.insert(
            id: id,
            isCorrect: isCorrect,
            fromAyah: fromAyah,
            toAyah: toAyah,
            resultId: resultId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$AnswersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {fromAyah = false, toAyah = false, resultId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (fromAyah) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.fromAyah,
                    referencedTable:
                        $$AnswersTableReferences._fromAyahTable(db),
                    referencedColumn:
                        $$AnswersTableReferences._fromAyahTable(db).id,
                  ) as T;
                }
                if (toAyah) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.toAyah,
                    referencedTable: $$AnswersTableReferences._toAyahTable(db),
                    referencedColumn:
                        $$AnswersTableReferences._toAyahTable(db).id,
                  ) as T;
                }
                if (resultId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.resultId,
                    referencedTable:
                        $$AnswersTableReferences._resultIdTable(db),
                    referencedColumn:
                        $$AnswersTableReferences._resultIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AnswersTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $AnswersTable,
    Answer,
    $$AnswersTableFilterComposer,
    $$AnswersTableOrderingComposer,
    $$AnswersTableAnnotationComposer,
    $$AnswersTableCreateCompanionBuilder,
    $$AnswersTableUpdateCompanionBuilder,
    (Answer, $$AnswersTableReferences),
    Answer,
    PrefetchHooks Function({bool fromAyah, bool toAyah, bool resultId})>;
typedef $$ActivitiesTableCreateCompanionBuilder = ActivitiesCompanion Function({
  Value<int> id,
  required String name,
  required int order,
});
typedef $$ActivitiesTableUpdateCompanionBuilder = ActivitiesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> order,
});

final class $$ActivitiesTableReferences
    extends BaseReferences<_$Database, $ActivitiesTable, Activity> {
  $$ActivitiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ActivitySchedulesTable, List<ActivitySchedule>>
      _activitySchedulesRefsTable(_$Database db) =>
          MultiTypedResultKey.fromTable(db.activitySchedules,
              aliasName: $_aliasNameGenerator(
                  db.activities.id, db.activitySchedules.activityId));

  $$ActivitySchedulesTableProcessedTableManager get activitySchedulesRefs {
    final manager =
        $$ActivitySchedulesTableTableManager($_db, $_db.activitySchedules)
            .filter((f) => f.activityId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_activitySchedulesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$EntriesTable, List<Entry>> _entriesRefsTable(
          _$Database db) =>
      MultiTypedResultKey.fromTable(db.entries,
          aliasName:
              $_aliasNameGenerator(db.activities.id, db.entries.activityId));

  $$EntriesTableProcessedTableManager get entriesRefs {
    final manager = $$EntriesTableTableManager($_db, $_db.entries)
        .filter((f) => f.activityId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_entriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ActivitiesTableFilterComposer
    extends Composer<_$Database, $ActivitiesTable> {
  $$ActivitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  Expression<bool> activitySchedulesRefs(
      Expression<bool> Function($$ActivitySchedulesTableFilterComposer f) f) {
    final $$ActivitySchedulesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.activitySchedules,
        getReferencedColumn: (t) => t.activityId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivitySchedulesTableFilterComposer(
              $db: $db,
              $table: $db.activitySchedules,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> entriesRefs(
      Expression<bool> Function($$EntriesTableFilterComposer f) f) {
    final $$EntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.entries,
        getReferencedColumn: (t) => t.activityId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EntriesTableFilterComposer(
              $db: $db,
              $table: $db.entries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ActivitiesTableOrderingComposer
    extends Composer<_$Database, $ActivitiesTable> {
  $$ActivitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));
}

class $$ActivitiesTableAnnotationComposer
    extends Composer<_$Database, $ActivitiesTable> {
  $$ActivitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  Expression<T> activitySchedulesRefs<T extends Object>(
      Expression<T> Function($$ActivitySchedulesTableAnnotationComposer a) f) {
    final $$ActivitySchedulesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.activitySchedules,
            getReferencedColumn: (t) => t.activityId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ActivitySchedulesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.activitySchedules,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> entriesRefs<T extends Object>(
      Expression<T> Function($$EntriesTableAnnotationComposer a) f) {
    final $$EntriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.entries,
        getReferencedColumn: (t) => t.activityId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EntriesTableAnnotationComposer(
              $db: $db,
              $table: $db.entries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ActivitiesTableTableManager extends RootTableManager<
    _$Database,
    $ActivitiesTable,
    Activity,
    $$ActivitiesTableFilterComposer,
    $$ActivitiesTableOrderingComposer,
    $$ActivitiesTableAnnotationComposer,
    $$ActivitiesTableCreateCompanionBuilder,
    $$ActivitiesTableUpdateCompanionBuilder,
    (Activity, $$ActivitiesTableReferences),
    Activity,
    PrefetchHooks Function({bool activitySchedulesRefs, bool entriesRefs})> {
  $$ActivitiesTableTableManager(_$Database db, $ActivitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> order = const Value.absent(),
          }) =>
              ActivitiesCompanion(
            id: id,
            name: name,
            order: order,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int order,
          }) =>
              ActivitiesCompanion.insert(
            id: id,
            name: name,
            order: order,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ActivitiesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {activitySchedulesRefs = false, entriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (activitySchedulesRefs) db.activitySchedules,
                if (entriesRefs) db.entries
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (activitySchedulesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ActivitiesTableReferences
                            ._activitySchedulesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ActivitiesTableReferences(db, table, p0)
                                .activitySchedulesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.activityId == item.id),
                        typedResults: items),
                  if (entriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ActivitiesTableReferences._entriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ActivitiesTableReferences(db, table, p0)
                                .entriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.activityId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ActivitiesTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $ActivitiesTable,
    Activity,
    $$ActivitiesTableFilterComposer,
    $$ActivitiesTableOrderingComposer,
    $$ActivitiesTableAnnotationComposer,
    $$ActivitiesTableCreateCompanionBuilder,
    $$ActivitiesTableUpdateCompanionBuilder,
    (Activity, $$ActivitiesTableReferences),
    Activity,
    PrefetchHooks Function({bool activitySchedulesRefs, bool entriesRefs})>;
typedef $$ActivitySchedulesTableCreateCompanionBuilder
    = ActivitySchedulesCompanion Function({
  Value<int> id,
  required int activityId,
  required List<int> scheduledDays,
  Value<DateTime> startDate,
  Value<DateTime?> endDate,
});
typedef $$ActivitySchedulesTableUpdateCompanionBuilder
    = ActivitySchedulesCompanion Function({
  Value<int> id,
  Value<int> activityId,
  Value<List<int>> scheduledDays,
  Value<DateTime> startDate,
  Value<DateTime?> endDate,
});

final class $$ActivitySchedulesTableReferences extends BaseReferences<
    _$Database, $ActivitySchedulesTable, ActivitySchedule> {
  $$ActivitySchedulesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ActivitiesTable _activityIdTable(_$Database db) =>
      db.activities.createAlias($_aliasNameGenerator(
          db.activitySchedules.activityId, db.activities.id));

  $$ActivitiesTableProcessedTableManager? get activityId {
    if ($_item.activityId == null) return null;
    final manager = $$ActivitiesTableTableManager($_db, $_db.activities)
        .filter((f) => f.id($_item.activityId!));
    final item = $_typedResult.readTableOrNull(_activityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ActivitySchedulesTableFilterComposer
    extends Composer<_$Database, $ActivitySchedulesTable> {
  $$ActivitySchedulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<int>, List<int>, String>
      get scheduledDays => $composableBuilder(
          column: $table.scheduledDays,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  $$ActivitiesTableFilterComposer get activityId {
    final $$ActivitiesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.activityId,
        referencedTable: $db.activities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivitiesTableFilterComposer(
              $db: $db,
              $table: $db.activities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ActivitySchedulesTableOrderingComposer
    extends Composer<_$Database, $ActivitySchedulesTable> {
  $$ActivitySchedulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scheduledDays => $composableBuilder(
      column: $table.scheduledDays,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  $$ActivitiesTableOrderingComposer get activityId {
    final $$ActivitiesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.activityId,
        referencedTable: $db.activities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivitiesTableOrderingComposer(
              $db: $db,
              $table: $db.activities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ActivitySchedulesTableAnnotationComposer
    extends Composer<_$Database, $ActivitySchedulesTable> {
  $$ActivitySchedulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<int>, String> get scheduledDays =>
      $composableBuilder(
          column: $table.scheduledDays, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  $$ActivitiesTableAnnotationComposer get activityId {
    final $$ActivitiesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.activityId,
        referencedTable: $db.activities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivitiesTableAnnotationComposer(
              $db: $db,
              $table: $db.activities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ActivitySchedulesTableTableManager extends RootTableManager<
    _$Database,
    $ActivitySchedulesTable,
    ActivitySchedule,
    $$ActivitySchedulesTableFilterComposer,
    $$ActivitySchedulesTableOrderingComposer,
    $$ActivitySchedulesTableAnnotationComposer,
    $$ActivitySchedulesTableCreateCompanionBuilder,
    $$ActivitySchedulesTableUpdateCompanionBuilder,
    (ActivitySchedule, $$ActivitySchedulesTableReferences),
    ActivitySchedule,
    PrefetchHooks Function({bool activityId})> {
  $$ActivitySchedulesTableTableManager(
      _$Database db, $ActivitySchedulesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivitySchedulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivitySchedulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivitySchedulesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> activityId = const Value.absent(),
            Value<List<int>> scheduledDays = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
          }) =>
              ActivitySchedulesCompanion(
            id: id,
            activityId: activityId,
            scheduledDays: scheduledDays,
            startDate: startDate,
            endDate: endDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int activityId,
            required List<int> scheduledDays,
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
          }) =>
              ActivitySchedulesCompanion.insert(
            id: id,
            activityId: activityId,
            scheduledDays: scheduledDays,
            startDate: startDate,
            endDate: endDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ActivitySchedulesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({activityId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (activityId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.activityId,
                    referencedTable:
                        $$ActivitySchedulesTableReferences._activityIdTable(db),
                    referencedColumn: $$ActivitySchedulesTableReferences
                        ._activityIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ActivitySchedulesTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $ActivitySchedulesTable,
    ActivitySchedule,
    $$ActivitySchedulesTableFilterComposer,
    $$ActivitySchedulesTableOrderingComposer,
    $$ActivitySchedulesTableAnnotationComposer,
    $$ActivitySchedulesTableCreateCompanionBuilder,
    $$ActivitySchedulesTableUpdateCompanionBuilder,
    (ActivitySchedule, $$ActivitySchedulesTableReferences),
    ActivitySchedule,
    PrefetchHooks Function({bool activityId})>;
typedef $$EntriesTableCreateCompanionBuilder = EntriesCompanion Function({
  Value<int> id,
  required String body,
  required DateTime date,
  required int fromAyah,
  required int toAyah,
  required int activityId,
});
typedef $$EntriesTableUpdateCompanionBuilder = EntriesCompanion Function({
  Value<int> id,
  Value<String> body,
  Value<DateTime> date,
  Value<int> fromAyah,
  Value<int> toAyah,
  Value<int> activityId,
});

final class $$EntriesTableReferences
    extends BaseReferences<_$Database, $EntriesTable, Entry> {
  $$EntriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AyatTable _fromAyahTable(_$Database db) => db.ayat
      .createAlias($_aliasNameGenerator(db.entries.fromAyah, db.ayat.id));

  $$AyatTableProcessedTableManager? get fromAyah {
    if ($_item.fromAyah == null) return null;
    final manager = $$AyatTableTableManager($_db, $_db.ayat)
        .filter((f) => f.id($_item.fromAyah!));
    final item = $_typedResult.readTableOrNull(_fromAyahTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $AyatTable _toAyahTable(_$Database db) =>
      db.ayat.createAlias($_aliasNameGenerator(db.entries.toAyah, db.ayat.id));

  $$AyatTableProcessedTableManager? get toAyah {
    if ($_item.toAyah == null) return null;
    final manager = $$AyatTableTableManager($_db, $_db.ayat)
        .filter((f) => f.id($_item.toAyah!));
    final item = $_typedResult.readTableOrNull(_toAyahTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ActivitiesTable _activityIdTable(_$Database db) =>
      db.activities.createAlias(
          $_aliasNameGenerator(db.entries.activityId, db.activities.id));

  $$ActivitiesTableProcessedTableManager? get activityId {
    if ($_item.activityId == null) return null;
    final manager = $$ActivitiesTableTableManager($_db, $_db.activities)
        .filter((f) => f.id($_item.activityId!));
    final item = $_typedResult.readTableOrNull(_activityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$EntriesTableFilterComposer extends Composer<_$Database, $EntriesTable> {
  $$EntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  $$AyatTableFilterComposer get fromAyah {
    final $$AyatTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableFilterComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AyatTableFilterComposer get toAyah {
    final $$AyatTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableFilterComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ActivitiesTableFilterComposer get activityId {
    final $$ActivitiesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.activityId,
        referencedTable: $db.activities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivitiesTableFilterComposer(
              $db: $db,
              $table: $db.activities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EntriesTableOrderingComposer
    extends Composer<_$Database, $EntriesTable> {
  $$EntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  $$AyatTableOrderingComposer get fromAyah {
    final $$AyatTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableOrderingComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AyatTableOrderingComposer get toAyah {
    final $$AyatTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableOrderingComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ActivitiesTableOrderingComposer get activityId {
    final $$ActivitiesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.activityId,
        referencedTable: $db.activities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivitiesTableOrderingComposer(
              $db: $db,
              $table: $db.activities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EntriesTableAnnotationComposer
    extends Composer<_$Database, $EntriesTable> {
  $$EntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$AyatTableAnnotationComposer get fromAyah {
    final $$AyatTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableAnnotationComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AyatTableAnnotationComposer get toAyah {
    final $$AyatTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toAyah,
        referencedTable: $db.ayat,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AyatTableAnnotationComposer(
              $db: $db,
              $table: $db.ayat,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ActivitiesTableAnnotationComposer get activityId {
    final $$ActivitiesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.activityId,
        referencedTable: $db.activities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ActivitiesTableAnnotationComposer(
              $db: $db,
              $table: $db.activities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EntriesTableTableManager extends RootTableManager<
    _$Database,
    $EntriesTable,
    Entry,
    $$EntriesTableFilterComposer,
    $$EntriesTableOrderingComposer,
    $$EntriesTableAnnotationComposer,
    $$EntriesTableCreateCompanionBuilder,
    $$EntriesTableUpdateCompanionBuilder,
    (Entry, $$EntriesTableReferences),
    Entry,
    PrefetchHooks Function({bool fromAyah, bool toAyah, bool activityId})> {
  $$EntriesTableTableManager(_$Database db, $EntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> body = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> fromAyah = const Value.absent(),
            Value<int> toAyah = const Value.absent(),
            Value<int> activityId = const Value.absent(),
          }) =>
              EntriesCompanion(
            id: id,
            body: body,
            date: date,
            fromAyah: fromAyah,
            toAyah: toAyah,
            activityId: activityId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String body,
            required DateTime date,
            required int fromAyah,
            required int toAyah,
            required int activityId,
          }) =>
              EntriesCompanion.insert(
            id: id,
            body: body,
            date: date,
            fromAyah: fromAyah,
            toAyah: toAyah,
            activityId: activityId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$EntriesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {fromAyah = false, toAyah = false, activityId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (fromAyah) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.fromAyah,
                    referencedTable:
                        $$EntriesTableReferences._fromAyahTable(db),
                    referencedColumn:
                        $$EntriesTableReferences._fromAyahTable(db).id,
                  ) as T;
                }
                if (toAyah) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.toAyah,
                    referencedTable: $$EntriesTableReferences._toAyahTable(db),
                    referencedColumn:
                        $$EntriesTableReferences._toAyahTable(db).id,
                  ) as T;
                }
                if (activityId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.activityId,
                    referencedTable:
                        $$EntriesTableReferences._activityIdTable(db),
                    referencedColumn:
                        $$EntriesTableReferences._activityIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$EntriesTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $EntriesTable,
    Entry,
    $$EntriesTableFilterComposer,
    $$EntriesTableOrderingComposer,
    $$EntriesTableAnnotationComposer,
    $$EntriesTableCreateCompanionBuilder,
    $$EntriesTableUpdateCompanionBuilder,
    (Entry, $$EntriesTableReferences),
    Entry,
    PrefetchHooks Function({bool fromAyah, bool toAyah, bool activityId})>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$AyatTableTableManager get ayat => $$AyatTableTableManager(_db, _db.ayat);
  $$TemplatesTableTableManager get templates =>
      $$TemplatesTableTableManager(_db, _db.templates);
  $$TemplateSegmentsTableTableManager get templateSegments =>
      $$TemplateSegmentsTableTableManager(_db, _db.templateSegments);
  $$ResultsTableTableManager get results =>
      $$ResultsTableTableManager(_db, _db.results);
  $$AnswersTableTableManager get answers =>
      $$AnswersTableTableManager(_db, _db.answers);
  $$ActivitiesTableTableManager get activities =>
      $$ActivitiesTableTableManager(_db, _db.activities);
  $$ActivitySchedulesTableTableManager get activitySchedules =>
      $$ActivitySchedulesTableTableManager(_db, _db.activitySchedules);
  $$EntriesTableTableManager get entries =>
      $$EntriesTableTableManager(_db, _db.entries);
}
