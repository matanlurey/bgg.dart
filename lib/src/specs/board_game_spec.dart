// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../models/board_game.dart';
import '../spec.dart';
import 'package:xml/xml.dart';

class BoardGameObjectSpec extends XmlObjectSpec<BoardGame> {
  const BoardGameObjectSpec();

  @override
  BoardGame decode(XmlElement xml) {
    return new BoardGame(
      id: readId(xml),
      yearPublished: readInt(xml, 'yearpublished'),
      minPlayers: readInt(xml, 'minplayers'),
      maxPlayers: readInt(xml, 'maxplayers'),
      playingTime: readInt(xml, 'playingtime'),
      minPlayTime: readInt(xml, 'minplaytime'),
      maxPlayTime: readInt(xml, 'maxplaytime'),
      age: readInt(xml, 'age'),
      name: readString(xml, 'name'),
      description: readString(xml, 'description'),
      thumbnail: Uri.parse(readString(xml, 'thumbnail')),
      image: Uri.parse(readString(xml, 'image')),
    );
  }
}

class BoardGameRefSpec extends XmlObjectSpec<BoardGameRef> {
  const BoardGameRefSpec();

  @override
  BoardGameRef decode(XmlElement xml) {
    return new BoardGameRef(
      id: readId(xml),
      yearPublished: readInt(xml, 'yearpublished'),
      name: readString(xml, 'name'),
    );
  }
}
