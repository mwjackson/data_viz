int GRDIRankx = 715;
int GRDIRanky = 550;
int GRDICountryx = 750;
int GRDICountryy = 550;
int GRDIRankChangex = 995;
int GRDIRankChangey = 550;
int GRDIScorex = 1030;
int GRDIScorey = 550;
int markAcrx = 1070;
int markAcry = 550;
int riskx = 1115;
int risky = 550;
int marksatx = 1160;
int marksaty = 550;
int timepresx = 1205;
int timepresy = 550;
int GRDIScroll = 0;
GeoMap geoMap;
color minColour, maxColour;
int markAtt = 1;
int risk = 0;
int markSat = 0;
int timePres = 0;
Container onsSaleVal;
Container onsSaleVol;
Container onsTable;
Container onsMap;
Container onsText;
Container onsGRDI;
Tooltip valSales;
Tooltip volSales;
Tooltip mapTip;
Help help;

void onsAnalysis() {
  fill(247);
  strokeWeight(2);
  rect(0, 30, width-1, height-32);
  onsAnalysisTab();

  GRDITable();
  noStroke();
  fill(247);
  rect(690, 441, 560, 29);
  rect(690, 691, 560, 29);
  onsSaleValPie();

  onsSaleVolPie();
  if (markAtt == 1) {
    risk = 0;
    markSat = 0;
    timePres = 0;
    GRDIMarkMap();
  }
  else if (risk == 1) {
    markAtt = 0;
    markSat = 0;
    timePres = 0;
    GRDIRiskMap();
  }
  else if (markSat == 1) {
    markAtt = 0;
    timePres = 0;
    risk = 0;
    GRDISatMap();
  }
  else if (timePres == 1) {
    markAtt = 0;
    risk = 0;
    markSat = 0;
    GRDITimeMap();
  }
  fill(255);
  strokeWeight(1);
  rect(880, 67.5, 30, 25);
  rect(923, 67.5, 40, 25);
  rect(976, 67.5, 30, 25);
  rect(1019, 67.5, 40, 25);
  fill(110);
  
  text("MA",889,84);
  text("Risk",934,84);
  text("MS",985,84);
  text("Time",1028,84);

  noStroke();

}

void onsAnalysisTab() {
  fill(247); 
  strokeWeight(1.5);
  stroke(0, 158, 217);
  fill(210, 242, 255);
  rect(width/4, 0, width/4, 30);
  fill(247); 
  rect(width/2, 0, width/4, 30);
  rect(3*width/4, 0, width/4, 30);
  rect(0, 0, width/4, 30);
  line(0, 30, width, 30);

  fill(100);
  textFont(tab, 24);
  text("Summary", 10, 23);
  text("GRDI and Retail Sales Index", 330, 23);
  text("Brand and Supplier Analysis", 650, 23);
  text("Grocer 33 Analysis", 970, 23);
  onsGRDI = new Container(30,430,630,260,"What is GRDI?");
  fill(110);
  textFont(body, 14);
  text("The Global Retail Development Index (GRDI) is an annual study that ranks the top 30 developing countries for retail expansion worldwide. The Index analyses 25 macroeconomic and retail-specific variables to help retailers devise successful global strategies and to identify emerging market investment opportunities. The GRDI is unique because it identifies today's most successful markets and those that offer the most potential for the future.",45,485,600,245);
}

