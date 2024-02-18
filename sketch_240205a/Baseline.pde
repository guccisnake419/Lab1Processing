int percentage_done= 0;
String Heartrate_zone= "NILL";
ArrayList<int[]> baseline_array = new ArrayList<int[]>();
void baseline_draw(){
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
  if(baseline_array.size()<=30){
    pushStyle();
    
    fill(0);
    textSize(30);
    text("CALCULATING BASELINE...", 80, 25);
    image(myAnimation,125, 40, 200, 200);
    percentage_done= (baseline_array.size()*100)/30;
    println(baseline_array.size());
    String mystr= "Percentage Done: "+ String.valueOf(percentage_done)+"%";
    text(mystr, 100, 400);
   
    if(baseline_array.size()==30){
     int total_heartrate= 0;
     
     for (var i : baseline_array){
       total_heartrate +=i[0];
       
     }
     resting_heartrate= (float)total_heartrate/30;
     Heartrate_zone=getzone(resting_heartrate);
     tab=BaselineCaller;
   
   }
    popStyle();
  }
 
 
 
  
}
String getzone(float hr){
  Heartrate_zone= "NILL";
  float percent= (hr * 100)/max_heart_rate;
  if (percent >=90){
    Heartrate_zone= "MAXIMUM";
  }
  else if (percent >=80){
    Heartrate_zone= "HARD";
  }
  else if (percent >=70){
    Heartrate_zone= "MODERATE";
  }
  else if (percent >=60){
    Heartrate_zone= "LIGHT";
  }
  else {
    Heartrate_zone= "VERY LIGHT";
  }
  return Heartrate_zone;
}
