import org.gicentre.utils.colour.*;   // For colour tables.import org.gicentre.utils.colour.*;   // For colour tables. //<>// //<>//

//test looking at managers, directors and senior officials for male and female and age banding

Table PayTable; 
float maleMin, maleMax, femaleMin, femaleMax;
float dataMin, dataMax;

ColourTable cTable;   // Will store a Brewer colour table.

color[] PALETTE = {#69D2E7, #A7DBD8, #E0E4CC, #F38630, #FA6900};

void setup()
{
  preprocessData();

  size(1500, 2000);  // Set up the sketch area 

  cTable = ColourTable.getPresetColourTable(ColourTable.REDS, 0, 1);// what happens if we get a negative difference? i.e. women earn more than men?  What would the colour be?
  //cTable = new ColourTable(); // create new colour bar
  //cTable.addContinuousColourRule(0,0,0,0);
  //cTable.addContinuousColourRule(0.5,255,0,0);

  smooth();
}

int page = 1;
void draw()
{
  background(225);
  title();
  
  if (page == 1) {
    pageOverview();
  } else if (page == 2) {
    pageAdmin();
  }else if (page == 3) {
    pageAssocProf();
  }else if (page == 4) {
    pageAdmin();
  }else if (page == 5) {
    pageAdmin();
  }
}

void pageOverview() {
  chart("ALL OCCUPATIONS",                                   100, 0, PayTable);
  chart("Associate professional and technical occupations",  100, 600, PayTable);
  chart("Administrative and secretarial occupations",        550, 0, PayTable);
  chart("Caring, leisure and other service occupations",     550, 600, PayTable);
}

void pageAdmin() {
  chart("Administrative and secretarial occupations", 100, 0, PayTable);
  chart("Administrative occupations", 550, 0, PayTable);
  chart("Secretarial and related occupations", 100, 600, PayTable);
}

void pageAssocProf() {
  chart("Associate professional and technical occupations", 100, 0, PayTable);
  chart("Culture, media and sports occupations", 100, 600, PayTable);
  chart("Business and public service associate professionals", 550, 0, PayTable);
  chart("Health and social care associate professionals", 550, 600, PayTable);
  
  chart("Protective service occupations", 1000, 0, PayTable);
  chart("Science, engineering and technology associate professionals", 1000, 600, PayTable);
}

void keyPressed()
{
  if (key=='1') {
    page = 1;
  } else if (key =='2') {
    page = 2;
  } else if (key =='3') {
    page = 3;
  } else if (key =='4') {
    page = 4;
  } else if (key =='5') {
    page = 5;
  } else if (key =='6') {
    page = 6;
  } else if (key =='7') {
    page = 7;
  } else if (key =='8') {
    page = 8;
  } else if (key =='9') {
    page = 9;
  }
}


/*

 TODO:
 
 - preprocess data 
 - remove n/as
 
 - page title
 - chart title
 - selectable occupation list in box
 
 - filter data based on string
 - pass filtered table to tab
 
 */