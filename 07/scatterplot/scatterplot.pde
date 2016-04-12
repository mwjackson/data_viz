import org.gicentre.utils.stat.*;    // For chart classes.
import org.gicentre.utils.colour.*;  // For colour tables.
 
// Simple scatterplot using Anderson's Iris Data
// Jo Wood, 13th March, 2016.
 
XYChart scatterplot;    // The data chart.
 
void setup()
{
  size(400,400);
   
  scatterplot = new XYChart(this); 
  readData(1,3,scatterplot);    // Read data from columns 1 and 3.
   
  // Set up scatterplot's appearance.
  scatterplot.setMinX(0);
  scatterplot.setMinY(0);
     
  scatterplot.showXAxis(true);
  scatterplot.showYAxis(true);
  scatterplot.setXAxisLabel("Sepal Length");
  scatterplot.setYAxisLabel("Petal Length");
  scatterplot.setPointSize(6);
}
 
void draw()
{
  background(255);
  scatterplot.draw(10,10,width-20,height-20);
  noLoop();    // Draw once only.
}