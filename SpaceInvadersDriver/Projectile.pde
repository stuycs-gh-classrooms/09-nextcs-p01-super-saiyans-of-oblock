public class Projectile {
  
  // var declarations
  int x;
  int y;
  int pSpeed; // negative goes upwards
  // i want to add angle eventually xd what do you think vincent - edgar
  int diameter;
  final int playerX;
  final int playerY;
  float xdiff;
  float ydiff;
  public Projectile(int x, int y, int speed, int diameter) {
    this.x = x;
    this.y = y;
    pSpeed = speed;
    this.diameter = diameter; // want to add this so you can charge up bigger attacks / send smaller ones
    playerX = mouseX; //saves current position of player mouse
    playerY = mouseY;
    xdiff = playerX-x;
    ydiff = abs(playerY-y);
}
  
  // draws it
  public void drawProjectile() {
    fill(projectileColor);
    circle(x,y,diameter);
    fill(0);
    circle (mouseX,mouseY,diameter);
  }
  
  // moves it
  public void move() {
    // will add angle implementation if vincent is ok with it
    y += pSpeed;
  }
  public void playerShoot(){

   y += pSpeed;
   x += xdiff/abs(ydiff/pSpeed);
  }
  public String getTeam() {
    // if bullet sent by player, return player - else enemy
    if (pSpeed <= 0) {
      return player;
    } else {
      return enemy;
    }
  }
  
  // get coords
  public PVector getXY() {
    return new PVector(x,y);
  }
  
  public int getDiameter() {
    return diameter;
  }
  
  
}
