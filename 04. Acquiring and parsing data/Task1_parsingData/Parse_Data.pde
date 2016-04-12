// Reads the GDP data from a text file.
void readData()
{
  String[] textLines = loadStrings("gdp.tsv");
 
  for (String  textLine: textLines)
  {
    println(textLine);
  }
}