void GRDITable()
{
  onsTable = new Container(690, 470, 560, 220, "GRDI Table");
  for (int row=0;row<GRDIdata.getRowCount(); row++)
  {
    int rank = GRDIdata.getInt(row, "2013 Rank");
    String country = GRDIdata.getString(row, "Country");
    int rankChange = GRDIdata.getInt(row, "2012 Rank") - GRDIdata.getInt(row, "2013 Rank");
    float GRDIScore = GRDIdata.getFloat(row, "GRDI Score");
    float markatt = GRDIdata.getFloat(row, "Market Attractiveness");
    float risk = GRDIdata.getFloat(row, "Country Risk");
    float marksat = GRDIdata.getFloat(row, "Market Saturation");
    float timepres = GRDIdata.getFloat(row, "Time Pressure");
    String status = GRDIdata.getString(row, "Status");

    textFont(body, 12);
    text(rank, GRDIRankx, (GRDIRanky+row*20)+GRDIScroll);
    text(country, GRDICountryx, (GRDICountryy+row*20)+GRDIScroll);
    text(rankChange, GRDIRankChangex, (GRDIRankChangey+row*20)+GRDIScroll);
    text(str(GRDIScore), GRDIScorex, (GRDIScorey+row*20)+GRDIScroll);
    text(str(markatt), markAcrx, (markAcry+row*20)+GRDIScroll);
    text(str(risk), riskx, (risky+row*20)+GRDIScroll);
    text(str(marksat), marksatx, (marksaty+row*20)+GRDIScroll);
    text(str(timepres), timepresx, (timepresy+row*20)+GRDIScroll);
  }
  noStroke();
  fill(255);
  rect(691, 511, 558, 26);
  rect(691, 675, 559, 15);
  fill(110);
  textFont(th, 12);
  text("Rank", GRDIRankx-10, 535);
  text("Country", GRDICountryx-1, 535);
  text("Change", GRDIRankChangex-16, 535);
  text("Score", GRDIScorex-2, 535);
  text("MA", markAcrx-1, 535);
  text("Risk", riskx-1, 535);
  text("MS", marksatx-1, 535);
  text("Time", timepresx-1, 535);
  stroke(230);
  strokeWeight(1);
  line(700, 538, 1230, 538);
  line(GRDIRankx+25, 525, GRDIRankx+25, 685);
  line(GRDIRankChangex-20, 525, GRDIRankChangex-20, 685);
  line(GRDIScorex-10, 525, GRDIScorex-10, 685);
  line(markAcrx-10, 525, markAcrx-10, 685);
  line(riskx-10, 525, riskx-10, 685);
  line(marksatx-10, 525, marksatx-10, 685);
  line(timepresx-10, 525, timepresx-10, 685);

  stroke(220);
  strokeWeight(1);
  line(691, 690, 691, 1250);
  fill(247);
  rect(690, 470, 560, 40, 2, 2, 0, 0);
  textFont(titleFont, 14);
  fill(51);
  text("GDRI Table", 690+15, 470+26);
  image(up, 1230, 550, 15, 15);
  image(down, 1230, 660, 15, 15);
  
  fill(17,127,234);
  ellipse(1220,490,25,25);
  fill(255);
  textFont(body,14);
  text("?",1217.5,495);
  if(mouseX > 1205 && mouseX < 1235 && mouseY > 480 && mouseY < 505)
  {
    help = new Help(690, 470, 560, 220,"This table contains the actual figures visualised in the map above. Change is the change in rank between 2013 and 2012. Score is the score given and assessed as the GDRI score, MA is the Market Attractiveness, Risk is how risky the country is. MS is how saturated the market is. Time is the amount of time pressure there is on the country in terms of how soon action should be taken.");
  }
}

