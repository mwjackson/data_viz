// Parse the Iris data extracting the data in the two given columns
// and adding a colour for each item according to its species.
 
void readData(int xCol, int yCol, XYChart scatterplot)
{
  Table irisTable = loadTable("irisData.tsv","header,tsv");
  ColourTable cTable = ColourTable.getPresetColourTable(ColourTable.ACCENT_3);
   
  int numPoints    = irisTable.getRowCount();
  float[] colours  = new float[numPoints];
  float[] x        = irisTable.getFloatColumn(xCol);
  float[] y        = irisTable.getFloatColumn(yCol);
  String[] species = irisTable.getStringColumn("Species");
   
  for (int i=0; i<numPoints; i++)
  {
    if (species[i].equals("setosa"))
    {
      colours[i] = 1;
    }
    else if (species[i].equals("versicolor"))
    {
      colours[i] = 2;
    }
    else if (species[i].equals("virginica"))
    {
      colours[i] = 3;
    } 
  }
 
  scatterplot.setData(x,y);  // Store data in scatterplot
  scatterplot.setPointColour(colours,cTable);
}