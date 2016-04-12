Container welCont;

void welcome() {
  fill(247);
  welcomeTab();
}

void welcomeTab() {


  fill(247);
  strokeWeight(2);
  rect(0, 30, width-1, height-32);

  stroke(150);
  strokeWeight(100);
  line(1100, -30, 500, height+50);

  stroke(150);
  strokeWeight(100);
  line(1300, -30, 700, height+50);

  stroke(200);
  strokeWeight(100);
  line(1500, -30, 900, height+50);

  strokeWeight(1.5);
  stroke(0, 158, 217);
  rect(width/4, 0, width/4, 30);
  rect(width/2, 0, width/4, 30);
  rect(3*width/4, 0, width/4, 30);
  rect(0, 0, width/4, 30);
  line(0, 30, width, 30);


  fill(100);
  textFont(tab, 24);
  text("Summary", 10, 23);

  textFont(tab, 24);
  text("GRDI and Retail Sales Index", 330, 23);

  textFont(tab, 24);
  text("Brand and Supplier Analysis", 650, 23);

  textFont(tab, 24);
  text("Grocer 33 Analysis", 970, 23);


  welCont = new Container(30, 60, 600, 380, "Welcome");
  welCont = new Container(30, 470, 600, 190, "How do you navigate?");
  welCont = new Container(660, 60, 590, 150, "What is Insight Into Retail?");
  noStroke();
  welcomeText();
}

