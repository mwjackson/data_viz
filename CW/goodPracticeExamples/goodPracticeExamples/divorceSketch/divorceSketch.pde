import org.gicentre.utils.stat.*;

/* *******************************************************************************
 * Divorce data visualization.
 * Student undergraduate submission 2014 - example of a good coursework submission.
 * See divorceJustification.pdf and divorceFeedback.pdf for further details.
 * NOTE: You need the giCentreUtils Processing libraries installed for this sketch
 * to function. See http://www.gicentre.net/software for details.
 * *******************************************************************************/

//initialise all charts
XYChart divTotalChartWife, divTotalChartHusband, blankChart;  //sketch1
BarChart marriageBar;  //sketch1
XYChart adulteryHusband, adulteryWife, behaviourHusband, behaviourWife, desertionHusband, desertionWife, sep2Husband, sep2Wife, sep5Husband, sep5Wife, otherHusband, otherWife, clearChart;   //sketch2

PImage male, female;  //initialise symbol images, sketch1 
float[] yearsWife, yearsHusband;  //float array to store years
float[] totalWife, totalHusband;  //float array to store totals of divorces, wife and husband
float[] totalMarriage;  //float array, total marriages - sketch1
float[] yearsMarriage;  //float array, years of marriages - sketch1
float[] medianAgeHusband, medianAgeWife, medianDuration;  //float arrays to store median data about divorces - sketch 1
boolean husband, wife, marriage, both = false;  //set booleans to false
boolean sketch1 = true;  //draw sketch1 on start up
boolean sketch2 = false;  //set sketch2 to false on start up
boolean sketch3 = false;  //set sketch3 to false on start up
Table marriageTable;    
int z = 0;  //z integer used in mapping sketch1
PFont ageFont, labelFont, axisFont, durationFont; //declare fonts
float[] yearsAdulteryHusband, yearsAdulteryWife;  //float arrays storing years from husband and wife datasets - sketch2
float[] totalAdulteryHusband, totalAdulteryWife,  totalBehaviourHusband, totalBehaviourWife, totalDesertionHusband, totalDesertionWife, totalSep2Husband, totalSep2Wife, totalSep5Husband, totalSep5Wife, totalOtherHusband, totalOtherWife;
float[] xPosition, yPosition, xPositionTick, yPositionTick;  //arrays storing x and y positions for reason labels and ticks in sketch2
String[] reasons;  // string array of reasons to act as labels in sketch 2
String[] yearsData;  
float[] years;  //float array storing years
int reasonSelected = -1;  //sketch2, select none of the reasons on start up
int tickSelected = -1;  //sketch2, select none of the ticks on start up
PImage tick;  //decalre image of tick for sketch 2
boolean adultery, behaviour, desertion, sep2, sep5, other = false;  //boolean fields for sketch2 on start up, draw none of the charts on start up
boolean tickAdultery, tickBehaviour, tickDesertion, tickSep2, tickSep5, tickOther = false;  //boolean fields for sketch2 on start up, display none of the ticks
int zAxis, adulteryCount = 0;  //integers used in mapping, sketch2
PFont labelsFont, yearFont, axisFontReasons;  //declare fonts
PImage maleSymbol, femaleSymbol;  //initialise symbol images used in sketch3
float totalNumWife, totalNumHusband = 0;  //set int values to 0 on start up
float totalWifeSymbol[], totalHusbandSymbol[];  //store number of symbols, sketch3
float wifePlot, husbandPlot;  //float values that indicate how many symbols are to be drawn - totalWifeSymbol/25000 = wife plot
int i;
PFont titleFont, keyFont; //declare fonts, sketch3  

