import org.gicentre.utils.colour.*;   // For colour tables.import org.gicentre.utils.colour.*;   // For colour tables. //<>// //<>//
import org.gicentre.utils.gui.*; // tooltips
import controlP5.ControlP5;

ControlP5 cp5;

Table all_occ; 

Tooltip tooltip;

ColourTable colorPositive;   // Will store a Brewer colour table.
ColourTable colorNegative; 

color[] PALETTE = {#69D2E7, #A7DBD8, #E0E4CC, #F38630, #FA6900};

float dataMin = 0;
float dataMax = 25;

float percentMin = -0.3;
float percentMax = 0.5;

String page = "overview";
PFont font;
int windowWidth = 1500;
int windowHeight = 2000;

void setup()
{
  PFont titleFont = loadFont("Aller-Bold-20.vlw"); 
  
  font = createFont("sans-serif", 12);
  cp5 = new ControlP5(this);

  size(2000, 1500);  // Set up the sketch area 

  all_occ = loadTable("data/alloccupations.csv", "header,csv");

  colorPositive = ColourTable.getPresetColourTable(ColourTable.REDS, 0, percentMax);
  colorNegative = ColourTable.getPresetColourTable(ColourTable.BLUES, 0, percentMax); // set negative color intensity to the same scale as positive

  //colorPositive = new ColourTable(); // create new colour bar
  //colorPositive.addContinuousColourRule(0, 0,0,0);
  //colorPositive.addContinuousColourRule(percentMax, 252, 102, 238);

  smooth();

  tooltip = new Tooltip(this, font, 12, 60);
  tooltip.setIsCurved(true);
  tooltip.setBorderWidth(2);
  tooltip.setBackgroundColour(255);
  tooltip.showPointer(false);

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

  page = "overview";
}

void draw()
{
  background(255); 
  title();
  legend();

  tooltip.setIsActive(false);

  if (page.equals("overview")) {
    pageOverview();
  } else if (page.equals("admin")) {
    pageAdmin();
  } else if (page.equals("assprof")) {
    pageAssocProf();
  } else if (page.equals("caring")) {
    pageCaring();
  } else if (page.equals("elem")) {
    pageElem();
  } else if (page.equals("mgrs")) {
    pageMgrs();
  } else if (page.equals("proc")) {
    pageProc();
  } else if (page.equals("prof")) {
    pageProf();
  } else if (page.equals("sales")) {
    pageSales();
  } else if (page.equals("trades")) {
    pageTrades();
  } else {
    println("ERROR NO PAGE FOUND");
  }
}

void pageOverview() {
  layoutCharts(new Chart[] { 
    //new Chart("ALL OCCUPATIONS", loadData("", "ALL OCCUPATIONS")), 
    new Chart("Administrative and secretarial occupations", loadData("", "Administrative and secretarial occupations")), 
    new Chart("Associate professional and technical occupations", loadData("", "Associate professional and technical occupations")), 
    new Chart("Caring, leisure and other service occupations", loadData("", "Caring, leisure and other service occupations")), 
    new Chart("Elementary occupations", loadData("", "Elementary occupations")), 
    new Chart("Managers, directors and senior officials", loadData("", "Managers, directors and senior officials")), 
    new Chart("Process, plant and machine operatives", loadData("", "Process, plant and machine operatives")), 
    new Chart("Professional occupations", loadData("", "Professional occupations")), 
    new Chart("Sales and customer service occupations", loadData("", "Sales and customer service occupations")), 
    new Chart("Skilled trades occupations", loadData("", "Skilled trades occupations")), 
    }, 400, 300);
}

void pageAdmin() {
  layoutCharts(new Chart[] { 
    new Chart("Administrative and secretarial occupations", loadData("", "Administrative and secretarial occupations")), 
    new Chart("Administrative occupations", loadData("", "Administrative occupations")), 
    new Chart("Secretarial and related occupations", loadData("", "Secretarial and related occupations")), 
    }, 500, 400);
}

void pageAssocProf() {
  layoutCharts(new Chart[] { 
    new Chart("Associate professional and technical occupations", loadData("", "Associate professional and technical occupations")), 
    new Chart("Culture, media and sports occupations", loadData("", "Culture, media and sports occupations")), 
    new Chart("Business and public service associate professionals", loadData("", "Business and public service associate professionals")), 
    new Chart("Health and social care associate professionals", loadData("", "Health and social care associate professionals")), 
    new Chart("Protective service occupations", loadData("", "Protective service occupations")), 
    new Chart("Science, engineering and technology associate professionals", loadData("", "Science, engineering and technology associate professionals")), 
    }, 500, 400);
}

void pageCaring() {
  layoutCharts(new Chart[] { 
    new Chart("Caring, leisure and other service occupations", loadData("", "Caring, leisure and other service occupations")), 
    new Chart("Caring personal service occupations", loadData("", "Caring personal service occupations")), 
    new Chart("Leisure, travel and related personal service occupations", loadData("", "Leisure, travel and related personal service occupations")), 
    }, 500, 400);
}

void pageElem() {
  layoutCharts(new Chart[] { 
    new Chart("Elementary occupations", loadData("", "Elementary occupations")), 
    new Chart("Elementary administration and service occupations", loadData("", "Elementary administration and service occupations")), 
    new Chart("Elementary trades and related occupations", loadData("", "Elementary trades and related occupations")), 
    }, 500, 400);
}

void pageMgrs() {
  layoutCharts(new Chart[] { 
    new Chart("Managers, directors and senior officials", loadData("", "Managers, directors and senior officials")), 
    new Chart("Corporate managers and directors", loadData("", "Corporate managers and directors")), 
    new Chart("Other managers and proprietors", loadData("", "Other managers and proprietors")), 
    }, 500, 400);
}

void pageProc() {
  layoutCharts(new Chart[] { 
    new Chart("Process, plant and machine operatives", loadData("", "Process, plant and machine operatives")), 
    new Chart("Process, plant and machine operatives_", loadData("", "Process, plant and machine operatives_")), 
    new Chart("Transport and mobile machine drivers and operatives", loadData("", "Transport and mobile machine drivers and operatives")), 
    }, 500, 400);
}

void pageProf() {
  layoutCharts(new Chart[] { 
    new Chart("Professional occupations", loadData("", "Professional occupations")), 
    new Chart("Business, media and public service professionals", loadData("", "Business, media and public service professionals")), 
    new Chart("Health professionals", loadData("", "Health professionals")), 
    new Chart("Science, research, engineering and technology professionals", loadData("", "Science, research, engineering and technology professionals")), 
    new Chart("Teaching and educational professionals", loadData("", "Teaching and educational professionals")), 
    }, 500, 400);
}

void pageSales() {
  layoutCharts(new Chart[] { 
    new Chart("Sales and customer service occupations", loadData("", "Sales and customer service occupations")), 
    new Chart("Customer service occupations", loadData("", "Customer service occupations")), 
    new Chart("Sales occupations", loadData("", "Sales occupations")), 
    }, 500, 400);
}

void pageTrades() {
  layoutCharts(new Chart[] { 
    new Chart("Skilled trades occupations", loadData("", "Skilled trades occupations")), 
    new Chart("Skilled agricultural and related trades", loadData("", "Skilled agricultural and related trades")), 
    new Chart("Skilled construction and building trades", loadData("", "Skilled construction and building trades")), 
    new Chart("Skilled metal, electrical and electronic trades", loadData("", "Skilled metal, electrical and electronic trades")), 
    new Chart("Textiles, printing and other skilled trades", loadData("", "Textiles, printing and other skilled trades")), 
    }, 500, 400);
}

void layoutCharts(Chart[] charts, int chartWidth, int chartHeight) {
  int columnsPerRow = 3;
  //int chartWidth = 500;
  //int chartHeight = 450;

  int currentColumn = 0;
  int currentRow = 0;
  for (Chart chart : charts) {
    int top = 150 + (chartHeight * currentRow);
    int left = 0 + (chartWidth * currentColumn);
    drawChart(chart.name, top, left, chartWidth, chartHeight, chart.data);

    currentColumn++;
    if (currentColumn == columnsPerRow) {
      currentColumn = 0;
      currentRow++;
    }
  }
}