float current_heartrate = 0;
String current_heartzone= "NIL";
int blood_oxylvl= 0;
int conf= 0;
int timer_state= 0;
void fitness_setup() {
  lineChart = new XYChart(this);
  lineChartX = new FloatList();
  lineChartY = new FloatList();
  lineChart.setData(lineChartX.array(), lineChartY.array());
  
  lineChart.showXAxis(true);
  lineChart.showYAxis(true);
  lineChart.setMinY(0);
  
  lineChart.setYFormat("00");
  lineChart.setXFormat("0");
  
  lineChart.setPointColour(color(180, 50, 100, 100));
  lineChart.setPointSize(5);
  lineChart.setLineWidth(2);
  
  count = 0;
  
  lineChart2 = new XYChart(this);
  lineChartX2 = new FloatList();
  lineChartY2 = new FloatList();
  lineChart2.setData(lineChartX2.array(), lineChartY2.array());
  
  lineChart2.showXAxis(true);
  lineChart2.showYAxis(true);
  lineChart2.setMinY(0);
  
  lineChart2.setYFormat("00");
  lineChart2.setXFormat("0");
  
  lineChart2.setPointColour(color(180, 50, 100, 100));
  lineChart2.setPointSize(5);
  lineChart2.setLineWidth(2);
  
  count2 = 0;
}
void fitness_draw(){
  pushStyle();
  background(255);
  fill(0);
  textSize(30);
  text("FITNESS MODE", 125, 25);
  String s= "Resting heart rate: "+ String.valueOf(int(resting_heartrate));
  String t= "Resting heart zone: "+ Heartrate_zone;
  
  text (s, 10, 50);
  text (t, 10, 75);
  lineChart.draw(25, 100,width-60 , 200);
  String u= "Current heart rate: "+ String.valueOf(int (current_heartrate));
  String v= "Current heart zone: "+ current_heartzone;
  String w= "Blood oxygen level: "+ String.valueOf(blood_oxylvl);
  String x= "Confidence: "+ String.valueOf(conf);
  text(u, 10, 350);
  text(v, 10, 375);
  text(w, 10, 400);
  text(x, 10, 425);
  timer_button.moveTo(10, 455);
  endf_button.moveTo(300, 455);
  start_relaxed.moveTo(10, 900);
  end_relaxed.moveTo(400, 900);
  start_stressed.moveTo(10, 900);
  end_stressed.moveTo(400, 900);
  if (!fitnesstimer.isPaused()){
    handletimers(hm.get(current_heartzone));
  }
  else if(fitnesstimer.isPaused())handletimers2();

   text(fitnesstimer.hour() + ":" + nf(fitnesstimer.minute(), 2) + ":" +
   nf(fitnesstimer.second(), 2) + ":" + nf(fitnesstimer.millis(), 3), 200, 455);
  popStyle();
}
 //<>// //<>// //<>//
void handletimers(Integer i){
  if (i != null){
    for (int j= 0; j< 5; j++){
      if(j==i){
        zones.get(i).start();
      }
      else if (!zones.get(i).isPaused())
        zones.get(i).pause();
    }
  }
  
}
void handletimers2(){
  for (int j= 0; j< 5; j++){
    if (!zones.get(j).isPaused())
      zones.get(j).pause();
    
  }
  
}