void setup() {

  size(800, 700);  //set size of sketch window
  
  //load all fonts from data file
  ageFont = loadFont("DilleniaUPCBold-70.vlw");
  labelFont =  loadFont("DilleniaUPCBold-28.vlw");
  axisFont = loadFont("DilleniaUPC-20.vlw");
  durationFont = loadFont("DilleniaUPCBold-100.vlw");
  labelsFont = loadFont("DilleniaUPCBold-25.vlw");
  yearFont = loadFont("DilleniaUPCBold-28.vlw");
  axisFontReasons = loadFont("DilleniaUPC-20.vlw");

  //load images from data file
  male = loadImage("male.png");
  female = loadImage("pink-female-hi.png");
  
  //initialise all charts
  divTotalChartWife = new XYChart(this);
  divTotalChartHusband = new XYChart(this);
  blankChart = new XYChart(this);
  marriageBar = new BarChart(this);
  adulteryHusband = new XYChart(this);
  adulteryWife = new XYChart(this); 
  behaviourHusband = new XYChart(this);
  behaviourWife = new XYChart(this);
  desertionHusband = new XYChart(this);
  desertionWife = new XYChart(this);
  sep2Husband = new XYChart(this);
  sep2Wife = new XYChart(this);
  sep5Husband = new XYChart(this);
  sep5Wife = new XYChart(this);
  otherHusband = new XYChart(this);
  otherWife = new XYChart(this);
  clearChart = new XYChart(this);

  wifeChart();  //call wifechart method - sketch1. Gets wife values from .csv and populates arrays
  husbandChart();  //call husbandchart method - sketch1. Gets husband values from.csv and populates arrays
  marriageBar();  //call marriagebar method - sketch1. Gets marriage values from .csv files and populates arrays
  wifeChartReasons();  //call wifechartreasons method - sketch2. Gets reason for divorce values from .csv files and populates arrays
  husbandChartReasons();  //call husbandchartreasons method - sketch2. Gets reason for divorce values from.csv files and populates arrays

  tick = loadImage("tick.gif");  //load tick images for use in sketch2
  
  
  // styling method based on giCentre examples of charts http://www.gicentre.net/utils/chart/ 
  //style wife chart for sketch1
  textFont(axisFont);
  divTotalChartWife.setMaxX(2013);
  divTotalChartWife.setMinX(1974);
  divTotalChartWife.setXFormat("####");
  divTotalChartWife.setMaxY(400000);
  divTotalChartWife.setMinY(20000);
  divTotalChartWife.showXAxis(true);
  divTotalChartWife.showYAxis(true);
  divTotalChartWife.setPointColour(color(216, 44, 145));
  divTotalChartWife.setPointSize(5);
  divTotalChartWife.setLineColour(color(216, 44, 145));
  divTotalChartWife.setLineWidth(2);
  
  //style husband chart for sketch 1
  textFont(axisFont);
  divTotalChartHusband.setMaxX(2013);
  divTotalChartHusband.setMinX(1974);
  divTotalChartHusband.setXFormat("####");
  divTotalChartHusband.setMaxY(400000);
  divTotalChartHusband.setMinY(20000);
  divTotalChartHusband.showXAxis(true);
  divTotalChartHusband.showYAxis(true);
  divTotalChartHusband.setPointColour(color(49, 44, 216));
  divTotalChartHusband.setPointSize(5);
  divTotalChartHusband.setLineColour(color(49, 44, 216));
  divTotalChartHusband.setLineWidth(2);

  //style marriage bar chart for sketch 1
  marriageBar.setMinValue(20000);
  marriageBar.setMaxValue(400000);
  marriageBar.setBarGap(1);

  //style blank chart sketch 1
  textFont(axisFont);
  blankChart.setXFormat("####");
  blankChart.setMaxY(400000);
  blankChart.setMinY(20000);
  blankChart.setMinX(1974);
  blankChart.setMaxX(2013);
  blankChart.showXAxis(true);
  blankChart.showYAxis(true);
  
  //style adultery husband chart sketch 2
  adulteryHusband.setMaxX(2012);
  adulteryHusband.setMinX(1974);
  adulteryHusband.setXFormat("####");
  adulteryHusband.setMaxY(65000);
  adulteryHusband.setMinY(0);
  adulteryHusband.showXAxis(true);
  adulteryHusband.showYAxis(true);
  adulteryHusband.setPointColour(color(185, 217, 255));
  adulteryHusband.setPointSize(5);
  adulteryHusband.setLineColour(color(185, 217, 255));
  adulteryHusband.setLineWidth(2);
  
  //style adultery wife chart sketch 2
  textFont(axisFontReasons);
  adulteryWife.setMaxX(2012);
  adulteryWife.setMinX(1974);
  adulteryWife.setXFormat("####");
  adulteryWife.setMaxY(65000);
  adulteryWife.setMinY(0);
  adulteryWife.showXAxis(true);
  adulteryWife.showYAxis(true);
  adulteryWife.setPointColour(color(255, 185, 232));
  adulteryWife.setPointSize(5);
  adulteryWife.setLineColour(color(255, 185, 232));
  adulteryWife.setLineWidth(2);
 
 //style behaviour husband chart sketch 2
  textFont(axisFontReasons);
  behaviourHusband.setMaxX(2012);
  behaviourHusband.setMinX(1974);
  behaviourHusband.setXFormat("####");
  behaviourHusband.setMaxY(65000);
  behaviourHusband.setMinY(0);
  behaviourHusband.showXAxis(true);
  behaviourHusband.showYAxis(true);
  behaviourHusband.setPointColour(color(185, 192, 255));
  behaviourHusband.setPointSize(5);
  behaviourHusband.setLineColour(color(185, 192, 255));
  behaviourHusband.setLineWidth(2);
  
  //style behaviour wife chart sketch 2
  textFont(axisFontReasons);
  behaviourWife.setMaxX(2012);
  behaviourWife.setMinX(1974);
  behaviourWife.setXFormat("####");
  behaviourWife.setMaxY(65000);
  behaviourWife.setMinY(0);
  behaviourWife.showXAxis(true);
  behaviourWife.showYAxis(true);
  behaviourWife.setPointColour(color(255, 160, 232));
  behaviourWife.setPointSize(5);
  behaviourWife.setLineColour(color(255, 160, 232));
  behaviourWife.setLineWidth(2);
  
  //style desertion husband chart sketch 2 
  textFont(axisFontReasons);
  desertionHusband.setMaxX(2012);
  desertionHusband.setMinX(1974);
  desertionHusband.setXFormat("####");
  desertionHusband.setMaxY(65000);
  desertionHusband.setMinY(0);
  desertionHusband.showXAxis(true);
  desertionHusband.showYAxis(true);
  desertionHusband.setPointColour(color(29,184, 255));
  desertionHusband.setPointSize(5);
  desertionHusband.setLineColour(color(29, 184, 255));
  desertionHusband.setLineWidth(2);

  //style desertion wife chart for sketch 2
  textFont(axisFontReasons);
  desertionWife.setMaxX(2012);
  desertionWife.setMinX(1974);
  desertionWife.setXFormat("####");
  desertionWife.setMaxY(65000);
  desertionWife.setMinY(0);
  desertionWife.showXAxis(true);
  desertionWife.showYAxis(true);
  desertionWife.setPointColour(color(252, 66, 191));
  desertionWife.setPointSize(5);
  desertionWife.setLineColour(color(252, 66, 191));
  desertionWife.setLineWidth(2);
  
    //style separation 2 years husband chart for sketch 2 
   textFont(axisFontReasons);
  sep2Husband.setMaxX(2012);
  sep2Husband.setMinX(1974);
  sep2Husband.setXFormat("####");
  sep2Husband.setMaxY(65000);
  sep2Husband.setMinY(0);
  sep2Husband.showXAxis(true);
  sep2Husband.showYAxis(true);
  sep2Husband.setPointColour(color(44,140, 216));
  sep2Husband.setPointSize(5);
  sep2Husband.setLineColour(color(44,140, 216));
  sep2Husband.setLineWidth(2);

  //style separation 2 years wife chart for sketch 2
  textFont(axisFontReasons);
  sep2Wife.setMaxX(2012);
  sep2Wife.setMinX(1974);
  sep2Wife.setXFormat("####");
  sep2Wife.setMaxY(65000);
  sep2Wife.setMinY(0);
  sep2Wife.showXAxis(true);
  sep2Wife.showYAxis(true);
  sep2Wife.setPointColour(color(216, 44, 136));
  sep2Wife.setPointSize(5);
  sep2Wife.setLineColour(color(216, 44, 136));
  sep2Wife.setLineWidth(2);
  
  //style separation 5 years husband chart for sketch 2
  textFont(axisFontReasons);
  sep5Husband.setMaxX(2012);
  sep5Husband.setMinX(1974);
  sep5Husband.setXFormat("####");
  sep5Husband.setMaxY(65000);
  sep5Husband.setMinY(0);
  sep5Husband.showXAxis(true);
  sep5Husband.showYAxis(true);
  sep5Husband.setPointColour(color(112, 211, 214));
  sep5Husband.setPointSize(5);
  sep5Husband.setLineColour(color(112, 211, 214));
  sep5Husband.setLineWidth(2);

  //style separation 5 years wife chart for sketch 2
  textFont(axisFontReasons);
  sep5Wife.setMaxX(2012);
  sep5Wife.setMinX(1974);
  sep5Wife.setXFormat("####");
  sep5Wife.setMaxY(65000);
  sep5Wife.setMinY(0);
  sep5Wife.showXAxis(true);
  sep5Wife.showYAxis(true);
  sep5Wife.setPointColour(color(214, 112, 173));
  sep5Wife.setPointSize(5);
  sep5Wife.setLineColour(color(214, 112, 173));
  sep5Wife.setLineWidth(2);
  
  //style other reasons husband chart for sketch 2 
  textFont(axisFontReasons);
  otherHusband.setMaxX(2012);
  otherHusband.setMinX(1974);
  otherHusband.setXFormat("####");
  otherHusband.setMaxY(65000);
  otherHusband.setMinY(0);
  otherHusband.showXAxis(true);
  otherHusband.showYAxis(true);
  otherHusband.setPointColour(color(2,126, 191));
  otherHusband.setPointSize(5);
  otherHusband.setLineColour(color(2, 126, 191));
  otherHusband.setLineWidth(2);

  //style other reasons wife chart for sketch 2
  textFont(axisFontReasons);
  otherWife.setMaxX(2012);
  otherWife.setMinX(1974);
  otherWife.setXFormat("####");
  otherWife.setMaxY(65000);
  otherWife.setMinY(0);
  otherWife.showXAxis(true);
  otherWife.showYAxis(true);
  otherWife.setPointColour(color(180,4, 110));
  otherWife.setPointSize(5);
  otherWife.setLineColour(color(180,4, 110));
  otherWife.setLineWidth(2);
  
  //style blank chart for sketch 2 - used for when no reason is selected
  textFont(axisFontReasons);
  clearChart.setMaxX(2012);
  clearChart.setMinX(1974);
  clearChart.setXFormat("####");
  clearChart.setMaxY(65000);
  clearChart.setMinY(0);
  clearChart.showXAxis(true);
  clearChart.showYAxis(true);
  
 //populate arrays used in sketch2 - corresponding array index's for reaosn and positions
 //method based on session5 data visualisation module (Jo Wood,2014) http://gicentre.org/datavis/session05/index.html
 reasons = new String[]{"Adultery", "Behaviour", "Desertion", "Separation 2 Years", "Separation 5 Years", "Other", "Clear"};  //reasons labels
 xPosition = new float[]{width-140, width-140, width-140, width-140, width-140, width-140, width-140};  //x positions of reasons labels
 yPosition = new float[]{height- 500, height - 450, height - 400, height -350, height -300, height-250, height-200};  //y positions of reasons labels
 xPositionTick =  new float[]{width-160, width-160, width-160, width-160, width-160, width-160, width-160};  //x positions of reason ticks 
 yPositionTick = new float[]{height-520, height - 470, height - 420, height -370, height -320, height-270, height-220};//y positions of reasons ticks

  //load images for sketch 3
   maleSymbol = loadImage("male.png");
  femaleSymbol = loadImage("pink-female-hi.png");
  
  //load fonts sketch 3
  titleFont =  loadFont("DilleniaUPCBold-28.vlw");
  keyFont =  loadFont("DilleniaUPCBold-25.vlw");
  
  getWifeTotal();  //call getwifetotal method to populate arrays from wife.csv file  - sketch3
  getHusbandTotal();  //call gethusband method to populate arrays from husband.csv file - sketch3
  
  wifePlot = floor(totalNumWife/25000);  //number of wife symbols to be plotted - sketch3
  println("Wife to be plotted : " + wifePlot);  //confirm amount is as expected through console print out
  
  husbandPlot = floor(totalNumHusband/25000);  //number of husband symbols to be plotted - sketch3
  println("Husband to be plotted : " + husbandPlot);  //confirm amount is as expected through console print out   
}

