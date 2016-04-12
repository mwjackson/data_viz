float promoTot;
int NoCP = 1;
int NoCPE  = 0;
int NoPOP= 0;
int PoP= 0;
int MP= 0;
int NoPoffP= 0;
color maxa;
color maxm;
color maxs;
color maxt;
color maxw;
color mina;
color minm;
color mins;
color mint;
color minw;
float maxSqrVal;
Container baskPie;
Container baskMetrics;
Tooltip retPieVal;

void GRDI() {
  GRDITab();
  grocer33Pie();
  retailerSquares();
  noStroke();
}

void GRDITab() {

  fill(247);

  strokeWeight(2);
  rect(0, 30, width-1, height-32);

     fill(247); 
  strokeWeight(1.5);
  stroke(0, 158, 217);
  fill(247); 
  rect(width/4, 0, width/4, 30);
  rect(width/2, 0, width/4, 30);
  
  fill(210, 242, 255);
  rect(3*width/4, 0, width/4, 30);
   line(0, 30, width, 30);
  fill(247); 
  rect(0, 0, width/4, 30);
 

  fill(100);
  textFont(tab, 24);
  text("Summary", 10, 23);
  text("GRDI and Retail Sales Index", 330, 23);
  text("Brand and Supplier Analysis", 650, 23);
  text("Grocer 33 Analysis", 970, 23);
  
  rect(830,130,20,20);
  rect(900,130,20,20);
   rect(970,130,20,20);
  rect(1040,130,20,20);
   rect(1110,130,20,20);
  rect(1180,130,20,20);
  noStroke();
}

void grocer33Pie() {
  baskPie = new Container(30,60,600,630,"40 Week Top 5 Retailers Performance - Cheapest Weekly Basket");
  int asda = 0;
  int mor = 0;
  int sains = 0 ;
  int tes = 0;
  int wait = 0;
  int total = 0;

  for (int row=0;row<grocer33Basket.getRowCount(); row++)
  {
    String retailer = grocer33Basket.getString(row, "Retailer");
    String win = grocer33Basket.getString(row, "Winner?");
    if (retailer.equals("Asda") && win.equals("Y")) {
      asda++;
    } 
    else if (retailer.equals("Morrisons") && win.equals("Y")) {
      mor++;
    }
    else if (retailer.equals("Sainsburys") && win.equals("Y")) {
      sains++;
    }
    else if (retailer.equals("Tesco") && win.equals("Y")) {
      tes++;
    }
    else if (retailer.equals("Waitrose") && win.equals("Y")) {
      wait++;
    }
  }
  total = asda+mor+sains+tes+wait;

  float asdaDeg = (float(asda)/float(total))*2*PI;
  float morDeg = (float(mor)/float(total))*2*PI;
  float sainsDeg = (float(sains)/float(total))*2*PI;
  float tesDeg = (float(tes)/float(total))*2*PI;
  float waitDeg = (float(wait)/float(total))*2*PI;

 
  strokeWeight(2);
  stroke(cAsda);
  noFill();
  arc(330, 395, 500, 500, (3*PI)/2, (3*PI)/2+asdaDeg);
  stroke(cMorrisons);
  arc(330, 395, 450, 450, (3*PI)/2, (3*PI)/2+morDeg);
  stroke(cSainsburys);
  arc(330, 395, 400, 400, (3*PI)/2, (3*PI)/2+sainsDeg);
  stroke(cTesco);
  arc(330, 395, 350, 350, (3*PI)/2, (3*PI)/2+tesDeg);
  stroke(cTesco);
  arc(330, 395, 300, 300, (3*PI)/2, (3*PI)/2+waitDeg);

  stroke(210);
  strokeWeight(3);
  line(330, 395, 330, 475-375+45);

  int x = 330;
  int y = 395;
  int r = 250;
  float asdaX = x + r*cos((3*PI)/2+asdaDeg);
  float asdaY = y + r*sin((3*PI)/2+asdaDeg);
  float morX = x + 225*cos((3*PI)/2+morDeg);
  float morY = y + 225*sin((3*PI)/2+morDeg);
  float sainsX = x + 200*cos((3*PI)/2+sainsDeg);
  float sainsY = y + 200*sin((3*PI)/2+sainsDeg);
  float tescoX = x + 175*cos((3*PI)/2+tesDeg);
  float tescoY = y + 175*sin((3*PI)/2+tesDeg);
  float waitX = x + 150*cos((3*PI)/2+waitDeg);
  float waitY = y + 150*sin((3*PI)/2+waitDeg);
  
  ellipseMode(RADIUS);
  noFill();
  stroke(220,220,220,100);
  ellipse(330, 395, 250, 250);
  stroke(220,220,220,150);
  ellipse(330, 395, 225, 225);
  ellipse(330, 395, 200, 200);
  ellipse(330, 395, 175, 175);
  ellipse(330, 395, 150, 150);
  noStroke();
  
  fill(cAsda);
  ellipse(asdaX, asdaY,5, 5);
  fill(cMorrisons);
  ellipse(morX, morY, 5, 5);
  fill(cSainsburys);
  ellipse(sainsX, sainsY, 5, 5);
  fill(cTesco);
  ellipse(tescoX, tescoY, 5, 5);
  fill(cWaitrose);
  ellipse(waitX, waitY, 5, 5);
  
  
  ellipseMode(CENTER);
  if(mouseX>asdaX-5 && mouseX<asdaX+5 && mouseY>asdaY-5 && mouseY<asdaY+5){
    retPieVal = new Tooltip(mouseX+40,mouseY,100,25,"h",str(asda));
  }
  else if(mouseX>morX-5 && mouseX<morX+5 && mouseY>morY-5 && mouseY<morY+5){
    retPieVal = new Tooltip(mouseX+40,mouseY,100,25,"h",str(mor));
  }
  else if(mouseX>sainsX-5 && mouseX<sainsX+5 && mouseY>sainsY-5 && mouseY<sainsY+5){
    retPieVal = new Tooltip(mouseX+40,mouseY,100,25,"h",str(sains));
  }
  else if(mouseX>tescoX-5 && mouseX<tescoX+5 && mouseY>tescoY-5 && mouseY<tescoY+5){
    retPieVal = new Tooltip(mouseX+40,mouseY,100,25,"h",str(tes));
  }
  else if(mouseX>waitX-5 && mouseX<waitX+5 && mouseY>waitY-5 && mouseY<waitY+5){
    retPieVal = new Tooltip(mouseX+40,mouseY,100,25,"h",str(wait));
  }
  
  
  
  fill(51);
  text("Asda", 530+15, 609);
  text("Morrisons", 530+15, 626);
  text("Sainsburys", 530+15, 644);
  text("Tesco", 530+15, 661);
  text("Waitrose", 530+15, 678);
  
  noStroke();
  fill(cAsda);
  rect(530, 600, 10, 10);
  fill(cMorrisons);
  rect(530, 617.5, 10, 10);
  fill(cSainsburys);
  rect(530, 635, 10, 10);
  fill(cTesco);
  rect(530, 652.5, 10, 10);
  fill(cWaitrose);
  rect(530, 670, 10, 10);
  
}

