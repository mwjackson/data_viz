import org.gicentre.utils.colour.*;   // For colour tables.import org.gicentre.utils.colour.*;   // For colour tables.

//test looking at managers, directors and senior officials for male and female and age banding

Table PayTable; 
float maleMin, maleMax, femaleMin, femaleMax;
float dataMin, dataMax;
float plotX1, plotY1; // create a box within sketch (x,y) co-ordinates
float plotX2, plotY2; // create a box within sketch width and height

ColourTable cTable;   // Will store a Brewer colour table.

void setup()
{
  size(800,500);  // Set up the sketch area 
  PayTable =loadTable("test.csv","header,csv");

  cTable = ColourTable.getPresetColourTable(ColourTable.REDS,0,1);// what happens if we get a negative difference? i.e. women earn more than men?  What would the colour be?
  //cTable = new ColourTable(); // create new colour bar
  //cTable.addContinuousColourRule(0,0,0,0);
  //cTable.addContinuousColourRule(0.5,255,0,0);

  //max and min of the annual salary for male
  maleMin =MAX_FLOAT;
  maleMax =MIN_FLOAT;
  femaleMin =MAX_FLOAT;
  femaleMax =MIN_FLOAT;
   
  // As a first step, saving a web page of the table allows us to
  // be assured we have read the data correctly into our sketch.
  saveTable(PayTable,"PayTable.html");
    
  // Find the minimum and maximum values for both male and female for an occupation - need this for each.
    for (int row=0; row<PayTable.getRowCount(); row++) // male
    {
      if (PayTable.getString(row,"Male").length() > 0)
      {
        maleMin =min(maleMin,PayTable.getFloat(row,"Male")); 
        maleMax =max(maleMax,PayTable.getFloat(row,"Male"));
      }
    }
    for (int row=0; row<PayTable.getRowCount(); row++) //female
    {
      if (PayTable.getString(row,"Female").length() >0)
      {
        femaleMin = min(femaleMin,PayTable.getFloat(row,"Female"));
        femaleMax = max(femaleMin,PayTable.getFloat(row,"Female"));
  }
    }
    // Corners of the plotted chart
    plotX1 = 50;
    plotX2 = width - plotX1;
    plotY1 = 60;
    plotY2 = height - plotY1;
  
    smooth();  
    dataMin = min(maleMin,femaleMax);
    dataMax = max(maleMax,femaleMax);
    println("minimum: ",dataMin);
    println("maximum: ",dataMax);
  }


void draw()
{
  // No drawing yet, just a white background.
  background(224);
  
  float leftBorder = 50;
  float graphWidth = width-leftBorder;
  int numRows = PayTable.getRowCount();
  float barWidth = graphWidth/numRows;
  float linePos;      // Used for drawing time lines.
  
  //show plot area as white box
  fill(255);
  rectMode(CORNERS);
  noStroke();
  rect(plotX1,plotY1,plotX2,plotY2);
  
  
  // Draw salary markers £'000
  stroke(180);
  fill(120);
  textAlign(CENTER);
  //float[] salary = new float[6];
  for (int salary=round(dataMin); salary<=50; salary+=10)
  {
    linePos = map(salary, dataMin, 50, plotX1+80, plotX2/2); //map salary lines to plot size
    line(linePos, 80, linePos, plotY2-40); //from xy1 to xy2 connects
    text(salary, linePos, plotY2-20);
    text("median salary in £'000",plotX2/3,plotY2-5);
  }
  
  for (int row=0; row<numRows; row++)
  {
    
  float maleSalary =PayTable.getFloat(row,"Male");
  float femaleSalary =PayTable.getFloat(row,"Female");
  float malesalaryPos = map(maleSalary,dataMin, 50, plotX1+80, plotX2/2);
  float femalesalaryPos = map(PayTable.getFloat(row,"Female"),dataMin, 50, plotX1+80, plotX2/2);
  float agePos = map(PayTable.getFloat(row,"agegrp"),1,6,plotY2-50,90);
  float percentdiff = PayTable.getFloat(row,"percent");
  fill(128);
  text(PayTable.getString(row,"Age"),plotX1+50,agePos);// map the age groups to the plot
  text("Age Group", plotX1+10,plotY2/2); //ask Jo how to rotate
  
  if (maleSalary >0 && femaleSalary >0)
  {
    stroke(cTable.findColour(percentdiff)); // larger the percent different the intense it gets - ask Jo can do from black to red? 
    strokeWeight(5);
    line(femalesalaryPos,agePos,malesalaryPos,agePos);// line
  }
  
  if (maleSalary>0)
  {
   noStroke(); 
   fill(3,206,255); 
   ellipse(malesalaryPos,agePos,5,5); //male salary plotted
   
   //if (dist(mouseX,mouseY,malesalaryPos,agePos) <10
  }
  if (femaleSalary>0)
  {
   noStroke(); 
   fill(132,255,3); 
   ellipse(femalesalaryPos,agePos,5,5); //female salary plotted
  }
   
  }
}