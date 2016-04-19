 //<>//
void chart(String name, float top, float left, Table PayTable) {
  float margin = 50;
  float graphWidth = 500;
  float graphHeight = 400;
  
  float xMiddle = (left + graphWidth + (2 * margin)) / 2;
  float bottom = top + graphHeight;

  // Corners of the plotted chart
  float chartLeft = left + margin;
  float chartRight = left + graphWidth - margin;
  float chartTop = top + margin;
  float chartBottom = top + graphHeight - margin;

  float leftBorder = 50;
  int numRows = PayTable.getRowCount();
  float barWidth = graphWidth/numRows;

  chartArea(name, top, bottom, chartLeft, chartRight, chartTop, chartBottom);

  for (TableRow row: PayTable.rows())
  {
    float maleSalary =row.getFloat("Male");
    float femaleSalary =row.getFloat("Female");
    float malesalaryPos = map(maleSalary, dataMin, 50, chartLeft, chartRight);
    float femalesalaryPos = map(row.getFloat("Female"), dataMin, 50, chartLeft, chartRight);
    float agePos = map(row.getFloat("agegrp"), 1, 6, chartTop, chartBottom);
    float percentdiff = row.getFloat("percent");
    
    fill(128);

    if (maleSalary > 0 && femaleSalary > 0)
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

void chartArea(String name, float top, float bottom, float chartLeft, float chartRight, float chartTop, float chartBottom) {
  //show plot area as white box
  fill(255);
  rectMode(CORNERS);
  noStroke();
  println("name: " + name + " x1: " + chartLeft + " x2: " + chartRight + " y1: " + chartTop + " y2: " + chartBottom);
  rect(chartLeft, chartTop, chartRight, chartBottom);

  // Draw salary markers £'000
  stroke(180);
  fill(120);
  textAlign(CENTER);
  
  text("median salary in £'000", chartLeft + 200, bottom);
  text("Age Group", chartLeft, bottom); //ask Jo how to rotate

  int[] salaries = {0, 10, 20, 30, 40, 50};
  for (int salary : salaries)
  {
    float lineX = map(salary, 0, 50, chartLeft, chartRight);
    System.out.printf("name: %s lineX: %f chartTop: %f chartBottom: %f\n", name, lineX, chartTop, chartBottom); 
    strokeWeight(1);
    line(lineX, chartTop, lineX, chartBottom); 
    text(salary, lineX, chartBottom + 20);
  }
  
  String[] ages = {"18-21", "22-29", "30-39", "40-49", "50-59", "60+"};
  int[] ageIndex = {1, 2, 3, 4, 5, 6};
  for (int i=0; i<6; i++) { 
    float agePos = map(ageIndex[i], 1, 6, chartTop, chartBottom);
    text(ages[i], chartLeft, agePos);
  }

}