void onsSaleValPie() {
  onsSaleVal = new Container(30, 60, 300, 340, "Retail Sales by Value in 2013 by Area");
  int food = 0;
  int nonFood = 0;
  int nonStore = 0 ;
  int fuel = 0;
  int total = 0;
  for (int row=0;row<retailSalesVal.getRowCount(); row++)
  {
    int foodVal = retailSalesVal.getInt(row, "Predominantly food stores");
    food = food + foodVal;
    int nonFoodVal = retailSalesVal.getInt(row, "Predominantly non-food stores");
    nonFood = nonFood + nonFoodVal;
    int nonStoreVal = retailSalesVal.getInt(row, "Non-store retailing");
    nonStore = nonStore + nonStoreVal;
    int fuelVal = retailSalesVal.getInt(row, "Automotive fuel");
    fuel = fuel + fuelVal;
  }
  total = fuel+nonStore+food+nonFood;
  fill(0);

  float foodDeg = (float(food)/float(total))*2*PI;
  float nonFoodDeg = (float(nonFood)/float(total))*2*PI;
  float nonStoreDeg = (float(nonStore)/float(total))*2*PI;
  float fuelDeg = (float(fuel)/float(total))*2*PI;
  stroke(255);
  strokeWeight(1);
  fill(87, 128, 186);
  if (mouseX >160 && mouseX < 240) {
    if (mouseY < 310 && mouseY > 250)
    {
      arc(180, 230, 250, 250, 0, foodDeg, PIE);
      valSales = new Tooltip(40, 365, 130, 25, "h", nfc(food));
      stroke(255);
    }
    else {
      arc(180, 230, 225, 225, 0, foodDeg, PIE);
    }
  }
  else {
    arc(180, 230, 225, 225, 0, foodDeg, PIE);
  }

  fill(25, 94, 188);

  if (mouseX >100 && mouseX < 170) {
    if (mouseY < 225 && mouseY > 160)
    {
      arc(180, 230, 250, 250, foodDeg, nonFoodDeg+foodDeg, PIE);
      valSales = new Tooltip(40, 365, 130, 25, "h", nfc(nonFood));
      stroke(255);
    }
    else {
      arc(180, 230, 225, 225, foodDeg, nonFoodDeg+foodDeg, PIE);
    }
  }
  else {
    arc(180, 230, 225, 225, foodDeg, nonFoodDeg+foodDeg, PIE);
  }

  fill(110, 160, 230);


  if (mouseX >225 && mouseX < 250) {
    if (mouseY < 170 && mouseY > 145)
    {
      arc(180, 230, 250, 250, nonFoodDeg+foodDeg, foodDeg+nonFoodDeg+nonStoreDeg, PIE);
      valSales = new Tooltip(40, 365, 130, 25, "h", nfc(nonStore));
      stroke(255);
    }
    else {
      arc(180, 230, 225, 225, nonFoodDeg+foodDeg, foodDeg+nonFoodDeg+nonStoreDeg, PIE);
    }
  }
  else {
    arc(180, 230, 225, 225, nonFoodDeg+foodDeg, foodDeg+nonFoodDeg+nonStoreDeg, PIE);
  }



  fill(0, 158, 217);


  if (mouseX >236 && mouseX < 280) {
    if (mouseY < 225 && mouseY > 185)
    {
      arc(180, 230, 250, 250, foodDeg+nonFoodDeg+nonStoreDeg, foodDeg+nonFoodDeg+nonStoreDeg+fuelDeg, PIE);
      valSales = new Tooltip(40, 365, 130, 25, "h", nfc(fuel));
      stroke(255);
    }
    else {
      arc(180, 230, 225, 225, foodDeg+nonFoodDeg+nonStoreDeg, foodDeg+nonFoodDeg+nonStoreDeg+fuelDeg, PIE);
    }
  }
  else {
    arc(180, 230, 225, 225, foodDeg+nonFoodDeg+nonStoreDeg, foodDeg+nonFoodDeg+nonStoreDeg+fuelDeg, PIE);
  }

  noStroke();

  Float foodPerc = float(food)/float(total);
  Float nonfoodPerc = float(nonFood)/float(total);
  Float nonStorePerc = float(nonStore)/float(total);
  Float fuelPerc = float(fuel)/float(total);

  fill(255);
  textFont(pieVal, 20);
  text(round(foodPerc*100)+"%", 175, 290);
  text(round(nonfoodPerc*100)+"%", 120, 200);
  text(round(nonStorePerc*100)+"%", 223, 170);
  text(round(fuelPerc*100)+"%", 230, 215);
  noStroke();
  fill(87, 128, 186);
  rect(180, 360+3, 10, 10);
  fill(25, 94, 188);
  rect(180, 377.5+3, 10, 10);
  fill(110, 160, 230);
  rect(250, 360+3, 10, 10);
  fill(0, 158, 217);
  rect(250, 377.5+3, 10, 10);

  textFont(body, 12);
  fill(51);
  text("Food", 195, 372);
  text("Non-Food", 195, 389);
  text("Non-Store", 265, 371);
  text("Fuel", 265, 389);
  fill(110);
}

