import org.gicentre.utils.colour.*;   // For colour tables.import org.gicentre.utils.colour.*;   // For colour tables. //<>// //<>//

import controlP5.*;

ControlP5 cp5;

//test looking at managers, directors and senior officials for male and female and age banding

Table PayTable; 

ColourTable cTable;   // Will store a Brewer colour table.

color[] PALETTE = {#69D2E7, #A7DBD8, #E0E4CC, #F38630, #FA6900};

float dataMin = 0;
float dataMax = 50000;

public class Chart {
  public final String name;
  public final List<GenderData> data;

  public Chart(String name, List<GenderData> data) {
    this.name = name;
    this.data = data;
  }
}

public class Button {
  public final String id;
  public final String label;

  public Button(String id, String label) {
    this.id = id;
    this.label = label;
  }
}

void setup()
{
  cp5 = new ControlP5(this);

  //preprocessData();

  size(1500, 2000);  // Set up the sketch area 

  cTable = ColourTable.getPresetColourTable(ColourTable.REDS, 0, 1);// what happens if we get a negative difference? i.e. women earn more than men?  What would the colour be?
  //cTable = new ColourTable(); // create new colour bar
  //cTable.addContinuousColourRule(0,0,0,0);
  //cTable.addContinuousColourRule(0.5,255,0,0);

  smooth();

  key_buttons(20, 620, new Button[] {
    new Button("overview", "Overview"), 
    new Button("admin", "Admin"), 
    new Button("assprof", "Assoc Prof"), 
    new Button("caring", "Caring, Leisure..."), 
    new Button("elem", "Elementary..."), 
    });

  key_buttons(60, 620, new Button[] {
    new Button("mgrs", "Managers, Directors..."), 
    new Button("proc", "Process, plant..."), 
    new Button("prof", "Professional Occ..."), 
    new Button("sales", "Sales & Customer..."), 
    new Button("trades", "Skilled Trades..."), 
    });
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
  } else if (page == 3) {
    pageAssocProf();
  } else if (page == 4) {
    pageAdmin();
  } else if (page == 5) {
    pageAdmin();
  } else if (page == 6) {
    pageAdmin();
  } else if (page == 7) {
    pageAdmin();
  } else if (page == 8) {
    pageAdmin();
  } else if (page == 9) {
    pageAdmin();
  }
}

void pageOverview() {
  layoutCharts(new Chart[] { 
    new Chart("ALL OCCUPATIONS", loadData("data/main_page.csv", "ALL OCCUPATIONS")), 
    });
}

void pageAdmin() {
  layoutCharts(new Chart[] { 
    new Chart("Administrative and secretarial occupations", loadData("data/main_page.csv", "Administrative and secretarial occupations")), 
    new Chart("Administrative occupations", loadData("data/admin.csv", "Administrative occupations")), 
    new Chart("Secretarial and related occupations", loadData("data/admin.csv", "Secretarial and related occupations")), 
    });
}

void pageAssocProf() {
  layoutCharts(new Chart[] { 
    new Chart("Associate professional and technical occupations", loadData("data/main_page.csv", "Associate professional and technical occupations")), 
    new Chart("Culture, media and sports occupations", loadData("data/assoc_prof_tech.csv", "Culture, media and sports occupations")), 
    new Chart("Business and public service associate professionals", loadData("data/assoc_prof_tech.csv", "Business and public service associate professionals")), 
    new Chart("Health and social care associate professionals", loadData("data/assoc_prof_tech.csv", "Health and social care associate professionals")), 
    new Chart("Protective service occupations", loadData("data/assoc_prof_tech.csv", "Protective service occupations")), 
    new Chart("Science, engineering and technology associate professionals", loadData("data/assoc_prof_tech.csv", "Science, engineering and technology associate professionals")), 
    });
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

void layoutCharts(Chart[] charts) {
  int columnsPerRow = 3;
  int chartWidth = 500;
  int chartHeight = 450;

  int currentColumn = 0;
  int currentRow = 0;
  for (Chart chart : charts) {
    int top = 150 + (chartHeight * currentRow);
    int left = 0 + (chartWidth * currentColumn);
    drawChart(chart.name, top, left, chart.data);

    currentColumn++;
    if (currentColumn == columnsPerRow) {
      currentColumn = 0;
      currentRow++;
    }
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