void draw() {
  if(sketch1){  //if sketch1 is true (will be true on start up)
    drawSketchOne();  //call drawSketchOne method 
  } else if (sketch2){  //if sketch2 is true - will be true if user presses '2'
    drawSketchTwo();  //call drawSketchTwo method
  } else if(sketch3){  //if sketch3 is true - will be true if user presses '3'
    drawSketchThree();  //call drawSketchThree method
  }
}
void drawSketchOne(){  //use this as draw function on key press '1' or on start up
 background(255, 247, 247);  //set background colour
  fill(0);  //make text black
  textFont(axisFont);  //set font
  text("Press H: Divorces granted husband", width-193, height- 100);  //keypress instructions
  text("Press W : Divorces granted wives", width-193, height- 85);  //keypress instructions
  text("Press B : Divorces granted both", width -193, height-70);  //keypress instructions
  text("Press M : Total marriages per year", width -193, height - 55);  //keypress instructions
  text("Press C : Clear chart", width-193, height -40);  //keypress instructions
  text("Press 2 : Reasons for divorce         Press 3 : Symbol graph of divorces", width -800, height -10); //keypress instructions
  textFont(labelFont);  //set text
  text("Total divorces granted over total marriages 1974-2012", width-580, height-670);  //chart title 
  textFont(axisFont);  //set text
  //chart draw method based on giCentre chart example code http://www.gicentre.net/utils/chart/
  blankChart.draw(20, 50, width-200, height-100);   //draw empty chart


  if (marriage) {  //if key pressed 'm'
    //chart draw method based on giCentre chart example code http://www.gicentre.net/utils/chart/
    marriageBar.draw(58, 40, width-270, height-100);
  }
  if (wife) {  //if keypressed 'w'
    //chart draw method based on giCentre chart example code http://www.gicentre.net/utils/chart/
    divTotalChartWife.draw(20, 50, width-200, height-100);
  }
  if (husband) {  //if keypressed 'h'
    //chart draw method based on giCentre chart example code http://www.gicentre.net/utils/chart/
    divTotalChartHusband.draw(20, 50, width-200, height-100);
  }
  if (both) {  //if keypressed 'b'
    //chart draw method based on giCentre chart example code http://www.gicentre.net/utils/chart/
    divTotalChartWife.draw(20, 50, width-200, height-100);
    divTotalChartHusband.draw(20, 50, width-200, height-100);
  }
  
  //draw male andfemale images
  image(male, width-120, height-600, 100, 150);
  image(female, width -120, height -425, 100, 150);

  //draws guide line
  if (mouseX>62 && mouseX<600) {  //if mouse is in chart area x-axis
    line(mouseX, height-640, mouseX, height-60);  //draw line at mouseX position, the height of the graph
    //map method based on example code found (Fry, 2014) at https://www.processing.org/reference/map_.html
    z = floor(map(mouseX, 62, 600, 1974, 2013));  //int z = map(value, start 1, stop1, start2, stop2) - maps screen coordinates to data
    textFont(labelFont);  //set font
    fill(0);  //set font to black
    text(z, map(z, 1974, 2013, 65, 600), height-630);  //sets text as z value(year) and plots onto guideline

    int index = getDataIndex(z);  //index = z value fed into getDataIndex method. Use z to fnd the inex of the year the line falls on
    if (index != -1) {  //if index has a value
      if (husband) {  //if husband is true, keypress 'h'
        fill(0);
        textFont(axisFont);
        text("   Husband : " + floor(totalHusband[index]), map(z, 1974, 2013, 62, 600), height-570); //draw label at guideline point, get total husband from the corresponding year
        text("Median age at divorce", width -130, height-440); //set label
        textFont(ageFont);
        text(nf(medianAgeHusband[index], 2, 1), width-105, height-530);  //label detailing median age of husband at divorce from corresponding years index
        textFont(durationFont);
        text(nf(medianDuration[index], 2, 1), width-130, height-160);  //label detailing the median duration of marriage at divorce from corresponding years index
        textFont(axisFont);
        text("Median years of marriage at divorce", width -140, height-145);  //set label
      }
      if (wife) {   //if wife is true, keypress 'w'
        fill(0);
        textFont(axisFont);
        text("   Wife : " + floor(totalWife[index]), map(z, 1974, 2013, 62, 600), height-570);  //draw label at guideline point, get total husband from the corresponding year
        text("Median age at divorce", width -130, height-265); 
        textFont(ageFont);
        text(nf(medianAgeWife[index], 2, 1), width-105, height-355);   //label detailing median age of wife at divorce from corresponding years index
        textFont(durationFont);
        text(nf(medianDuration[index], 2, 1), width-130, height-160);  //label detailing the median duration of marriage at divorce from corresponding years index
        textFont(axisFont);
        text("Median years of marriage at divorce", width -140, height-145);  //set label
      }
      if (both) {  //if both is true, key press 'b'
        fill(0);
        textFont(axisFont);
        text("   Husband : " + floor(totalHusband[index]), map(z, 1974, 2013, 62, 600), height-570);   //draw label at guideline point, get total husband from the corresponding year
        text("   Wife : " + floor(totalHusband[index]), map(z, 1974, 2013, 62, 600), height-550);  //draw label at guideline point, get total wife from the corresponding year
        text("Median age at divorce", width -130, height-440); 
        textFont(ageFont);
        text(nf(medianAgeHusband[index], 2, 1), width-105, height-530);   //label detailing median age of husband at divorce from corresponding years index
        textFont(axisFont);
        text("Median age at divorce", width -130, height-265); 
        textFont(ageFont);
        text(nf(medianAgeWife[index], 2, 1), width-105, height-355);  //label detailing median age of wife at divorce from corresponding years index
        textFont(durationFont);
        text(nf(medianDuration[index], 2, 1), width-130, height-160);  //label detailing the median duration of marriage at divorce from corresponding years index
        textFont(axisFont);
        text("Median years of marriage at divorce", width -140, height-145);  //set label
        }
      }
    }
 }
 
 void drawSketchTwo(){  //if sketch2, keypress '2'
  
  background(255, 247, 247);  //set background colour
  //chart draw method based on giCentre chart example code http://www.gicentre.net/utils/chart/
  clearChart.draw(30, 50, width-200, height-100);  //draw empty chart
  textFont(axisFontReasons);  //set font
  text("Click text to populate graph", width-160, height -540);  //instructions text
  text("Press 1 : Total divorces          Press 3 : Symbol graph of divorces", width -800, height -10);  //instruction text

  fill(0);
  textFont(labelsFont);
  text("Reasons for divorces granted 1974-2012", width-600, height-670);  //chart title 
  
  //for loop to plot reasons labels
   //method based on session5 data visualisation module (Jo Wood,2014) http://gicentre.org/datavis/session05/index.html
  for (int i=0; i<reasons.length; i++){
    textFont(labelsFont);
    text(reasons[i], xPosition[i], yPosition[i]);  //plot reason text at position[i] in xposition[i], yposition[i] - continue until all string from reasons array have been plotted
   }

  textFont(axisFontReasons);
  if(adultery){  //if adultery is true, user has clicked adultery
    //chart draw method based on giCentre chart example code http://www.gicentre.net/utils/chart/
    adulteryHusband.draw(30, 50, width-200, height -100);
    adulteryWife.draw(30, 50, width-200, height -100);
    if(tickAdultery){
      //display image from tick array in xposition[0] and yposition[0]
      image(tick, xPositionTick[0], yPositionTick[0], 20, 20);
    }
  }
   
 if(behaviour){  //if behaviour is true, user has clicked behaviour
   //chart draw method based on giCentre chart example code http://www.gicentre.net/utils/chart/
   behaviourHusband.draw(30, 50, width-200, height -100);
   behaviourWife.draw(30, 50, width-200, height -100);
   if(tickBehaviour){
     //display image from tick array in xposition[1] and yposition[1]
     image(tick, xPositionTick[1], yPositionTick[1], 20, 20);
   }
 }
 if(desertion){  //if desertion is true, user has clicked desertion
 //chart draw method based on giCentre chart example code http://www.gicentre.net/utils/chart/
   desertionHusband.draw(30, 50, width-200, height -100);
   desertionWife.draw(30, 50, width-200, height -100);
   if(tickDesertion){
     //display image from tick array in xposition[2], yposition[2]
     image(tick, xPositionTick[2], yPositionTick[2], 20, 20);
   }
 }
 if(sep2){  //if separation is true, user has clicked separation2
 //chart draw method based on giCentre chart example code http://www.gicentre.net/utils/chart/
   sep2Husband.draw(30, 50, width-200, height -100);
   sep2Wife.draw(30, 50, width-200, height -100);
   if(tickSep2){
     //display image from tick array in xposition[3], yposition[3]
     image(tick, xPositionTick[3], yPositionTick[3], 20, 20);
   }
 }
 if(sep5){  //if separation5 is true, user has clicked separation5
 //chart draw method based on giCentre chart example code http://www.gicentre.net/utils/chart/
   sep5Husband.draw(30, 50, width-200, height -100);
   sep5Wife.draw(30, 50, width-200, height -100);
   if(tickSep5){
     //display image from tick array in xposition[4], y position[4]
     image(tick, xPositionTick[4], yPositionTick[4], 20, 20);
   }
 } 
 if(other){  //if other is true, user has clicked other
 //chart draw method based on giCentre chart example code http://www.gicentre.net/utils/chart/
   otherHusband.draw(30, 50, width-200, height -100);
   otherWife.draw(30, 50, width-200, height -100);
   if(tickOther){
     //display image from tick array in xposition[5] and yposition[5]
     image(tick, xPositionTick[5], yPositionTick[5], 20, 20);
   }
 }
 //method based on session5 data visualisation module (Jo Wood,2014) http://gicentre.org/datavis/session05/index.html
  if(reasonSelected ==-1){
    fill(0);
  }if(reasonSelected ==0){  //adultery clicked
      adultery = true;
      tickAdultery = true;
  }if(reasonSelected ==1){  //behaviour clicked
    behaviour = true;
    tickBehaviour = true;
  }if (reasonSelected ==2){  //desertion clicked
    desertion = true;
    tickDesertion = true;
  } if(reasonSelected ==3){  //separation 2 years clicked
    sep2 = true;
    tickSep2 = true;
  } if(reasonSelected ==4){  //separation 5 years clicked
   sep5 = true;
   tickSep5 = true;
  } if(reasonSelected ==5){  //other clicked
    other = true;
    tickOther = true;
  }  if(reasonSelected ==6){  //clear clicked - clears chart area
    adultery = false;  //remove chart
    behaviour =false;  //remove chart
    desertion = false;  //remove chart
    sep2 = false;  //remove chart
    sep5 = false;  //remove chart
    other = false;  //remove chart
  }
 //method based on session5 data visualisation module (Jo Wood,2014) http://gicentre.org/datavis/session05/index.html  
  if(tickSelected ==-1){
    fill(0);
  }if(tickSelected ==0){  //adultery tick clicked
      adultery = false;  //remove chart
      tickAdultery = false;  //remove tick
  }if(tickSelected ==1){  //behaviour tick clicked
    behaviour = false;  //remove chart
    tickBehaviour = false;  //remove tick
  }if (tickSelected ==2){  //desertion tick clicked
    desertion = false;  //remove chart
    tickBehaviour = false;  //remove tick
  } if(tickSelected ==3){  //separation 2 years tick clicked
    sep2 = false;  //remove chart
    tickSep2 = false;  //remove tick
  } if(tickSelected ==4){  //separation 5 years tick clicked
   sep5 = false;  //remove chart
   tickSep5 = false;  //remove tick
  } if(tickSelected ==5){  //other tick clicked
    other = false;  //remove chart
    tickOther = false;  //remove tick
  } if (tickSelected ==6){  //clear tick clicked - remove all charts and ticks
    adultery = false;
    behaviour =false;
    desertion = false;
    sep2 = false;
    sep5 = false;
    other = false;
  }
  tickSelected =-1;  //set tick selected back to -1
  reasonSelected =-1;  //set reason selected back to -1
  
  //mouse over graph draws line, displays corresponding date and shows data
  if(mouseX>65 && mouseX<622){   //if mouse is in chart area
   line(mouseX, height-640, mouseX, height-60);  //draw line at xposition
     //map method based on example code found (Fry, 2014) at https://www.processing.org/reference/map_.html
    zAxis = floor(map(mouseX, 65, 622, 1974, 2013));  //int zAxis = map(value, start 1, stop1, start2, stop2) - maps screen coordinates to data
    textFont(yearFont);
    text(zAxis, map(zAxis, 1974, 2013, 65, 622), height-630); //sets text as zAxis value(year) and plots onto guideline
    textFont(axisFontReasons);
    int index = getDataIndexReasons(zAxis);  //index = zAxis value fed into getDataIndexReasons method. Use z to fnd the inex of the year the line falls on
    if(index != -1){  //if index has value
      if(adultery){  //if adultery = true, adultery selected
        textFont(axisFontReasons);
        text("   Adultery",map(zAxis, 1974, 2013, 60, 622), height-620);
        text("   Wife : " +floor(totalAdulteryWife[index]) + "   Husband : " + floor(totalAdulteryHusband[index]),map(zAxis, 1974, 2013, 65, 622), height-605);  //add label to guideline, details totalAulteryWife and totalAdultery husband values for correspinding index year
      }
      if(behaviour){  //if behaviour = true, behaviour selected
        textFont(axisFontReasons);
        text("   Behaviour" ,map(zAxis, 1974, 2013, 60, 622), height-585);
        text("   Wife : " +floor(totalBehaviourWife[index]) + "   Husband : " + floor(totalBehaviourHusband[index]),map(zAxis, 1974, 2013, 65, 622), height-570);  //add label to guideline, details totalBehaviourWife and totalBehvaiourHusband values for correspinding index year
      }
      if(desertion){  //if desetion = true, desertion selected
        textFont(axisFontReasons);
        text("   Desertion" ,map(zAxis, 1974, 2013, 60, 622), height-550);
        text("   Wife : " +floor(totalDesertionWife[index]) + "   Husband : " + floor(totalDesertionHusband[index]),map(zAxis, 1974, 2013, 65, 622), height-535);  //add label to guideline, details totalDesertionWife and totalDesertionHusband values for correspinding index year
      }
      if(sep2){  //if separation2 = true, sep2 selected
        textFont(axisFontReasons);
        text("   Separation 2 years" ,map(zAxis, 1974, 2013, 60, 622), height-515);
        text("   Wife : " +floor(totalSep2Wife[index]) + "   Husband : " + floor(totalSep2Husband[index]),map(zAxis, 1974, 2013, 65, 622), height-500);  //add label to guideline, details totalSep2Wife and totalSep2Husband values for correspinding index year
      }
      if(sep5){
        textFont(axisFontReasons);  //if separation5 = true, sep5 selected
        text("   Separation 5 years" ,map(zAxis, 1974, 2013, 65, 622), height-480);
        text("   Wife : " +floor(totalSep5Wife[index]) + "   Husband : " + floor(totalSep5Husband[index]),map(zAxis, 1974, 2013, 65, 622), height-465);  //add label to guideline, details totalSep5Wife and totalSep5Husband values for correspinding index year
      }
      if(other){
        textFont(axisFontReasons);  //if other = true, other selected
        text("   Other" ,map(zAxis, 1974, 2013, 80, 632), height-445);
        text("   Wife : " +floor(totalOtherWife[index]) + "   Husband : " + floor(totalOtherHusband[index]),map(zAxis, 1974, 2013, 65, 622), height-430);  //add label to guideline, details totalOtherWife and totalOtherHusband values for correspinding index year
      }
    }
   }  
}

