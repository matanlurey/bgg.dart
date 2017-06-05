# bgg

[BoardGameGeek.com][BGG] API Client for Dart and Flutter.

[BGG]: https://www.boardgamegeek.com/

**Warning**: This is not an official Google or Dart project.

## Usage

```dart
// Prints the game matching ID#2536.
//
// Then prints all games with "Letters" in the title.
main() async {
  var http = new BggHttp();
  var bgg = new Bgg(http);
  var result = await bgg.getBoardGame(2536);
  print(result.name);
  
  var search = await bgg.searchGames('Letters');
  print('\nGames matching "Letters": ');
  print('* ' + search.map((r) => r.name).toList().join('\n* '));
  http.close();
}
```
