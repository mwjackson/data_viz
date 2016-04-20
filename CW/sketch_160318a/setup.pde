void preprocessData() {
  PayTable = loadTable("test.csv", "header,csv");

  // As a first step, saving a web page of the table allows us to
  // be assured we have read the data correctly into our sketch.
  saveTable(PayTable, "PayTable.html");

  //max and min of the annual salary for PayMale
  maleMin = MAX_FLOAT;
  maleMax = MIN_FLOAT;
  femaleMin = MAX_FLOAT;
  femaleMax = MIN_FLOAT;

  // Find the minimum and maximum values for both male and female for an occupation - need this for each.
  for (int row=0; row<PayTable.getRowCount(); row++) // male
  {
    if (PayTable.getString(row, "Male").length() > 0)
    {
      maleMin =min(maleMin, PayTable.getFloat(row, "Male")); 
      maleMax =max(maleMax, PayTable.getFloat(row, "Male"));
    }
  }
  for (int row=0; row<PayTable.getRowCount(); row++) //female
  {
    if (PayTable.getString(row, "Female").length() >0)
    {
      femaleMin = min(femaleMin, PayTable.getFloat(row, "Female"));
      femaleMax = max(femaleMin, PayTable.getFloat(row, "Female"));
    }
  }

  dataMin = min(maleMin, femaleMax);
  dataMax = max(maleMax, femaleMax);
  println("minimum: ", dataMin);
  println("maximum: ", dataMax);
}