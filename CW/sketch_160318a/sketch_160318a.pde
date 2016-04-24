import org.gicentre.utils.colour.*;   // For colour tables.import org.gicentre.utils.colour.*;   // For colour tables. //<>// //<>//
import org.gicentre.utils.gui.*; // tooltips
import controlP5.ControlP5;

ControlP5 cp5;

//test looking at managers, directors and senior officials for male and female and age banding

Table PayTable; 

Tooltip tooltip;

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

  size(1500, 2000);  // Set up the sketch area 

  cTable = ColourTable.getPresetColourTable(ColourTable.REDS, 0, 1);// what happens if we get a negative difference? i.e. women earn more than men?  What would the colour be?
  //cTable = new ColourTable(); // create new colour bar
  //cTable.addContinuousColourRule(0,0,0,0);
  //cTable.addContinuousColourRule(0.5,255,0,0);

  smooth();

  PFont font = createFont("sans-serif", 12);
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

String page = "overview";
void draw()
{
  background(225);
  title();

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

void pageCaring() {
  layoutCharts(new Chart[] { 
    new Chart("Caring, leisure and other service occupations", loadData("data/main_page.csv", "Caring, leisure and other service occupations")), 
    new Chart("Caring personal service occupations", loadData("data/caring_leis_oth_serv.csv", "Caring personal service occupations")), 
    new Chart("Leisure, travel and related personal service occupations", loadData("data/caring_leis_oth_serv.csv", "Leisure, travel and related personal service occupations")), 
    });
}

void pageElem() {
  layoutCharts(new Chart[] { 
    new Chart("Elementary occupations", loadData("data/main_page.csv", "Elementary occupations")), 
    new Chart("Elementary administration and service occupations", loadData("data/elementary.csv", "Elementary administration and service occupations")), 
    new Chart("Elementary trades and related occupations", loadData("data/elementary.csv", "Elementary trades and related occupations")), 
    });
}

void pageMgrs() {
  layoutCharts(new Chart[] { 
    new Chart("Managers, directors and senior officials", loadData("data/main_page.csv", "Managers, directors and senior officials")), 
    new Chart("Corporate managers and directors", loadData("data/managers.csv", "Corporate managers and directors")), 
    new Chart("Other managers and proprietors", loadData("data/managers.csv", "Other managers and proprietors")), 
    });
}

void pageProc() {
  layoutCharts(new Chart[] { 
    new Chart("Process, plant and machine operatives", loadData("data/main_page.csv", "Process, plant and machine operatives")), 
    new Chart("Process, plant and machine operatives_", loadData("data/process_plant_machine.csv", "Process, plant and machine operatives_")), 
    new Chart("Transport and mobile machine drivers and operatives", loadData("data/process_plant_machine.csv", "Transport and mobile machine drivers and operatives")), 
    });
}

void pageProf() {
  layoutCharts(new Chart[] { 
    new Chart("Professional occupations", loadData("data/main_page.csv", "Professional occupations")), 
    new Chart("Business, media and public service professionals", loadData("data/professional.csv", "Business, media and public service professionals")), 
    new Chart("Health professionals", loadData("data/professional.csv", "Health professionals")), 
    new Chart("Science, research, engineering and technology professionals", loadData("data/professional.csv", "Science, research, engineering and technology professionals")), 
    new Chart("Teaching and educational professionals", loadData("data/professional.csv", "Teaching and educational professionals")), 
    });
}

void pageSales() {
  layoutCharts(new Chart[] { 
    new Chart("Sales and customer service occupations", loadData("data/main_page.csv", "Sales and customer service occupations")), 
    new Chart("Customer service occupations", loadData("data/sales_customer_serv.csv", "Customer service occupations")), 
    new Chart("Sales occupations", loadData("data/sales_customer_serv.csv", "Sales occupations")), 
    });
}

void pageTrades() {
  layoutCharts(new Chart[] { 
    new Chart("Skilled trades occupations", loadData("data/main_page.csv", "Skilled trades occupations")), 
    new Chart("Skilled agricultural and related trades", loadData("data/skilled_trade.csv", "Skilled agricultural and related trades")), 
    new Chart("Skilled construction and building trades", loadData("data/skilled_trade.csv", "Skilled construction and building trades")), 
    new Chart("Skilled metal, electrical and electronic trades", loadData("data/skilled_trade.csv", "Skilled metal, electrical and electronic trades")), 
    new Chart("Textiles, printing and other skilled trades", loadData("data/skilled_trade.csv", "Textiles, printing and other skilled trades")), 
    });
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