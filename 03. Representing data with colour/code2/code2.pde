// Draws a colour contrast figure 4.14 from Ware 2004.
// Jo Wood, 26th January, 2016.
 
boolean drawBackground;
 
void setup()
{
  size(600, 300);
  drawBackground = false;
}
 
void draw()
{
  noStroke();
 
  if (drawBackground)
  {
    // Red background.
    background(150, 0, 0);
 
    // Blue rectangles
    fill(0, 0, 100);
    rect(0, 0, width*.08, height);
    rect(width*.42, 0, width*.08, height);
    rect(width*.58, 0, width*.35, height);
  }
  else
  {
    // White background.
    background(255);
  }
 
  // Draw crosses
  stroke(104, 38, 100);
  strokeWeight(6);
 
  line(width*.09, height*.08, width*.41, height*.92);
  line(width*.09, height*.92, width*.41, height*.08);
 
  line(width*.59, height*.08, width*.91, height*.92);
  line(width*.59, height*.92, width*.91, height*.08);
}
 
void keyPressed()
{
  if (key == ' ')
  {
    // Toggle coloured background variable.
    drawBackground = !drawBackground;
  }
}