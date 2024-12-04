public class Projectile {
  
  // var declarations
  int x;
  int y;
  int pSpeed; // negative goes upwards
  // i want to add angle eventually xd what do you think vincent - edgar
  
  public Projectile(int x, int y, int speed) {
    this.x = x;
    this.y = y;
    pSpeed = speed;
  }
  
  // draws it
  public void drawProjectile() {
    
  }
  
  // moves it
  public void move() {
    // will add angle implementation if vincent is ok with it
    y += pSpeed;
  }
  
  // get coords
  public PVector getXY() {
    return new PVector(x,y);
  }
  
  
}
