PImage backgroundImage;
PImage startBackground;
PImage playerImage;
PImage coinImage;
PImage bombImage;
PImage goldbarImage;

int playerX, playerY;
int coinX, coinY;
int bombX, bombY;
int goldbarX, goldbarY;
int score = 0;
int bombSpeed = 3;
int bombPoints = -1;
int goldbarPoints = 2;

boolean gameStarted = false;
int countdown = 10 * 50; 

void setup() {
  size(500, 550);
  playerX = width / 2;
  playerY = height - 100;
  coinX = (int) random(width);
  coinY = 20;
  bombX = (int) random(width);
  bombY = 20;
  goldbarX = (int) random(width);
  goldbarY = 20;

  playerImage = loadImage("Player.png");
  playerImage.resize(40, 40);

  coinImage = loadImage("coin.jpg");
  coinImage.resize(20, 20);

  bombImage = loadImage("bomb.png");
  bombImage.resize(50, 50);

  goldbarImage = loadImage("goldbar.png");
  goldbarImage.resize(30, 30);

  backgroundImage = loadImage("background.jpg");
  backgroundImage.resize(width, height);

  startBackground = loadImage("start_screen_background.jpg");
  startBackground.resize(width, height);
}

void draw() {
  if (!gameStarted) {
    image(startBackground, 0, 0);
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Click to Start", width / 2, height / 2 + 70);
  } else if (countdown > 0) {
    image(backgroundImage, 0, 0);
    fill(255);
    textSize(20);
    text("Score: " + score, 20 + 40, 20);
    int seconds = countdown / 60;
    text("Time: " + seconds, width - 100, 20);

    countdown--;

    image(playerImage, playerX, playerY);
    imageMode(CENTER);
    image(coinImage, coinX, coinY);
    image(bombImage, bombX, bombY);
    image(goldbarImage, goldbarX, goldbarY);
    imageMode(CORNER);

    coinY += 2;
    if (coinY > height) {
      coinX = (int) random(0, width - 50);
      coinY = 20;
    }

    bombY += bombSpeed;
    if (bombY > height) {
      bombX = (int) random(0, width - 50);
      bombY = 20;
    }

    goldbarY += 4;
    if (goldbarY > height) {
      goldbarX = (int) random(0, width - 50);
      goldbarY = 20;
    }

    if (dist(playerX + 10, playerY + 10, coinX, coinY) < 20) {
      score++;
      coinX = (int) random(0, width - 50);
      coinY = 20;
    }

    if (dist(playerX + 10, playerY + 10, bombX, bombY) < 20) {
      score += bombPoints;
      bombX = (int) random(0, width - 50);
      bombY = 20;
    }

    if (dist(playerX + 10, playerY + 10, goldbarX, goldbarY) < 20) {
      score += goldbarPoints;
      goldbarX = (int) random(0, width - 50);
      goldbarY = 20;
    }

    if (keyPressed) {
      if (keyCode == LEFT && playerX > 0) {
        playerX -= 5;
      } else if (keyCode == RIGHT && playerX < width - 20) {
        playerX += 5;
      }
    }
  } else {
    image(startBackground, 0, 0);
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Game Over", width / 2, height / 2 + 40);
    text("Score: " + score, width / 2, height / 2 + 80);
    text("Click to Restart", width / 2, height / 2 + 120);

    if (mousePressed) {
      restartGame();
    }
  }
}

void mousePressed() {
  if (!gameStarted) {
    gameStarted = true;
    countdown = 20 * 60;
  }
}

void restartGame() {
  score = 0;
  countdown = 20 * 60;
  playerX = width / 2;
  playerY = height - 100;
  coinX = (int) random(width);
  coinY = 20;
  bombX = (int) random(width);
  bombY = 20;
  goldbarX = (int) random(width);
  goldbarY = 20;
}
