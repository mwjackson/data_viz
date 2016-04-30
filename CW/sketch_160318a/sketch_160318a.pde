import org.gicentre.utils.colour.*;   // For colour tables.import org.gicentre.utils.colour.*;   //<>// //<>// //<>//
import org.gicentre.utils.gui.*; // tooltips
import controlP5.ControlP5; // buttons

ControlP5 cp5;
Tooltip tooltip;

// all occupations data
Table all_occ; 

float dataMin = 0;
float dataMax = 25;

float percentMin = -0.5;
float percentMax = 0.5;

// default page is overview
String page = "overview";

// matt: comment this
int windowWidth = 1500;
int windowHeight = 2000;

void setup()
{
  // load fonts
  menuFont = loadFont("Aller-14.vlw"); 
  titleFont = loadFont("Aller-Bold-20.vlw");
  subTitleFont = loadFont("Aller-14.vlw");
  
  cp5 = new ControlP5(this);

  size(1500, 1100);  // Set up the sketch area 

  all_occ = loadTable("data/alloccupations.csv", "header,csv");

  //colorPositive = ColourTable.getPresetColourTable(ColourTable.REDS, 0, percentMax);
  //colorNegative = ColourTable.getPresetColourTable(ColourTable.BLUES, 0, percentMax); // set negative color intensity to the same scale as positive

  colourTable = new ColourTable(); // create new colour bar
  colourTable.addContinuousColourRule(percentMin, female);
  colourTable.addContinuousColourRule(0, color(255, 255, 255));
  colourTable.addContinuousColourRule(percentMax, male);

  smooth();

  // configure tooltip styling
  tooltip = new Tooltip(this, menuFont, 12, 60);
  tooltip.setIsCurved(true);
  tooltip.setBorderWidth(2);
  tooltip.setBackgroundColour(255);
  tooltip.showPointer(false);

  // create the menu buttons
  draw_buttons(20, 620, new Button[] {
    new Button("overview", "Overview"), 
    new Button("admin", "Administrative and secretarial occupations"), 
    new Button("assprof", "Associate professional and technical occupations"), 
    new Button("caring", "Caring, leisure and other service occupations"), 
    new Button("elem", "Elementary occupations"), 
    });

  draw_buttons(60, 620, new Button[] {
    new Button("mgrs", "Managers, directors and senior officials"), 
    new Button("proc", "Process, plant and machine operatives"), 
    new Button("prof", "Professional occupations"), 
    new Button("sales", "Sales and customer service occupations"), 
    new Button("trades", "Skilled trades occupations"), 
    });

  // set current page to overview
  page = "overview";
}

