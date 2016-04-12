// Draws a simple colour range by interpolating colours.
// Jo Wood, 26th January, 2016
 
color colour1;  // The two colours between which to
color colour2;  // construct the colour range.
 
void setup()
{
  size(400,150);
  colour1 = color(255,0,0);
  colour2 = color(0,0,255);
}
 
void draw()
{ //for each pixel give a colour - draw vertical lines
  for (float x=0; x<width; x++)
  {
    color newColour = lerpColor(colour1,colour2,x/width);
    stroke(newColour);
    line(x,0,x,height);
  }
   
  noLoop();    // Draw once only.
}