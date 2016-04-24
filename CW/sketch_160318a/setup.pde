 //<>// //<>//

//void preprocessData() {
//  PayTable = loadTable("test.csv", "header,csv");

//  // As a first step, saving a web page of the table allows us to
//  // be assured we have read the data correctly into our sketch.
//  saveTable(PayTable, "PayTable.html");

//  //max and min of the annual salary for PayMale
//  maleMin = MAX_FLOAT;
//  maleMax = MIN_FLOAT;
//  femaleMin = MAX_FLOAT;
//  femaleMax = MIN_FLOAT;

//  // Find the minimum and maximum values for both male and female for an occupation - need this for each.
//  for (int row=0; row<PayTable.getRowCount(); row++) // male
//  {
//    if (PayTable.getString(row, "Male").length() > 0)
//    {
//      maleMin =min(maleMin, PayTable.getFloat(row, "Male")); 
//      maleMax =max(maleMax, PayTable.getFloat(row, "Male"));
//    }
//  }
//  for (int row=0; row<PayTable.getRowCount(); row++) //female
//  {
//    if (PayTable.getString(row, "Female").length() >0)
//    {
//      femaleMin = min(femaleMin, PayTable.getFloat(row, "Female"));
//      femaleMax = max(femaleMin, PayTable.getFloat(row, "Female"));
//    }
//  }

//  dataMin = min(maleMin, femaleMax);
//  dataMax = max(maleMax, femaleMax);
//  println("minimum: ", dataMin);
//  println("maximum: ", dataMax);
  
//}

void title() {
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

    cp5.addButton("btn_" + buttons[i].id)
      .setValue(0)
      .setPosition(left + marg + (wid + marg) * i, top + marg)
      .setLabel(buttons[i].label)
      //.setColor(PALETTE[i])
      .setSize(150, 20);
  }
}


public void btn_overview(int theValue) {
  page = 1;
}

public void btn_admin(int theValue) {
  page = 2;
}

public void btn_assprof(int theValue) {
  page = 3;
}