//global air temperature in the last 130 years. Using the techniques you have learned last week and this week, 
//try to produce a graphical representation of all or some of the data represented in this table.

import org.gicentre.utils.colour.*;    // For colour tables.
ColourTable cTable;    // Will store a Brewer colour table.
Table dataTable; 

void setup()
{
  size(500,800);
  stroke(180);
  textAlign(CENTER);
  
   //Load data from tables
   dataTable = loadTable("airtemp.csv","header,csv");
}