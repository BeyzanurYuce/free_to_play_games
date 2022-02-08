import 'package:flutter/material.dart';
import 'game.dart';
import 'games.dart';
import 'package:provider/provider.dart';

class AddGames extends StatefulWidget {
  const AddGames({Key? key}) : super(key: key);

  @override
  _AddGamesState createState() => _AddGamesState();
}

class _AddGamesState extends State<AddGames> {
  String pictureUrlLink = '';

  TextEditingController idCtr = TextEditingController();
  TextEditingController titleCtr = TextEditingController();
  TextEditingController genreCtr = TextEditingController();
  TextEditingController shortDescriptionCtr = TextEditingController();
  TextEditingController imageUrlCtr = TextEditingController();

  FocusNode imageFocusNode = FocusNode();

  GlobalKey<FormState> textFieldsKey = GlobalKey<FormState>();

  @override
  void initState() {
    imageFocusNode.addListener(() {
      // print('has Focus: ${imageFocusNode.hasFocus}');
    });
    super.initState();
  }

  @override
  void dispose() {
    imageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'New Game',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (textFieldsKey.currentState!.validate()) {
                print('OK');
                Game newGame = Game(
                  id: idCtr.text,
                  title: titleCtr.text,
                  genre: genreCtr.text,
                  shortDescription: shortDescriptionCtr.text,
                  thumbnail_Url: imageUrlCtr.text,
                );
                Provider.of<Games>(context, listen: false)
                    .addingNewGameMethod(newGame);
                Navigator.pop(context);
              }
            },
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: textFieldsKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: idCtr,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please provide a value';
                    }
                  },
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'ID',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titleCtr,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please provide a value';
                    }
                  },
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: genreCtr,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please provide a value';
                    }
                  },
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Genre',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 2,
                  controller: shortDescriptionCtr,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter a description';
                    }
                  },
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'shortDescription',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      child: pictureUrlLink == ''
                          ? Text('Enter a Url')
                          : Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              pictureUrlLink,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: size.width - 124,
                      child: Focus(
                        onFocusChange: (hasFocus) {
                          if (!hasFocus) {
                            print('HelloMello');
                            setState(() {
                              pictureUrlLink = imageUrlCtr.text;
                            });
                          }
                        },
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please enter an image URL';
                            }
                          },
                          focusNode: imageFocusNode,
                          controller: imageUrlCtr,
                          decoration: InputDecoration(
                            labelText: 'Image URL',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
