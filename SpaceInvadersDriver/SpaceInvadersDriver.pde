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
final color backgroundC = color(100);
public final int shipDiameter = 20;
public color playerColor;
public color enemyColor;
public color projectileColor;
public int enemyShipSpeed;
public int enemySpeedDirection;
public int epSpeed; // enemy projectile speed
public int ppSpeed; // player projectile speed
public int pDiameter; // projectile diameter
public float angle; // angle of ship compared to mouse XY
public int waveNum; // current wave #
// setup
void setup() {
  size(400,400);
  isPaused = false;
  isGameOver = false;
  enemyShips = new EvilShips[4][10];
  livesLeft = 4;
  initialPlayerPos = new PVector(width/2, height - shipDiameter);
  pShip = new PlayerShip((int)random(width/2) + shipDiameter, height - shipDiameter);
  playerColor = color(#64FFC8);
  enemyColor = color(#FF1978);
  //enemyShipSpeed = 2;
  enemySpeedDirection = 1;
  enemyShipSpeed = 1;
  projectileColor = color(#C8C8FF);
  pDiameter = 5;
  spawnEnemyShips(enemyShips);
  background(backgroundC);
  epSpeed = 5;
  ppSpeed = -5;
  waveNum = 1;
  frameRate(60);
}

// draw
void draw() {
  // if game is unpaused and not lost
  if (!isPaused && !isGameOver) {
    
    if (frameCount%1==0) {moveEnemyShips();/*System.out.println("lol");*/}
    processCollisions(enemyShips);
    managePlayerAttack();
    //angle = atan2(mouseY - pShip.y, mouseX - pShip.x);
    if (frameCount % 5 == 0) {manageTheProjectiles();} // enemy projectiles
    System.out.println(livesLeft);
    animate();
    pShip.drawAmmo();
    if (frameCount % 10 == 0){
    int count = 0;
    for (int i = 0; i < enemyShips.length; i ++){
     for (int s = 0; s < enemyShips[i].length; s++){
       if(enemyShips[i][s] != null){
         count ++;
       }
     }
    }
    if (count == 0){
     waveNum ++;
     newWave(); 
    }
  }
    if (livesLeft<=-1) {loseScreen();}
  } else if (isPaused) {
    gamePaused();
  } else if (isGameOver) {
    
    loseScreen();
    
  }
}

// animate background with stars and stuff
void newWave(){
  textSize(20);
  text("Wave "+ waveNum, width/2, height/2);
  enemyShips = new EvilShips[4][10];
  spawnEnemyShips(enemyShips);
}
void animate() {
  background(backgroundC);
  for (int r=0;r<enemyShips.length;r++) {
    for (int c=0;c<enemyShips[r].length;c++) {
      if (enemyShips[r][c]!=null) {enemyShips[r][c].drawShip();}
    }
  }
  // players and their projectiles
  if (pShip!=null) {pShip.drawShip();}
}

// instantiate enemy ships
void spawnEnemyShips(EvilShips[][] b) {
  for (int r=0;r<b.length;r++) {
    for (int c=0;c<b[r].length;c++) {
      b[r][c] = new EvilShips(c,r);
    }
  }
}

// screen if you lose
void loseScreen() {
  background(255,0,0);
  textAlign(CENTER,CENTER);
  fill(255);
  textSize(width/20);
  text("You lose-click r to reset",width/2,height/2);
}

// if game paused
void gamePaused() {
  fill(255);
  //rect((width/2) - (width/10) - 50,50,50,300);
  //rect((width/2) + (width/10),50,50,300);
  rect(width/30,10,10,50);
  rect((width/30)+20,10,10,50);
}

// process collissions of both sides
void processCollisions(EvilShips[][] g) {
  // evil ships
  for (int r=0;r<g.length;r++) {
    for (int c=0;c<g[r].length;c++) {
      if (g[r][c]!=null && pShip!=null) {
        if (g[r][c].shipGetsHit(pShip.getProjectiles())) {
          for (int i=0;i<pShip.getProjectiles().length;i++) {
            if (pShip.getProjectiles()[i]!=null && g[r][c].shipGotHit(pShip.getProjectiles()[i])) {
              pShip.getProjectiles()[i] = null;
            }
          }
          g[r][c] = null;
        }
      }
    }
  }
  // player
  for (int r=0;r<enemyShips.length;r++) {
    for (int c=0;c<enemyShips[r].length;c++) {
      if (pShip!=null&&enemyShips[r][c]!=null&&pShip.shipGetsHit(enemyShips[r][c].getProjectile())) {
        livesLeft--;
        enemyShips[r][c].createAttack();
        if (livesLeft<=0) {
          loseScreen();
        }
      }
    }
  }
}

// move enemy ships
void moveEnemyShips() {
  boolean goDown = false;
  for (int r=0;r<enemyShips.length;r++) {
    for (int c=0;c<enemyShips[r].length;c++) {
      if (enemyShips[r][c]!=null) {
        if (enemyShips[r][c].getXY().x < shipDiameter) {
          enemySpeedDirection = 1;
          goDown = true;
          //System.out.println("go right");
        } else if (enemyShips[r][c].getXY().x > width - shipDiameter) {
          enemySpeedDirection = -1;
          goDown = true;
          //System.out.println("go left");
        }
      }
    }
  }
  for (int r=0;r<enemyShips.length;r++) {
    for (int c=0;c<enemyShips[r].length;c++) {
      if (enemyShips[r][c]!=null) {
        if (goDown) {
          enemyShips[r][c].moveShip(0,shipDiameter); // gotta fix this method and the encompassing
        }
        //System.out.println("should have moved");
        enemyShips[r][c].moveShip(/*shipDiameter * */ enemySpeedDirection,0);
      }
    }
  }
}

void manageTheProjectiles() {
  // enemy ones
  for (int r=0;r<enemyShips.length;r++) {
    for (int c=0;c<enemyShips[r].length;c++) {
      if (enemyShips[r][c]!=null) {
        enemyShips[r][c].manageProjectile();
      }
    }
  }
  /*// player ones
  if (pShip!=null) {
    for (int c=0;c<pShip.getProjectiles().length;c++) {
      pShip.manageAttack();
    }
  }*/
}

void managePlayerAttack() {
  if (pShip!=null) {
    pShip.manageAttack();
    pShip.drawAmmo();
  }
}

void sendPlayerAttack() {
  if (pShip!=null) {pShip.createAttack();}
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
  // regular here
  if (pShip!=null && !isPaused && !isGameOver) {
    
    
    
    if (keyCode==LEFT && pShip.getXY().x >= shipDiameter) {
      pShip.moveX(-shipDiameter/2);
    }
    if (keyCode==RIGHT && pShip.getXY().x <= width - shipDiameter) {
      pShip.moveX(shipDiameter/2);
    }
    if (key == ' ') {
      sendPlayerAttack();
    }
    
    
  }
}

// mouse input
void mousePressed() {
  pShip.createAttack();
}
