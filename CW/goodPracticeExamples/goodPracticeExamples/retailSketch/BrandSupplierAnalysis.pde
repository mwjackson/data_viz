int Grank100x = 150;
int Grank100y = 128;
int GSrank100x = 1170;
int GSrank100y = 128;
int Gbrand100x = 50;
int Gbrand100y = 140;
int GSupp100x = 970;
int GSupp100y = 140;
int brandScroll0 = 0;
int brandScroll2 = 0;
Graph brandGraph;
BoxPlot turnoverBoxPlot;
Container bsBrand;
Container bsSupp;
Container bsGraph;
Container bsUKChan;
Container bsSuppType;
Container bsBoxPlot1;
Container bsBoxPlot2;

void grocer33Analysis() {
fill(247);

  strokeWeight(2);
  rect(0, 30, width-1, height-32);
  grocer33AnalysisTab();
  grocertop100BrandsTable();
  fill(220);
  //rect(20, 325, 200, 500);
  fill(100);
  grocertop150SuppliersTable();
  fill(220);
  //rect(20, 650, 285, 200);
  fill(100);
  supplierTypePie();
  channelPie();
  brandGraph();
  turnoverBoxPlot();
  profitBoxPlot();
  noStroke();
  grocer33AnalysisTab();
}

void grocer33AnalysisTab() {
    fill(247); 
  strokeWeight(1.5);
  stroke(0, 158, 217);
  fill(247); 
  rect(width/4, 0, width/4, 30);
  
  fill(210, 242, 255);
  rect(width/2, 0, width/4, 30);
  fill(247); 
  rect(3*width/4, 0, width/4, 30);
  rect(0, 0, width/4, 30);
  line(0, 30, width, 30);

  fill(100);
  textFont(tab, 24);
  text("Summary", 10, 23);
  text("GRDI and Retail Sales Index", 330, 23);
  text("Brand and Supplier Analysis", 650, 23);
  text("Grocer 33 Analysis", 970, 23);

  noStroke();
  fill(247);
  rect(30,31.5,1240,28.5);
  
  rect(30,361,250,29);
  
  rect(30,691,1240,29);
  
  rect(950,401,300,29);
  
  rect(950,546,300,29);
  noStroke();
}


void grocertop100BrandsTable()
{
  bsBrand = new Container(30, 60, 250, 300, "Top 100 Brands 2014");
  for (int row=0;row<sumTop100.getRowCount(); row++)
  {
    int difference = sumTop100.getInt(row, "Rank in 2014") - sumTop100.getInt(row, "Rank in 2013");
    String brand = sumTop100.getString(row, "Brand");
    fill(51);
    textFont(body, 12);
    text(brand, Gbrand100x, (Gbrand100y+row*20)+brandScroll0);
    noStroke();
    
    if (difference >= 0) {
      fill(100,200,35);
      text(difference, 245, Grank100y+row*20+brandScroll0+12);
      rect(220, Grank100y+row*20+brandScroll0, difference, 19);
    }
    else if (difference < 0) {
      fill(200,35,35);
      text(difference, 245, Grank100y+row*20+brandScroll0+12);
      rect(220, Grank100y+row*20+brandScroll0, difference, 19);
    }
  }
  
  fill(255);
  rect(31, 101, 228, 26);
  rect(31, 345, 228, 15);
  stroke(220);
  line(31,360,278,360);
  
  fill(110);
  textFont(th, 12);
  text("Brand", 50, 123);
  text("Rank Chng",Grank100x+42 , 123);

  stroke(220);
  strokeWeight(1);
  fill(247);
  rect(30, 60, 250, 40, 2, 2, 0, 0);
  textFont(titleFont, 14);
  fill(51);
  text("Top 100 Brands 2014", 30+15, 60+26);
  
   stroke(230);
  strokeWeight(1);
  line(160, 115, 160, 355);
  line(40, 128, 260, 128);


  line(220, 128, 220, 355);
  
  image(up,260,135,15,15);
  image(down,260,340,15,15);
}