void drawSketchThree(){
  fill(0);
  background(255, 247, 247);  //set background colour
  textFont(axisFont);
  text("Press 1 : Total divorces          Press 2 : Reasons for divorce", width -800, height -10);  //key press instructions
  textFont(titleFont);
  text("Total divorces granted 1974-2012", width-555, height-670);  //title of chart
  textFont(keyFont);
  image(femaleSymbol, 100, 625, 40, 40);  //load image as key
  text(": 25,000 divorces granted to wives", 145, 650);  //key text
  image(maleSymbol, 400, 625, 40, 40);  //load image as key
  text(": 25,000 divorces granted to husbands", 445, 650);  //key text
   symbolGrid();//call symbol grid method
}

void wifeChart() {
  //sketch1
    //chart draw method based on giCentre scatter chart example code http://www.gicentre.net/utils/chart/ 
  String[] dataWife = loadStrings("divorces.csv");  //load .csv file in, store as string array
  yearsWife = new float[dataWife.length-1];  //initalise array
  totalWife = new float[dataWife.length-1];  //initialise array
  medianAgeWife = new float[dataWife.length-1];  //initialise array
  for (int i =0; i<dataWife.length-1; i++) {  //for each item in data wife array loop through
    String[] tokens =dataWife[i+1].split(",");  //split array to consider commas
    yearsWife[i] = Float.parseFloat(tokens[0]);  //get years wife value from position i, column 0 and add to yearswife array
    totalWife[i] = Float.parseFloat(tokens[3]);     //get total wife value from position i, column 3 and add to totalwife array
    medianAgeWife[i] = Float.parseFloat(tokens[6]);  //get madian age wife value from position i, column 6 and add to medianAgeWife
  }
  divTotalChartWife.setData(yearsWife, totalWife);  //set chart to use array values as data
  println(totalWife.length);
}

