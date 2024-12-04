// EDGAR AND VINCENT


// variable declaration
boolean isPaused;
boolean isGameOver;
PlayerShip pShip;
public EvilShips[][] enemyShips;
public final String enemy = "enemy";
public final String player = "player";
int livesLeft;
PVector initialPlayerPos;
final color backgroundC = color(10);
public final int shipDiameter = 20;
public color playerColor;
public color enemyColor;
public color projectileColor;

// setup
void setup() {
  size(400,400);
  isPaused = false;
  isGameOver = false;
  // did this cause ima make each ship 20 pixels diameter
  enemyShips = new EvilShips[4][10];
  livesLeft = 4;
  initialPlayerPos = new PVector(width/2, height - shipDiameter);
  createPlayerShip(pShip);
  playerColor = color(#64FFC8);
  enemyColor = color(#FF1978);
  projectileColor = color(#C8C8FF);
  spawnEnemyShips(enemyShips);
  background(backgroundC);
}

// draw
void draw() {
  // if game is unpaused and not lost
  if (!isPaused && !isGameOver) {
    
    
    
    
    
  } else if (isPaused) {
    gamePaused();
  } else if (isGameOver) {
    loseScreen();
  }
}

// animate background with stars and stuff
void animateBackground() {
  background(backgroundC);
}

// instantiate enemy ships
void spawnEnemyShips(EvilShips[][] b) {
  for (int r=0;r<b.length;r++) {
    for (int c=0;c<b[r].length;c++) {
      b[r][c] = new EvilShips(c,r);
    }
  }
}

// moves enemy ships
void moveEnemyShips() {
  
}

// screen if you lose
void loseScreen() {
  
}

// just new player ship - no points lost
void createPlayerShip(PlayerShip pLol) {
  pLol = new PlayerShip((int)initialPlayerPos.x,(int)initialPlayerPos.y);
}

// what to do when your player ship gets hit
void playerHit() {
  
}

// if game paused
void gamePaused() {
  
}


// key pressed
void keyPressed() {
  
}

// mouse input
void mousePressed() {
  
}
