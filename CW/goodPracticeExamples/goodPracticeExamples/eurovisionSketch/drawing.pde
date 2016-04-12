void setupTimeline() {
  strokeWeight(1);
  stroke(255);
  fill(#e64262);  
  rect(-1, timeline.y - 1, width + 2, 31);
  
  // Draw year and box
  strokeWeight(1);
  textSize(10);
  int timelineYear = 1975;
  for (int i=0; i<=35 ;i++) 
  {
    if (year == timelineYear || (mouseX > timeline.x + timelineUnit*i && mouseX < timeline.x + timelineUnit*i + timelineUnit && mouseY > timeline.y) ) {
      fill(#b10b40);  
    }
    else {
      noFill();
    }
    rect(timeline.x + timelineUnit*i, timeline.y - 1, timelineUnit, 31);
    fill(255);
    text(str(timelineYear), timeline.x + timelineUnit*i, timeline.y, timelineUnit, 30);
    timelineYear += 1;
  }
  
  // Draw draggable button
  image(timelineBtn, buttonX, timeline.y - 27);
  if (mouseX > buttonX && mouseX < buttonX + 18) {
    textSize(9);
    text("Drag Me", buttonX - timelineUnit/2 + 9, timeline.y - 45, timelineUnit, 12);
  }
  
  // Draw play / pause button
  if (autoplay) {
    fill(#dd0035);
    rect(-1, timeline.y - 1, 31, 31);
    fill(255);
    rect(9, timeline.y + 6, 3, 16);
    rect(17, timeline.y + 6, 3, 16);
  }
  else {
    fill(#0099ca);
    rect(-1, timeline.y - 1, 31, 31);
    fill(255);
    beginShape();
    vertex(10, timeline.y + 8);
    vertex(20, timeline.y + 14);
    vertex(10, timeline.y + 20);
    endShape();
  }
}

void setupPage() {
  background(#ff637e); 
  image(bg,0,0,width,height);
  image(logo, 30, 20);
  textAlign(LEFT, TOP);
  fill(255);
  textFont(brush);
  text(year, 30, 100);
  textFont(aller);
  textSize(14);
  String intro = "Find out voting patterns and relationships between countries over the years 1975 - 2010.\n\nSelect one or more countries to see their voting relationships.\n\nYou can change the voting view of one country by selecting one of the options below.";
  text(intro, 30, 160, 220, 240);
  // Buttons
  for (int i=0; i<4; i++) {
    if (btnOn[i] || (mouseY < btnPos[i].y + 36 && mouseY > btnPos[i].y) && mouseX > 30 && mouseX < 242) {
      image(buttons[i*2], btnPos[i].x, btnPos[i].y);
    }
    else {
      image(buttons[i*2+1], btnPos[i].x, btnPos[i].y);
    }
  }
}
