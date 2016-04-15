import org.gicentre.utils.colour.*;   // For colour tables.import org.gicentre.utils.colour.*;   // For colour tables.

//test looking at managers, directors and senior officials for male and female and age banding

Table PayTable; 
float maleMin, maleMax, femaleMin, femaleMax;
float dataMin, dataMax;

ColourTable cTable;   // Will store a Brewer colour table.

void setup()
{
  preprocessData();

  size(2000, 2000);  // Set up the sketch area 

  cTable = ColourTable.getPresetColourTable(ColourTable.REDS, 0, 1);// what happens if we get a negative difference? i.e. women earn more than men?  What would the colour be?
  //cTable = new ColourTable(); // create new colour bar
  //cTable.addContinuousColourRule(0,0,0,0);
  //cTable.addContinuousColourRule(0.5,255,0,0);

  smooth();
}

void draw()
{
  chart(0, 0, PayTable);
  chart(500, 0, PayTable);
  /*
  chart(0, 500, PayTable);
  chart(500, 500, PayTable);
  */
}