void onsSaleVolPie() {
  onsSaleVol = new Container(360, 60, 300, 340, "Retail Sales by Volume in 2013 by Area");
  int food = 0;
  int nonFood = 0;
  int nonStore = 0 ;
  int fuel = 0;
  int total = 0;
  for (int row=0;row<retailSalesVol.getRowCount(); row++)
  {
    int foodVol = retailSalesVol.getInt(row, "Predominantly food stores");
    food = food + foodVol;
    int nonFoodVol = retailSalesVol.getInt(row, "Predominantly non-food stores");
    nonFood = nonFood + nonFoodVol;
    int nonStoreVol = retailSalesVol.getInt(row, "Non-store retailing");
    nonStore = nonStore + nonStoreVol;
    int fuelVol = retailSalesVol.getInt(row, "Automotive fuel");
    fuel = fuel + fuelVol;
  }
  total = fuel+nonStore+food+nonFood;
  fill(0);

  float listedDeg = (float(food)/float(total))*2*PI;
  float familyDeg = (float(nonFood)/float(total))*2*PI;
  float ukSubDeg = (float(nonStore)/float(total))*2*PI;
  float PEDeg = (float(fuel)/float(total))*2*PI;
  stroke(255);
  strokeWeight(1);
  fill(87, 128, 186);


  if (mouseX >490 && mouseX < 570) {
    if (mouseY < 310 && mouseY > 250)
    {
      arc(510, 230, 250, 250, 0, listedDeg, PIE);
      volSales = new Tooltip(370, 365, 130, 25, "h", nfc(food));
      stroke(255);
    }
    else {
      arc(510, 230, 225, 225, 0, listedDeg, PIE);
    }
  }
  else {
    arc(510, 230, 225, 225, 0, listedDeg, PIE);
  }

  fill(25, 94, 188);


  if (mouseX >430 && mouseX < 500) {
    if  (mouseY < 225 && mouseY > 160)
    {
      arc(510, 230, 250, 250, listedDeg, familyDeg+listedDeg, PIE);
      volSales = new Tooltip(370, 365, 130, 25, "h", nfc(nonFood));
      stroke(255);
    }
    else {
      arc(510, 230, 225, 225, listedDeg, familyDeg+listedDeg, PIE);
    }
  }
  else {
    arc(510, 230, 225, 225, listedDeg, familyDeg+listedDeg, PIE);
  }


  fill(110, 160, 230);

  if (mouseX >555 && mouseX < 580) {
    if (mouseY < 170 && mouseY > 145)
    {
      arc(510, 230, 250, 250, familyDeg+listedDeg, listedDeg+familyDeg+ukSubDeg, PIE);
      volSales = new Tooltip(370, 365, 130, 25, "h", nfc(nonStore));
      stroke(255);
    }
    else {
      arc(510, 230, 225, 225, familyDeg+listedDeg, listedDeg+familyDeg+ukSubDeg, PIE);
    }
  }
  else {
    arc(510, 230, 225, 225, familyDeg+listedDeg, listedDeg+familyDeg+ukSubDeg, PIE);
  }




  fill(0, 158, 217);


  if (mouseX >566 && mouseX < 610) {
    if (mouseY < 225 && mouseY > 185)
    {
      arc(510, 230, 250, 250, listedDeg+familyDeg+ukSubDeg, listedDeg+familyDeg+ukSubDeg+PEDeg, PIE);
      volSales = new Tooltip(370, 365, 130, 25, "h", nfc(fuel));
      stroke(255);
    }
    else {
      arc(510, 230, 225, 225, listedDeg+familyDeg+ukSubDeg, listedDeg+familyDeg+ukSubDeg+PEDeg, PIE);
    }
  }
  else {
    arc(510, 230, 225, 225, listedDeg+familyDeg+ukSubDeg, listedDeg+familyDeg+ukSubDeg+PEDeg, PIE);
  }


  noStroke();

  Float foodPerc = float(food)/float(total);
  Float nonfoodPerc = float(nonFood)/float(total);
  Float nonStorePerc = float(nonStore)/float(total);
  Float fuelPerc = float(fuel)/float(total);

  fill(255);
  textFont(pieVal, 20);
  text(round(foodPerc*100)+"%", 510, 290);
  text(round(nonfoodPerc*100)+"%", 450, 200);
  text(round(nonStorePerc*100)+"%", 557, 170);
  text(round(fuelPerc*100)+"%", 560, 215);

  noStroke();
  fill(87, 128, 186);
  rect(510, 360+3, 10, 10);
  fill(25, 94, 188);
  rect(510, 377.5+3, 10, 10);
  fill(110, 160, 230);
  rect(580, 360+3, 10, 10);
  fill(0, 158, 217);
  rect(580, 377.5+3, 10, 10);

  textFont(body, 12);
  fill(51);
  text("Food", 525, 372);
  text("Non-Food", 525, 389);
  text("Non-Store", 595, 371);
  text("Fuel", 595, 389);
  fill(110);
}