void grocertop150SuppliersTable()
{
  bsSupp = new Container(950, 60, 300, 340, "Top 150 Suppliers 2013");
  for (int row=0;row<sumTop150.getRowCount(); row++)
  {
    int difference = sumTop150.getInt(row, "Rank 2013") - sumTop150.getInt(row, "Rank 2012");
    String brand = sumTop150.getString(row, "Name 2");
    fill(51);
    textFont(body, 12);
    text(brand, GSupp100x, (GSupp100y+row*20)+brandScroll2);
    noStroke();
    
    if (difference >= 0 && sumTop150.getInt(row, "Rank 2012") != 0) {
      fill(100,200,35);
      text(difference, 1200, GSrank100y+row*20+brandScroll2+12);
       rect(GSrank100x, GSrank100y+row*20+brandScroll2, difference, 19);
    }
    else if (difference >= 0 && sumTop150.getInt(row, "Rank 2012") == 0) {
      
      text("New", 1200, GSrank100y+row*20+brandScroll2+12);
    }
    else if (difference < 0) {
      fill(200,35,35);
      text(difference,1200, GSrank100y+row*20+brandScroll2+12);
      rect(GSrank100x, GSrank100y+row*20+brandScroll2, difference, 19);
    }
    
  }
  fill(255);
  rect(951, 101, 298, 26);
  rect(951, 385, 299, 15);
  stroke(220);
  line(951,400,1249,400);
  
   fill(110);
  textFont(th, 12);
  text("Supplier", 970, 123);
  text("Rank Chng",GSrank100x-30 , 123);
  stroke(220);
  strokeWeight(1);
  fill(247);
  rect(950, 60, 300, 40, 2, 2, 0, 0);
  textFont(titleFont, 14);
  fill(51);
  text("Top 100 Suppliers 2013", 950+15, 60+26);
  
  stroke(230);
  strokeWeight(1);
  line(1120, 115, 1120, 395);
  line(960, 128, 1230, 128);


  line(1170, 128, 1170, 395);
  noStroke();
  
  image(up,1230,135,15,15);
  image(down,1230,370,15,15);
}

void supplierTypePie() {
  bsSuppType = new Container(310, 430, 300, 260, "Supplier Types");
  float listed = 0;
  float family = 0;
  float ukSub = 0;
  float PE = 0;
  for (int row=0;row<sumTop150.getRowCount(); row++)
  {
    String type = sumTop150.getString(row, "Own 2");
    if (type.equals("Listed")) {
      listed++;
    } 
    else if (type.equals("Family")) {
      family++;
    }
    else if (type.equals("UK sub")) {
      ukSub++;
    }
    else if (type.equals("PE")) {
      PE++;
    }
  }
  float listedDeg = (listed/150.00)*2*PI;
  float familyDeg = (family/150.00)*2*PI;
  float ukSubDeg = (ukSub/150.00)*2*PI;
  float PEDeg = (PE/150.00)*2*PI;

  fill(0, 158, 217);
  arc(425, 580, 175, 175, 0, listedDeg, PIE);
  fill(133, 164, 205);
  arc(425, 580, 175, 175, listedDeg, familyDeg+listedDeg, PIE);
  fill(87, 128, 186);
  arc(425, 580, 175, 175, familyDeg+listedDeg, listedDeg+familyDeg+ukSubDeg, PIE);
  fill(97, 206, 248);
  arc(425, 580, 175, 175, listedDeg+familyDeg+ukSubDeg, listedDeg+familyDeg+ukSubDeg+PEDeg, PIE);
  
  
  fill(51);
  textFont(body, 12);
  text("Listed", 515+15, 609+10);
  text("Family", 515+15, 626+10);
  text("UK Subsidary", 515+15, 644+10);
  text("Private Equity", 515+15, 661+10); 
  noStroke();
  fill(0, 158, 217);
  rect(515, 600+10, 10, 10);
  fill(133, 164, 205);
  rect(515, 617.5+10, 10, 10);
  fill(87, 128, 186);
  rect(515, 635+10, 10, 10);
  fill(97, 206, 248);
  rect(515, 652.5+10, 10, 10);

}