void draw()
{
  background(255); 
  title();

  // clean up old tooltips from previous loop
  tooltip.setIsActive(false);

  // draw the page of the "current page" variable
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

// drawing functions for each page
void pageOverview() {
  layoutCharts(new Chart[] { 
    //new Chart("ALL OCCUPATIONS", loadData("", "ALL OCCUPATIONS")), 
    new Chart("Administrative and secretarial occupations", false, loadData("", "Administrative and secretarial occupations")), 
    new Chart("Associate professional and technical occupations", false, loadData("", "Associate professional and technical occupations")), 
    new Chart("Caring, leisure and other service occupations", false, loadData("", "Caring, leisure and other service occupations")), 
    new Chart("Elementary occupations", false, loadData("", "Elementary occupations")), 
    new Chart("Managers, directors and senior officials", false, loadData("", "Managers, directors and senior officials")), 
    new Chart("Process, plant and machine operatives", false, loadData("", "Process, plant and machine operatives")), 
    new Chart("Professional occupations", false, loadData("", "Professional occupations")), 
    new Chart("Sales and customer service occupations", false, loadData("", "Sales and customer service occupations")), 
    new Chart("Skilled trades occupations", false, loadData("", "Skilled trades occupations")), 
    }, 475, 300);
}

void pageAdmin() {
  layoutCharts(new Chart[] { 
    new Chart("Administrative and secretarial occupations", true, loadData("", "Administrative and secretarial occupations")), 
    new Chart("Administrative occupations", false, loadData("", "Administrative occupations")), 
    new Chart("Secretarial and related occupations", false, loadData("", "Secretarial and related occupations")), 
    }, 500, 400);
}

void pageAssocProf() {
  layoutCharts(new Chart[] { 
    new Chart("Associate professional and technical occupations", true, loadData("", "Associate professional and technical occupations")), 
    new Chart("Culture, media and sports occupations", false, loadData("", "Culture, media and sports occupations")), 
    new Chart("Business and public service associate professionals", false, loadData("", "Business and public service associate professionals")), 
    new Chart("Health and social care associate professionals", false, loadData("", "Health and social care associate professionals")), 
    new Chart("Protective service occupations", false, loadData("", "Protective service occupations")), 
    new Chart("Science, engineering and technology associate professionals", false, loadData("", "Science, engineering and technology associate professionals")), 
    }, 500, 400);
}

void pageCaring() {
  layoutCharts(new Chart[] { 
    new Chart("Caring, leisure and other service occupations", true, loadData("", "Caring, leisure and other service occupations")), 
    new Chart("Caring personal service occupations", false, loadData("", "Caring personal service occupations")), 
    new Chart("Leisure, travel and related personal service occupations", false, loadData("", "Leisure, travel and related personal service occupations")), 
    }, 500, 400);
}

void pageElem() {
  layoutCharts(new Chart[] { 
    new Chart("Elementary occupations", true, loadData("", "Elementary occupations")), 
    new Chart("Elementary administration and service occupations", false, loadData("", "Elementary administration and service occupations")), 
    new Chart("Elementary trades and related occupations", false, loadData("", "Elementary trades and related occupations")), 
    }, 500, 400);
}

void pageMgrs() {
  layoutCharts(new Chart[] { 
    new Chart("Managers, directors and senior officials", true, loadData("", "Managers, directors and senior officials")), 
    new Chart("Corporate managers and directors", false, loadData("", "Corporate managers and directors")), 
    new Chart("Other managers and proprietors", false, loadData("", "Other managers and proprietors")), 
    }, 500, 400);
}

void pageProc() {
  layoutCharts(new Chart[] { 
    new Chart("Process, plant and machine operatives", true, loadData("", "Process, plant and machine operatives")), 
    new Chart("Process, plant and machine operatives_", false, loadData("", "Process, plant and machine operatives_")), 
    new Chart("Transport and mobile machine drivers and operatives", false, loadData("", "Transport and mobile machine drivers and operatives")), 
    }, 500, 400);
}

void pageProf() {
  layoutCharts(new Chart[] { 
    new Chart("Professional occupations", true, loadData("", "Professional occupations")), 
    new Chart("Business, media and public service professionals", false, loadData("", "Business, media and public service professionals")), 
    new Chart("Health professionals", false, loadData("", "Health professionals")), 
    new Chart("Science, research, engineering and technology professionals", false, loadData("", "Science, research, engineering and technology professionals")), 
    new Chart("Teaching and educational professionals", false, loadData("", "Teaching and educational professionals")), 
    }, 500, 400);
}

void pageSales() {
  layoutCharts(new Chart[] { 
    new Chart("Sales and customer service occupations", true, loadData("", "Sales and customer service occupations")), 
    new Chart("Customer service occupations", false, loadData("", "Customer service occupations")), 
    new Chart("Sales occupations", false, loadData("", "Sales occupations")), 
    }, 500, 400);
}

void pageTrades() {
  layoutCharts(new Chart[] { 
    new Chart("Skilled trades occupations", true, loadData("", "Skilled trades occupations")), 
    new Chart("Skilled agricultural and related trades", false, loadData("", "Skilled agricultural and related trades")), 
    new Chart("Skilled construction and building trades", false,loadData("", "Skilled construction and building trades")), 
    new Chart("Skilled metal, electrical and electronic trades", false, loadData("", "Skilled metal, electrical and electronic trades")), 
    new Chart("Textiles, printing and other skilled trades", false, loadData("", "Textiles, printing and other skilled trades")), 
    }, 500, 400);
}

void layoutCharts(Chart[] charts, int chartWidth, int chartHeight) {
  int columnsPerRow = 3;
  //int chartWidth = 500;
  //int chartHeight = 450;

  int currentColumn = 0;
  int currentRow = 0;
  for (Chart chart : charts) {
    // calculate position based on row and column eg. 500 x 2, 300 x 2 for row 2 column 2
    int top = 150 + (chartHeight * currentRow);
    int left = 0 + (chartWidth * currentColumn);
    drawChart(chart.title, chart.name, top, left, chartWidth, chartHeight, chart.data);

    currentColumn++;
    if (currentColumn == columnsPerRow) {
      currentColumn = 0;
      currentRow++;
    }
  }
}