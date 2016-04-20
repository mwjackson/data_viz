import org.gicentre.utils.colour.*;   // For colour tables.import org.gicentre.utils.colour.*;   // For colour tables. //<>// //<>//

//test looking at managers, directors and senior officials for male and female and age banding

Table PayTable; 
float maleMin, maleMax, femaleMin, femaleMax;
float dataMin, dataMax;

ColourTable cTable;   // Will store a Brewer colour table.

void setup()
{
  preprocessData();

  size(1500, 1000);  // Set up the sketch area 

  cTable = ColourTable.getPresetColourTable(ColourTable.REDS, 0, 1);// what happens if we get a negative difference? i.e. women earn more than men?  What would the colour be?
  //cTable = new ColourTable(); // create new colour bar
  //cTable.addContinuousColourRule(0,0,0,0);
  //cTable.addContinuousColourRule(0.5,255,0,0);

  smooth();
}

int page = 1;
void draw()
{
  if (page == 1) {
    pageOverview();
  } else if (page == 2) {
    pageAdmin();
  }
}

void pageOverview() {
  background(225);

  title();
  chart("ALL OCCUPATIONS", 100, 0, PayTable);
  chart("Administrative and secretarial occupations", 550, 0, PayTable);
  chart("Associate professional and technical occupations", 100, 600, PayTable);
  chart("Caring, leisure and other service occupations", 550, 600, PayTable);
}

void pageAdmin() {
  background(225);

  title();
  chart("Administrative and secretarial occupations", 100, 0, PayTable);
  chart("Administrative occupations", 550, 0, PayTable);
  chart("Secretarial and related occupations", 100, 600, PayTable);
}

void keyPressed()
{
  if (key=='1') {
    page = 1;
  } else if (key =='2') {
    page = 2;
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