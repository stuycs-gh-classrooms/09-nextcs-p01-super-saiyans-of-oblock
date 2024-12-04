public class Projectile {
  
  // var declarations
  int x;
  int y;
  int pSpeed; // negative goes upwards
  // i want to add angle eventually xd what do you think vincent - edgar
  int diameter;
  
  public Projectile(int x, int y, int speed, int diameter) {
    this.x = x;
    this.y = y;
    pSpeed = speed;
    this.diameter = diameter; // want to add this so you can charge up bigger attacks / send smaller ones
  }
  
  // draws it
  public void drawProjectile() {
    fill(projectileColor);
    circle(x,y,diameter);
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
  
  public int getDiameter() {
    return diameter;
  }
  
  
}
