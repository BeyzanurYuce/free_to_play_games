import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game.dart';


class Games with ChangeNotifier {
  String typeOfGame = 'All';
  final List<Game> _items = [
    Game(
      id: '1',
      title: 'Dauntless',
      thumbnail_Url: 'https://www.freetogame.com/g/1/thumbnail.jpg',
      shortDescription:
      'A free-to-play, co-op action RPG with gameplay similar to Monster Hunter.',
      genre: 'MMORPG',
    ),
    Game(
      id: '2',
      title: 'World of Tanks',
      thumbnail_Url: 'https://www.freetogame.com/g/2/thumbnail.jpg',
      shortDescription:
      'If you like blowing up tanks, with a quick and intense game style you will love this game!',
      genre: 'Shooter',
    ),
    Game(
      id: '3',
      title: 'Warframe',
      thumbnail_Url: 'https://www.freetogame.com/g/3/thumbnail.jpg',
      shortDescription:
      'A cooperative free-to-play third person online action shooter set in an stunning sci-fi world.',
      genre: 'Shooter',
    ),
    Game(
      id: '4',
      title: 'CRSED: F.O.A.D.',
      thumbnail_Url: 'https://www.freetogame.com/g/4/thumbnail.jpg',
      shortDescription:
      'Take the battle royale genre and add  mystical powers and you have CRSED: F.O.A.D. (Aka Cuisine Royale: Second Edition)',
      genre: 'Shooter',
    ),
    Game(
      id: '5',
      title: 'Crossout',
      thumbnail_Url: 'https://www.freetogame.com/g/5/thumbnail.jpg',
      shortDescription: 'A post-apocalyptic MMO vehicle combat game!',
      genre: 'Shooter',
    ),
    Game(
      id: '6',
      title: 'Blade and Soul',
      thumbnail_Url: 'https://www.freetogame.com/g/6/thumbnail.jpg',
      shortDescription:
      'A free-to-play martial arts MMORPG that tasks players with learning combination attacks.',
      genre: 'MMORPG',
    ),
    Game(
      id: '7',
      title: 'Armored Warfare',
      thumbnail_Url: 'https://www.freetogame.com/g/7/thumbnail.jpg',
      shortDescription:
      'A modern team-based MMO tank game from Obsidian Entertainment.',
      genre: 'Shooter',
    ),
    Game(
      id: '8',
      title: 'Trove',
      thumbnail_Url: 'https://www.freetogame.com/g/8/thumbnail.jpg',
      shortDescription:
      'A free to play Sandbox massively multiplayer online role-playing game!',
      genre: 'MMORPG',
    ),
    Game(
      id: '9',
      title: 'World of Warships',
      thumbnail_Url: 'https://www.freetogame.com/g/9/thumbnail.jpg',
      shortDescription:
      'A 3D free to play naval action-themed MMO from the creators of World of Tanks!',
      genre: 'Shooter',
    ),
    Game(
      id: '10',
      title: 'ArcheAge',
      thumbnail_Url: 'https://www.freetogame.com/g/10/thumbnail.jpg',
      shortDescription:
      'A free-to-play, hybrid fantasy/sandbox MMORPG brought to you by Trion Worlds.',
      genre: 'MMORPG',
    ),
  ];

  List<Game> currentList() {
    if (typeOfGame == 'All') {
      return _items;
    }
    List<Game> newList =
    _items.where((game) => game.genre == typeOfGame).toList();
    return newList;
  }

  void changeTypeOfGameInMain(String currentType) {
    typeOfGame = currentType;
    notifyListeners();
  }

  void addingNewGameMethod(Game newGame) {
    _items.add(newGame);
  }
}

class GameDetail extends StatefulWidget {
  int index;


  GameDetail({required this.index});

  @override
  _GameDetailState createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          Provider.of<Games>(context, listen: false)._items[widget.index].title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              Provider.of<Games>(context, listen: false)
                  .currentList()[widget.index]
                  .thumbnail_Url,
              width: size.width,
              height: (size.height / 2),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                Provider.of<Games>(context, listen: false)
                    .currentList()[widget.index]
                    .genre,
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                Provider.of<Games>(context, listen: false)
                    .currentList()[widget.index]
                    .shortDescription,
                style: TextStyle(color: Colors.black, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}