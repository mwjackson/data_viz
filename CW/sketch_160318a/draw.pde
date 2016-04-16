
void chart(String name, float chartTop, float chartLeft, Table PayTable) {
  float margin = 50;
  float graphWidth = 500;
  float graphHeight = 400;

  //float plotX1, plotY1; // create a box within sketch (x,y) co-ordinates
  //float plotX2, plotY2; // create a box within sketch width and height

  // Corners of the plotted chart
  float plotX1 = chartLeft + margin; //<>//
  float plotX2 = chartLeft + graphWidth;
  float plotY1 = chartTop + margin;
  float plotY2 = chartTop + graphHeight;



  float leftBorder = 50;
  int numRows = PayTable.getRowCount();
  float barWidth = graphWidth/numRows;

  //show plot area as white box
  fill(255);
  rectMode(CORNERS);
  noStroke();
  println("name: " + name + " x1: " + plotX1 + " x2: " + plotX2 + " y1: " + plotY1 + " y2: " + plotY2);
  rect(plotX1, plotY1, plotX2, plotY2);

  // Draw salary markers £'000
  stroke(180);
  fill(120);
  textAlign(CENTER);
  //float[] salary = new float[6];
  float linePos;      // Used for drawing time lines.
  for (int salary=round(dataMin); salary<=50; salary+=10)
  {
    linePos = map(salary, dataMin, 50, plotX1+80, plotX2/2); //map salary lines to plot size
    line(linePos, plotY1, linePos, plotY2-40); //from xy1 to xy2 connects
    text(salary, linePos, plotY2-20);
    text("median salary in £'000", plotX2/3, plotY2-5);
  }

  for (int row=0; row<numRows; row++)
  {
    float maleSalary =PayTable.getFloat(row, "Male");
    float femaleSalary =PayTable.getFloat(row, "Female");
    float malesalaryPos = map(maleSalary, dataMin, 50, plotX1+80, plotX2/2);
    float femalesalaryPos = map(PayTable.getFloat(row, "Female"), dataMin, 50, plotX1+80, plotX2/2);
    float agePos = map(PayTable.getFloat(row, "agegrp"), 1, 6, plotY2-50, 90);
    float percentdiff = PayTable.getFloat(row, "percent");
    fill(128);
    text(PayTable.getString(row, "Age"), plotX1+50, agePos);// map the age groups to the plot
    text("Age Group", plotX1+10, plotY2/2); //ask Jo how to rotate

    if (maleSalary >0 && femaleSalary >0)
    {
      stroke(cTable.findColour(percentdiff)); // larger the percent different the intense it gets - ask Jo can do from black to red? 
      strokeWeight(5);
      line(femalesalaryPos, agePos, malesalaryPos, agePos);// line
    }

    if (maleSalary>0)
    {
      noStroke(); 
      fill(3, 206, 255); 
      ellipse(malesalaryPos, agePos, 5, 5); //male salary plotted

      //if (dist(mouseX,mouseY,malesalaryPos,agePos) <10
    }
    if (femaleSalary>0)
    {
      noStroke(); 
      fill(132, 255, 3); 
      ellipse(femalesalaryPos, agePos, 5, 5); //female salary plotted
    }
  }
}