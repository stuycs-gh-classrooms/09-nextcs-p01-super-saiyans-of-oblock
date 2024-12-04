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
  
  public void setActualXY(int x, int y) {
    xLoc = x;
    yLoc = y;
  }
  
  public PVector getActualXY() {
    return new PVector(xLoc,yLoc);
  }
  
  public void drawShip() {
    
  }
  
  public void shipGetsHit() {
    
  }
  
  public void sendAttack() {
    
  }
  
}
