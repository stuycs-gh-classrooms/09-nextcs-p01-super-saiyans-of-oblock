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
public int epSpeed; // enemy projectile speed
public int ppSpeed; // player projectile speed
public int pDiameter; // projectile diameter

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
  pDiameter = 5;
  spawnEnemyShips(enemyShips);
  background(backgroundC);
  epSpeed = 5;
  ppSpeed = -5;
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

// process collissions of both sides
void processCollisions(Projectile p, EvilShips[][] g, PlayerShip player) {
  // evil ship
  for (int r=0;r<g.length;r++) {
    for (int c=0;c<g[r].length;c++) {
      if (g[r][c]!=null) {
        
      }
    }
  }
  // player
  
}

void moveProjectiles() {
  
}


// key pressed
void keyPressed() {
  if (key=='r') {
    setup();
  }
  if (key=='p') {
    if (isPaused) {
      isPaused = false;
    } else if (isPaused==false) {
      isPaused = true;
    }
  }
}

// mouse input
void mousePressed() {
  
}