void GRDIMarkMap()
{
  onsMap = new Container(690, 60, 560, 380, "World Map of GRDI Measures");
  geoMap = new GeoMap(691, 115, 559, 324, this);
  geoMap.readFile("world");
  strokeWeight(1.5);
  stroke(0, 40);              
  fill(0, 173, 0);          
  geoMap.draw();
  float dataMax = 0;
  float val=0.00;
  for (int i=0;i<GRDIdata.getRowCount();i++) {
    val = GRDIdata.getFloat(i, "Market Attractiveness");
    if (val > dataMax) {
      dataMax = val;
    } 
    else {
      dataMax=dataMax;
    }
  }



  for (int id : geoMap.getFeatures().keySet())
  {
    String countryCode = geoMap.getAttributes().getString(id, 2);
    TableRow row = GRDIdata.findRow(countryCode, 1);
    maxColour = color(139, 188, 255);  // Light blue
    minColour = color(70, 100, 142);
    if (row != null)       // Table row matches country code
    {
      float markAtt = row.getFloat(6)/dataMax;
      fill(lerpColor(minColour, maxColour, markAtt));
    }
    else                   // No data found in table.
    {
      fill(250);
    }

    geoMap.draw(id); // Draw country
  }

  int id2 = geoMap.getID(mouseX, mouseY);
  if (id2 != -1)
  {
    fill(0, 0, 210);
    geoMap.draw(id2);

    String name = geoMap.getAttributes().getString(id2, 3);


    mapTip = new Tooltip(mouseX+20, mouseY, 100, 40, "w", name);
  }
  image(markLeg, 720, 380, 70, 15);
  fill(51);
  textFont(body, 12);
  text("min", 700, 390);
  text("max", 792, 390);
}

void GRDIRiskMap()
{
  onsMap = new Container(690, 60, 560, 380, "World Map of GRDI Measures");
  geoMap = new GeoMap(691, 115, 559, 324, this);
  geoMap.readFile("world");
  strokeWeight(1.5);
  stroke(0, 40);              
  fill(0, 173, 0);          
  geoMap.draw();
  float dataMax = 0;
  for (int i=0;i<GRDIdata.getRowCount();i++) {
    float val = GRDIdata.getFloat(i, "Country Risk");
    if (val > dataMax) {
      dataMax = val;
    } 
    else {
      dataMax=dataMax;
    }
  }



  for (int id : geoMap.getFeatures().keySet())
  {
    String countryCode = geoMap.getAttributes().getString(id, 2);
    TableRow row = GRDIdata.findRow(countryCode, 1);
    minColour = color(255, 201, 203);  // Light blue
    maxColour = color(165, 0, 0);
    if (row != null)       // Table row matches country code
    {
      float risk = row.getFloat(7)/dataMax;
      fill(lerpColor(minColour, maxColour, risk));
    }
    else                   // No data found in table.
    {
      fill(250);
    }

    geoMap.draw(id); // Draw country
  }

  int id = geoMap.getID(mouseX, mouseY);
  if (id != -1)
  {
    fill(0, 0, 210);
    geoMap.draw(id);

    String name = geoMap.getAttributes().getString(id, 3);

    mapTip = new Tooltip(mouseX+20, mouseY, 100, 40, "w", name);
  }
  image(riskLeg, 720, 380, 70, 15);
  fill(51);
  textFont(body, 12);
  text("min", 700, 390);
  text("max", 792, 390);
}