void husbandChart() {
  //sketch1
    //chart draw method based on giCentre scatter chart example code http://www.gicentre.net/utils/chart/
  String[] dataHusband = loadStrings("divorces.csv");  //load .csv file in, store as string array
  yearsHusband = new float[dataHusband.length-1];  //initialise array
  totalHusband = new float[dataHusband.length-1];  //initialise array
  medianAgeHusband = new float[dataHusband.length-1];  //initialise array
  medianDuration = new float[dataHusband.length-1];  //initialise array
  for (int i =0; i<dataHusband.length-1; i++) {  //for each item in data husband array loop through
    String[] tokensHusband = dataHusband[i+1].split(",");   //split array to consider commas
    yearsHusband[i] = Float.parseFloat(tokensHusband[0]);  //get years husband value from position i, column 0 and add to yearshusband array
    totalHusband[i] = Float.parseFloat(tokensHusband[2]);  //get total husband value from position i, column 2 and add to totalhusband array
    medianAgeHusband[i] = Float.parseFloat(tokensHusband[5]);      //get median age husband value from position i, column 5 and add to medianAgeHUsband array
    medianDuration[i] = Float.parseFloat(tokensHusband[7]);  //get median duration value from position i, column 7 and add to medianDuration array
  }
  println(yearsHusband);
  println(totalHusband);
  divTotalChartHusband.setData(yearsHusband, totalHusband);  //set chart to use array values as data
  println(totalHusband.length);
}


