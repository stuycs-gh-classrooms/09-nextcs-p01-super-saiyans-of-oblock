public class EvilShips {
  
  // column x and y - not actual x and y
  private int colX;
  private int rowY;

  // actual x and actual y
  private int xLoc;
  private int yLoc;
  
  public EvilShips(int colX, int rowY) {
    this.colX = colX;
    this.rowY = rowY;
    xLoc = colX * shipDiameter;
    yLoc = rowY * shipDiameter;
  }
  
  public void setXY(int x, int y) {
    xLoc = x;
    yLoc = y;
  }
  
  public PVector getXY() {
    return new PVector(xLoc,yLoc);
  }
  
  public void drawShip() {
    fill(enemyColor);
    triangle(xLoc,yLoc+shipDiameter/2, 
    xLoc+shipDiameter/2,yLoc-shipDiameter/2,
    xLoc-shipDiameter/2,yLoc-shipDiameter/2);
    fill(backgroundC);
    triangle(xLoc,yLoc+shipDiameter/4,
    xLoc+shipDiameter/2,yLoc-shipDiameter/2,
    xLoc-shipDiameter/2,yLoc-shipDiameter/2);
  }
  
  public boolean shipGetsHit(Projectile[] p) {
    boolean didGetHit = false;
    for () {
      
    }
    return didGetHit;
  }
  
  public void sendAttack() {
    
  }
  
}