void GRDISatMap()
{
  onsMap = new Container(690, 60, 560, 380, "World Map of GRDI Measures");
  geoMap = new GeoMap(691, 115, 559, 324, this);
  geoMap.readFile("world");
  strokeWeight(1.5);
  stroke(0, 40);              
  fill(0, 173, 0);          
  geoMap.draw();
  float dataMax = 0;
  for (int i=0;i<GRDIdata.getRowCount();i++) {
    float val = GRDIdata.getFloat(i, "Market Saturation");
    if (val > dataMax) {
      dataMax = val;
    } 
    else {
      dataMax=dataMax;
    }
  }



  for (int id : geoMap.getFeatures().keySet())
  {
    String countryCode = geoMap.getAttributes().getString(id, 2);
    TableRow row = GRDIdata.findRow(countryCode, 1);
    minColour = color(0, 255, 40);  // Light blue
    maxColour = color(0, 124, 19);
    if (row != null)       // Table row matches country code
    {
      float sat = row.getFloat(8)/dataMax;
      fill(lerpColor(minColour, maxColour, sat));
    }
    else                   // No data found in table.
    {
      fill(250);
    }

    geoMap.draw(id); // Draw country
  }

  int id = geoMap.getID(mouseX, mouseY);
  if (id != -1)
  {
    fill(0, 0, 210);
    geoMap.draw(id);

    String name = geoMap.getAttributes().getString(id, 3);
    mapTip = new Tooltip(mouseX+20, mouseY, 100, 40, "w", name);
  }
  image(satLeg, 720, 380, 70, 15);
  fill(51);
  textFont(body, 12);
  text("min", 700, 390);
  text("max", 792, 390);
}

void GRDITimeMap()
{
  onsMap = new Container(690, 60, 560, 380, "World Map of GRDI Measures");
  geoMap = new GeoMap(691, 115, 559, 324, this);
  geoMap.readFile("world");
  strokeWeight(1.5);
  stroke(0, 40);              
  fill(0, 173, 0);          
  geoMap.draw();
  int colBarw = 100;
  int colBarh = 30;

  float dataMax = 0;
  for (int i=0;i<GRDIdata.getRowCount();i++) {
    float val = GRDIdata.getFloat(i, "Time Pressure");
    if (val > dataMax) {
      dataMax = val;
    } 
    else {
      dataMax=dataMax;
    }
  }



  for (int id : geoMap.getFeatures().keySet())
  {
    String countryCode = geoMap.getAttributes().getString(id, 2);
    TableRow row = GRDIdata.findRow(countryCode, 1);
    minColour = color(255, 196, 0);  // Light blue
    maxColour = color(129, 99, 0);
    Float time = 0.00;
    if (row != null)       // Table row matches country code
    {
      time = row.getFloat(9)/dataMax;
      fill(lerpColor(minColour, maxColour, time));
    }
    else                   // No data found in table.
    {
      fill(250);
    }

    geoMap.draw(id); // Draw country
  }

  int id = geoMap.getID(mouseX, mouseY);
  if (id != -1)
  {
    fill(150);
    geoMap.draw(id);

    String name = geoMap.getAttributes().getString(id, 3);
    mapTip = new Tooltip(mouseX+20, mouseY, 100, 40, "w", name);
  }
  image(timeLeg, 720, 380, 70, 15);
  fill(51);
  textFont(body, 12);
  text("min", 700, 390);
  text("max", 792, 390);
}

