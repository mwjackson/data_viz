class Container
{
  int x;
  int y;
  int w;
  int h;
  String t;
  Container(int xpos, int ypos, int howLong, int howTall, String title) {
    x=xpos;
    y=ypos;
    w=howLong;
    h=howTall;
    t=title;
    fill(255);

    stroke(220);
    strokeWeight(1);
    rect(x, y, w, h,2,2,0,0);
    fill(247);
    rect(x, y, w, 40,2,2,0,0);
    
    title(t);
  }
  void title(String t)
  {
    
    
    textFont(titleFont, 14);
    fill(51);
    text(t,x+15,y+26);
    
  }
}


