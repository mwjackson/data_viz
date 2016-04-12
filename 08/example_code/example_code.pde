import org.gicentre.utils.stat.*;    // For chart classes.
import org.gicentre.utils.colour.*;  // For bar chart colour table.
 
// Simple bar chart with interactive highlighting
// Jo Wood, 19th March, 2016
 
BarChart barChart;
float[] data,colours;
 
void setup()
{
  size(300,200);
   
  data = new float[] {0.76, 0.24, 0.39, 0.18, 0.00, 0.05};
  colours = new float[data.length];
  ColourTable cTable = new ColourTable();
  cTable.addDiscreteColourRule(0, 100,160,160);  // Normal colour = 0
  cTable.addDiscreteColourRule(1,  45,105,105);  // Highlight colour = 1
  
  barChart = new BarChart(this);
  barChart.setData(data);
  barChart.setBarColour(colours,cTable);
}
 
// Draw the bar chart
void draw()
{
  background(255);
  barChart.draw(15,15,width-30,height-30);
  noLoop();    // Don't redraw unless the mouse is moved.
}
 
// Only test for bar highlighting when the mouse moves
void mouseMoved()
{
  // Reset all colours to non-highlighted
  for (int i=0; i<data.length; i++)
  {
    colours[i] = 0;
  }
   
  // See if mouse is over a bar.
  // getscreentodata - built in
  PVector dataUnderMouse = barChart.getScreenToData(new PVector(mouseX,mouseY));
  if (dataUnderMouse != null)
  {
    int selectedBar = int(dataUnderMouse.x);
    float dataValue = dataUnderMouse.y;
     
    if (dataValue < data[selectedBar])//within limits of the bar
    {
      colours[selectedBar] = 1;
    }
  }
  loop();    // Redraw whenever the mouse is moved.
}