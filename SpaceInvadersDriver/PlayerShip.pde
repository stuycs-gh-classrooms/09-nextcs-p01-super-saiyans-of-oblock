public class PlayerShip {
  
  // actual x and y
  private int x;
  private int y;
  
  // projectiles
  private Projectile[] spots;
  
  public PlayerShip(int x, int y) {
    this.x = x;
    this.y = y;
    spots = new Projectile[5]; // have 5 projectiles
  }
  
  public void setXY(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public PVector getXY() {
     return new PVector(x,y);
  }
  
  public boolean shipGetsHit(Projectile p) {
    boolean isHit = false;
    if (p!=null) {
      int xDiff = (int)Math.abs(p.getXY().x - x);
      int yDiff = (int)Math.abs(p.getXY().y - y);
      if (xDiff <= p.getDiameter()*1.5 && yDiff <= p.getDiameter()*1.5) {
        isHit = true;
      }
    }
    return isHit;
  }
  public void drawAmmo(){ // draws the current player ammo on the side
   int x = width - 20;
   int y = height - 100;
   rectMode(CORNERS);
   for(int i = 0;i <spots.length;i++){
     if (spots[i] == null){
     fill(255);
   rect(x,y,x+10,y+10);
   y += 15;
   //println(spots.length);
   }}
  }
  public void createAttack() {
    for (int c=0;c<spots.length;c++) {
      if (spots[c]==null) {
        spots[c] = new Projectile(x,y-pDiameter,ppSpeed,pDiameter);
        //spots[c].drawProjectile();
        //System.out.println("create attack before print");
        return;
      }
    }
  }
  
  public void manageAttack() {
    for (int c=0;c<spots.length;c++) {
      if (spots[c]!=null) {
        spots[c].playerShoot();
        if (spots[c].getXY().y <= 0 || spots[c].getXY().x <= 0 || spots[c].getXY().x >= width) {
          spots[c] = null;
        }
      }
    }
  }
  
  public Projectile[] getProjectiles() {
    return spots;
  }
  
  public void drawShip() { // tried to implement turning and directional aiming, went badly lol
    
    fill(playerColor);

    // calculate the angle to the mouse
    angle = atan2(mouseY - pShip.y, mouseX - pShip.x);

    // ship geometry parameters
    float tipLength = 30;  // Distance from center to the tip
    float baseWidth = 10;  // Half the width of the base

    // calculate the vertices
    float tipX = pShip.x + cos(angle) * tipLength;  // Tip of the triangle
    float tipY = pShip.y + sin(angle) * tipLength;

    float leftBaseX = pShip.x + cos(angle + PI / 2) * baseWidth;
    float leftBaseY = pShip.y + sin(angle + PI / 2) * baseWidth;

    float rightBaseX = pShip.x + cos(angle - PI / 2) * baseWidth;
    float rightBaseY = pShip.y + sin(angle - PI / 2) * baseWidth;

    // debugging
    println(degrees(angle));
   // println(tipX + ", " + tipY );
   // println(leftBaseX + ", " + leftBaseY );
  //  println( rightBaseX + ", " + rightBaseY );

    // draw the triangle
    triangle(tipX, tipY, leftBaseX, leftBaseY, rightBaseX, rightBaseY);

    // draw projectiles
    for (int c=0;c<spots.length;c++) {
      if (spots[c]!=null) {
        spots[c].drawProjectile();
      }
    }
  }
  
  public void moveX(int distance) {
    x += distance;
  }
  
}
