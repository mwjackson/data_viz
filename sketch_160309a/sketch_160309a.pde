// Shows opinion polls Jan 2013 - Jan 2015
// Jo Wood, 26th January, 2016
  
// The voting data.
float con2015,con2014,con2013;
float lab2015,lab2014,lab2013;
float libdem2015,libdem2014,libdem2013;
float other2015, other2014, other2013;
  
void setup()
{
  size(500,500);
  float scaleFactor = width/32;  // Scale circles relative to sketch size.
      
  // Initialise the voting data and scale to fit in sketch.
  con2015 = scaleFactor*pow(32,0.6);
  con2014 = scaleFactor*pow(31,0.6);
  con2013 = scaleFactor*pow(31,0.6);
  lab2015 = scaleFactor*pow(34,0.6);
  lab2014 = scaleFactor*pow(39,0.6);
  lab2013 = scaleFactor*pow(43,0.6);
  libdem2015 = scaleFactor*pow(7,0.6);
  libdem2014 = scaleFactor*pow(9,0.6);
  libdem2013 = scaleFactor*pow(10,0.6);
  other2015 = scaleFactor*pow(27,0.6);
  other2014 = scaleFactor*pow(21,0.6);
  other2013 = scaleFactor*pow(16,0.6);
}
  
void draw()
{
  background(255);    // White background.
  noStroke();         // No borders around circles.
    
  fill(60,60,220);  // Conservatives in blue
  ellipse(width*.2,height*.15,con2013,con2013);
  ellipse(width*.5,height*.15,con2014,con2014);
  ellipse(width*.8,height*.15,con2015,con2015);
    
  fill(240,50,50);  // Labour in red 
  ellipse(width*.2,height*.4,lab2013,lab2013);
  ellipse(width*.5,height*.4,lab2014,lab2014);
  ellipse(width*.8,height*.4,lab2015,lab2015);
    
  fill(250,140,30);  // LibDems in yellow
  ellipse(width*.2,height*.65,libdem2013,libdem2013);
  ellipse(width*.5,height*.65,libdem2014,libdem2014);
  ellipse(width*.8,height*.65,libdem2015,libdem2015);
   
  fill(128,180,90);  // Others in green
  ellipse(width*.2,height*.85,other2013,other2013);
  ellipse(width*.5,height*.85,other2014,other2014);
  ellipse(width*.8,height*.85,other2015,other2015);
}