void channelPie() {
  
  bsBrand = new Container(30, 390, 250, 300, "UK Channels Division");
  float OnDeg = 0.00;
  float DisDeg = 0.00;
  float ConvDeg = 0.00;
  float SupDeg = 0.00;
  float HypDeg = 0.00;
  float OthDeg = 0.00;
  for (int row=0;row<ukChannel.getRowCount(); row++)
  {
    Float amount = ukChannel.getFloat(row, "Amount (bn)");
    String channel = ukChannel.getString(row, "Channel");
    if (channel.equals("Online")) {
      OnDeg = (amount/169.8)*2*PI;
    } 
    else if (channel.equals("Discounters")) {
      DisDeg= (amount/169.8)*2*PI;
    }
    else if (channel.equals("Convenience Stores")) {
      ConvDeg= (amount/169.8)*2*PI;
    }
    else if (channel.equals("Small Supermarkets")) {
      SupDeg= (amount/169.8)*2*PI;
    }
    else if (channel.equals("Hypermarkets and Superstores")) {
      HypDeg= (amount/169.8)*2*PI;
    }
    else if (channel.equals("Other Retailers")) {
      OthDeg= (amount/169.8)*2*PI;
    }
  }
  stroke(255);
  fill(54,170,214);
  arc(155, 540, 175, 175, 0, OnDeg, PIE);
  fill(40,117,147);
  arc(155, 540, 175, 175, OnDeg,DisDeg+ OnDeg, PIE);
  fill(52,214,191);
  arc(155, 540, 175, 175, DisDeg+ OnDeg, DisDeg+ OnDeg+ConvDeg, PIE);
  fill(59,191,255);
  arc(155, 540, 175, 175, DisDeg+ OnDeg+ConvDeg, DisDeg+ OnDeg+ConvDeg+SupDeg, PIE);
  fill(16,163,175);
  arc(155, 540, 175, 175, DisDeg+ OnDeg+ConvDeg+SupDeg, DisDeg+ OnDeg+ConvDeg+SupDeg+HypDeg, PIE);
  fill(19,32,137);
  arc(155, 540, 175, 175, DisDeg+ OnDeg+ConvDeg+SupDeg+HypDeg, DisDeg+ OnDeg+ConvDeg+SupDeg+HypDeg+OthDeg, PIE);
  
  fill(51);
  textFont(body, 12);
  text("Online", 40+15, 635+10);
  text("Discounters", 40+15, 652.5+10);
  text("Convenience Stores", 40+15, 670+10);
  text("Small Supermarkets", 150+15, 635+10); 
  text("Hypermarkets and Superstores", 150+15, 652.5,105,35);
  text("Other", 40+15, 617.5+10);
  noStroke();
  fill(54,170,214);
  rect(40, 635, 10, 10);
   fill(40,117,147);
  rect(40, 652.5, 10, 10);
  fill(52,214,191);
  rect(40, 670, 10, 10);
  fill(59,191,255);
  rect(150, 635, 10, 10);
  fill(16,163,175);
  rect(150, 652.5, 10, 10);
  fill(19,32,137);
  rect(40, 617.5, 10, 10);
//  
}

void brandGraph(){
  bsBrand = new Container(310, 60, 610, 340, "2014 Sales by Brand (m)");
 brandGraph = new Graph(380,385,500,260,sumTop100, "brandGraph");
}

void turnoverBoxPlot()
{
  bsBoxPlot1 = new Container(640, 430, 610, 115, "2013 Supplier Turnover Analysis");
  turnoverBoxPlot = new BoxPlot(685,530,525,sumTop150,"turnover");
}

void profitBoxPlot()
{
  bsBoxPlot2 = new Container(640, 575, 610, 115, "2013 Supplier Profit Analysis");
  turnoverBoxPlot = new BoxPlot(685,675,525,sumTop150,"profit");
}
