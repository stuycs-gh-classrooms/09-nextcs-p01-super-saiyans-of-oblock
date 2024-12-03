public class PlayerShip extends Ships {
  
  // column x and y - not actual x and y
  private int colX;
  private int rowY;
  
  // team
  private String team;
  
  // 
  
  public PlayerShip(int colX, int rowY) {
    this.colX = colX;
    this.rowY = rowY;
    team = player;
  }
  
  @Override
  public void setXY() {
    
  }
  
  @Override
  public PVector getXY() {
     return new PVector(colX,rowY);
  }
  
  @Override
  public void killShip() {
    
  }
  
  @Override
  public void sendAttack() {
    
  }
  
}
