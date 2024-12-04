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
    for (int c=0;c<p.length;c++) {
      if (p[c]!=null && p[c].getTeam()==player) {
        int xDifference = (int)Math.abs(p[c].getXY().x - xLoc);
        int yDifference = (int)Math.abs(p[c].getXY().y - yLoc);
        if (xDifference <= p[c].getDiameter()/2 && yDifference <= p[c].getDiameter()/2) {
          didGetHit = true;
        }
          
      }
    }
    return didGetHit;
  }
  
  public void sendAttack() {
    
  }
  
}
