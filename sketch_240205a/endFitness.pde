void endFitness_draw(){
  pushStyle();
  background(255);
  fill(0);
  textSize(30);
  textAlign(CENTER);
  text("EXERCISE ZONES", width/2, 30);
  
  // Define background colors for each zone
  fill(255, 0, 0); // Red for MAXIMUM zone
  rect(50, 40, width - 100, 40);
  
  fill(255, 165, 0); // Orange for HARD zone
  rect(50, 85, width - 100, 40);
  
  fill(255, 255, 0); // Yellow for MODERATE zone
  rect(50, 130, width - 100, 40);
  
  fill(0, 255, 0); // Green for LIGHT zone
  rect(50, 175, width - 100, 40);
  
  fill(135, 206, 250); // Light blue for VERY LIGHT zone
  rect(50, 220, width - 100, 40);
  
  fill(0);
  String u="MAXIMUM: "+zones.get(0).hour() + ":" + nf(zones.get(0).minute(), 2) + ":" +
   nf(zones.get(0).second(), 2) + ":" + nf(zones.get(0).millis(), 3);
   String v="HARD: "+zones.get(1).hour() + ":" + nf(zones.get(1).minute(), 2) + ":" +
   nf(zones.get(1).second(), 2) + ":" + nf(zones.get(1).millis(), 3);
   String w="MODERATE: "+zones.get(2).hour() + ":" + nf(zones.get(2).minute(), 2) + ":" +
   nf(zones.get(2).second(), 2) + ":" + nf(zones.get(2).millis(), 3);
   String x="LIGHT: "+zones.get(3).hour() + ":" + nf(zones.get(3).minute(), 2) + ":" +
   nf(zones.get(3).second(), 2) + ":" + nf(zones.get(3).millis(), 3);
   String y="VERY LIGHT: "+zones.get(4).hour() + ":" + nf(zones.get(4).minute(), 2) + ":" +
   nf(zones.get(4).second(), 2) + ":" + nf(zones.get(4).millis(), 3);
  
  text(u, width/2, 70);
  text(v, width/2, 115);
  text(w, width/2, 165);
  text(x, width/2, 210);
  text(y, width/2, 250);
  textSize(18);
  text("Press 'F' for Fitness Mode", width/2, 425);
  text("Press 'R' for Relaxed/Stressed Mode", width/2, 450);
  text ("Press 'H' for Home ", width/2, 475);
  timer_button.moveTo(10, 900);
  endf_button.moveTo(300, 900);
  popStyle();
}
