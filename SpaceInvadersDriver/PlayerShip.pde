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
  public void DrawAmmo(){ // draws the current player ammo on the side
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
        spots[c].move();
        if (spots[c].getXY().y <= 0) {
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
    //translate(x,y);
    float Rx = x+cos(angle)*30;
    float Ry = y+sin(angle)*30;
    float Rx2 = x+cos(angle+PI/2)*5;
    float Ry2 = x+sin(angle+PI/2)*5;
    float Rx3 = x+cos(angle-PI/2)*5;
    float Ry3 = x+sin(angle-PI/2)*5;
    //println(sin(angle)*30);
   triangle(x,y-shipDiameter/2,x+shipDiameter/2,y+shipDiameter/2,x-shipDiameter/2,y+shipDiameter/2);
    //triangle(Rx,Ry-shipDiameter/2,Rx+shipDiameter/2,Ry+shipDiameter/2,Rx-shipDiameter/2,Ry+shipDiameter/2);
    //triangle(Rx,Ry,Rx2,Ry2,Rx3,Ry3);
    //translate(-x,-y);
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
