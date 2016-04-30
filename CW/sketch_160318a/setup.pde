import controlP5.CColor; //<>// //<>//
import java.lang.*;

// this class stores what we need for each menu button
public class Button {
  public final String id;
  public final String label;

  public Button(String id, String label) {
    this.id = id;
    this.label = label;
  }
}

// draw a row of menu buttons
void draw_buttons(int top, int left, Button[] buttons) {
  int wid = 150;
  int marg = 10;

  // loop through buttons and create new button
  // increment position for each one
  for (int i=0; i < 5; i++) {
    String id = "btn_" + buttons[i].id;
    cp5.addButton(id)
      .setValue(0)
      .setPosition(left + marg + (wid + marg) * i, top + marg)
      .setLabel(abbreviate(buttons[i].label, 17))
      .setFont(menuFont)
      .setColor(new CColor(header, legend, #FFFFFF, #FFFFFF, #FFFFFF))
      .setSize(150, 20);
  }
}

// helper function to truncate the button text
String abbreviate(String str, int wid) {
  int cut = wid;
  if (str.length() <= wid) {
    return str;
  }
  return str.substring(0, wid - 3) + "..."; //<>//
}

// button click handlers
// update the "current page" variable when each button is clicked
public void btn_overview(int v) {
  page = "overview";
}

public void btn_admin(int v) {
  page = "admin";
}

public void btn_assprof(int v) {
  page = "assprof";
}

public void btn_caring(int v) {
  page = "caring";
}

public void btn_elem(int v) {
  page = "elem";
}

public void btn_mgrs(int v) {
  page = "mgrs";
}

public void btn_proc(int v) {
  page = "proc";
}

public void btn_prof(int v) {
  page = "prof";
}

public void btn_sales(int v) {
  page = "sales";
}

public void btn_trades(int v) {
  page = "trades";
}