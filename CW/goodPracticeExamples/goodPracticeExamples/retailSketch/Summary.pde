
int Srankx = 1065;
int Sranky = 140;
int Sbrandx = 1110;
int Sbrandy = 140;
int brandScroll1 = 0;
Graph salesGraph;
Graph fuelGraph;
Container sumSalesMCont;
Container sumSalesYCont;
Container sumTop100Cont;
Container sumAvailCont;


void summary() {
  fill(247);
  strokeWeight(2);
  rect(0, 30, width-1, height-32);
  summaryTab();

  summarytop100BrandsTable();
  salesGraph();
  fuelGraph();
  availabilityDots();
  summaryTab();
  noStroke();
  fill(247);
  ellipseMode(CENTER);
}

void summaryTab() {
  fill(247); 
  strokeWeight(1.5);
  stroke(0, 158, 217);
  rect(width/4, 0, width/4, 30);
  rect(width/2, 0, width/4, 30);
  rect(3*width/4, 0, width/4, 30);
  fill(210, 242, 255);
  rect(0, 0, width/4, 30);
  line(0, 30, width, 30);

  fill(100);
  textFont(tab, 24);
  text("Summary", 10, 23);
  text("GRDI and Retail Sales Index", 330, 23);
  text("Brand and Supplier Analysis", 650, 23);
  text("Grocer 33 Analysis", 970, 23);
}

void summarytop100BrandsTable()
{
  sumSalesYCont = new Container(1040, 60, 210, 630, "Top 100 Brands 2014");

  for (int row=0;row<sumTop100.getRowCount(); row++)
  {
    int rank = sumTop100.getInt(row, "Rank in 2014");
    String brand = sumTop100.getString(row, "Brand");
    textFont(body, 12);
    text(rank, Srankx, (Sranky+row*20)+brandScroll1);
    text(brand, Sbrandx, (Sbrandy+row*20)+brandScroll1);
  }
  noStroke();
  fill(255);
  rect(1041, 101, 200, 25);
  fill(110);
  textFont(th, 12);
  text("Rank", 1055, 123);
  text("Brand", 1110, 123);
  stroke(230);
  strokeWeight(1);
  line(1090, 115, 1090, 685);
  line(1050, 128, 1230, 128);

  noStroke();
  fill(247);
  rect(1040, 691, 210, 29);
  rect(1040, 31, 210, 29);



  stroke(220);
  strokeWeight(1);
  fill(247);
  rect(1040, 60, 210, 40, 2, 2, 0, 0);
  textFont(titleFont, 14);
  fill(51);
  text("Top 100 Brands 2014", 1040+15, 60+26);
  image(up, 1220, 140, 15, 15);
  image(down, 1220, 660, 15, 15);
}

void salesGraph()
{
  sumSalesMCont = new Container(30, 60, 400, 460, "Retail Sales by Value in 2013 (,000 (£))");

  salesGraph = new Graph(100, 480, 300, 350, retailSalesVal, "salesVal");
   noStroke();
  fill(87, 128, 186);
  rect(37,460,10,10);
  fill(0, 158, 217);
  rect(37,480,10,10);
  fill(0, 74, 219);
  ellipse(42.5,505,10,10);
  fill(51);
  textFont(body,12);
  text("Retail",37+15,468);
  text("Fuel",37+15,488);
  text("Avg",42+10,509);
}

void fuelGraph()
{
  sumSalesYCont = new Container(460, 60, 550, 460, "Total Retail Sales by Value from 2003 to 2013 (,000 (£))");

  fuelGraph = new Graph(537, 480, 450, 350, histSales, "histVal");
  noStroke();
  fill(87, 128, 186);
  rect(467,460,10,10);
  fill(0, 158, 217);
  rect(467,480,10,10);
  fill(0, 74, 219);
  ellipse(472,505,10,10);
  fill(51);
  textFont(body,12);
  text("Retail",467+15,468);
  text("Fuel",467+15,488);
  text("Avg",472+10,509);
}

