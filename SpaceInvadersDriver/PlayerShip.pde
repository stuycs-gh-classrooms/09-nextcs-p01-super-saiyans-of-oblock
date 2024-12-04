public class PlayerShip {
  
  // actual x and y
  private int x;
  private int y;
  
  // projectiles
  private Projectile[] spots;
  
  public PlayerShip(int x, int y) {
    this.x = x;
    this.y = y;
    spots = new Projectile[30]; // have 30 projectiles
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
    int xDiff = (int)Math.abs(p.getXY().x - x);
    int yDiff = (int)Math.abs(p.getXY().y - y);
    if (xDiff <= p.getDiameter()/*/2*/ && yDiff <= p.getDiameter()/*/2*/) {
      isHit = true;
    }
    return isHit;
  }
  
  public void createAttack() {
    for (int c=0;c<spots.length;c++) {
      if (spots[c]==null) {
        spots[c] = new Projectile(x,y-pDiameter,ppSpeed,pDiameter);
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
      } else {
        createAttack();
      }
    }
  }
  
  public void drawShip() {
    fill(playerColor);
    triangle(x,y+shipDiameter/2,x+shipDiameter/2,y+shipDiameter/2,x-shipDiameter/2,y+shipDiameter/2);
    /*fill(backgroundC);
    triangle();*/
  }
  
  public Projectile[] getProjectiles() {
    return spots;
  }
  
}
