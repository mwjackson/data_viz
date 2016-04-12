import org.gicentre.geomap.io.*;
import org.gicentre.geomap.GeoMap;
import org.gicentre.utils.colour.*;

/* *******************************************************************************
 * Retail data visualization.
 * Student undergraduate submission 2014 - example of a good coursework submission.
 * See retailJustification.pdf and retailFeedback.pdf for further details.
 * NOTE: You need both the giCentreUtils and geoMap Processing libraries installed
 * for this sketch to function. See http://www.gicentre.net/software for details.
 * *******************************************************************************/

//Variables

int pageNo = 0;
PFont body;
PFont titleFont;
PFont tab;
PFont th;
PFont pieVal;
PImage cursor;
PImage up;
PImage down;
PImage markLeg;
PImage riskLeg;
PImage satLeg;
PImage timeLeg;
PImage markbut;
PImage riskbut;
PImage satbut;
PImage timebut;
PImage asda;
PImage mor;
PImage sains;
PImage tesco;
PImage wait;
Table sumTop100;
Table sumTop150;
Table GRDIdata;
Table ukChannel;
Table retailSalesVal;
Table retailSalesVol;
Table grocer33Basket;
Table histSales;
Table grocerPromo;
Table grocerAvail;
color cAsda = color(124, 195, 67);
color cMorrisons = color(245,255,0);
color cSainsburys = color(233, 144, 0);
color cTesco = color(255, 0, 0);
color cWaitrose = color(111, 169, 33);


void setup()
{
  sumTop100 = loadTable("Top 100 Brands.csv", "header,csv");
  sumTop150 = loadTable("Top 150 Suppliers.csv", "header,csv");
  GRDIdata = loadTable("GRDI Data.csv", "header,csv");
  ukChannel = loadTable("UK Channels.csv", "header,csv");
  retailSalesVal = loadTable("2013 Retails Sales Val.csv", "header,csv");
  retailSalesVol = loadTable("2013 Retails Sales Vol.csv", "header,csv");
  grocer33Basket = loadTable("Grocer 33.csv", "header,csv");
  histSales = loadTable("Historic Sales Val.csv", "header,csv");
  grocerPromo = loadTable("Grocer 33 Promo.csv", "header,csv");
  grocerAvail = loadTable("Grocer 33 Availability.csv", "header,csv");
  size(1280, 720);
  body = loadFont("body.vlw");
  tab = loadFont("tabTitle.vlw");
  titleFont = loadFont("ContainerTitle.vlw");
  th = loadFont("tableHeader.vlw");
  pieVal =  loadFont("pieValue.vlw");
  bullet = loadImage("bullet.png");
  cursor = loadImage("newCursor.png");
  up = loadImage("up.png");
  down = loadImage("down.png");
  markLeg = loadImage("attLeg.png");
  riskLeg= loadImage("riskLeg.png");
  satLeg = loadImage("satLeg.png");
  timeLeg = loadImage("timeLeg.png");
  markbut = loadImage("ma.png");
  riskbut= loadImage("risk.png");
  satbut = loadImage("ms.png");
  timebut = loadImage("time.png");
  asda = loadImage("asda.png");
  mor = loadImage("mor.png");
  sains = loadImage("sains.png");
  tesco = loadImage("tesco.png");
  wait = loadImage("wait.png");

  cursor(cursor, 0, 0);
}

void draw()
{ 
  background(255);
  if  (pageNo == 0) {
    welcomeTab();
  }
  else if  (pageNo == 1) {
    summary();
  }
  else if  (pageNo == 2) {
    onsAnalysis();
  }
  else if  (pageNo == 3) {
    grocer33Analysis();
  }
  else if  (pageNo == 4) {
    GRDI();
  }
  frame.setTitle("Insight into Retail - " + int(frameRate) + " fps" + mouseX + " - " + mouseY + "     " + brandScroll0);

  fill(255, 10); // semi-transparent white
  rect(0, 0, width, height);
}

void keyPressed() {
  if (key =='0')
  {
    pageNo = 0;
  }
  else if (key =='1')
  {
    pageNo = 1;
  }
  else if (key =='2')
  {
    pageNo = 2;
  }
  else if (key =='3')
  {
    pageNo = 3;
  }
  else if (key =='4')
  {
    pageNo = 4;
  }
  else if (keyCode == TAB)
  {
    if (pageNo == 4) {
      pageNo = 1;
    }
    else {
      pageNo++;
    }
  }
}

void mouseClicked() {
  if (mouseY > 0 && mouseY < 30) {
    if (mouseX > 0 && mouseX < width/4) 
    {
      pageNo = 1;
    }
    else if (mouseX > width/4 && mouseX < width/2) 
    {
      pageNo = 2;
    }
    else if (mouseX > width/2 && mouseX < 3*width/4) 
    {
      pageNo = 3;
    }
    else if (mouseX > 3*width/4 && mouseX < width) 
    {
      pageNo = 4;
    }
  }
}

