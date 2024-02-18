int current_heartrate2 = 0;
long starttime= 0;
long difference = 0;
int blood_oxylvl2= 0;
int conf2= 0;
void intro_draw(){
  // Main menu GUI
  //background(255);
  if (millis() - lastColorChangeTime > 2000) {
    // Change the background color to the next color in the array
    background(colors[currentColorIndex]);
    
    // Increment the current color index, and wrap around if needed
    currentColorIndex = (currentColorIndex + 1) % colors.length;
    
    // Update lastColorChangeTime to the current time
    lastColorChangeTime = millis();
  }
  else{
     background(colors[currentColorIndex]);
  }
  pushStyle();
  
  //rectMode(CENTER);
  //rect(width / 2, height / 2,495 , 495);
  fill(0);
  textSize(24);
  image(img, 180, 20);
  //image(img2, 250, 20, 150, 150);

  textAlign(CENTER);
  String u= "Current heart rate: "+ String.valueOf(int (current_heartrate2));
  String v= "Time since last beat: "+String.valueOf(difference)+"ms" ;
  String w= "Blood oxygen level: "+ String.valueOf(blood_oxylvl2);
  String x= "Confidence: "+ String.valueOf(conf2);
  
  text(u, width/2, 250);
  text(v, width/2, 325);
  text(w, width/2, 275);
  text(x, width/2, 300);
  textSize(18);
  
  text("Press 'F' for Fitness Mode", width/2, 450);
  text("Press 'R' for Relaxed/Stressed Mode", width/2,475 );
  
  popStyle();
  //delay(5);
  
}
