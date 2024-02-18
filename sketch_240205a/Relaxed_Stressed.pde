float relaxed_heartrate= 0;
String message= "";
int relaxed_state= 0;
int stressed_state= 0;
void relaxed_draw(){
  pushStyle();
  background(255);
  fill(0);
  textSize(30);
  
  text("RELAXED Vs STRESSED MODE", 75, 25);
  String s= "Resting heart rate: "+ String.valueOf(int(resting_heartrate));
  text (s, 10, 50);
  lineChart2.draw(25, 75,width-60 , 200); //<>//
  String u= "Current heart rate: "+ String.valueOf(int (relaxed_heartrate));
  text(u, 10, 325);
  start_relaxed.moveTo(10, 350);
  end_relaxed.moveTo(400, 350);
  start_stressed.moveTo(10, 400);
  end_stressed.moveTo(400, 400);
  timer_button.moveTo(10, 900);
  endf_button.moveTo(300, 900);
 
  text(relaxedtimer.hour() + ":" + nf(relaxedtimer.minute(), 2) + ":" +
   nf(relaxedtimer.second(), 2) + ":" + nf(relaxedtimer.millis(), 3), 200, 375);
   text(stressedtimer.hour() + ":" + nf(stressedtimer.minute(), 2) + ":" +
   nf(stressedtimer.second(), 2) + ":" + nf(stressedtimer.millis(), 3), 200, 425);
   fill(135, 206, 250); // Light blue for VERY LIGHT zone
    rect(20, 450, width - 30, 40);
     fill(0, 0, 0);
    text(message, 30, 475);
   
   
}
