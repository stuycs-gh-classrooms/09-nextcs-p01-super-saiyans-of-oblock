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
    if (p!=null) {
      int xDiff = (int)Math.abs(p.getXY().x - x);
      int yDiff = (int)Math.abs(p.getXY().y - y);
      if (xDiff <= p.getDiameter()*1.5 && yDiff <= p.getDiameter()*1.5) {
        isHit = true;
      }
    }
    return isHit;
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
  
  public void drawShip() {
    fill(playerColor);
    triangle(x,y-shipDiameter/2,x+shipDiameter/2,y+shipDiameter/2,x-shipDiameter/2,y+shipDiameter/2);
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
