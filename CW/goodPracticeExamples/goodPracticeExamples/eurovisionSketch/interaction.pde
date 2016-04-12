void mouseMoved() {
  cursor(ARROW);
  if (mouseY > timeline.y) { // Timeline
    cursor(HAND); 
  }
  else if (mouseX > 30 && mouseX < 242) { // Buttons
    for (int i=0; i<4; i++) {
      if (mouseY < btnPos[i].y + 36 && mouseY > btnPos[i].y) {
        cursor(HAND);
        break;
      }
    }
  }
  else if (mouseX > buttonX && mouseX < buttonX + 18) { // Draggable button
    cursor(HAND);
  }
  else { // Detect country  
    showDetails = -1;
    showDetailsCountry = "";
    for (int row=0; row<countries.getRowCount(); row++)
    {
      float x = countries.getFloat(row, "X");
      float y = countries.getFloat(row, "Y");
      if (dist(mouseX, mouseY, x, y) < baseSize && currentSizes[row] > 0) {
        showDetails = row;
        showDetailsCountry = countries.getString(row, "Country");  
        cursor(HAND);
        t = 0.5;
      }  
    }
  }
}

void mouseReleased() {
  if (changeYear) {
    changeYear(0.01);
  }
}

void mouseClicked() {
  
  if (mouseY > timeline.y) {
    // Detect timeline
    if (mouseX > 30) {
      // Change year
      buttonX = mouseX;
      changeYear = true;
      changeYear(0.01);
    }
    else {
      autoplay = !autoplay;
      if (autoplay && year == 2010) {
        year = 1974;
      }
    }
  }
  else if (mouseX > 30 && mouseX < 242) { 
    // Detect buttons
    if (mouseY < btnPos[3].y + 36 && mouseY > btnPos[3].y) {
      reset();
    }
    else {
      for (int i=0; i<3; i++) {
        if (mouseY < btnPos[i].y + 36 && mouseY > btnPos[i].y) {
          btnOn[i] = true;
          if (i == 0) { voteMode = 'a'; }
          else if (i == 1) { voteMode = 'g'; }
          else if (i == 2) { voteMode = 'r'; }
        }
        else {
          btnOn[i] = false;
        }
      }
    }
  }
  else {
    // Detect country
    for (int row=0; row<countries.getRowCount(); row++)
    {
      float x = countries.getFloat(row, "X");
      float y = countries.getFloat(row, "Y");
      if (dist(mouseX, mouseY, x, y) < currentSizes[row]) {
        String country = countries.getString(row, "Country");
        if (selected.get(country) == 0) {
          selected.put(country, 1);
          totalSelected += 1;
        }
        else {
          selected.put(country, 0);
          totalSelected -= 1;
        }
      }
    }
  }
}

void mouseDragged() {
  if (dist(mouseX, mouseY, buttonX, timeline.y) < 50) {
    // update button position
    buttonX = mouseX;
    changeYear = true;
    changeYear(0.5);
  }
}
