PImage playerImage;
PImage coinImage;
int playerX, playerY; // 玩家的位置
int coinX, coinY;     // 金幣的位置
int score = 0;        // 得分

void setup() {
  size(400, 450);
  playerX = width / 2;
  playerY = height - 40;
  coinX = (int) random(width);
  coinY = 20;
  
  // 載入玩家圖示
  playerImage = loadImage("Player.png");
  playerImage.resize(40, 40);
  
  // 載入金幣圖示
  coinImage = loadImage("coin.png");
  coinImage.resize(50, 50);
}

void draw() {
  background(220);
  
  // 顯示得分
  fill(0);
  textSize(16);
  text("Score: " + score, 10, 20);
  
  // 繪製玩家
  image(playerImage, playerX, playerY);
  
  // 繪製金幣
  image(coinImage, coinX, coinY);
  
  // 移動金幣
  coinY += 3;
  if (coinY > height) {
    coinX = (int) random(width);
    coinY = 20;
  }
  
  // 檢查是否接住金幣
  if (dist(playerX + 10, playerY + 10, coinX, coinY) < 20) {
    score++;
    coinX = (int) random(width);
    coinY = 20;
  }
  
  // 移動玩家
  if (keyPressed) {
    if (keyCode == LEFT && playerX > 0) {
      playerX -= 5;
    } else if (keyCode == RIGHT && playerX < width - 20) {
      playerX += 5;
    }
  }
}
