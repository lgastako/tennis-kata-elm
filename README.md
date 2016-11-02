# tennis kata

from http://blog.ploeh.dk/2016/02/10/types-properties-software-designing-with-types/

- Each player can have either of these points in one game: Love, 15, 30, 40.
- If you have 40 and you win the ball, you win the game. There are, however, special rules.
- If both have 40, the players are deuce.
  - If the game is in deuce, the winner of a ball will have advantage and game ball.
  - If the player with advantage wins the ball, (s)he wins the game.
  - If the player without advantage wins, they are back at deuce.
