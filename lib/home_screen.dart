import 'package:flutter/material.dart';

import 'game_logic.dart';



class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  String activePlayer = 'X';
  bool isSwitched = false;
  int turn = 0;
  String result = '';
  Game game = Game();
  bool gameOver = false;

  _onTap(index, activePlayer)  async{
    game.playGame(index, activePlayer);
    _updateState();
    if (isSwitched && !gameOver && turn != 9) {
      print(turn);
      print(isSwitched);
       await game.autoPlay();
      _updateState();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        body: SafeArea(
            child: Center(
            child: Column(
                children: [
                  SwitchListTile.adaptive(
                    tileColor:Colors.black ,
                   // selectedTileColor: backgroundColor: ,
                      title: const Text(
                        "Turn on/off Two Player",
                        style: TextStyle(backgroundColor: Colors.black,fontSize: 28, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      value: isSwitched,
                      onChanged:(value) {
                        setState(() {
                          isSwitched = value;
                        });

                      }),
                  Text(
                    "It'S $activePlayer TURN",
                    style: const TextStyle(fontSize: 32),
                  ),
                  Expanded(
                    child: GridView.count(
                        padding: const EdgeInsets.all(16),
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1,
                        children: List.generate(9, (index) =>
                            InkWell(borderRadius:BorderRadius.circular(16) ,
                                onTap: () =>(!gameOver &&
                                !Player.playerX.contains(index)&&
                                !Player.playerO.contains(index))?
                                _onTap(index, activePlayer):
                                 null,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16)
                                      , color: Theme
                                      .of(context)
                                      .secondaryHeaderColor),
                                  child: Center(child:
                                  Player.playerX.contains(index) ?
                                  const Text("X", style: TextStyle(
                                      color: Colors.blue, fontSize: 52),)
                                      : Player.playerO.contains(index) ?
                                  const Text("O", style: TextStyle(
                                      color: Colors.red, fontSize: 52))
                                      : const Text("")),

                                )
                            ),
                        )),

                  ),

                  Text(
                    result,
                    style: const TextStyle(fontSize: 42, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton.icon(
                      onPressed: () => restart(),
                      icon: const Icon(Icons.restart_alt),
                      label: const Text("Repeat  The Game "))
                ]))));
  }

  _updateState() {
    setState(() {
      turn++;
      activePlayer == "X" ? activePlayer = "O" : activePlayer = "X";
      String winner = game.checkWinner();
      if (winner != "" && !gameOver){
        result = "$winner is the  Winner";
        gameOver = true;
      }
      else if(turn == 9 ){
        result = "It\'s Draw";
      }
    });
  }

  restart() {

    Player.playerO.clear();
    Player.playerX.clear();
    activePlayer = "";
    isSwitched = false;
     gameOver = false;
     turn = 0;
     result = "";
    print(activePlayer);
    _updateState();
    print(activePlayer);
    print("${Player.playerX}");

  }

}