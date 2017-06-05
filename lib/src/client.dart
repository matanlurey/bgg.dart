// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'models/board_game.dart';
import 'specs/board_game_spec.dart';

import 'http.dart';

/// A client for [BGG's API](https://boardgamegeek.com/wiki/page/BGG_XML_API2).
class Bgg {
  final BggHttp _http;

  const Bgg(this._http);

  /// Retrieve information about a particular game by [gameId].
  Future<BoardGame> getBoardGame(int gameId) async {
    final xml = (await _http([
      'boardgame',
      '$gameId',
    ]))
        .findAllElements('boardgame')
        .first;
    return const BoardGameObjectSpec().decode(xml);
  }

  /// Retrieves a list of board games matching [query].
  Future<Iterable<BoardGameRef>> searchGames(String query) async {
    final xml = (await _http.call([
      'search',
    ], queryParameters: <String, dynamic>{
      'search': query,
    }))
        .findAllElements('boardgame');
    return xml.map(const BoardGameRefSpec().decode);
  }
}
