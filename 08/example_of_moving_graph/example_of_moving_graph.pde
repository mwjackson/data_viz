import org.gicentre.utils.stat.*;
//array

float[] data1 = new float[] {50,17,70,90,10};// start state
float[] data2 = new float[] {40,50,30,80,20}; //end state
float t, inc;


BarChart barChart;

void setup()
{
  size(600,600);
  t = 0;
  inc = 0; // don't want it move 
  barChart = new BarChart(this);
  barChart.setData(data1);
  barChart.setMinValue(0);
  barChart.setMaxValue(100);
  
}

void draw()
{
  background(255);
  t = t + inc;
  
  if (t<=0) //controls t and stops it from going out of bounds
  {
    t = 0;
    inc = 0;
  }
  else if (t >= 1)
  {
    t = 1;
    inc = 0;
  }
  //length of new array = length of data1
  float[] data = new float[data1.length];
  for (int i=0; i<data.length;i++)
  {
    data[i] = lerp(data1[i],data2[i],t); //data[i] = position
  }
  barChart.setData(data);
  barChart.draw(0,0,width,height);// x,ywidth,height - need to set min max otherwise axis is set to minimum

  
}

void keyPressed()
{
  if (key == 's')
  {
    inc = -0.02;
  }
  else if (key == 'e')
  {
    inc = 0.02;
  }
}