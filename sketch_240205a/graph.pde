XYChart lineChart;
FloatList lineChartX;
FloatList lineChartY;

int count;

XYChart lineChart2;
FloatList lineChartX2;
FloatList lineChartY2;

int count2;
void graph_setup() {
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
  
  
}

void graph_draw() {
  background(200);
  textSize(9);
  
  lineChart.draw(15, 15, width - 30, height - 30);
  fill(200);
  rect(500, 200, 0, 0);
  
  fill(120);
  textSize(20);
  text("User's Heart Beat", 70, 30);
}

void graph_serialEvent(float val) {
  count++;
  current_heartrate= val;
  current_heartzone=getzone(val);
  lineChartX.append(count);
  lineChartY.append(val);
  
  if (lineChartX.size() > 7 && lineChartY.size() > 7) {
    lineChartX.remove(0);
    lineChartY.remove(0);
  }
  
  lineChart.setData(lineChartX.array(), lineChartY.array());
}
void graph_serialEvent2(float val) {
  count++;
  relaxed_heartrate= val;
  
  lineChartX2.append(count);
  lineChartY2.append(val);
  
  if (lineChartX2.size() > 7 && lineChartY2.size() > 7) {
    lineChartX2.remove(0);
    lineChartY2.remove(0);
  }
  
  lineChart2.setData(lineChartX2.array(), lineChartY2.array());
}
