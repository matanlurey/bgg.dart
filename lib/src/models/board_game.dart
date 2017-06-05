// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

class BoardGame implements BoardGameRef {
  @override
  final int id;
  @override
  final int yearPublished;
  final int minPlayers;
  final int maxPlayers;
  final int playingTime;
  final int minPlayTime;
  final int maxPlayTime;
  final int age;
  @override
  final String name;
  final String description;
  final Uri thumbnail;
  final Uri image;

  const BoardGame({
    @required this.id,
    @required this.yearPublished,
    @required this.minPlayers,
    @required this.maxPlayers,
    @required this.playingTime,
    @required this.minPlayTime,
    @required this.maxPlayTime,
    @required this.age,
    @required this.name,
    @required this.description,
    @required this.thumbnail,
    @required this.image,
  });
}

class BoardGameRef {
  final int id;
  final int yearPublished;
  final String name;

  const BoardGameRef({
    @required this.id,
    @required this.yearPublished,
    @required this.name,
  });
}
