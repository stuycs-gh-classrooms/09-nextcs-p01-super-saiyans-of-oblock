public class EvilShips {
  
  /*// column x and y - not actual x and y
  private int colX;
  private int rowY;*/

  // actual x and actual y
  private int xLoc;
  private int yLoc;
  
  // array for projectiles shot from this spaceship # spots is arbitrary but gives time for it to shoot
  private Projectile p;
  
  
  public EvilShips(int colX, int rowY) {
    /*this.colX = colX;
    this.rowY = rowY;*/
    xLoc = (colX+1) * shipDiameter;
    yLoc = (1+rowY) * shipDiameter;
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
    
    if (p!=null) {p.drawProjectile();}
  }
  
  void moveShip(int xAdd, int yAdd) {
    xLoc += xAdd;
    yLoc += yAdd;
    //System.out.println(xLoc);
    //System.out.println(yLoc);
  }
  
  public boolean shipGetsHit(Projectile[] p) {
    boolean didGetHit = false;
    for (int c=0;c<p.length;c++) {
      if (p[c]!=null && p[c].getTeam()==player) {
        int xDifference = (int)Math.abs(p[c].getXY().x - xLoc);
        int yDifference = (int)Math.abs(p[c].getXY().y - yLoc);
        if (xDifference <= p[c].getDiameter()*2 && yDifference <= p[c].getDiameter()*2) {
          didGetHit = true;
        }
          
      }
    }
    return didGetHit;
  }
  
  public boolean shipGotHit(Projectile p) {
    boolean didGetHit = false;
    if (p!=null && p.getTeam()==player) {
      int xDifference = (int)Math.abs(p.getXY().x - xLoc);
      int yDifference = (int)Math.abs(p.getXY().y - yLoc);
      if (xDifference <= p.getDiameter()*2 && yDifference <= p.getDiameter()*2) {
        didGetHit = true;
      }
    }
    return didGetHit;
  }
  
  private void createAttack() {
    p = new Projectile(xLoc,yLoc + shipDiameter/2, epSpeed,pDiameter);
  }
  
  public void manageProjectile() {
    if (p!=null) {
      p.move();
      if (p.getXY().y >= height) {
        createAttack();
      }
      //p.drawProjectile();
    } else if (random(1)<0.005) {
      createAttack();
    }
  }
  
  public Projectile getProjectile() {
    return p;
  }
  
  
}
