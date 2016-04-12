// Draws a coloured circle at the current mouse position.
// Jo Wood, 29th January, 2015
 
void setup()
{
  size(400,250);
   
  // Thick grey border around features.
  strokeWeight(2);
  stroke(80);
}
 
void draw()
{
  // Set the background to light grey
  background(230);
 
  // Create 3 variables.
  float diameter = width/5;
  float xColour = 255*mouseX/width;
  float yColour = 255*mouseY/height;
 
  // Draw circle that changes colour with mouse position.
  fill(128,xColour,yColour);
  ellipse(mouseX,mouseY,diameter,diameter);
}