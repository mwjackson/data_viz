import java.util.Map;

/* *******************************************************************************
 * Data visualization of EuroVision voting patterns.
 * Student postgraduate submission 2014 - example of a good coursework submission.
 * See eurovisionJustification.pdf and courseworkFeedback.pdf for further details.
 * *******************************************************************************/

float baseSize = 50; // base size of each country circle
int year = 1975; // timeline 

PVector timeline;
float timelineUnit;
float timelineWidth;
float buttonX;

boolean changeYear = false;

boolean autoplay = true;
int savedTime;
int totalTime = 1500;

Table scores, votes, countries;

float t;
float inc;

float[] currentSizes;

float showDetails = -1;
String showDetailsCountry = "";
float detailSize = 120;


// Vote mode: 
// 'a' = votes a country gave and received
// 'g' = votes that the country gave
// 'r' = votes that the country received
char voteMode = 'a'; 

HashMap<String,Integer> selected = new HashMap<String,Integer>();
int totalSelected = 0;

// Images
PImage logo;
PImage bg;
PImage timelineBtn;
PImage[] buttons;
PImage allActiveBtn;
PImage allBtn;
PImage gaveActiveBtn;
PImage gaveBtn;
PImage receivedActiveBtn;
PImage receivedBtn;
PImage resetActiveBtn;
PImage resetBtn;

PVector[] btnPos;
boolean[] btnOn;

PFont brush;
PFont aller;

void setup()
{
  size(1280,720);
  
  countries = loadTable("countries.tsv", "tsv, header");
  scores = loadTable("scores.tsv", "tsv, header");
  votes = loadTable("votes.tsv", "tsv, header");
  
  t = 0.1;
  inc = 0.2;
  savedTime = millis();
  currentSizes = new float[countries.getRowCount()];
  
  for (int row=0; row<countries.getRowCount(); row++)
  {
    currentSizes[row] = 1;
    selected.put(countries.getString(row, "Country"), 0);
  }
  
  logo = loadImage("eurovision.png");
  bg = loadImage("bg.jpg");
  timelineBtn = loadImage("microphone.png");
  
  buttons = new PImage[8];
  buttons[0] = loadImage("all-active-btn.png");
  buttons[1] = loadImage("all-btn.png");
  buttons[2] = loadImage("gave-active-btn.png");
  buttons[3] = loadImage("gave-btn.png");
  buttons[4] = loadImage("received-active-btn.png");
  buttons[5] = loadImage("received-btn.png");
  buttons[6] = loadImage("reset-active-btn.png");
  buttons[7] = loadImage("reset-btn.png");

  btnPos = new PVector[4];
  btnPos[0] = new PVector(30, 390);
  btnPos[1] = new PVector(30, 435);
  btnPos[2] = new PVector(30, 480);
  btnPos[3] = new PVector(30, 535);
  
  btnOn = new boolean[4];
  btnOn[0] = true;
  btnOn[1] = false;
  btnOn[2] = false;
  btnOn[3] = false;
  
  timeline = new PVector(30, height - 30);
  timelineWidth = width - 30;
  timelineUnit = timelineWidth/36;
  buttonX = width - (2011 - year)*timelineUnit + timelineUnit/2 - 9;
  brush = loadFont("BrushScriptStd-55.vlw");
  aller = loadFont("Aller-14.vlw");
}
 
