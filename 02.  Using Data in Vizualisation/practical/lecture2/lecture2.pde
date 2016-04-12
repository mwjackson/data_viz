PImage img;
void setup()
{
  size(400,320);
  
  // Load the image from a local file.
  img = loadImage("https://i.ytimg.com/i/FctpiB_Hnlk3ejWfHqSm6Q/mq1.jpg?v=505b90b1");
  //img = loadImage("sphere.png");
  
  //postition image so it is centred at the given coordinates.
  imageMode(CENTER);
}

void draw()
{
  background(255);
  
  //Draw the image centred on the current mouse position.
  //image(a,b,c,d,e) a=image, b,c = coordinates d,e width and height
  image(img,mouseX, mouseY,200,120);
}