// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name.model.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum NameModelKey {
  first,
  last,
  middle,
  full,
}

extension NameModelKeyExtension on NameModelKey {
  String get value {
    switch (this) {
      case NameModelKey.first:
        return 'first';
      case NameModelKey.last:
        return 'last';
      case NameModelKey.middle:
        return 'middle';
      case NameModelKey.full:
        return 'full';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(NameModel doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'first', doc.first);
  Helper.writeNotNull(data, 'last', doc.last);
  Helper.writeNotNull(data, 'middle', doc.middle);
  Helper.writeNotNull(data, 'full', doc.full);

  return data;
}

/// For load data
void _$fromData(NameModel doc, Map<String, dynamic> data) {
  doc.first = Helper.valueFromKey<String>(data, 'first');
  doc.last = Helper.valueFromKey<String>(data, 'last');
  doc.middle = Helper.valueFromKey<String>(data, 'middle');
  doc.full = Helper.valueFromKey<String>(data, 'full');
}
