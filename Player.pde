/*
* Simple player class
*
*
* Author: James Logan
* Verison 1.5
*/

public class Player {  
    //Player vars
    float x, y;
    float dx = 0, dy = 0;
    float pSpeed = 5;
    float speedY = 5;
    float size;
    int pHealth;
    PVector vel;

    public Player(float newX, float newY, float newSize, float speed, int health) {
        x = newX;
        y = newY;
        size = newSize;
        pSpeed = speed;
        pHealth = health;
        vel = new PVector();
    }
    
    //call funcations
    void run() {
        display();
        movePlayer();
        
    }

    //updates x and y
    void movePlayer() {
        x += vel.x;
        y += vel.y;
    }

    //draws enemyAI
    void display() {
        fill(255,0,255);
        ellipse(x, y, size, size);
    }

    //move when button is pressed
    void pressed(boolean left, boolean right, boolean up, boolean down) {
        if (left)  dx = -1;
        if (right) dx =  1;
        if (up)    dy = -1;
        if (down)  dy =  1;
        setVel();
        
    }
    
    //stop moving when keys released
    void released(boolean left, boolean right, boolean up, boolean down) { 
        if (left)  dx = 0;
        if (right) dx = 0;
        if (up)    dy = 0;
        if (down)  dy = 0;
        setVel();
    }
    
    //set velocity
    void setVel(){
        vel = new PVector(dx, dy);
        vel.setMag(pSpeed);

    }
}
