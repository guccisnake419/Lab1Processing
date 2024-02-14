void endFitness_draw(){
  pushStyle();
  background(255);
  fill(0);
  textSize(30);
  text("EXERCISE ZONES", 125, 25);
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
  text(u, 10,50);
  text(v, 10, 75);
  text(w, 10, 100);
  text(x, 10, 125);
  text(y, 10, 150);
  textSize(18);
  text("Press 'F' for Fitness Mode", 80, 350);
  text("Press 'R' for Relaxed/Stressed Mode", 80, 400);
  text ("Press 'I' for instructions", 80, 450);
  popStyle();
}