void draw()
{
  if (autoplay) {
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime && year < 2010) {
      year++;
      t = 0.5;
      buttonX = width - (2011 - year)*timelineUnit + timelineUnit/2 - 9;
      savedTime = millis();  
    }
    else if (year == 2010) {
      autoplay = false;
    }
  }
  
  setupPage();
  
  textAlign(CENTER, CENTER);
  // Animation transition based on lecture 8
  t = t + inc;
  if (t <= 0) {
    t = 0;
  }
  else if (t >= 1) {
    t = 1;
  }
  
  // Draw vote relationships
  float alpha;
  
  for (TableRow row : votes.findRows(str(year).substring(0,4), "Year")) 
  {
    String giver = row.getString("Giver");
    String recipient = row.getString("Recipient");
    float points = row.getFloat("Points");
    
    if (totalSelected > 1) {
      if (selected.get(giver) == 1 && selected.get(recipient) == 1) {
        alpha = 255;
      }
      else {
        alpha = 0;
      }
    }
    else 
    {
      if ((showDetailsCountry.equals(giver) || selected.get(giver) == 1) && (voteMode == 'a' || voteMode == 'g')) {
        alpha = 255;
      }
      else if ((showDetailsCountry.equals(recipient) || selected.get(recipient) == 1) && (voteMode == 'a' || voteMode == 'r')) {
        alpha = 255; 
      }
      else if (showDetailsCountry.equals("") && totalSelected == 0) {
        alpha = 150;
      }
      else {
        alpha = 15;
      }
    }
    
    TableRow giverRow = countries.findRow(giver, "Country");
    TableRow recipientRow = countries.findRow(recipient, "Country");
    
    float x1 = giverRow.getFloat("X");
    float y1 = giverRow.getFloat("Y");
    
    float x2 = recipientRow.getFloat("X");
    float y2 = recipientRow.getFloat("Y");
    
    // Curved edge method based on lecture 9
    float curveAngle = radians(-90);
    float x = (x1-x2)/4f;
    float y = (y1-y2)/4f;
 
    float cx = x2 + x*cos(curveAngle) - y*sin(curveAngle);
    float cy = y2 + y*cos(curveAngle) + x*sin(curveAngle);
    
    String colour = giverRow.getString("Colour");
    
    noFill();
    stroke(unhex( "FF" + colour.substring(1) ), lerp(0, alpha, t));
    strokeWeight(points);
    bezier(x1, y1, cx, cy, x2, y2, x2, y2);
    
  }
  
  // Draw country circle
  
  for (int row=0; row<countries.getRowCount(); row++)
  {
    // Get init position
    float x = countries.getFloat(row, "X");
    float y = countries.getFloat(row, "Y");
    String country = countries.getString(row, "Country");
    String colour = countries.getString(row, "Colour");
    
    alpha = 255;
    if (totalSelected > 1 && selected.get(country) == 0) {
      alpha = 25;
    }
    
    // Find country score
    TableRow scoresRow = scores.findRow(str(year).substring(0,4), "Year");
    float score = scoresRow.getFloat(country);
    
    // Draw circle
    float size = score*baseSize / 100;
    
    fill(unhex("FF" + colour.substring(1)), alpha);
    noStroke();
    
    if (t == 1) {
      currentSizes[row] = size;
    }
    
    textSize(12);
    
    if (size > 0) {
      if (showDetails == row) {
        ellipse(x, y, lerp(currentSizes[row], detailSize, t), lerp(currentSizes[row], detailSize, t));
        fill(255, alpha);
        textSize(14);
        text(int(score), x, y + 20);
      }
      else {
        ellipse(x, y, lerp(currentSizes[row], size, t), lerp(currentSizes[row], size, t));
      }
      fill(255, alpha);
      textSize(12);
      text(country, x, y);
    }
    else {
      // find out if the country voted
      boolean voted = false;
      for (TableRow votesRow : votes.findRows(str(year).substring(0,4), "Year")) {
        if (votesRow.getString("Giver").equals(country)) {
          voted = true;
          break;
        }
      }
      if (voted) {
        fill(255, alpha);
        text(country, x, y);
      }
    }
  }
  
  setupTimeline();
  
}

// Reset selected countries
void reset() 
{
  for (int row=0; row<countries.getRowCount(); row++)
  {
    selected.put(countries.getString(row, "Country"), 0);
  }
  totalSelected = 0;
}

void changeYear(float timer) {
  year = 2011 - ceil( (width  - buttonX) / timelineUnit );
  buttonX = width - (2011 - year)*timelineUnit + timelineUnit/2 - 9;
  t = timer;
  changeYear = false;
}