void marriageBar() {
  //sketch1
    //chart draw method based on giCentre scatter chart example code http://www.gicentre.net/utils/chart/
  String[] dataMarriage = loadStrings("marriages.csv");  //load in .csv file, store as string array
  totalMarriage = new float[dataMarriage.length-1];  //initialise array
  yearsMarriage = new float[dataMarriage.length-1];  //initialise array
  for (int i =0; i<dataMarriage.length-1; i++) {  //for each item in datamarriage array loop through
    String[] tokensMarriage = dataMarriage[i+1].split(",");   //split rray to consider commas
    yearsMarriage[i] = Float.parseFloat(tokensMarriage[0]);  //get years marriage value from position i, column 0 and add to yearsmarriage array
    totalMarriage[i] = Float.parseFloat(tokensMarriage[1]);  //get total marriage value from position i, colmn 1 and add to totalmarriage array
  }
  marriageBar.setData(totalMarriage);  //set chart to use array as data
  println(yearsMarriage.length);
}

void keyPressed() {
  //key press events method based upon keypressed example code(2014) obtained from https://www.processing.org/reference/keyPressed_.html
  if (key =='h') {
    husband = true;
    wife = false;
  }
  if (key =='w') {
    husband = false;
    wife = true;
  }
  if (key =='b') { 
    husband = false;
    wife = false;
    both = true;
  }
  if (key =='m') {
    marriage = true;
  }
  if (key=='n') {
    marriage =false;
  }
  if (key =='c') {
    marriage = false;
    husband = false;
    wife = false;
  }
 if (key == '1') {  //switch view to sketch 1
    sketch1 = true;
    sketch2 = false;
    sketch3 =false;
 }   
  if (key == '2') {    //switch view to sketch 2
    sketch1 = false;
    sketch2 = true;
    sketch3 =false;
 }
  if (key == '3') {  //switch view to sketch 3
    sketch1 = false;
    sketch2 = false;
    sketch3 = true;
    }
 }

