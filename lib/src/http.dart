// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:http/http.dart';
import 'package:xml/xml.dart';

/// A lightweight HTTP shim that is simple to implement.
///
/// Most users should directly use the high-level `Bgg` class.
class BggHttp {
  static final Uri _defaultBaseUri = new Uri(
    scheme: 'https',
    host: 'www.boardgamegeek.com',
    path: 'xmlapi',
  );

  final Uri _baseUri;
  final Client _http;

  BggHttp({
    Client http,
    Uri baseUri,
  })
      : _http = http ?? new Client(),
        _baseUri = baseUri ?? _defaultBaseUri;

  /// Returns an XML-decoded result from making an API call to [pathSegments].
  ///
  /// Optionally specify [queryParameters] to make as part of the HTTP call.
  Future<XmlDocument> call(
    Iterable<String> pathSegments, {
    Map<String, dynamic> queryParameters: const <String, dynamic>{},
  }) =>
      _http
          .get(_baseUri.replace(
            pathSegments: _baseUri.pathSegments.toList()..addAll(pathSegments),
            queryParameters: queryParameters,
          ))
          .then((response) => parse(response.body));

  /// Closes the HTTP client, terminating all connections.
  void close() => _http.close();
}
