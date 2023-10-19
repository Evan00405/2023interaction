import processing.sound.*;
//http://processing.org/reference/libraries/sound/index.html
void setup() {
  size(300, 300);
  file = new SoundFile(this, "a.mp3");
  file.play();
  
}
void draw(){
  
}
