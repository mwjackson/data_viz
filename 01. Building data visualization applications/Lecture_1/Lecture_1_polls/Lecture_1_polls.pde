//data challenge on lecture 1 Polls

void setup()
{
  size(500,500);
}

void draw()
{
  //draw a transparent background
  fill(255,10);
  rect(0,0,width,height);
  
  //text
  print("ABCD");
  
  //labour
  fill(255,0,0);
  stroke(255,0,0);
  ellipse(100,100,43,43);
    
  //con
  fill(0,0,255);
  stroke(0,0,255);
  ellipse(100,106,31,31);

  //lib
  fill(200,128,64);
  stroke(200,128,64);
  ellipse(100,115,10,10);
 
}