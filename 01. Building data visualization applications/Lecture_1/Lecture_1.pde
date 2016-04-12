// Draws an ellipse that follows the mouse position.
// Jo Wood, 25th January, 2016
 
//setup() one time set up of stuff e.g. load data
// size() size of window there is a default
void setup()
{
  size(500,450);
}

//width & height - will ensure size same as window
//different height and width rect(0,0,width*0.5,height)
// draw() - loops - keeps running over and over
//So it displays a green ellipse instead of a red one;
//uses a more transparent background so the 'tails' on the moving ellipse appear longer;
//the sketch is 500 wide by 450 pixels tall;
//the width of the ellipse is 10% of the width of the sketch, and its height is 6% (1/15th) of the height of the sketch;
//the width of the line around the ellipse varies according to the mouse position (how that varies is up to you)


void draw()
{
  // Draw transparent background.
  fill(255,10);          
  rect(0,0,width,height);
   
  // fill() colour
  // Draw red ellipse at mouse position.
  fill(0,255,0);
  stroke(0,0,255);
  strokeWeight((mouseY+mouseX)/100);
  ellipse(mouseX,mouseY,width/10,height/15);
}