void mousePressed()
{
  if (pageNo == 1) {
    if (mouseX > 1220 && mouseX < 1235)
    {
      if (mouseY > 660 && mouseY < 675)
      {
        if (brandScroll1 == -1440) {
        }
        else {
          brandScroll1 = brandScroll1 - 20;
        }
      }
      else if (mouseY > 140 && mouseY < 155)
      {
        if (brandScroll1 == 0) {
        }
        else {
          brandScroll1 =brandScroll1 + 20;
        }
      }
    }
  }
  else if (pageNo == 3) {
    if (mouseX > 260 && mouseX < 275)
    {
      if (mouseY > 135 && mouseY < 150)
      {

        if (brandScroll0 == 0) {
        }
        else {
          brandScroll0 = brandScroll0 + 20;
        }
      }
      else if (mouseY > 340 && mouseY < 355)
      {
        brandScroll0 = brandScroll0 - 20;
      }
    }

    if (mouseX > 1230 && mouseX < 1250)
    {
      if (mouseY > 135 && mouseY < 150)
      {
        if (brandScroll2 == 0) {
        }
        else {
          brandScroll2 = brandScroll2 + 20;
        }
      }
      else if (mouseY > 370 && mouseY < 385)
      {
        brandScroll2 = brandScroll2 - 20;
      }
    }
  }
  else if (pageNo == 2) {
    if (mouseX > 1230 && mouseX < 1245)
    {
      if (mouseY > 660 && mouseY < 675)
      {
        GRDIScroll = GRDIScroll - 20;
      }
      else if (mouseY > 550 && mouseY < 565)
      {
        if (GRDIScroll == 0) {
        }
        else {
          GRDIScroll = GRDIScroll + 20;
        }
      }
    }
    else if (mouseY > 67.5 && mouseY < 92.5)
    {
      if (mouseX > 880 && mouseX < 910)
      {
        markAtt = 1;
        risk = 0;
        markSat = 0;
        timePres = 0;
      }
      else if (mouseX > 976 && mouseX < 1006) {
        markAtt = 0;
        risk = 0;
        markSat = 1;
        timePres = 0;
      }
      else if (mouseX > 923 && mouseX < 1023) {
        markAtt = 0;
        risk = 1;
        markSat = 0;
        timePres = 0;
      }

      else if (mouseX > 1019 && mouseX < 1049) {
        markAtt= 0;
        risk = 0;
        markSat = 0;
        timePres = 1;
      }
    }
  }
  else if (pageNo == 4) {
    if (mouseX > 830 && mouseX < 1070)
    {
      if (mouseY > 390 && mouseY < 405)
      {
        NoCP = 1;
        NoCPE  = 0;
        NoPOP= 0;
        PoP= 0;
        MP= 0;
        NoPoffP= 0;
      }
      else if (mouseY > 410 && mouseY < 425)
      {
        NoCP = 0;
        NoCPE  = 1;
        NoPOP= 0;
        PoP= 0;
        MP= 0;
        NoPoffP= 0;
      }
      else if (mouseY > 430 && mouseY < 445)
      {
        NoCP = 0;
        NoCPE  = 0;
        NoPOP= 1;
        PoP= 0;
        MP= 0;
        NoPoffP= 0;
      }

      else if (mouseY > 470 && mouseY < 485)
      {
        NoCP = 0;
        NoCPE  = 0;
        NoPOP= 0;
        PoP= 0;
        MP= 1;
        NoPoffP= 0;
      }
      else if (mouseY > 490 && mouseY < 505)
      {
        NoCP = 0;
        NoCPE  = 0;
        NoPOP= 0;
        PoP= 0;
        MP= 0;
        NoPoffP= 1;
      }
      else if (mouseY > 450 &&mouseY < 465)
      {
        NoCP = 0;
        NoCPE  = 0;
        NoPOP= 0;
        PoP= 1;
        MP= 0;
        NoPoffP= 0;
      }
    }

  }
}
void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  if (pageNo == 1)
  {
    if (mouseX > 1040 && mouseX < 1250)
    {
      if (mouseY > 60 && mouseY < 690)
      {
        if (e == 1) {
          if (brandScroll1 == -1440) {
          }
          else {
            brandScroll1 = brandScroll1 - 20;
          }
        }
        else if (e == -1) {
          if (brandScroll1 == 0) {
          }
          else {
            brandScroll1 = brandScroll1 + 20;
          }
        }
      }
    }
  }
  else if (pageNo == 2)
  {
    if (mouseX > 690 && mouseX < 1250)
    {
      if (mouseY > 470 && mouseY < 690)
      {
        if (e == 1) {
          if (GRDIScroll == -460) {
          }
          else {
            GRDIScroll = GRDIScroll - 20;
          }
        }
        else if (e == -1) {
          if (GRDIScroll == 0) {
          }
          else {
            GRDIScroll = GRDIScroll + 20;
          }
        }
      }
    }
  }
  else if (pageNo == 3)
  {
    if (mouseX > 950 && mouseX < 1250)
    {
      if (mouseY > 60 && mouseY < 690)
      {
        if (e == 1) {
          if (brandScroll2 == -2740) {
          }
          else {
            brandScroll2 = brandScroll2 - 20;
          }
        }
        else if (e == -1) {
          if (brandScroll2 == 0) {
          }
          else {
            brandScroll2 = brandScroll2 + 20;
          }
        }
      }
    }
    else if (mouseX > 30 && mouseX < 280) {
      if (mouseY > 60 && mouseY < 360)
      {
        if (e == 1) {
          if (brandScroll0 == -1780) {
          }
          else {
            brandScroll0 = brandScroll0 - 20;
          }
        }
        else if (e == -1) {
          if (brandScroll0 == 0) {
          }
          else {
            brandScroll0 = brandScroll0 + 20;
          }
        }
      }
    }
  }
}

