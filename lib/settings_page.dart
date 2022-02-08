import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'games.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String selectionOfTypeOfGames = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          RadioListTile<String>(
            groupValue: selectionOfTypeOfGames,
            value: 'Shooter',
            title: Text('Shooter'),
            onChanged: (value) {
              setState(() {
                selectionOfTypeOfGames = value!;
              });
            },
          ),
          RadioListTile<String>(
            groupValue: selectionOfTypeOfGames,
            value: 'MMOFPS',
            title: Text('MMOFPS'),
            onChanged: (value) {
              setState(() {
                selectionOfTypeOfGames = value!;
              });
            },
          ),
          RadioListTile<String>(
            groupValue: selectionOfTypeOfGames,
            value: 'PvP',
            title: Text('PvP'),
            onChanged: (value) {
              setState(() {
                selectionOfTypeOfGames = value!;
              });
            },
          ),
          RadioListTile<String>(
            groupValue: selectionOfTypeOfGames,
            value: 'MMORPG',
            title: Text('MMORPG'),
            onChanged: (value) {
              setState(() {
                selectionOfTypeOfGames = value!;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<Games>(context, listen: false)
                  .changeTypeOfGameInMain(selectionOfTypeOfGames);
              print(selectionOfTypeOfGames);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrange,
            ),
            child: Text(
              'OK',
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}