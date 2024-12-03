public class EvilShips extends Ships {
  
  // column x and y - not actual x and y
  private int colX;
  private int rowY;
  
  // team
  private String team;
  
  // 
  
  
  public EvilShips(int colX, int rowY) {
    this.colX = colX;
    this.rowY = rowY;
    team = enemy;
  }
  
  @Override
  public void setXY() {
    
  }
  
  @Override
  public PVector getXY() {
    return new PVector();
  }
  
  @Override
  public void killShip() {
    
  }
  
  @Override
  public void sendAttack() {
    
  }
  
}
