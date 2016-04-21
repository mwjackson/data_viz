void title() { //<>//
  // sketch title
  // TODO: key
  fill(200);

  // title
  rect(20, 20, 600, 100);
  // key
  rect(620, 20, 1440, 100);

  fill(120);
  textAlign(CENTER);
  textSize(20);
  text("GENDER GAP IN INDUSTRY", 200, 65);
  
  key_buttons(20, 620, new String[] {"Admin", "Assoc Prof", "Caring, Leisure...", "Elementary...", "Managers, Directors..."});
  key_buttons(60, 620, new String[] {"Process, plant...", "Professional Occ...", "Sales & Customer...", "Skilled Trades...", ""});
}

void key_buttons(int top, int left, String[] labels) {
  int wid = 150;
  int heig = 20;
  int marg = 10;
  
  fill(255, 0, 0);
  rect(left + marg + (wid + marg) * 0, top + marg, left + marg + wid + (marg + wid) * 0, top + marg + heig);
  
  fill(120);
  textAlign(CENTER);
  text(labels[0], top + marg, left + marg);
  
  fill(0, 255, 0);
  rect(left + marg + (wid + marg) * 1, top + marg, left + marg + wid + (marg + wid) * 1, top + marg + heig);
  
  fill(0, 0, 255);  
  rect(left + marg + (wid + marg) * 2, top + marg, left + marg + wid + (marg + wid) * 2, top + marg + heig);
  
  fill(255, 0, 255);  
  rect(left + marg + (wid + marg) * 3, top + marg, left + marg + wid + (marg + wid) * 3, top + marg + heig);
  
  fill(0, 255, 255);  
  rect(left + marg + (wid + marg) * 4, top + marg, left + marg + wid + (marg + wid) * 4, top + marg + heig);
}


void chart(String name, float top, float left, Table data) {
  float margin = 50;
  float graphWidth = 500;
  float graphHeight = 400;

  float bottom = top + graphHeight;

  // Corners of the plotted chart
  float chartLeft = left + margin;
  float chartRight = left + graphWidth - margin;
  float chartTop = top + margin;
  float chartBottom = top + graphHeight - margin;

  //println("name: " + name + " chartLeft: " + chartLeft + " chartRight: " + chartRight + " chartTop: " + chartTop + " chartBottom: " + chartBottom);
  System.out.printf("name: %s \nchartLeft: %f chartRight: %f chartTop: %f chartBottom: %f\n", name, chartLeft, chartRight, chartTop, chartBottom); 

  fill(120);
  textAlign(CENTER);
  textSize(12);
  text(name.toUpperCase(), chartLeft + 200, top + 20);

  chartArea(name, top, bottom, chartLeft, chartRight, chartTop, chartBottom);

  int ageIndex = 1;
  for (TableRow row : data.rows())
  {
    float maleSalary = row.getFloat("Male");
    float femaleSalary = row.getFloat("Female");
    float malesalaryPos = map(maleSalary, dataMin, 50, chartLeft, chartRight);
    float femalesalaryPos = map(femaleSalary, dataMin, 50, chartLeft, chartRight);
    float percentdiff = (maleSalary - femaleSalary) / maleSalary;
    
    float agePos = map(ageIndex, 1, 6, chartTop, chartBottom);

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
    ageIndex++;
  }
}

void chartArea(String name, float top, float bottom, float chartLeft, float chartRight, float chartTop, float chartBottom) {
  //show plot area as white box
  fill(255);
  rectMode(CORNERS);
  noStroke();
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