void retailerSquares()
{
   baskPie = new Container(660,60,590,630,"40 Week Top 5 Retailers Performance - Other Metrics");
  
 maxa=cAsda;
 maxm=cMorrisons;
 maxs=cSainsburys;
 maxt=cTesco;
 maxw=cWaitrose;
 mina=color(10,129,41);
 minm=color(150,150,0);
 mins=color(142,86,0);
 mint=color(160,0,0);
 minw=color(75,129,0);
 textFont(body,12);
  text("0%",885,285);
   text("0%",885,305);
    text("0%",885,325);
     text("0%",885,345);
     text("0%",885,365);

  text("Max",1010,285);
   text("Max",1010,305);
    text("Max",1010,325);
     text("Max",1010,345);
     text("Max",1010,365);
 image(asda,905,275,100,15);
 image(mor,905,295,100,15);
 image(sains,905,315,100,15);
 image(tesco,905,335,100,15);
 image(wait,905,355,100,15);
 textFont(tab,20);
 text("Asda",935,255);
 text("Morrisons",710,455);
 text("Sainsbury's",1105,455);
 text("Tesco",832.5,655);
 text("Waitrose",1015,655);
 
 fill(247);
 
 rect(830,390,240,15);
 rect(830,410,240,15);
 rect(830,430,240,15);
 rect(830,450,240,15);
 rect(830,470,240,15);
 rect(830,490,240,15);
 
 if(NoCP == 1){
   fill(220);
 
 rect(830,390,240,15);
 }
 else if(NoCPE == 1){
   fill(220);
 
 rect(830,410,240,15);
 }
 else if(NoPOP == 1){
   fill(220);
 
 rect(830,430,240,15);
 }
 else if(PoP == 1){
   fill(220);
 
 rect(830,450,240,15);
 }
 else if(MP == 1){
   fill(220);
 
 rect(830,470,240,15);
 }
 else if(NoPoffP == 1){
   fill(220);
 
 rect(830,490,240,15);
 }

 
 
 textFont(body,12);
 fill(51);
  text("No. of Cheapest Products",890,402.5);
 text("No. of Cheapest Products Exclusively",865,422.5);
 text("No. of Products On Promotion",880,442.5);
   text("Price-Only Promotions",900,462.5);
    text("Multibuy Promotions",905,482.5);
    text("No. of Products Off Promotion",880,502.5);
  if (NoCP == 1) {
      promoTot = 0.00;
      float asdaVal= 0.00;
      float morVal= 0.00;
      float sainsVal= 0.00;
      float tescoVal= 0.00;
      float waitVal= 0.00;
      maxSqrVal = 0.00;
      for(int row = 0;row<grocerPromo.getRowCount(); row++){
        String retailer = grocerPromo.getString(row, "Retailer");
        int cp = grocerPromo.getInt(row,"Number of cheapest products");
        promoTot+=cp;
        if(cp > maxSqrVal){maxSqrVal = cp;}else{maxSqrVal=maxSqrVal;}
        if (retailer.equals("Asda")) {
          asdaVal = cp;
      } 
    else if (retailer.equals("Morrisons")) {
     morVal = cp;
    }
    else if (retailer.equals("Sainsburys")) {
      sainsVal = cp;
    }
    else if (retailer.equals("Tesco")) {
      tescoVal = cp;
    }
    else if (retailer.equals("Waitrose")) {
      waitVal = cp;
    }
      }


      fill(lerpColor(mina, maxa, asdaVal/maxSqrVal));
      rect(905,130,100,100);
      fill(lerpColor(minm, maxm, morVal/maxSqrVal));
      rect(700,330,100,100);
      fill(lerpColor(mins, maxs, sainsVal/maxSqrVal));
      rect(1100,330,100,100);
      fill(lerpColor(mint, maxt, tescoVal/maxSqrVal));
      rect(810,530,100,100);
      fill(lerpColor(minw, maxw, waitVal/maxSqrVal));
      rect(1000,530,100,100);
      
      
        fill(255);
      textFont(pieVal, 20);
      text(nf((asdaVal/promoTot)*100,1,1) + "%",932.5,185);
      text(nf((morVal/promoTot)*100,1,1)+"%",725,385);
      text(nf((sainsVal/promoTot)*100,1,1)+"%",1127.5,385);
      text(nf((tescoVal/promoTot)*100,1,1)+"%",837.5,585);
      text(nf((waitVal/promoTot)*100,1,1)+"%",1027.5,585);
  }
  else if (NoCPE == 1) {
      promoTot = 0.00;
      float asdaVal= 0.00;
      float morVal= 0.00;
      float sainsVal= 0.00;
      float tescoVal= 0.00;
      float waitVal= 0.00;
      maxSqrVal = 0.00;
      for(int row = 0;row<grocerPromo.getRowCount(); row++){
        String retailer = grocerPromo.getString(row, "Retailer");
        int cp = grocerPromo.getInt(row,"Number of cheapest products exclusively");
        promoTot+=cp;
        if(cp > maxSqrVal){maxSqrVal = cp;}else{maxSqrVal=maxSqrVal;}
        if (retailer.equals("Asda")) {
          asdaVal = cp;
      } 
    else if (retailer.equals("Morrisons")) {
     morVal = cp;
    }
    else if (retailer.equals("Sainsburys")) {
      sainsVal = cp;
    }
    else if (retailer.equals("Tesco")) {
      tescoVal = cp;
    }
    else if (retailer.equals("Waitrose")) {
      waitVal = cp;
    }
      }
    fill(lerpColor(mina, maxa, asdaVal/maxSqrVal));
      rect(905,130,100,100);
      fill(lerpColor(minm, maxm, morVal/maxSqrVal));
      rect(700,330,100,100);
      fill(lerpColor(mins, maxs, sainsVal/maxSqrVal));
      rect(1100,330,100,100);
      fill(lerpColor(mint, maxt, tescoVal/maxSqrVal));
      rect(810,530,100,100);
      fill(lerpColor(minw, maxw, waitVal/maxSqrVal));
      rect(1000,530,100,100);
      
      
        fill(255);
      textFont(pieVal, 20);
      text(nf((asdaVal/promoTot)*100,1,1) + "%",932.5,185);
      text(nf((morVal/promoTot)*100,1,1)+"%",725,385);
      text(nf((sainsVal/promoTot)*100,1,1)+"%",1127.5,385);
      text(nf((tescoVal/promoTot)*100,1,1)+"%",837.5,585);
      text(nf((waitVal/promoTot)*100,1,1)+"%",1027.5,585);
  }
  else if (NoPOP == 1) {
      promoTot = 0.00;
      float asdaVal= 0.00;
      float morVal= 0.00;
      float sainsVal= 0.00;
      float tescoVal= 0.00;
      float waitVal= 0.00;
      maxSqrVal = 0.00;
      for(int row = 0;row<grocerPromo.getRowCount(); row++){
        String retailer = grocerPromo.getString(row, "Retailer");
        int cp = grocerPromo.getInt(row,"Number of products on promotion");
        promoTot+=cp;
        if(cp > maxSqrVal){maxSqrVal = cp;}else{maxSqrVal=maxSqrVal;}
        if (retailer.equals("Asda")) {
          asdaVal = cp;
      } 
    else if (retailer.equals("Morrisons")) {
     morVal = cp;
    }
    else if (retailer.equals("Sainsburys")) {
      sainsVal = cp;
    }
    else if (retailer.equals("Tesco")) {
      tescoVal = cp;
    }
    else if (retailer.equals("Waitrose")) {
      waitVal = cp;
    }
      }
   fill(lerpColor(mina, maxa, asdaVal/maxSqrVal));
      rect(905,130,100,100);
      fill(lerpColor(minm, maxm, morVal/maxSqrVal));
      rect(700,330,100,100);
      fill(lerpColor(mins, maxs, sainsVal/maxSqrVal));
      rect(1100,330,100,100);
      fill(lerpColor(mint, maxt, tescoVal/maxSqrVal));
      rect(810,530,100,100);
      fill(lerpColor(minw, maxw, waitVal/maxSqrVal));
      rect(1000,530,100,100);
      
      
        fill(255);
      textFont(pieVal, 20);
      text(nf((asdaVal/promoTot)*100,1,1) + "%",932.5,185);
      text(nf((morVal/promoTot)*100,1,1)+"%",725,385);
      text(nf((sainsVal/promoTot)*100,1,1)+"%",1127.5,385);
      text(nf((tescoVal/promoTot)*100,1,1)+"%",837.5,585);
      text(nf((waitVal/promoTot)*100,1,1)+"%",1027.5,585);
  }
  else if (PoP == 1) {
      promoTot = 0.00;
      float asdaVal= 0.00;
      float morVal= 0.00;
      float sainsVal= 0.00;
      float tescoVal= 0.00;
      float waitVal= 0.00;
      maxSqrVal = 0.00;
      for(int row = 0;row<grocerPromo.getRowCount(); row++){
        String retailer = grocerPromo.getString(row, "Retailer");
        int cp = grocerPromo.getInt(row,"Price-only promotions");
        promoTot+=cp;
        if(cp > maxSqrVal){maxSqrVal = cp;}else{maxSqrVal=maxSqrVal;}
        if (retailer.equals("Asda")) {
          asdaVal = cp;
      } 
    else if (retailer.equals("Morrisons")) {
     morVal = cp;
    }
    else if (retailer.equals("Sainsburys")) {
      sainsVal = cp;
    }
    else if (retailer.equals("Tesco")) {
      tescoVal = cp;
    }
    else if (retailer.equals("Waitrose")) {
      waitVal = cp;
    }
      }
     fill(lerpColor(mina, maxa, asdaVal/maxSqrVal));
      rect(905,130,100,100);
      fill(lerpColor(minm, maxm, morVal/maxSqrVal));
      rect(700,330,100,100);
      fill(lerpColor(mins, maxs, sainsVal/maxSqrVal));
      rect(1100,330,100,100);
      fill(lerpColor(mint, maxt, tescoVal/maxSqrVal));
      rect(810,530,100,100);
      fill(lerpColor(minw, maxw, waitVal/maxSqrVal));
      rect(1000,530,100,100);
      
      
        fill(255);
      textFont(pieVal, 20);
      text(nf((asdaVal/promoTot)*100,1,1) + "%",932.5,185);
      text(nf((morVal/promoTot)*100,1,1)+"%",725,385);
      text(nf((sainsVal/promoTot)*100,1,1)+"%",1127.5,385);
      text(nf((tescoVal/promoTot)*100,1,1)+"%",837.5,585);
      text(nf((waitVal/promoTot)*100,1,1)+"%",1027.5,585);
  }
  else if (MP == 1) {
      promoTot = 0.00;
      float asdaVal= 0.00;
      float morVal= 0.00;
      float sainsVal= 0.00;
      float tescoVal= 0.00;
      float waitVal= 0.00;
      maxSqrVal = 0.00;
      for(int row = 0;row<grocerPromo.getRowCount(); row++){
        String retailer = grocerPromo.getString(row, "Retailer");
        int cp = grocerPromo.getInt(row,"Multibuy promotions");
        promoTot+=cp;
        if(cp > maxSqrVal){maxSqrVal = cp;}else{maxSqrVal=maxSqrVal;}
        if (retailer.equals("Asda")) {
          asdaVal = cp;
      } 
    else if (retailer.equals("Morrisons")) {
     morVal = cp;
    }
    else if (retailer.equals("Sainsburys")) {
      sainsVal = cp;
    }
    else if (retailer.equals("Tesco")) {
      tescoVal = cp;
    }
    else if (retailer.equals("Waitrose")) {
      waitVal = cp;
    }
      }
   fill(lerpColor(mina, maxa, asdaVal/maxSqrVal));
      rect(905,130,100,100);
      fill(lerpColor(minm, maxm, morVal/maxSqrVal));
      rect(700,330,100,100);
      fill(lerpColor(mins, maxs, sainsVal/maxSqrVal));
      rect(1100,330,100,100);
      fill(lerpColor(mint, maxt, tescoVal/maxSqrVal));
      rect(810,530,100,100);
      fill(lerpColor(minw, maxw, waitVal/maxSqrVal));
      rect(1000,530,100,100);
      
      
        fill(255);
      textFont(pieVal, 20);
      text(nf((asdaVal/promoTot)*100,1,1) + "%",932.5,185);
      text(nf((morVal/promoTot)*100,1,1)+"%",725,385);
      text(nf((sainsVal/promoTot)*100,1,1)+"%",1127.5,385);
      text(nf((tescoVal/promoTot)*100,1,1)+"%",837.5,585);
      text(nf((waitVal/promoTot)*100,1,1)+"%",1027.5,585);
  }
  else if (NoPoffP == 1) {
      promoTot = 0.00;
      float asdaVal= 0.00;
      float morVal= 0.00;
      float sainsVal= 0.00;
      float tescoVal= 0.00;
      float waitVal= 0.00;
      maxSqrVal = 0.00;
      for(int row = 0;row<grocerPromo.getRowCount(); row++){
        String retailer = grocerPromo.getString(row, "Retailer");
        int cp = grocerPromo.getInt(row,"Number of products off promotion");
        promoTot+=cp;
        if(cp > maxSqrVal){maxSqrVal = cp;}else{maxSqrVal=maxSqrVal;}
        if (retailer.equals("Asda")) {
          asdaVal = cp;
      } 
    else if (retailer.equals("Morrisons")) {
     morVal = cp;
    }
    else if (retailer.equals("Sainsburys")) {
      sainsVal = cp;
    }
    else if (retailer.equals("Tesco")) {
      tescoVal = cp;
    }
    else if (retailer.equals("Waitrose")) {
      waitVal = cp;
    }
      }
     fill(lerpColor(mina, maxa, asdaVal/maxSqrVal));
      rect(905,130,100,100);
      fill(lerpColor(minm, maxm, morVal/maxSqrVal));
      rect(700,330,100,100);
      fill(lerpColor(mins, maxs, sainsVal/maxSqrVal));
      rect(1100,330,100,100);
      fill(lerpColor(mint, maxt, tescoVal/maxSqrVal));
      rect(810,530,100,100);
      fill(lerpColor(minw, maxw, waitVal/maxSqrVal));
      rect(1000,530,100,100);
      
      
        fill(255);
      textFont(pieVal, 20);
      text(nf((asdaVal/promoTot)*100,1,1) + "%",932.5,185);
      text(nf((morVal/promoTot)*100,1,1)+"%",725,385);
      text(nf((sainsVal/promoTot)*100,1,1)+"%",1127.5,385);
      text(nf((tescoVal/promoTot)*100,1,1)+"%",837.5,585);
      text(nf((waitVal/promoTot)*100,1,1)+"%",1027.5,585);
  }
}