void availabilityDots()
{

  float amax = 0.00;
  float aavg = 0.00;
  float amin = 1.00;
  Float atot = 0.00;
  float mmax = 0.00;
  float mavg = 0.00;
  float mmin = 1.00;
  Float mtot = 0.00;
  float smax = 0.00;
  float savg = 0.00;
  float smin = 1.00;
  Float stot = 0.00;
  float tmax = 0.00;
  float tavg = 0.00;
  float tmin = 1.00;
  Float ttot = 0.00;
  float wmax = 0.00;
  float wavg = 0.00;
  float wmin = 1.00;
  Float wtot = 0.00;
  sumSalesYCont = new Container(30, 550, 980, 140, "Stock Availability for the Past 20 Weeks for the Big 5");
  for (int row=0;row<grocerAvail.getRowCount(); row++)
  {
    Float avail = grocerAvail.getFloat(row, "Availability");
    String retailer = grocerAvail.getString(row, "Retailer");

    if (retailer.equals("Asda")) {

      if (avail > amax) {
        amax = avail;
      }
      else if (avail < amin) {
        amin = avail;
      }
      else {
        amax=amax;
        amin=amin;
      }
      atot += avail;
    }

    if (retailer.equals("Morrisons")) {

      if (avail > mmax) {
        mmax = avail;
      }
      else if (avail < mmin) {
        mmin = avail;
      }
      else {
        mmax=mmax;
        mmin=mmin;
      }
      mtot += avail;
    }

    if (retailer.equals("Sainsburys")) {

      if (avail > smax) {
        smax = avail;
      }
      else if (avail < smin) {
        smin = avail;
      }
      else {
        smax=smax;
        smin=smin;
      }
      stot += avail;
    }

    if (retailer.equals("Tesco")) {

      if (avail > tmax) {
        tmax = avail;
      }
      else if (avail < tmin) {
        tmin = avail;
      }
      else {
        tmax=tmax;
        tmin=tmin;
      }
      ttot += avail;
    }

    if (retailer.equals("Waitrose")) {

      if (avail > wmax) {
        wmax = avail;
      }
      else if (avail < wmin) {
        wmin = avail;
      }
      else {
        wmax=wmax;
        wmin=wmin;
      }
      wtot += avail;
    }
  }
  aavg = atot/21;
  mavg = mtot/21;
  savg = stot/21;
  tavg = ttot/21;
  wavg = wtot/21;
  fill(110);
  textFont(body, 12);

  text("Max", 40+15, 614);
  text("Avg", 40+15, 644);
  text("Min", 40+15, 674);

  fill(51);
  text("Asda", 920+15, 609);
  text("Morrisons", 920+15, 626);
  text("Sainsburys", 920+15, 644);
  text("Tesco", 920+15, 661);
  text("Waitrose", 920+15, 678);
  fill(110);

  textFont(body, 14);
  text(nf(amax*100, 0, 2) + "%", 120+25+15, 615);
  text(nf(aavg*100, 0, 2)+"%", 130+25+15, 645);
  text(nf(amin*100, 0, 2)+"%", 120+25+15, 675);

  text(nf(mmax*100, 0, 2) + "%", 290+25+15, 615);
  text(nf(mavg*100, 0, 2)+"%", 300+15+25, 645);
  text(nf(mmin*100, 0, 2)+"%", 290+15+25, 675);

  text(nf(smax*100, 0, 2) + "%", 460+15+25, 615);
  text(nf(savg*100, 0, 2)+"%", 470+15+25, 645);
  text(nf(smin*100, 0, 2)+"%", 460+15+25, 675);

  text(nf(tmax*100, 0, 2) + "%", 630+15+25, 615);
  text(nf(tavg*100, 0, 2)+"%", 640+15+25, 645);
  text(nf(tmin*100, 0, 2)+"%", 630+15+25, 675);

  text(nf(wmax*100, 0, 2) + "%", 800+15+25, 615);
  text(nf(wavg*100, 0, 2)+"%", 810+15+25, 645);
  text(nf(wmin*100, 0, 2)+"%", 800+15+25, 675);

  ellipseMode(CORNER);
  stroke(0);
  fill(cAsda);
  ellipse(45+15+25, 605, 70, 70);
  fill(cMorrisons);
  ellipse(215+15+25, 605, 70, 70);
  fill(cSainsburys);
  ellipse(385+15+25, 605, 70, 70);
  fill(cTesco);
  ellipse(555+15+25, 605, 70, 70);
  fill(cWaitrose);
  ellipse(725+15+25, 605, 70, 70);

  noStroke();
  fill(cAsda);
  rect(900+15, 600, 10, 10);
  fill(cMorrisons);
  rect(900+15, 617.5, 10, 10);
  fill(cSainsburys);
  rect(900+15, 635, 10, 10);
  fill(cTesco);
  rect(900+15, 652.5, 10, 10);
  fill(cWaitrose);
  rect(900+15, 670, 10, 10);
}