int getDataIndex(int year) {
 //sketch1
  for (int i=0; i<yearsWife.length; i++) {  //for all elements in yearsWife array, loop through and search
    if (yearsWife[i] == year) {  //if match found
      return i;  //return index position of matched year
    }
  }
  for (int h=0; h< yearsHusband.length; h++) {  //for all elements in yearsHusband array, loop through and search
    if (yearsHusband[h] == year) {  //if match found
      return h;  //return index position of matched year
    }
  }

  for (int y=0; y<yearsMarriage.length; y++) {  //for all elements in yearsMarriage array, loop through and search
    if (yearsMarriage[y] == year) {  //if match found
      return y;  //return index position of matched year
    }
  }
  return -1;
 }
 
void husbandChartReasons(){
  //sketch2
   String[] dataAdulteryHusband = loadStrings("husband.csv");  //load in .csv file and add to array
   //initialise arrays
  yearsAdulteryHusband = new float[dataAdulteryHusband.length-1];
  totalAdulteryHusband = new float[dataAdulteryHusband.length-1];
  totalBehaviourHusband = new float[dataAdulteryHusband.length-1];
  totalDesertionHusband = new float[dataAdulteryHusband.length-1];
  totalSep2Husband = new float[dataAdulteryHusband.length-1];
  totalSep5Husband = new float[dataAdulteryHusband.length-1];
  totalOtherHusband = new float[dataAdulteryHusband.length-1];
  
  for(int i=0; i<dataAdulteryHusband.length-1; i++){  //loop through all items of dataAdulteryHusband array
    String[] tokens = dataAdulteryHusband[i+1].split(",");  //split array to consider commas
    //get floats from .csv file corresponding columns at position i
    yearsAdulteryHusband[i] = Float.parseFloat(tokens[0]);
    totalAdulteryHusband[i] = Float.parseFloat(tokens[3]);
    totalBehaviourHusband[i] = Float.parseFloat(tokens[5]);
    totalDesertionHusband[i] = Float.parseFloat(tokens[7]);
    totalSep2Husband[i] = Float.parseFloat(tokens[9]);
    totalSep5Husband[i] = Float.parseFloat(tokens[11]);
    totalOtherHusband[i] = Float.parseFloat(tokens[13]);
  }
  //set data for each chart
  println("Husband : "+ yearsAdulteryHusband.length);
  adulteryHusband.setData(yearsAdulteryHusband, totalAdulteryHusband);
  behaviourHusband.setData(yearsAdulteryHusband, totalBehaviourHusband);
  desertionHusband.setData(yearsAdulteryHusband, totalDesertionHusband);
  sep2Husband.setData(yearsAdulteryHusband, totalSep2Husband);
  sep5Husband.setData(yearsAdulteryHusband, totalSep5Husband);
  otherHusband.setData(yearsAdulteryHusband, totalOtherHusband);
}

