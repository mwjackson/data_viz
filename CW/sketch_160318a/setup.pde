void title() { //<>// //<>//
  fill(200);

  // title
  rect(20, 20, 600, 100);
  // key
  rect(620, 20, 1440, 100);

  fill(120);
  textAlign(CENTER);
  textSize(20);
  text("THE GENDER GAP IN INDUSTRY", 200, 65);
}

void key_buttons(int top, int left, Button[] buttons) {
  int wid = 150;
  int marg = 10;

  for (int i=0; i < 5; i++) {

    String id = "btn_" + buttons[i].id;
    cp5.addButton(id)
      .setValue(0)
      .setPosition(left + marg + (wid + marg) * i, top + marg)
      .setLabel(buttons[i].label)
      //.setColor(PALETTE[i])
      .setSize(150, 20);
  }
}


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