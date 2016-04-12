// Reads and displays GDP data.
// Jo Wood, 12th February 2016
 
float[] years;    // Stores a collection of dates.
float[] gdps;     // Stores a collection of GDP values.
 
void setup()
{
  size(400, 300);
  readData();
}
 
void draw()
{
  background(255);
}