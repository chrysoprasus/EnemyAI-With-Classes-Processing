/*
* This is a simple enemyAI class that makes a enemy that call follow the player!
*
*
* Author: James Logan
* Verison 1.5
*/


//Player Vars
Player player1;
PVector playerPos = new PVector(width*0.75, height*0.75);
int playerSize = 30;
int playerSpeed = 5;
int pHealth = 100;

boolean playerDamaged = false;

EnemyAI simpleEnemy;

//player movement
void keyPressed() {
  player1.pressed((key == 'a' || key == 'A'), (key == 'd' || key == 'D'), (key == 'w' || key == 'W'), (key == 's' || key == 'S'));
}
void keyReleased() {
  player1.released((key == 'a' || key == 'A'), (key == 'd' || key == 'D'), (key == 'w' || key == 'W'), (key == 's' || key == 'S'));
}


//------------------------------set up
void setup() {
  frameRate(60);
  size(960, 970);
  ellipseMode(RADIUS);
  
  //Initialize player
  player1 = new Player(playerPos.x, playerPos.y, playerSize, playerSpeed, pHealth);
  
  //Initialize EnemyAI              
  simpleEnemy = new EnemyAI(player1, 30, 2, 100);
  
}

void draw(){
  background(0);
  
  //Draw Player
  player1.run();
  
  //Draw EnemyAI
  simpleEnemy.create();
}
