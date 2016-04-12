// Draws a slice though HSB colour space
// Jo Wood, 26th January, 2016
 
float bri;    // Use to set colour brightness
float hue;
 
void setup()
{
  size(400,250);
  bri = 75;    // Try changing this value between 0-100
  hue = 360; // keep hue constant
 
 //hue saturation and brightness - goes from left to right
 //Hue=360, sat=100, brightness=100
  colorMode(HSB,width,height,100);  // Use HSB colour space.
  //holds hue constant varies sat and brightness
  //colorMode(HSB,360,width,height);  // Use HSB colour space.
}
 
void draw()
{
  for (int x=0; x<width; x++)
  {
    for (int y=0; y<height; y++)
    {
        // stroke(360,x, y); //keep hue constant and change sat and brightness
        stroke(x,y,bri); // keep bri constant and change hue and sat
        point(x,y);
    }
  }
   
  noLoop();    // This stops sketch redrawing 60 times per second.
}