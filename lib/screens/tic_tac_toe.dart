import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_computing/config/extentions.dart';
import 'package:mobile_computing/config/simple_message_dialog.dart';
import 'package:mobile_computing/config/size_config.dart';
import 'package:toggle_switch/toggle_switch.dart';

enum AutoPlay { ON, OFF }

class GameKey {
  final int id;
  String text;
  Color color;
  Color bgColor;
  bool enabled;

  GameKey({
    this.id,
    this.text = "",
    this.color,
    this.bgColor,
    this.enabled = true,
  });
}

class TickTacToeScreen extends StatefulWidget {
  final String tag;

  const TickTacToeScreen({Key key, this.tag}) : super(key: key);

  @override
  _TickTacToeScreenState createState() => _TickTacToeScreenState();
}

class _TickTacToeScreenState extends State<TickTacToeScreen> {
  List<GameKey> gameButtons;
  var player1;

  var player2;

  var activePlayer;

  AutoPlay autoPlay;

  @override
  void initState() {
    autoPlay = AutoPlay.ON;
    gameButtons = _initButtons();
    super.initState();
  }

  List<GameKey> _initButtons() {
    player1 = new List();
    player2 = new List();
    activePlayer = 1;
    List<GameKey> buttons = [];
    for (var i = 0; i < 9; i++) {
      buttons.add(
          GameKey(id: i + 1, bgColor: Color(0xFF0E1C32), color: Colors.white));
    }
    return buttons;
  }

  _playGame(GameKey key) {
    setState(() {
      if (activePlayer == 1) {
        key.text = "X";
        key.color = Colors.green;
        key.bgColor = Colors.white;
        player1.add(key.id);
        activePlayer = 2;
      } else {
        key.text = "O";
        key.color = Theme.of(context).primaryColor;
        key.bgColor = Colors.white;
        player2.add(key.id);
        activePlayer = 1;
      }
      key.enabled = false;
      int winner = _checkWinner();
      if (winner == -1) {
        if (gameButtons.every((p) => p.text != "")) {
          _showResetMessage(context, "Game tied");
        } else {
          activePlayer == 2 ? _autoPlay() : null;
        }
      }
    });
  }

  void _autoPlay() {
    if (autoPlay == AutoPlay.ON) {
      var emptyCells = new List();
      var list = new List.generate(9, (i) => i + 1);
      for (var cellId in list) {
        if (!(player1.contains(cellId) || player2.contains(cellId))) {
          emptyCells.add(cellId);
        }
      }
      var r = new Random();
      var randIndex = r.nextInt(emptyCells.length - 1);
      var cellId = emptyCells[randIndex];
      int i = gameButtons.indexWhere((p) => p.id == cellId);
      _playGame(gameButtons[i]);
    }
  }

  int _checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }
    //check vertical possibilities
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }
    //check diagonal possibilities
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }
    if (winner != -1) {
      _showResetMessage(context, "Player $winner won");
    }
    return winner;
  }

  void _resetGame() {
    setState(() {
      gameButtons = _initButtons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Hero(
            tag: widget.tag,
            flightShuttleBuilder:
                (flightContext, animation, direction, fromContext, toContext) =>
                    SizedBox.shrink(),
            child: Text(
              "Tic Tac Toe",
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 22,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    bottom: SizeConfig.getProportionateScreenHeight(24)),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Auto Play",
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                              fontSize: SizeConfig.defaultSize * 2.4,
                            ),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionateScreenHeight(5),
                      ),
                      ToggleSwitch(
                        activeBgColor: Theme.of(context).primaryColor,
                        minWidth: SizeConfig.screenWidth * 0.3,
                        fontSize: SizeConfig.defaultSize * 1.8,
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.black26,
                        minHeight: SizeConfig.defaultSize * 6,
                        initialLabelIndex: autoPlay.index,
                        labels: [
                          "ON",
                          "OFF",
                        ],
                        onToggle: (index) {
                          setState(() {
                            autoPlay = AutoPlay.values[index];
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: gameButtons.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0),
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Container(
                        margin: EdgeInsets.all(SizeConfig.defaultSize),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: gameButtons[index].bgColor,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(4.0, 4.0),
                                color: Colors.grey[500].withOpacity(0.2),
                                spreadRadius: 1.0,
                                blurRadius: 15.0,
                              ),
                              BoxShadow(
                                offset: Offset(-4.0, -4.0),
                                color: Colors.white,
                                spreadRadius: 1.0,
                                blurRadius: 15.0,
                              ),
                            ],
                          ),
                          child: Text(
                            gameButtons[index].text,
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontSize: SizeConfig.defaultSize * 5.6,
                                      fontWeight: FontWeight.w600,
                                      color: gameButtons[index].color,
                                    ),
                          ),
                        ).ripple(gameButtons[index].enabled
                            ? () => _playGame(gameButtons[index])
                            : null),
                      ),
                      //
                    );
                  }),
            ],
          ),
        ));
  }

  void _showResetMessage(BuildContext context, String title) {
    MsgDialog.showMsgDialog(
        context: context,
        title: "$title",
        msg: "Tap on Reset to start again",
        positiveText: "Reset",
        negativeText: '',
        onPositivePressed: _resetGame);
  }
}
