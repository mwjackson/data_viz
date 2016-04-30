import java.util.*;  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

ColourTable colourTable; 

PFont menuFont, subTitleFont, titleFont;

color header = color(74, 74, 74);
color legend = color(255, 255, 255, 7);

color male = color(144, 0, 255); // purple
color female = color(249, 233, 0); // yellow
color chartBg = color(225, 245, 254); //blue

//color male = color(244, 67, 54); // red
//color female = color(33, 150, 243); // blue
//color chartBg = color(255, 253, 231); // pale yellow

int headerHeight = 105;
int titleSize = 20;
int subTitleSize = 16;


// this class stores what we need to draw each chart
public class Chart {
  public final String name;  // the name
  public final Boolean title;  // true if this a main title chart (eg. professionals)
  public final List<GenderData> data;  // the data needed for the chart

  public Chart(String name, Boolean title, List<GenderData> data) {
    this.name = name; 
    this.title = title;
    this.data = data;
  }
}

void title() { 
  fill(header);
  rect(0, 0, width, headerHeight); // header bg

  // title
  fill(255);
  textAlign(LEFT);
  textFont(titleFont, 20);
  text("THE GENDER GAP IN INDUSTRY", 250, 47);
  fill(155);
  textFont(subTitleFont, subTitleSize);
  text("Median hourly pay (£) by age group", 250, 70);

  // key
  fill(legend);
  noStroke();
  rect(0, 0, 200, headerHeight);
  
  fill(255);
  textAlign(LEFT);
  textSize(12);
  text("Female", 15, 55);
  text("Male", 145, 55);
  noStroke(); 
  fill(female); 
  ellipse(70, 50, 20, 20); //female salary plotted
  noStroke(); 
  fill(male); 
  ellipse(130, 50, 20, 20); //male salary plotted

  fill(255);
  stroke(155); // larger the percent different the intense it gets - ask Jo can do from black to red? 
  strokeWeight(1);
  line(67, 75, 133, 75);
  line(67, 65, 67, 75);
  line(133, 65, 133, 75);
  text("-50%", 25, 80);
  text("+50%", 145, 80);
  text("Pay Gap", 80, 90);

  for (float i=percentMin; i<percentMax; i+=0.01) {
    fill(colourTable.findColour(i));  // reverse order
    stroke(colourTable.findColour(i));
    rect(100 + (50*i), 49, 100 + (50*i), 51);
  }
}

void drawChart(Boolean title, String name, float top, float left, float chartWidth, float chartHeight, List<GenderData> data) {
  float margin = 50;

  float bottom = top + chartHeight;

  // calculate corners of the plotted chart
  float chartLeft = left + margin;
  float chartRight = left + chartWidth - margin;
  float chartTop = top + margin;
  float chartBottom = top + chartHeight - margin;

  System.out.printf("name: %s \nchartLeft: %f chartRight: %f chartTop: %f chartBottom: %f\n", name, chartLeft, chartRight, chartTop, chartBottom); 

  // draw the axes, background, labels etc
  chartArea(title, name, top, bottom, chartLeft, chartRight, chartTop, chartBottom);

  //System.out.printf("dataMin: %s dataMax: %f\n", dataMin, dataMax); 

  Collections.reverse(data);  // reverse order for display

  // draw the individual data lines & ellipsis'
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
      int c = colourTable.findColour(percentdiff);
      stroke(c); // larger the percent different the intense it gets - ask Jo can do customised colours? 
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
      fill(male); 
      ellipse(malesalaryPos, agePos, dotSize, dotSize); //male salary plotted
    }

    if (femaleSalary>0)
    {
      noStroke(); 
      fill(female); 
      ellipse(femalesalaryPos, agePos, dotSize, dotSize); //female salary plotted
    }
    ageIndex++;
  }
}

void chartArea(Boolean title, String name, float top, float bottom, float chartLeft, float chartRight, float chartTop, float chartBottom) {
  fill(0);
  textAlign(CENTER);
  textSize(12);

  if (title) {
    text(name.toUpperCase(), centreOfChart(chartLeft, chartRight), top + 20);
  } else {
    text(name, centreOfChart(chartLeft, chartRight), top + 20);
  }

  //show plot area as white box
  fill(chartBg);
  rectMode(CORNERS);
  noStroke();
  rect(chartLeft, chartTop, chartRight, chartBottom);

  // Draw salary markers £'000
  stroke(180);
  fill(0);
  textAlign(CENTER);

  //text("median salary in £ per hour", centreOfChart(chartLeft, chartRight), bottom);
  //text("Age Group", chartLeft, bottom); //ask Jo how to rotate

  int[] salaries = {0, 5, 10, 15, 20, 25};
  for (int salary : salaries)
  {
    fill(0);
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