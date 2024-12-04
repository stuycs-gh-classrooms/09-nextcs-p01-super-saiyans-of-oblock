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
  
  public void setXY() {
    
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
      
    }
  }
  
  public void manageAttack() {
    
  }
  
  public void drawShip() {
    
  }
  
  public Projectile[] getProjectiles() {
    return spots;
  }
  
}
