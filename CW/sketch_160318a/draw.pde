import java.util.*; //<>//

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

void title() { //<>//
  fill(200);

  rect(20, 20, 400, 100); // title
  rect(420, 20, 600, 100); // key
  rect(620, 20, 1440, 100); // menu

  // title
  fill(120);
  textAlign(CENTER);
  textSize(20);
  text("THE GENDER GAP IN INDUSTRY", 200, 65);
  
  // key
  textAlign(LEFT);
  textSize(12);
  text("Male", 450, 45);
  text("Female", 450, 75);
  noStroke(); 
  fill(3, 206, 255); 
  ellipse(440, 40, 8, 8); //male salary plotted
  noStroke(); 
  fill(132, 255, 3); 
  ellipse(440, 70, 8, 8); //female salary plotted
}

void drawChart(String name, float top, float left, float chartWidth, float chartHeight, List<GenderData> data) {
  float margin = 50;
  //float graphWidth = 500;
  //float graphHeight = 400;

  float bottom = top + chartHeight;

  // Corners of the plotted chart
  float chartLeft = left + margin;
  float chartRight = left + chartWidth - margin;
  float chartTop = top + margin;
  float chartBottom = top + chartHeight - margin;

  System.out.printf("name: %s \nchartLeft: %f chartRight: %f chartTop: %f chartBottom: %f\n", name, chartLeft, chartRight, chartTop, chartBottom); 

  fill(120);
  textAlign(CENTER);
  textSize(12);
  text(name.toUpperCase(), centreOfChart(chartLeft, chartRight), top + 20);

  chartArea(name, top, bottom, chartLeft, chartRight, chartTop, chartBottom);

  //float dataMin = min(minMale(data), minFemale(data));
  //float dataMax = max(maxMale(data), maxFemale(data));

  //System.out.printf("dataMin: %s dataMax: %f\n", dataMin, dataMax); 

  Collections.reverse(data);  // reverse order for display
  
  int ageIndex = 1;
  for (GenderData row : data)
  {
    float maleSalary = row.male;
    float femaleSalary = row.female;
    float malesalaryPos = map(maleSalary, dataMin, dataMax, chartLeft + 10, chartRight - 10);  // add 10px margin
    float femalesalaryPos = map(femaleSalary, dataMin, dataMax, chartLeft + 10, chartRight - 10); // add 10px margin
    float percentdiff = (maleSalary - femaleSalary) / maleSalary;

    float agePos = map(ageIndex, 1, 6, chartTop + 10, chartBottom - 10); // add 10px margin

    System.out.printf("age: %s male: %f female: %f\n", row.age, row.male, row.female); 

    fill(128);

    if (maleSalary > 0 && femaleSalary > 0)
    {
      int c =  percentdiff >= 0 ? colorPositive.findColour(percentdiff) : colorNegative.findColour(Math.abs(percentdiff)); //<>//
      stroke(c); // larger the percent different the intense it gets - ask Jo can do from black to red? 
      strokeWeight(5);
      line(femalesalaryPos, agePos, malesalaryPos, agePos);// line

      if (dist(mouseX, mouseY, (femalesalaryPos + malesalaryPos) / 2, agePos) < 20)
      {
        //tooltip.setText(String.format("%.2f %%\nMale: %.2f Female: %.2f", percentdiff*100, maleSalary, femaleSalary) );
        tooltip.setText(String.format("%.2f %%", percentdiff*100));
        tooltip.setIsActive(true);
        tooltip.draw(((femalesalaryPos + malesalaryPos) / 2) + 40, agePos + 8);
      }
    }

    int dotSize = 10;
    if (maleSalary>0)
    {
      noStroke(); 
      fill(3, 206, 255); 
      ellipse(malesalaryPos, agePos,dotSize, dotSize); //male salary plotted
    }

    if (femaleSalary>0)
    {
      noStroke(); 
      fill(132, 255, 3); 
      ellipse(femalesalaryPos, agePos, dotSize, dotSize); //female salary plotted
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

  text("median salary in £ per hour", centreOfChart(chartLeft, chartRight), bottom);
  text("Age Group", chartLeft, bottom); //ask Jo how to rotate

  int[] salaries = {0, 5, 10, 15, 20, 25};
  for (int salary : salaries)
  {
    float lineX = map(salary, 0, max(salaries), chartLeft, chartRight);
    strokeWeight(1);
    line(lineX, chartTop, lineX, chartBottom); 
    text(salary, lineX, chartBottom + 20);
  }

  String[] ages = {"60+", "50-59", "40-49", "30-39", "22-29", "18-21" };
  int[] ageIndex = {1, 2, 3, 4, 5, 6};
  for (int i=0; i<6; i++) { 
    float agePos = map(ageIndex[i], 1, 6, chartTop + 10, chartBottom - 10);  // add 10px margin
    textAlign(RIGHT);
    text(ages[i], chartLeft - 5, agePos);
  }
}

float centreOfChart(float left, float right) {
  return (left + right)/2;
}