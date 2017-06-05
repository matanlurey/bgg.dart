// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

/// **INTERNAL ONLY**: Specification details on going from XML -> `T`.
@immutable
@visibleForTesting
abstract class XmlObjectSpec<T> {
  static T _defaultOrElse<T>() => null;

  const XmlObjectSpec();

  /// Returns the unique ID for an [xml]-encoded object.
  @protected
  int readId(XmlElement xml) => int.parse(xml.getAttribute('objectid'));

  @protected
  int readInt(
    XmlElement xml,
    String path, {
    int orElse(): _defaultOrElse,
  }) {
    return int.parse(
      readString(xml, path, orElse: () => '${orElse()}'),
      onError: (_) => orElse(),
    );
  }

  @protected
  String readString(
    XmlElement xml,
    String path, {
    String orElse(): _defaultOrElse,
  }) {
    for (final part in path.split(' ')) {
      final results = xml.findAllElements(part);
      if (results.isEmpty) {
        return orElse();
      }
      xml = results.first;
    }
    return xml.text;
  }

  /// Decodes a [xml] result as a strongly typed object `T`.
  T decode(XmlElement xml);
}

T _defaultOrElse<T>() => throw new StateError('Node not found');

int readChildInt(
  XmlElement xml,
  String name, {
  int orElse(): _defaultOrElse,
}) =>
    int.parse(readChildString(xml, name, orElse: () => '${orElse()}'));

String readChildString(
  XmlElement xml,
  String name, {
  String orElse(): _defaultOrElse,
}) {
  final nodes = xml.findElements(name);
  if (nodes.isEmpty) {
    return orElse();
  }
  return nodes.first.text;
}
