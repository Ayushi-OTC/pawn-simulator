# README

Description:

-  The application is a simulation of a pawn moving on a square board of dimensions 8 units x 8 units.

-  There are no other obstructions on the board.

-  The pawn is free to roam around the surface of the board but must be prevented from falling. Any movement that would result in the pawn falling from the board must be prevented however further valid movement commands must still be allowed.

- The very first command to the pawn simulator is a PLACE command with valid inputs. For Example - PLACE 0,3,NORTH,WHITE

- The valid colour to the PLACE command is WHITE or BLACK.

- The first time that the pawn moves, it can move 1 or 2 squares. After this all the following MOVE commands can only move the pawn by one step.

- The origin (0,0) here is considered to be the SOUTH WEST most corner, facing pawn in the NORTH direction.

- LEFT and RIGHT will rotate the pawn 90 degrees in the specified direction without changing the position of the pawn.

- REPORT will announce the X,Y,F and C of the pawn.

- Valid commands are as follows -
  
  PLACE X,Y,F,C

  MOVE X

  LEFT

  RIGHT

  REPORT

Example Input and Output -

i. PLACE 0,0,NORTH,WHITE
   MOVE 1
   REPORT
   Output: 0,1,NORTH,WHITE

ii. PLACE 0,0,NORTH,BLACK
    LEFT
    REPORT
    Output: 0,0,WEST,BLACK

iii. PLACE 1,2,EAST,BLACK
     MOVE 2
     MOVE 1
     LEFT
     MOVE
     REPORT
     Output: 3,3,NORTH,BLACK

In order to play the pawn simulation game, following command can be used -

ruby execute/execute.rb
