class Help {
  int x;
  int y;
  int w;
  int h;
  String t;
  Help(int xpos, int ypos, int howLong, int howTall, String st) {

    x=xpos;
    y=ypos;
    w=howLong;
    h=howTall;
    t=st;

      fill(255);
      stroke(220);
      strokeWeight(1);
      rect(x, y, w, h, 2, 2, 0, 0);
      fill(247);
      rect(x, y, w, 40, 2, 2, 0, 0);
  
    populate(t);
  }
  void populate(String t)
  {
      textFont(titleFont, 14);
      fill(51);
    text("Help",x+15,y+26);
      text(t, x+15, y+40+15,w-15,h-15);
  }
}