void wifeChartReasons(){
 //sketch2
 //method based on session5 data visualisation module (Jo Wood,2014) http://gicentre.org/datavis/session05/index.html
 String[] dataAdulteryWife = loadStrings("wife.csv");  //load in .csv file
 //initialise arrays
   yearsAdulteryWife = new float[dataAdulteryWife.length-1]; 
  totalAdulteryWife = new float[dataAdulteryWife.length-1];
  totalBehaviourWife= new float[dataAdulteryWife.length-1];
  totalDesertionWife = new float[dataAdulteryWife.length-1];
  totalSep2Wife = new float[dataAdulteryWife.length-1];
  totalSep5Wife = new float[dataAdulteryWife.length-1];
  totalOtherWife = new float[dataAdulteryWife.length-1];
  
  for(int i=0; i<dataAdulteryWife.length-1; i++){  //loop through all elements of dataAdulteryWife array
    String[] tokens = dataAdulteryWife[i+1].split(",");  //split array to consider commas
    //get floats from .csv file corresponding columns at position i
    yearsAdulteryWife[i] = Float.parseFloat(tokens[0]);
    totalAdulteryWife[i] = Float.parseFloat(tokens[3]);
    totalBehaviourWife[i] = Float.parseFloat(tokens[5]);
    totalDesertionWife[i] = Float.parseFloat(tokens[7]);
    totalSep2Wife[i] = Float.parseFloat(tokens[9]);
    totalSep5Wife[i] = Float.parseFloat(tokens[11]);
    totalOtherWife[i] = Float.parseFloat(tokens[13]);
    
  }
  println("WIfe : " + yearsAdulteryWife.length);  
  //set data for each chart
  adulteryWife.setData(yearsAdulteryWife, totalAdulteryWife);
  behaviourWife.setData(yearsAdulteryWife, totalBehaviourWife);
  desertionWife.setData(yearsAdulteryWife, totalDesertionWife);
  sep2Wife.setData(yearsAdulteryWife, totalSep2Wife);
  sep5Wife.setData(yearsAdulteryWife, totalSep5Wife);
  otherWife.setData(yearsAdulteryWife, totalOtherWife);
}

void mouseClicked(){
  //method based on session5 data visualisation module (Jo Wood,2014) http://gicentre.org/datavis/session05/index.html
  for (int i=0; i<reasons.length; i++){
    if(dist(xPosition[i]+10, yPosition[i], mouseX, mouseY) < 20){  //if mouse clicked less than 20 pixels away from reasons label
      reasonSelected = i;  //change value of reasons selected e.q. if 0, adultery will be true
      fill(0);
      println(i);
      println(reasons[i]);
  }
    
    for (int t=0; t<reasons.length; t++){  
      if(dist(xPositionTick[t]+5, yPositionTick[t], mouseX, mouseY) < 20){  //if mouse clicked less than 20 pixels away from tick image
        tickSelected = t;  //remove tick and reasons selected
        fill(0);
        println("Remove " + reasons[t]);
      }
    }
  }
}

int getDataIndexReasons(int year){
  println(yearsAdulteryWife.length);
  for(int i =0; i< yearsAdulteryWife.length; i++){    //for all elements of yearsAdulteryWife arry, loop through and search
    println(i);
    if(yearsAdulteryWife[i] == year){  //if match found
      return i;  //return index of matched year
    }
  }
  for(int h=0; h< yearsAdulteryHusband.length; h++){  //for all elements of yearsAdulteryHusband array, loop through and search
    if(yearsAdulteryHusband[h] == year){  //if match found
      return h;  //return index of matched year
    }
  }
  return -1;  //return int value -1
}


void getWifeTotal(){
  //sketch3
 String[] dataWife = loadStrings("wife.csv");  //loads in .csv file and store to string array
   float[] totalWifeSymbol = new float[dataWife.length-1];  //initialise array
         for (int i =0; i<dataWife.length-1; i++){  //for all elements of datawife array loop through
             String[] tokens =dataWife[i+1].split(",");  //split array to consider commas
              totalWifeSymbol[i] = Float.parseFloat(tokens[2]);   //get totalWifeSymbol at position i, column 2 and store to totalWifeSymbol
              totalNumWife = floor(totalNumWife+totalWifeSymbol[i]); //floor totalwifesymbol value to get rounded number and store to variable
        }
         println("Wife : " + floor(totalNumWife));
}

void getHusbandTotal(){
  String[] dataHusband = loadStrings("husband.csv");  //loads in .csv file and store to string array
  float[] totalHusbandSymbol = new float[dataHusband.length-1];  //initialise array
   for(int h=0; h<dataHusband.length-1;h++){  //for all elemenets of datahusband array
     String[] tokens = dataHusband[h+1].split(",");  //split array to consider commas
     totalHusbandSymbol[h] = Float.parseFloat(tokens[2]);  //get totalHusbandSymbol at position i, column 2 and store to array
     totalNumHusband = floor(totalNumHusband+totalHusbandSymbol[h]);  //floor totalHusbandSymbol to et rounded number and store to variable
   }
   println("Husband : " +floor(totalNumHusband));
}

void symbolGrid(){
//sketch3, plot wife and husband symbols
i = -1;
  for(float yPosition = 100; yPosition<width-200; yPosition = yPosition +40){  //loop through y positions 
       i++;  //increment i
    for(float xPosition = 100; xPosition<width-100; xPosition = xPosition +40){  //loop through x positions
        i++;  //increment i
          if( i<= wifePlot){  //if i is less than or equal to the size of wife plot
            image(femaleSymbol, xPosition, yPosition, 40, 40);  //draw wife symbol
         }else if(i > wifePlot){  //if i is greater than wife plot
            image(maleSymbol, xPosition, yPosition, 40, 40);  //draw husband symbol
         }
       if(i ==220){  //if i equals 220 (wifePlot + husbandPlot)
         break;  //break
       }  
     }
       if(i ==220){  //if i equals 220(wifePlot+HusbandPlot)
         break; //break
     } 
  }      

}


