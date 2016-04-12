//Adapt the globalTemp sketch (reproduced below) from the lecture notes to use an alternative Brewer colour scheme that 
//reflects the data being used. How does your scheme cope with the negative temperature change in 1970? 
import org.gicentre.utils.colour.*;    // For colour tables.
 
// Sketch to show surface temperature changes using a Brewer colour scheme.
// Jo Wood, 26th January, 2016
 
float temp1960,temp1970,temp1980,temp1990,temp2000,temp2010;
 
ColourTable cTable;    // Will store a Brewer colour table.
 
void setup()
{
  size(400,150);
  stroke(180);
  textAlign(CENTER);
  

  
  // change "BU_PU" to use Brewer colour palette
  // how do you use the palette colour the opposite way?
  cTable = ColourTable.getPresetColourTable(ColourTable.BU_PU,0,1);
   
  temp1960 = 0.06;
  temp1970 =-0.04;
  temp1980 = 0.18;
  temp1990 = 0.34;
  temp2000 = 0.55;
  temp2010 = 0.70;
}
 
void draw()
{
  background(255);
   
  fill(cTable.findColour(temp1960));
  rect(width*.05,50,width/8,height/3);
   
  fill(cTable.findColour(temp1970));
  rect(width*.20,50,width/8,height/3);
   
  fill(cTable.findColour(temp1980));
  rect(width*.35,50,width/8,height/3);
   
  fill(cTable.findColour(temp1990));
  rect(width*.50,50,width/8,height/3);
   
  fill(cTable.findColour(temp2000));
  rect(width*.65,50,width/8,height/3);
   
  fill(cTable.findColour(temp2010));
  rect(width*.80,50,width/8,height/3);
   
  fill(0);
  text("Global surface air temperature anomaly",width/2,20);
  text("5-year mean, base 1951-1980. Source: NASA, 2010",width/2,40);
  text("1960", width*.11,height-30);
  text("1970", width*.26,height-30);
  text("1980", width*.41,height-30);
  text("1990", width*.56,height-30);
  text("2000", width*.71,height-30);
  text("2010", width*.86,height-30);
   
  noLoop();      // Draw once only.
}