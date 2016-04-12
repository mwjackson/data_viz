class Tooltip {
  int x;
  int y;
  int w;
  int h;
  String t;
  String type;
  Tooltip(int xpos, int ypos, int howLong, int howTall, String type, String st) {

    x=xpos;
    y=ypos;
    w=howLong;
    h=howTall;
    t=st;

    if (type.equals("h")) {
      fill(255);
      stroke(220);
      strokeWeight(1);
      rect(x, y, w, h, 2, 2, 0, 0);
      fill(247);
      rect(x, y, 40, h, 2, 2, 0, 0);
    }
    else if (type.equals("w")) {
      fill(255);
      stroke(220);
      strokeWeight(1);
      rect(x, y, w, h, 2, 2, 0, 0);
      fill(247);
      rect(x, y, w, 20, 2, 2, 0, 0);
    }
    populate(type);
  }
  void populate(String ty)
  {
    if (ty.equals("w")) {
      textFont(titleFont, 14);
      fill(51);
      text("Value", x+15, y+14);
      text(t, x+15, y+34);
    }
    else if (ty.equals("h")) {
      textFont(titleFont, 14);
      fill(51);
      text("Value", x+5, y+16);
      text(t, x+50, y+17);
    }
  }
}

class Tooltip2 {
  int x;
  int y;
  int w;
  int h;
  String t;
  String type;
  String val;
  Tooltip2(int xpos, int ypos, int howLong, int howTall, String type, String st, String v) {
    val = v;
    x=xpos;
    y=ypos;
    w=howLong;
    h=howTall;
    t=st;

    if (type.equals("h")) {
      fill(255);
      stroke(220);
      strokeWeight(1);
      rect(x, y, w, h, 2, 2, 0, 0);
      fill(247);
      rect(x, y, 40, h, 2, 2, 0, 0);
    }
    else if (type.equals("w")) {
      fill(255);
      stroke(220);
      strokeWeight(1);
      rect(x, y, w, h, 2, 2, 0, 0);
      fill(247);
      rect(x, y, w, 20, 2, 2, 0, 0);
    }
    populate(type);
  }
  void populate(String ty)
  {
    if (ty.equals("w")) {
      textFont(titleFont, 14);
      fill(51);
      text(t, x+15, y+14);
      text(val, x+15, y+40);
    }
    else if (ty.equals("h")) {
      textFont(titleFont, 14);
      fill(51);
      text("Value", x+5, y+16);
      text(t, x+50, y+17);
    }
  }
}

