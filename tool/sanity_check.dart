// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:bgg/bgg.dart';
import 'package:stack_trace/stack_trace.dart';

/// With a pre-authorized client ID, print "Vabanque" (Game ID#2536).
///
/// Otherwise fails with an [exitCode] of `1`. This is used as a (very) simple
/// test to ensure that nothing horrible broke with our code that connects to
/// the BoardGameGeek API server.
Future<Null> main() async {
  BggHttp http;
  Bgg bgg;
  try {
    http = new BggHttp();
    bgg = new Bgg(http);
    final result = await bgg.getBoardGame(2536);
    print(result.name);
    final search = await bgg.searchGames('Letters');
    print('\nGames matching "Letters": ');
    print('* ' + search.map((r) => r.name).toList().join('\n* '));
    http.close();
  } catch (e, s) {
    print('Error: $e');
    print('Stack: ${new Trace.from(s).terse}');
    exitCode = 1;
  } finally {
    http?.close();
  }
}
