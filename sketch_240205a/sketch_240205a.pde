import processing.serial.*;
Serial myPort;
import org.gicentre.utils.stat.*;
import gifAnimation.*;
import lord_of_galaxy.timing_utils.*;
import g4p_controls.GButton;
import g4p_controls.*;
import java.util.*; 

Gif myAnimation;

boolean send = false;
String msg = "";
String tab= "intro";
int age= 21;
int max_heart_rate= 220- age;
float resting_heartrate= 0;
PImage img;
PImage img2;
PImage img3;
PImage img4;
Stopwatch fitnesstimer;
Stopwatch relaxedtimer;
Stopwatch stressedtimer;
color[] colors;
int currentColorIndex = 0; 
int lastColorChangeTime; 
ArrayList<Stopwatch> zones;
GButton timer_button;
GButton endf_button;
GButton start_relaxed;
GButton end_relaxed;
GButton start_stressed;
GButton end_stressed;
String BaselineCaller;
Map<String, Integer> hm 
            = new HashMap<String, Integer>();
void setup(){
  size(500, 500);
  background(255);
  img = loadImage("IMG_0576.PNG");
  img2= loadImage("stressed.png");
  img3 = loadImage("stressed1.png");
  img4 = loadImage("relaxed22.png");
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');
  myAnimation = new Gif(this, "bepatient.gif");  
  myAnimation.play();
  fitness_setup();
  fitnesstimer = new Stopwatch(this);
  relaxedtimer= new Stopwatch(new PApplet());
  stressedtimer= new Stopwatch(new PApplet());
  zones= new ArrayList();
  for(int i= 0; i< 5; i++){
    Stopwatch temp = new Stopwatch(new PApplet());
    zones.add(temp);
  }
   //mainWindow = GWindow.getWindow(this, "Main Window", 100, 100, 300, 200,JAVA2D);
  timer_button =new  GButton(this, 50, 700, 100, 20, "TIMER");
  endf_button =new  GButton(this, 50, 700, 100, 20, "END SESSION");
  start_relaxed =new  GButton(this, 50, 700, 100, 40, "RELAXED TIMER");
  end_relaxed =new  GButton(this, 50, 700, 100, 40, "END RELAXED TEST");
  start_stressed =new  GButton(this, 50, 700, 100, 40, "STRESSED TIMER");
  end_stressed =new  GButton(this, 50, 700, 100, 40, "END STRESSED TEST");
  timer_button.fireAllEvents(true);
  hm.put("MAXIMUM", 0); 
  hm.put("HARD", 1); 
  hm.put("MODERATE", 2); 
  hm.put("LIGHT", 3);
  hm.put("VERY LIGHT", 4);
  
  colors = new color[5];
  colors[0] = color(255, 150, 150);   // Lighter Red
  colors[1] = color(150, 255, 150);   // Lighter Green
  colors[2] = color(150, 150, 255);   // Lighter Blue
  colors[3] = color(255, 255, 150); // Lighter Yellow
  colors[4] = color(150, 255, 255); // Lighter Cyan
  lastColorChangeTime = millis();
}
void draw(){
  
  if (tab=="intro")
    intro_draw();
  else if (tab == "Baseline"){
      baseline_draw();
  }
  else if (tab == "Fitness"){
    if(baseline_array.size()<30){
      tab= "Baseline";
      BaselineCaller= "Fitness";
      baseline_draw();
    }
    else{
      fitness_draw();
    }
    
    
  }
  else if (tab == "Relaxed_Stressed"){
    if(baseline_array.size()<30){
      tab= "Baseline";
      BaselineCaller= "Relaxed_Stressed";
      baseline_draw();
      
    }
     else relaxed_draw();
  }
   
  else if(tab=="endFitness")
    endFitness_draw();
   
  
  
}


void serialEvent(Serial myPort){
  String tempval = myPort.readStringUntil('\n');
  tempval = tempval.trim();
  println(tempval);
  
  String[] res=  tempval.split("[,]", 0);
  if (res.length==4){
   int[] sol = new int[4];
   for (int i = 0; i< 4; i++){
     
     sol[i] = Integer.valueOf(res[i]);
     
   }
   if (tab== "intro"){
     current_heartrate2 = sol[0];
     difference= millis()- starttime;
     starttime= millis();
    blood_oxylvl2= sol[2];
    conf2= sol[1];
     
   }
   if (tab=="Baseline"){
       //print("Adding to baseline");
       baseline_array.add(sol);
     }
    if (tab== "Fitness" && !fitnesstimer.isPaused()){
      blood_oxylvl= sol[2];
      conf= sol[1];
      graph_serialEvent((float)sol[0]);
      //delay(1000);
      //graph_serialEvent((float)140);//for testing
      
      
    }
   if (tab== "Relaxed_Stressed" &&  (!relaxedtimer.isPaused() ||!stressedtimer.isPaused() )){
     
     graph_serialEvent2((float)sol[0]);
   }
  }
   //<>// //<>// //<>// //<>//
   
   
  
}
