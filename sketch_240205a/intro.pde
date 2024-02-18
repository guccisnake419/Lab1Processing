
void intro_draw(){
  // Main menu GUI
  pushStyle();
  fill(0);
  textSize(18);
  image(img, 50, 20);
  image(img2, 250, 20, 150, 150);

  textAlign(CENTER);
  text("Press 'F' for Fitness Mode", width/2, 300);
  text("Press 'R' for Relaxed/Stressed Mode", width/2, 350);
  text ("Press 'I' for instructions", width/2, 400);
  popStyle();
  
}
