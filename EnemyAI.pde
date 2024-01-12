/*
* Simple enemy that follows the player
*
*
* Author: James Logan
* Verison 1.5
*/

public class EnemyAI {
  
  //EnemyAI Vars
  PVector aiPos, aiVel, aiDecPos, aiDecVel;
  float aiSize;
  float playerSize;
  int aiHealth;


  //Dection zone radius
  int aiRadius = 200;
  //Array        dection zone(not hit)  dection zone(hit)      ai color
  color[] cols = {color(255, 0, 0, 50), color(0, 255, 0, 50), color(0, 0, 255)};

  //boolean
  boolean detected = false;
  boolean isAilve = true; // Death can be added


  //Player Vars
  PVector playerPos;
  Player pTarget;
  float sppeed;

  //            Target player,  EnemyAI size, EnemyAI speed, EnemyAI Health
  public EnemyAI(Player client, float aiSiz, float speed, int health) {
    //AI Vars
    aiPos = new PVector(width*0.1, height*0.5);
    aiVel = new PVector(2, 0);
    aiDecPos = new PVector(aiPos.x, aiPos.y);

    //Player vars
    pTarget = client;
    aiSize = aiSiz;
    playerSize = client.size;
    sppeed = speed;
    aiHealth = health;
  }

  //------------------------------------draw ai
  void create() {

    if (dist(pTarget.x, pTarget.y, aiPos.x, aiPos.y) < playerSize + aiSize) {

      playerDamaged = true;
    } else {
      //not colliding!
      playerDamaged = false;
    }


    //--------------------------------------player take damage from enemyAI
    if (playerDamaged == true) {
      player1.pHealth -= 1;
    } else {
      player1.pHealth = player1.pHealth;
    }


    //---------------------Check if player is in detection box
    if (dist(pTarget.x, pTarget.y, aiDecPos.x, aiDecPos.y) < playerSize + aiRadius) {
      //if in detection box
      detected = true;
      println("hit");
    } else {
      //if NOT in detection box
      detected = false;
    }

    //if detected is true move AI to player
    if (detected == true) {

      //Move AI to player
      playerPos = new PVector(pTarget.x, pTarget.y);
      PVector vel = PVector.sub(playerPos, aiPos);
      vel.setMag(sppeed);
      aiPos.add(vel);
      aiDecPos = aiPos;

      //Draw AI
      fill(0, 0, 255);
      ellipse(aiPos.x, aiPos.y, aiSize, aiSize);

      //Draw AI Hit Detector
      fill(cols[1]);
      ellipse(aiDecPos.x, aiDecPos.y, aiRadius, aiRadius);

      // if not hit set defult colour
    } else if (detected == false) {
      //Draw AI
      fill(cols[2]);
      ellipse(aiPos.x, aiPos.y, aiSize, aiSize);

      //Draw AI Hit Dector
      fill(cols[0]);
      ellipse(aiDecPos.x, aiDecPos.y, aiRadius, aiRadius);
    }
    //------------------------------------draw ai end
  }
}
