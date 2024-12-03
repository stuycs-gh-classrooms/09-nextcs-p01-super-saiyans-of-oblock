// EDGAR AND VINCENT


// variable declaration
boolean isPaused;
boolean isGameOver;
PlayerShip pShip;
EvilShips[][] enemyShips;
public final String enemy = "enemy";
public final String player = "player";
int livesLeft;
PVector initialPlayerPos;
color backgroundC;
public final int shipDiameter = 20;



// setup
void setup() {
  size(400,400);
  isPaused = false;
  isGameOver = false;
  // did this cause ima make each ship 20 pixels diameter
  enemyShips = new EvilShips[width/20][height/20];
  
  createPlayerShip(pShip);
  setupBoard();
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

// setup the board
void setupBoard() {
  background(backgroundC);
}

// animate background with stars and stuff
void animateBackground() {
  
}

// spawns enemy ships
void spawnEnemyShips() {
  
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
