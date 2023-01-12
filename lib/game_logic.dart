import 'dart:core';
import 'dart:math';

class Player {
  String activePlayer  = "X";
   static List<int> playerX =[];
   static List<int> playerO =[];
}
 extension ContainsALL on List{
   bool containsALL(x,y,{z}){
    if(z == null) {
      return contains(x) && contains(y);
    } else
        {
          return contains(x) && contains(y) && contains(z);
        }
  }

}
class Game{
  playGame(index ,activePlayer){
    activePlayer == "X"?
        Player.playerX.add(index):
        Player.playerO.add(index);

  }
   Future <void> autoPlay() async{
       List<int> emptyCells =[];
       int index;
       for(int i =0;i<9;i++)
         {
           if(!Player.playerX.contains(i) && !Player.playerO.contains(i) ){
             emptyCells.add(i);
           }
         }
       //start_center
       if(Player.playerO.containsALL(0,1) && emptyCells.contains(2))
         index = 2;
       else if(Player.playerO.containsALL(3,4) && emptyCells.contains(5))
         index = 5;
       else if( Player.playerO.containsALL(6,7) && emptyCells.contains(8))
         index = 8;
       else if(Player.playerO.containsALL(0,3) && emptyCells.contains(6))
         index = 6;
       else if(Player.playerO.containsALL(1,4) && emptyCells.contains(7))
         index = 7;
       else if(Player.playerO.containsALL(2,5) && emptyCells.contains(8))
         index = 8;
       else if(Player.playerO.containsALL(0,4) && emptyCells.contains(8))
         index = 8;
       else if(Player.playerO.containsALL(2,4) && emptyCells.contains(6))
         index = 6;

       //start_end
       else if(Player.playerO.containsALL(0,2) && emptyCells.contains(1))
         index = 1;
       else if(Player.playerO.containsALL(3,5) && emptyCells.contains(4))
         index = 4;
       else if( Player.playerO.containsALL(6,8) && emptyCells.contains(7))
         index = 7;
       else if(Player.playerO.containsALL(0,6) && emptyCells.contains(3))
         index = 3;
       else if(Player.playerO.containsALL(1,7)&& emptyCells.contains(4))
         index = 4;
       else if(Player.playerO.containsALL(2,8)&& emptyCells.contains(5))
         index = 5;
       else if(Player.playerO.containsALL(0,8)&& emptyCells.contains(4))
         index = 4;
       else if(Player.playerO.containsALL(2,6) && emptyCells.contains(4))
         index = 4;
       //center_end
       else if(Player.playerO.containsALL(1,2) && emptyCells.contains(0))
         index = 0;
       else if(Player.playerO.containsALL(4,5) && emptyCells.contains(3))
         index = 3;
       else if( Player.playerO.containsALL(7,8) && emptyCells.contains(6))
         index = 6;
       else if(Player.playerO.containsALL(3,6) && emptyCells.contains(0))
         index = 0;
       else if(Player.playerO.containsALL(4,7) && emptyCells.contains(1))
         index = 1;
       else if(Player.playerO.containsALL(5,8)&& emptyCells.contains(2))
         index = 2;
       else if(Player.playerO.containsALL(4,8)&& emptyCells.contains(0))
         index = 0;
       else if(Player.playerO.containsALL(4,6) && emptyCells.contains(2))
         index = 2;
       //start_center
       else if(Player.playerX.containsALL(0,1) && emptyCells.contains(2))
         index = 2;
       else if(Player.playerX.containsALL(3,4) && emptyCells.contains(5))
         index = 5;
       else if( Player.playerX.containsALL(6,7) && emptyCells.contains(8))
         index = 8;
       else if(Player.playerX.containsALL(0,3) && emptyCells.contains(6))
         index = 6;
       else if(Player.playerX.containsALL(1,4) && emptyCells.contains(7))
         index = 7;
       else if(Player.playerX.containsALL(2,5) && emptyCells.contains(8))
         index = 8;
       else if(Player.playerX.containsALL(0,4) && emptyCells.contains(8))
         index = 8;
       else if(Player.playerX.containsALL(2,4) && emptyCells.contains(6))
         index = 6;
       //start_end
       else if(Player.playerX.containsALL(0,2) && emptyCells.contains(1))
         index = 1;
       else if(Player.playerX.containsALL(3,5) && emptyCells.contains(4))
         index = 4;
       else if( Player.playerX.containsALL(6,8) && emptyCells.contains(7))
         index = 7;
       else if(Player.playerX.containsALL(0,6) && emptyCells.contains(3))
         index = 3;
       else if(Player.playerX.containsALL(1,7) && emptyCells.contains(4))
         index = 4;
       else if(Player.playerX.containsALL(2,8) && emptyCells.contains(5))
         index = 5;
       else if(Player.playerX.containsALL(0,8) && emptyCells.contains(4))
         index = 4;
       else if(Player.playerX.containsALL(2,6) && emptyCells.contains(4))
         index = 4;
       //center_end
       else if(Player.playerX.containsALL(1,2) && emptyCells.contains(0))
         index = 0;
       else if(Player.playerX.containsALL(4,5) && emptyCells.contains(3))
         index = 3;
       else if( Player.playerX.containsALL(7,8) && emptyCells.contains(6))
         index = 6;
       else if(Player.playerX.containsALL(3,6) && emptyCells.contains(0))
         index = 0;
       else if(Player.playerX.containsALL(4,7) && emptyCells.contains(1))
         index = 1;
       else if(Player.playerX.containsALL(5,8) && emptyCells.contains(2))
         index = 2;
       else if(Player.playerX.containsALL(4,8) && emptyCells.contains(0))
         index = 0;
        else if(Player.playerX.containsALL(6,4) && emptyCells.contains(2))
        index = 2;
     else {
    int randomNumber = Random().nextInt(emptyCells.length);
        index = emptyCells[randomNumber];
  }
       playGame(index, "O");
  }
  checkWinner(){
    String winner;
    if(Player.playerX.containsALL(0,1,z:2)||
        Player.playerX.containsALL(3,4,z:5)||
        Player.playerX.containsALL(6,7,z:8)||
        Player.playerX.containsALL(0,3,z:6)||
        Player.playerX.containsALL(1,4,z:7)||
        Player.playerX.containsALL(2,5,z:8)||
        Player.playerX.containsALL(0,4,z:8)||
        Player.playerX.containsALL(2,4,z:6)) winner ="X";
    else if(Player.playerO.containsALL(0,1,z:2)||
        Player.playerO.containsALL(3,4,z:5)||
        Player.playerO.containsALL(6,7,z:8)||
        Player.playerO.containsALL(0,3,z:6)||
        Player.playerO.containsALL(1,4,z:7)||
        Player.playerO.containsALL(2,5,z:8)||
        Player.playerO.containsALL(0,4,z:8)||
        Player.playerO.containsALL(2,4,z:6))
      winner ="O";
     else

      winner = "";
     return winner;


  }

}